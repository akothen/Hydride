#lang rosette
(require "bvops.rkt")
(define (VADD_16_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_16_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_16_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_16_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_16_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_16_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_1_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_1_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_1_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_1_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_1_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_1_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_2_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_2_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_2_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_2_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_2_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_2_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_32_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_32_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_32_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_32_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_32_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_32_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_4_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_4_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_4_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_4_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_4_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_4_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_8_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_8_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_8_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_8_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_8_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_8_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_16_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_16_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_16_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_16_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_16_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_16_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_1_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_1_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_1_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_1_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_1_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_1_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_2_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_2_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_2_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_2_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_2_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_2_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_32_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_32_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_32_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_32_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_32_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_32_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_4_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_4_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_4_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_4_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_4_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_4_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_8_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_8_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_8_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_8_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_8_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VADD_sat_8_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VAND_16_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_16_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_16_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_16_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_16_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_16_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_1_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_1_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_1_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_1_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_1_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_1_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_2_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_2_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_2_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_2_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_2_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_2_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_32_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_32_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_32_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_32_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_32_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_32_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_4_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_4_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_4_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_4_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_4_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_4_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_8_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_8_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_8_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_8_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_8_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAND_8_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvand  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_16_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_16_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_16_Q_Q_Q  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_16_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_16_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_16_UQ_UQ_UQ  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_16_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_16_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_1_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_1_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_1_Q_Q_Q  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_1_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_1_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_1_UQ_UQ_UQ  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_1_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_1_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_2_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_2_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_2_Q_Q_Q  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_2_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_2_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_2_UQ_UQ_UQ  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_2_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_2_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_32_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_32_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_32_Q_Q_Q  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 2048 2048))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 2048 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_32_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_32_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_32_UQ_UQ_UQ  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 2048 2048))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 2048 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_32_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_32_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_4_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_4_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_4_Q_Q_Q  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_4_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_4_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_4_UQ_UQ_UQ  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_4_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_4_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_8_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_8_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_8_Q_Q_Q  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_8_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_8_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_8_UQ_UQ_UQ  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_8_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VASR_8_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvashr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VAVG_16_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 8)))
  (define %16 (bvashr  %15  (bv 1 8)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_16_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 32)))
  (define %16 (bvashr  %15  (bv 1 32)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_16_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 8)))
  (define %16 (bvlshr  %15  (bv 1 8)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_16_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 32)))
  (define %16 (bvlshr  %15  (bv 1 32)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_16_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 16)))
  (define %16 (bvlshr  %15  (bv 1 16)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_16_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 16)))
  (define %16 (bvashr  %15  (bv 1 16)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_1_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 8)))
  (define %16 (bvashr  %15  (bv 1 8)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_1_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 32)))
  (define %16 (bvashr  %15  (bv 1 32)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_1_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 8)))
  (define %16 (bvlshr  %15  (bv 1 8)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_1_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 32)))
  (define %16 (bvlshr  %15  (bv 1 32)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_1_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 16)))
  (define %16 (bvlshr  %15  (bv 1 16)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_1_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 16)))
  (define %16 (bvashr  %15  (bv 1 16)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_2_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 8)))
  (define %16 (bvashr  %15  (bv 1 8)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_2_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 32)))
  (define %16 (bvashr  %15  (bv 1 32)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_2_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 8)))
  (define %16 (bvlshr  %15  (bv 1 8)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_2_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 32)))
  (define %16 (bvlshr  %15  (bv 1 32)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_2_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 16)))
  (define %16 (bvlshr  %15  (bv 1 16)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_2_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 16)))
  (define %16 (bvashr  %15  (bv 1 16)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_32_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 8)))
  (define %16 (bvashr  %15  (bv 1 8)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_32_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 32)))
  (define %16 (bvashr  %15  (bv 1 32)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_32_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 8)))
  (define %16 (bvlshr  %15  (bv 1 8)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_32_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 32)))
  (define %16 (bvlshr  %15  (bv 1 32)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_32_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 16)))
  (define %16 (bvlshr  %15  (bv 1 16)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_32_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 16)))
  (define %16 (bvashr  %15  (bv 1 16)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_4_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 8)))
  (define %16 (bvashr  %15  (bv 1 8)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_4_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 32)))
  (define %16 (bvashr  %15  (bv 1 32)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_4_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 8)))
  (define %16 (bvlshr  %15  (bv 1 8)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_4_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 32)))
  (define %16 (bvlshr  %15  (bv 1 32)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_4_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 16)))
  (define %16 (bvlshr  %15  (bv 1 16)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_4_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 16)))
  (define %16 (bvashr  %15  (bv 1 16)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_8_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 8)))
  (define %16 (bvashr  %15  (bv 1 8)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_8_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 32)))
  (define %16 (bvashr  %15  (bv 1 32)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_8_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 8)))
  (define %16 (bvlshr  %15  (bv 1 8)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_8_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 32)))
  (define %16 (bvlshr  %15  (bv 1 32)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_8_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 16)))
  (define %16 (bvlshr  %15  (bv 1 16)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_8_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvadd  %8  %13))
  (define %15 (bvadd  %14  (bv 1 16)))
  (define %16 (bvashr  %15  (bv 1 16)))
  %16
 )
 )
)
)
)
dst)
(define (VAVG_sat_16_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  (define %16 (bvaddnsw  %14  (bv 1 8) 8))
  (define %18 (bvashr  %16  (bv 1 8)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_16_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  (define %16 (bvaddnsw  %14  (bv 1 32) 32))
  (define %18 (bvashr  %16  (bv 1 32)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_16_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  (define %16 (bvaddnsw  %14  (bv 1 8) 8))
  (define %18 (bvashr  %16  (bv 1 8)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_16_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  (define %16 (bvaddnsw  %14  (bv 1 32) 32))
  (define %18 (bvashr  %16  (bv 1 32)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_16_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  (define %16 (bvaddnsw  %14  (bv 1 16) 16))
  (define %18 (bvashr  %16  (bv 1 16)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_16_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  (define %16 (bvaddnsw  %14  (bv 1 16) 16))
  (define %18 (bvashr  %16  (bv 1 16)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_1_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  (define %16 (bvaddnsw  %14  (bv 1 8) 8))
  (define %18 (bvashr  %16  (bv 1 8)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_1_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  (define %16 (bvaddnsw  %14  (bv 1 32) 32))
  (define %18 (bvashr  %16  (bv 1 32)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_1_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  (define %16 (bvaddnsw  %14  (bv 1 8) 8))
  (define %18 (bvashr  %16  (bv 1 8)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_1_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  (define %16 (bvaddnsw  %14  (bv 1 32) 32))
  (define %18 (bvashr  %16  (bv 1 32)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_1_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  (define %16 (bvaddnsw  %14  (bv 1 16) 16))
  (define %18 (bvashr  %16  (bv 1 16)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_1_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  (define %16 (bvaddnsw  %14  (bv 1 16) 16))
  (define %18 (bvashr  %16  (bv 1 16)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_2_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  (define %16 (bvaddnsw  %14  (bv 1 8) 8))
  (define %18 (bvashr  %16  (bv 1 8)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_2_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  (define %16 (bvaddnsw  %14  (bv 1 32) 32))
  (define %18 (bvashr  %16  (bv 1 32)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_2_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  (define %16 (bvaddnsw  %14  (bv 1 8) 8))
  (define %18 (bvashr  %16  (bv 1 8)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_2_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  (define %16 (bvaddnsw  %14  (bv 1 32) 32))
  (define %18 (bvashr  %16  (bv 1 32)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_2_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  (define %16 (bvaddnsw  %14  (bv 1 16) 16))
  (define %18 (bvashr  %16  (bv 1 16)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_2_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  (define %16 (bvaddnsw  %14  (bv 1 16) 16))
  (define %18 (bvashr  %16  (bv 1 16)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_32_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  (define %16 (bvaddnsw  %14  (bv 1 8) 8))
  (define %18 (bvashr  %16  (bv 1 8)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_32_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  (define %16 (bvaddnsw  %14  (bv 1 32) 32))
  (define %18 (bvashr  %16  (bv 1 32)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_32_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  (define %16 (bvaddnsw  %14  (bv 1 8) 8))
  (define %18 (bvashr  %16  (bv 1 8)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_32_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  (define %16 (bvaddnsw  %14  (bv 1 32) 32))
  (define %18 (bvashr  %16  (bv 1 32)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_32_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  (define %16 (bvaddnsw  %14  (bv 1 16) 16))
  (define %18 (bvashr  %16  (bv 1 16)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_32_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  (define %16 (bvaddnsw  %14  (bv 1 16) 16))
  (define %18 (bvashr  %16  (bv 1 16)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_4_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  (define %16 (bvaddnsw  %14  (bv 1 8) 8))
  (define %18 (bvashr  %16  (bv 1 8)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_4_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  (define %16 (bvaddnsw  %14  (bv 1 32) 32))
  (define %18 (bvashr  %16  (bv 1 32)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_4_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  (define %16 (bvaddnsw  %14  (bv 1 8) 8))
  (define %18 (bvashr  %16  (bv 1 8)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_4_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  (define %16 (bvaddnsw  %14  (bv 1 32) 32))
  (define %18 (bvashr  %16  (bv 1 32)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_4_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  (define %16 (bvaddnsw  %14  (bv 1 16) 16))
  (define %18 (bvashr  %16  (bv 1 16)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_4_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  (define %16 (bvaddnsw  %14  (bv 1 16) 16))
  (define %18 (bvashr  %16  (bv 1 16)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_8_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  (define %16 (bvaddnsw  %14  (bv 1 8) 8))
  (define %18 (bvashr  %16  (bv 1 8)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_8_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  (define %16 (bvaddnsw  %14  (bv 1 32) 32))
  (define %18 (bvashr  %16  (bv 1 32)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_8_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 8))
  (define %16 (bvaddnsw  %14  (bv 1 8) 8))
  (define %18 (bvashr  %16  (bv 1 8)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_8_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 32))
  (define %16 (bvaddnsw  %14  (bv 1 32) 32))
  (define %18 (bvashr  %16  (bv 1 32)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_8_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  (define %16 (bvaddnsw  %14  (bv 1 16) 16))
  (define %18 (bvashr  %16  (bv 1 16)))
  %18
 )
 )
)
)
)
dst)
(define (VAVG_sat_8_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvaddnsw  %8  %13 16))
  (define %16 (bvaddnsw  %14  (bv 1 16) 16))
  (define %18 (bvashr  %16  (bv 1 16)))
  %18
 )
 )
)
)
)
dst)
(define (VBFE_16_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvashr  %20  %11))
  (define %22 (bvshl  (bv 1 32)  %5))
  (define %23 (bvsub  %22  (bv 1 32)))
  (define %24 (bvand  %21  %23))
  %24
 )
 )
)
)
)
dst)
(define (VBFE_16_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvlshr  %20  %11))
  (define %22 (bvshl  (bv 1 32)  %5))
  (define %23 (bvsub  %22  (bv 1 32)))
  (define %24 (bvand  %21  %23))
  %24
 )
 )
)
)
)
dst)
(define (VBFE_1_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvashr  %20  %11))
  (define %22 (bvshl  (bv 1 32)  %5))
  (define %23 (bvsub  %22  (bv 1 32)))
  (define %24 (bvand  %21  %23))
  %24
 )
 )
)
)
)
dst)
(define (VBFE_1_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvlshr  %20  %11))
  (define %22 (bvshl  (bv 1 32)  %5))
  (define %23 (bvsub  %22  (bv 1 32)))
  (define %24 (bvand  %21  %23))
  %24
 )
 )
)
)
)
dst)
(define (VBFE_2_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvashr  %20  %11))
  (define %22 (bvshl  (bv 1 32)  %5))
  (define %23 (bvsub  %22  (bv 1 32)))
  (define %24 (bvand  %21  %23))
  %24
 )
 )
)
)
)
dst)
(define (VBFE_2_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvlshr  %20  %11))
  (define %22 (bvshl  (bv 1 32)  %5))
  (define %23 (bvsub  %22  (bv 1 32)))
  (define %24 (bvand  %21  %23))
  %24
 )
 )
)
)
)
dst)
(define (VBFE_32_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvashr  %20  %11))
  (define %22 (bvshl  (bv 1 32)  %5))
  (define %23 (bvsub  %22  (bv 1 32)))
  (define %24 (bvand  %21  %23))
  %24
 )
 )
)
)
)
dst)
(define (VBFE_32_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvlshr  %20  %11))
  (define %22 (bvshl  (bv 1 32)  %5))
  (define %23 (bvsub  %22  (bv 1 32)))
  (define %24 (bvand  %21  %23))
  %24
 )
 )
)
)
)
dst)
(define (VBFE_4_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvashr  %20  %11))
  (define %22 (bvshl  (bv 1 32)  %5))
  (define %23 (bvsub  %22  (bv 1 32)))
  (define %24 (bvand  %21  %23))
  %24
 )
 )
)
)
)
dst)
(define (VBFE_4_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvlshr  %20  %11))
  (define %22 (bvshl  (bv 1 32)  %5))
  (define %23 (bvsub  %22  (bv 1 32)))
  (define %24 (bvand  %21  %23))
  %24
 )
 )
)
)
)
dst)
(define (VBFE_8_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvashr  %20  %11))
  (define %22 (bvshl  (bv 1 32)  %5))
  (define %23 (bvsub  %22  (bv 1 32)))
  (define %24 (bvand  %21  %23))
  %24
 )
 )
)
)
)
dst)
(define (VBFE_8_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvlshr  %20  %11))
  (define %22 (bvshl  (bv 1 32)  %5))
  (define %23 (bvsub  %22  (bv 1 32)))
  (define %24 (bvand  %21  %23))
  %24
 )
 )
)
)
)
dst)
(define (VBFI_16_D_D_D_D_D  src0 src1 src2 src3 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %12 (bvshl  (bv 1 32)  %5))
  (define %13 (bvsub  %12  (bv 1 32)))
  (define %14 (bvshl  %13  %11))
  (define %23 (extract  %3 i0.new src2))
  (define %24 (bvshl  %23  %11))
  (define %25 (bvand  %24  %14))
  (define %30 (extract  %3 i0.new src3))
  (define %31 (bvnot  %14))
  (define %32 (bvand  %30  %31))
  (define %33 (bvor  %25  %32))
  %33
 )
 )
)
)
)
dst)
(define (VBFI_16_UD_UD_UD_UD_UD  src0 src1 src2 src3 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %12 (bvshl  (bv 1 32)  %5))
  (define %13 (bvsub  %12  (bv 1 32)))
  (define %14 (bvshl  %13  %11))
  (define %23 (extract  %3 i0.new src2))
  (define %24 (bvshl  %23  %11))
  (define %25 (bvand  %24  %14))
  (define %30 (extract  %3 i0.new src3))
  (define %31 (bvnot  %14))
  (define %32 (bvand  %30  %31))
  (define %33 (bvor  %25  %32))
  %33
 )
 )
)
)
)
dst)
(define (VBFI_1_D_D_D_D_D  src0 src1 src2 src3 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %12 (bvshl  (bv 1 32)  %5))
  (define %13 (bvsub  %12  (bv 1 32)))
  (define %14 (bvshl  %13  %11))
  (define %23 (extract  %3 i0.new src2))
  (define %24 (bvshl  %23  %11))
  (define %25 (bvand  %24  %14))
  (define %30 (extract  %3 i0.new src3))
  (define %31 (bvnot  %14))
  (define %32 (bvand  %30  %31))
  (define %33 (bvor  %25  %32))
  %33
 )
 )
)
)
)
dst)
(define (VBFI_1_UD_UD_UD_UD_UD  src0 src1 src2 src3 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %12 (bvshl  (bv 1 32)  %5))
  (define %13 (bvsub  %12  (bv 1 32)))
  (define %14 (bvshl  %13  %11))
  (define %23 (extract  %3 i0.new src2))
  (define %24 (bvshl  %23  %11))
  (define %25 (bvand  %24  %14))
  (define %30 (extract  %3 i0.new src3))
  (define %31 (bvnot  %14))
  (define %32 (bvand  %30  %31))
  (define %33 (bvor  %25  %32))
  %33
 )
 )
)
)
)
dst)
(define (VBFI_2_D_D_D_D_D  src0 src1 src2 src3 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %12 (bvshl  (bv 1 32)  %5))
  (define %13 (bvsub  %12  (bv 1 32)))
  (define %14 (bvshl  %13  %11))
  (define %23 (extract  %3 i0.new src2))
  (define %24 (bvshl  %23  %11))
  (define %25 (bvand  %24  %14))
  (define %30 (extract  %3 i0.new src3))
  (define %31 (bvnot  %14))
  (define %32 (bvand  %30  %31))
  (define %33 (bvor  %25  %32))
  %33
 )
 )
)
)
)
dst)
(define (VBFI_2_UD_UD_UD_UD_UD  src0 src1 src2 src3 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %12 (bvshl  (bv 1 32)  %5))
  (define %13 (bvsub  %12  (bv 1 32)))
  (define %14 (bvshl  %13  %11))
  (define %23 (extract  %3 i0.new src2))
  (define %24 (bvshl  %23  %11))
  (define %25 (bvand  %24  %14))
  (define %30 (extract  %3 i0.new src3))
  (define %31 (bvnot  %14))
  (define %32 (bvand  %30  %31))
  (define %33 (bvor  %25  %32))
  %33
 )
 )
)
)
)
dst)
(define (VBFI_32_D_D_D_D_D  src0 src1 src2 src3 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %12 (bvshl  (bv 1 32)  %5))
  (define %13 (bvsub  %12  (bv 1 32)))
  (define %14 (bvshl  %13  %11))
  (define %23 (extract  %3 i0.new src2))
  (define %24 (bvshl  %23  %11))
  (define %25 (bvand  %24  %14))
  (define %30 (extract  %3 i0.new src3))
  (define %31 (bvnot  %14))
  (define %32 (bvand  %30  %31))
  (define %33 (bvor  %25  %32))
  %33
 )
 )
)
)
)
dst)
(define (VBFI_32_UD_UD_UD_UD_UD  src0 src1 src2 src3 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %12 (bvshl  (bv 1 32)  %5))
  (define %13 (bvsub  %12  (bv 1 32)))
  (define %14 (bvshl  %13  %11))
  (define %23 (extract  %3 i0.new src2))
  (define %24 (bvshl  %23  %11))
  (define %25 (bvand  %24  %14))
  (define %30 (extract  %3 i0.new src3))
  (define %31 (bvnot  %14))
  (define %32 (bvand  %30  %31))
  (define %33 (bvor  %25  %32))
  %33
 )
 )
)
)
)
dst)
(define (VBFI_4_D_D_D_D_D  src0 src1 src2 src3 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %12 (bvshl  (bv 1 32)  %5))
  (define %13 (bvsub  %12  (bv 1 32)))
  (define %14 (bvshl  %13  %11))
  (define %23 (extract  %3 i0.new src2))
  (define %24 (bvshl  %23  %11))
  (define %25 (bvand  %24  %14))
  (define %30 (extract  %3 i0.new src3))
  (define %31 (bvnot  %14))
  (define %32 (bvand  %30  %31))
  (define %33 (bvor  %25  %32))
  %33
 )
 )
)
)
)
dst)
(define (VBFI_4_UD_UD_UD_UD_UD  src0 src1 src2 src3 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %12 (bvshl  (bv 1 32)  %5))
  (define %13 (bvsub  %12  (bv 1 32)))
  (define %14 (bvshl  %13  %11))
  (define %23 (extract  %3 i0.new src2))
  (define %24 (bvshl  %23  %11))
  (define %25 (bvand  %24  %14))
  (define %30 (extract  %3 i0.new src3))
  (define %31 (bvnot  %14))
  (define %32 (bvand  %30  %31))
  (define %33 (bvor  %25  %32))
  %33
 )
 )
)
)
)
dst)
(define (VBFI_8_D_D_D_D_D  src0 src1 src2 src3 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %12 (bvshl  (bv 1 32)  %5))
  (define %13 (bvsub  %12  (bv 1 32)))
  (define %14 (bvshl  %13  %11))
  (define %23 (extract  %3 i0.new src2))
  (define %24 (bvshl  %23  %11))
  (define %25 (bvand  %24  %14))
  (define %30 (extract  %3 i0.new src3))
  (define %31 (bvnot  %14))
  (define %32 (bvand  %30  %31))
  (define %33 (bvor  %25  %32))
  %33
 )
 )
)
)
)
dst)
(define (VBFI_8_UD_UD_UD_UD_UD  src0 src1 src2 src3 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %4 (extract  %3 i0.new src0))
  (define %5 (bvand  %4  (bv 31 32)))
  (define %10 (extract  %3 i0.new src1))
  (define %11 (bvand  %10  (bv 31 32)))
  (define %12 (bvshl  (bv 1 32)  %5))
  (define %13 (bvsub  %12  (bv 1 32)))
  (define %14 (bvshl  %13  %11))
  (define %23 (extract  %3 i0.new src2))
  (define %24 (bvshl  %23  %11))
  (define %25 (bvand  %24  %14))
  (define %30 (extract  %3 i0.new src3))
  (define %31 (bvnot  %14))
  (define %32 (bvand  %30  %31))
  (define %33 (bvor  %25  %32))
  %33
 )
 )
)
)
)
dst)
(define (VDIV_16_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_16_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_16_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_16_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_16_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_16_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_1_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_1_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_1_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_1_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_1_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_1_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_2_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_2_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_2_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_2_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_2_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_2_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_32_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_32_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_32_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_32_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_32_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_32_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_4_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_4_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_4_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_4_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_4_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_4_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_8_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_8_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_8_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_8_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_8_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvudiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDIV_8_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsdiv  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VDP4A_16_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmul  %130.new  %190.new))
  (define %22 (bvadd  %8  %21))
  (define %28.new.low.idx (+  %0.new0  8))
  (define %28.new.high.idx0 (+  %28.new.low.idx  7))
  (define %270.new (extract  %28.new.high.idx0 %28.new.low.idx src1))
  (define %330.new (extract  %28.new.high.idx0 %28.new.low.idx src2))
  (define %35 (bvmul  %270.new  %330.new))
  (define %36 (bvadd  %22  %35))
  (define %42.new.low.idx (+  %0.new0  16))
  (define %42.new.high.idx0 (+  %42.new.low.idx  7))
  (define %410.new (extract  %42.new.high.idx0 %42.new.low.idx src1))
  (define %470.new (extract  %42.new.high.idx0 %42.new.low.idx src2))
  (define %49 (bvmul  %410.new  %470.new))
  (define %50 (bvadd  %36  %49))
  (define %56.new.low.idx (+  %0.new0  24))
  (define %56.new.high.idx0 (+  %56.new.low.idx  7))
  (define %550.new (extract  %56.new.high.idx0 %56.new.low.idx src1))
  (define %610.new (extract  %56.new.high.idx0 %56.new.low.idx src2))
  (define %63 (bvmul  %550.new  %610.new))
  (define %64 (bvadd  %50  %63))
  %64
 )
 )
)
)
)
dst)
(define (VDP4A_16_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmul  %130.new  %190.new))
  (define %22 (bvadd  %8  %21))
  (define %28.new.low.idx (+  %0.new0  8))
  (define %28.new.high.idx0 (+  %28.new.low.idx  7))
  (define %270.new (extract  %28.new.high.idx0 %28.new.low.idx src1))
  (define %330.new (extract  %28.new.high.idx0 %28.new.low.idx src2))
  (define %35 (bvmul  %270.new  %330.new))
  (define %36 (bvadd  %22  %35))
  (define %42.new.low.idx (+  %0.new0  16))
  (define %42.new.high.idx0 (+  %42.new.low.idx  7))
  (define %410.new (extract  %42.new.high.idx0 %42.new.low.idx src1))
  (define %470.new (extract  %42.new.high.idx0 %42.new.low.idx src2))
  (define %49 (bvmul  %410.new  %470.new))
  (define %50 (bvadd  %36  %49))
  (define %56.new.low.idx (+  %0.new0  24))
  (define %56.new.high.idx0 (+  %56.new.low.idx  7))
  (define %550.new (extract  %56.new.high.idx0 %56.new.low.idx src1))
  (define %610.new (extract  %56.new.high.idx0 %56.new.low.idx src2))
  (define %63 (bvmul  %550.new  %610.new))
  (define %64 (bvadd  %50  %63))
  %64
 )
 )
)
)
)
dst)
(define (VDP4A_1_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmul  %130.new  %190.new))
  (define %22 (bvadd  %8  %21))
  (define %28.new.low.idx (+  %0.new0  8))
  (define %28.new.high.idx0 (+  %28.new.low.idx  7))
  (define %270.new (extract  %28.new.high.idx0 %28.new.low.idx src1))
  (define %330.new (extract  %28.new.high.idx0 %28.new.low.idx src2))
  (define %35 (bvmul  %270.new  %330.new))
  (define %36 (bvadd  %22  %35))
  (define %42.new.low.idx (+  %0.new0  16))
  (define %42.new.high.idx0 (+  %42.new.low.idx  7))
  (define %410.new (extract  %42.new.high.idx0 %42.new.low.idx src1))
  (define %470.new (extract  %42.new.high.idx0 %42.new.low.idx src2))
  (define %49 (bvmul  %410.new  %470.new))
  (define %50 (bvadd  %36  %49))
  (define %56.new.low.idx (+  %0.new0  24))
  (define %56.new.high.idx0 (+  %56.new.low.idx  7))
  (define %550.new (extract  %56.new.high.idx0 %56.new.low.idx src1))
  (define %610.new (extract  %56.new.high.idx0 %56.new.low.idx src2))
  (define %63 (bvmul  %550.new  %610.new))
  (define %64 (bvadd  %50  %63))
  %64
 )
 )
)
)
)
dst)
(define (VDP4A_1_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmul  %130.new  %190.new))
  (define %22 (bvadd  %8  %21))
  (define %28.new.low.idx (+  %0.new0  8))
  (define %28.new.high.idx0 (+  %28.new.low.idx  7))
  (define %270.new (extract  %28.new.high.idx0 %28.new.low.idx src1))
  (define %330.new (extract  %28.new.high.idx0 %28.new.low.idx src2))
  (define %35 (bvmul  %270.new  %330.new))
  (define %36 (bvadd  %22  %35))
  (define %42.new.low.idx (+  %0.new0  16))
  (define %42.new.high.idx0 (+  %42.new.low.idx  7))
  (define %410.new (extract  %42.new.high.idx0 %42.new.low.idx src1))
  (define %470.new (extract  %42.new.high.idx0 %42.new.low.idx src2))
  (define %49 (bvmul  %410.new  %470.new))
  (define %50 (bvadd  %36  %49))
  (define %56.new.low.idx (+  %0.new0  24))
  (define %56.new.high.idx0 (+  %56.new.low.idx  7))
  (define %550.new (extract  %56.new.high.idx0 %56.new.low.idx src1))
  (define %610.new (extract  %56.new.high.idx0 %56.new.low.idx src2))
  (define %63 (bvmul  %550.new  %610.new))
  (define %64 (bvadd  %50  %63))
  %64
 )
 )
)
)
)
dst)
(define (VDP4A_2_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmul  %130.new  %190.new))
  (define %22 (bvadd  %8  %21))
  (define %28.new.low.idx (+  %0.new0  8))
  (define %28.new.high.idx0 (+  %28.new.low.idx  7))
  (define %270.new (extract  %28.new.high.idx0 %28.new.low.idx src1))
  (define %330.new (extract  %28.new.high.idx0 %28.new.low.idx src2))
  (define %35 (bvmul  %270.new  %330.new))
  (define %36 (bvadd  %22  %35))
  (define %42.new.low.idx (+  %0.new0  16))
  (define %42.new.high.idx0 (+  %42.new.low.idx  7))
  (define %410.new (extract  %42.new.high.idx0 %42.new.low.idx src1))
  (define %470.new (extract  %42.new.high.idx0 %42.new.low.idx src2))
  (define %49 (bvmul  %410.new  %470.new))
  (define %50 (bvadd  %36  %49))
  (define %56.new.low.idx (+  %0.new0  24))
  (define %56.new.high.idx0 (+  %56.new.low.idx  7))
  (define %550.new (extract  %56.new.high.idx0 %56.new.low.idx src1))
  (define %610.new (extract  %56.new.high.idx0 %56.new.low.idx src2))
  (define %63 (bvmul  %550.new  %610.new))
  (define %64 (bvadd  %50  %63))
  %64
 )
 )
)
)
)
dst)
(define (VDP4A_2_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmul  %130.new  %190.new))
  (define %22 (bvadd  %8  %21))
  (define %28.new.low.idx (+  %0.new0  8))
  (define %28.new.high.idx0 (+  %28.new.low.idx  7))
  (define %270.new (extract  %28.new.high.idx0 %28.new.low.idx src1))
  (define %330.new (extract  %28.new.high.idx0 %28.new.low.idx src2))
  (define %35 (bvmul  %270.new  %330.new))
  (define %36 (bvadd  %22  %35))
  (define %42.new.low.idx (+  %0.new0  16))
  (define %42.new.high.idx0 (+  %42.new.low.idx  7))
  (define %410.new (extract  %42.new.high.idx0 %42.new.low.idx src1))
  (define %470.new (extract  %42.new.high.idx0 %42.new.low.idx src2))
  (define %49 (bvmul  %410.new  %470.new))
  (define %50 (bvadd  %36  %49))
  (define %56.new.low.idx (+  %0.new0  24))
  (define %56.new.high.idx0 (+  %56.new.low.idx  7))
  (define %550.new (extract  %56.new.high.idx0 %56.new.low.idx src1))
  (define %610.new (extract  %56.new.high.idx0 %56.new.low.idx src2))
  (define %63 (bvmul  %550.new  %610.new))
  (define %64 (bvadd  %50  %63))
  %64
 )
 )
)
)
)
dst)
(define (VDP4A_32_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmul  %130.new  %190.new))
  (define %22 (bvadd  %8  %21))
  (define %28.new.low.idx (+  %0.new0  8))
  (define %28.new.high.idx0 (+  %28.new.low.idx  7))
  (define %270.new (extract  %28.new.high.idx0 %28.new.low.idx src1))
  (define %330.new (extract  %28.new.high.idx0 %28.new.low.idx src2))
  (define %35 (bvmul  %270.new  %330.new))
  (define %36 (bvadd  %22  %35))
  (define %42.new.low.idx (+  %0.new0  16))
  (define %42.new.high.idx0 (+  %42.new.low.idx  7))
  (define %410.new (extract  %42.new.high.idx0 %42.new.low.idx src1))
  (define %470.new (extract  %42.new.high.idx0 %42.new.low.idx src2))
  (define %49 (bvmul  %410.new  %470.new))
  (define %50 (bvadd  %36  %49))
  (define %56.new.low.idx (+  %0.new0  24))
  (define %56.new.high.idx0 (+  %56.new.low.idx  7))
  (define %550.new (extract  %56.new.high.idx0 %56.new.low.idx src1))
  (define %610.new (extract  %56.new.high.idx0 %56.new.low.idx src2))
  (define %63 (bvmul  %550.new  %610.new))
  (define %64 (bvadd  %50  %63))
  %64
 )
 )
)
)
)
dst)
(define (VDP4A_32_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmul  %130.new  %190.new))
  (define %22 (bvadd  %8  %21))
  (define %28.new.low.idx (+  %0.new0  8))
  (define %28.new.high.idx0 (+  %28.new.low.idx  7))
  (define %270.new (extract  %28.new.high.idx0 %28.new.low.idx src1))
  (define %330.new (extract  %28.new.high.idx0 %28.new.low.idx src2))
  (define %35 (bvmul  %270.new  %330.new))
  (define %36 (bvadd  %22  %35))
  (define %42.new.low.idx (+  %0.new0  16))
  (define %42.new.high.idx0 (+  %42.new.low.idx  7))
  (define %410.new (extract  %42.new.high.idx0 %42.new.low.idx src1))
  (define %470.new (extract  %42.new.high.idx0 %42.new.low.idx src2))
  (define %49 (bvmul  %410.new  %470.new))
  (define %50 (bvadd  %36  %49))
  (define %56.new.low.idx (+  %0.new0  24))
  (define %56.new.high.idx0 (+  %56.new.low.idx  7))
  (define %550.new (extract  %56.new.high.idx0 %56.new.low.idx src1))
  (define %610.new (extract  %56.new.high.idx0 %56.new.low.idx src2))
  (define %63 (bvmul  %550.new  %610.new))
  (define %64 (bvadd  %50  %63))
  %64
 )
 )
)
)
)
dst)
(define (VDP4A_4_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmul  %130.new  %190.new))
  (define %22 (bvadd  %8  %21))
  (define %28.new.low.idx (+  %0.new0  8))
  (define %28.new.high.idx0 (+  %28.new.low.idx  7))
  (define %270.new (extract  %28.new.high.idx0 %28.new.low.idx src1))
  (define %330.new (extract  %28.new.high.idx0 %28.new.low.idx src2))
  (define %35 (bvmul  %270.new  %330.new))
  (define %36 (bvadd  %22  %35))
  (define %42.new.low.idx (+  %0.new0  16))
  (define %42.new.high.idx0 (+  %42.new.low.idx  7))
  (define %410.new (extract  %42.new.high.idx0 %42.new.low.idx src1))
  (define %470.new (extract  %42.new.high.idx0 %42.new.low.idx src2))
  (define %49 (bvmul  %410.new  %470.new))
  (define %50 (bvadd  %36  %49))
  (define %56.new.low.idx (+  %0.new0  24))
  (define %56.new.high.idx0 (+  %56.new.low.idx  7))
  (define %550.new (extract  %56.new.high.idx0 %56.new.low.idx src1))
  (define %610.new (extract  %56.new.high.idx0 %56.new.low.idx src2))
  (define %63 (bvmul  %550.new  %610.new))
  (define %64 (bvadd  %50  %63))
  %64
 )
 )
)
)
)
dst)
(define (VDP4A_4_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmul  %130.new  %190.new))
  (define %22 (bvadd  %8  %21))
  (define %28.new.low.idx (+  %0.new0  8))
  (define %28.new.high.idx0 (+  %28.new.low.idx  7))
  (define %270.new (extract  %28.new.high.idx0 %28.new.low.idx src1))
  (define %330.new (extract  %28.new.high.idx0 %28.new.low.idx src2))
  (define %35 (bvmul  %270.new  %330.new))
  (define %36 (bvadd  %22  %35))
  (define %42.new.low.idx (+  %0.new0  16))
  (define %42.new.high.idx0 (+  %42.new.low.idx  7))
  (define %410.new (extract  %42.new.high.idx0 %42.new.low.idx src1))
  (define %470.new (extract  %42.new.high.idx0 %42.new.low.idx src2))
  (define %49 (bvmul  %410.new  %470.new))
  (define %50 (bvadd  %36  %49))
  (define %56.new.low.idx (+  %0.new0  24))
  (define %56.new.high.idx0 (+  %56.new.low.idx  7))
  (define %550.new (extract  %56.new.high.idx0 %56.new.low.idx src1))
  (define %610.new (extract  %56.new.high.idx0 %56.new.low.idx src2))
  (define %63 (bvmul  %550.new  %610.new))
  (define %64 (bvadd  %50  %63))
  %64
 )
 )
)
)
)
dst)
(define (VDP4A_8_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmul  %130.new  %190.new))
  (define %22 (bvadd  %8  %21))
  (define %28.new.low.idx (+  %0.new0  8))
  (define %28.new.high.idx0 (+  %28.new.low.idx  7))
  (define %270.new (extract  %28.new.high.idx0 %28.new.low.idx src1))
  (define %330.new (extract  %28.new.high.idx0 %28.new.low.idx src2))
  (define %35 (bvmul  %270.new  %330.new))
  (define %36 (bvadd  %22  %35))
  (define %42.new.low.idx (+  %0.new0  16))
  (define %42.new.high.idx0 (+  %42.new.low.idx  7))
  (define %410.new (extract  %42.new.high.idx0 %42.new.low.idx src1))
  (define %470.new (extract  %42.new.high.idx0 %42.new.low.idx src2))
  (define %49 (bvmul  %410.new  %470.new))
  (define %50 (bvadd  %36  %49))
  (define %56.new.low.idx (+  %0.new0  24))
  (define %56.new.high.idx0 (+  %56.new.low.idx  7))
  (define %550.new (extract  %56.new.high.idx0 %56.new.low.idx src1))
  (define %610.new (extract  %56.new.high.idx0 %56.new.low.idx src2))
  (define %63 (bvmul  %550.new  %610.new))
  (define %64 (bvadd  %50  %63))
  %64
 )
 )
)
)
)
dst)
(define (VDP4A_8_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmul  %130.new  %190.new))
  (define %22 (bvadd  %8  %21))
  (define %28.new.low.idx (+  %0.new0  8))
  (define %28.new.high.idx0 (+  %28.new.low.idx  7))
  (define %270.new (extract  %28.new.high.idx0 %28.new.low.idx src1))
  (define %330.new (extract  %28.new.high.idx0 %28.new.low.idx src2))
  (define %35 (bvmul  %270.new  %330.new))
  (define %36 (bvadd  %22  %35))
  (define %42.new.low.idx (+  %0.new0  16))
  (define %42.new.high.idx0 (+  %42.new.low.idx  7))
  (define %410.new (extract  %42.new.high.idx0 %42.new.low.idx src1))
  (define %470.new (extract  %42.new.high.idx0 %42.new.low.idx src2))
  (define %49 (bvmul  %410.new  %470.new))
  (define %50 (bvadd  %36  %49))
  (define %56.new.low.idx (+  %0.new0  24))
  (define %56.new.high.idx0 (+  %56.new.low.idx  7))
  (define %550.new (extract  %56.new.high.idx0 %56.new.low.idx src1))
  (define %610.new (extract  %56.new.high.idx0 %56.new.low.idx src2))
  (define %63 (bvmul  %550.new  %610.new))
  (define %64 (bvadd  %50  %63))
  %64
 )
 )
)
)
)
dst)
(define (VDP4A_sat_16_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmulnsw  %130.new  %190.new 8))
  (define %23 (bvaddnsw  %8  %21 32))
  (define %30.new.low.idx (+  %0.new0  8))
  (define %30.new.high.idx0 (+  %30.new.low.idx  7))
  (define %290.new (extract  %30.new.high.idx0 %30.new.low.idx src1))
  (define %350.new (extract  %30.new.high.idx0 %30.new.low.idx src2))
  (define %37 (bvmulnsw  %290.new  %350.new 8))
  (define %39 (bvaddnsw  %23  %37 32))
  (define %46.new.low.idx (+  %0.new0  16))
  (define %46.new.high.idx0 (+  %46.new.low.idx  7))
  (define %450.new (extract  %46.new.high.idx0 %46.new.low.idx src1))
  (define %510.new (extract  %46.new.high.idx0 %46.new.low.idx src2))
  (define %53 (bvmulnsw  %450.new  %510.new 8))
  (define %55 (bvaddnsw  %39  %53 32))
  (define %62.new.low.idx (+  %0.new0  24))
  (define %62.new.high.idx0 (+  %62.new.low.idx  7))
  (define %610.new (extract  %62.new.high.idx0 %62.new.low.idx src1))
  (define %670.new (extract  %62.new.high.idx0 %62.new.low.idx src2))
  (define %69 (bvmulnsw  %610.new  %670.new 8))
  (define %71 (bvaddnsw  %55  %69 32))
  %71
 )
 )
)
)
)
dst)
(define (VDP4A_sat_16_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmulnsw  %130.new  %190.new 8))
  (define %23 (bvaddnsw  %8  %21 32))
  (define %30.new.low.idx (+  %0.new0  8))
  (define %30.new.high.idx0 (+  %30.new.low.idx  7))
  (define %290.new (extract  %30.new.high.idx0 %30.new.low.idx src1))
  (define %350.new (extract  %30.new.high.idx0 %30.new.low.idx src2))
  (define %37 (bvmulnsw  %290.new  %350.new 8))
  (define %39 (bvaddnsw  %23  %37 32))
  (define %46.new.low.idx (+  %0.new0  16))
  (define %46.new.high.idx0 (+  %46.new.low.idx  7))
  (define %450.new (extract  %46.new.high.idx0 %46.new.low.idx src1))
  (define %510.new (extract  %46.new.high.idx0 %46.new.low.idx src2))
  (define %53 (bvmulnsw  %450.new  %510.new 8))
  (define %55 (bvaddnsw  %39  %53 32))
  (define %62.new.low.idx (+  %0.new0  24))
  (define %62.new.high.idx0 (+  %62.new.low.idx  7))
  (define %610.new (extract  %62.new.high.idx0 %62.new.low.idx src1))
  (define %670.new (extract  %62.new.high.idx0 %62.new.low.idx src2))
  (define %69 (bvmulnsw  %610.new  %670.new 8))
  (define %71 (bvaddnsw  %55  %69 32))
  %71
 )
 )
)
)
)
dst)
(define (VDP4A_sat_1_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmulnsw  %130.new  %190.new 8))
  (define %23 (bvaddnsw  %8  %21 32))
  (define %30.new.low.idx (+  %0.new0  8))
  (define %30.new.high.idx0 (+  %30.new.low.idx  7))
  (define %290.new (extract  %30.new.high.idx0 %30.new.low.idx src1))
  (define %350.new (extract  %30.new.high.idx0 %30.new.low.idx src2))
  (define %37 (bvmulnsw  %290.new  %350.new 8))
  (define %39 (bvaddnsw  %23  %37 32))
  (define %46.new.low.idx (+  %0.new0  16))
  (define %46.new.high.idx0 (+  %46.new.low.idx  7))
  (define %450.new (extract  %46.new.high.idx0 %46.new.low.idx src1))
  (define %510.new (extract  %46.new.high.idx0 %46.new.low.idx src2))
  (define %53 (bvmulnsw  %450.new  %510.new 8))
  (define %55 (bvaddnsw  %39  %53 32))
  (define %62.new.low.idx (+  %0.new0  24))
  (define %62.new.high.idx0 (+  %62.new.low.idx  7))
  (define %610.new (extract  %62.new.high.idx0 %62.new.low.idx src1))
  (define %670.new (extract  %62.new.high.idx0 %62.new.low.idx src2))
  (define %69 (bvmulnsw  %610.new  %670.new 8))
  (define %71 (bvaddnsw  %55  %69 32))
  %71
 )
 )
)
)
)
dst)
(define (VDP4A_sat_1_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmulnsw  %130.new  %190.new 8))
  (define %23 (bvaddnsw  %8  %21 32))
  (define %30.new.low.idx (+  %0.new0  8))
  (define %30.new.high.idx0 (+  %30.new.low.idx  7))
  (define %290.new (extract  %30.new.high.idx0 %30.new.low.idx src1))
  (define %350.new (extract  %30.new.high.idx0 %30.new.low.idx src2))
  (define %37 (bvmulnsw  %290.new  %350.new 8))
  (define %39 (bvaddnsw  %23  %37 32))
  (define %46.new.low.idx (+  %0.new0  16))
  (define %46.new.high.idx0 (+  %46.new.low.idx  7))
  (define %450.new (extract  %46.new.high.idx0 %46.new.low.idx src1))
  (define %510.new (extract  %46.new.high.idx0 %46.new.low.idx src2))
  (define %53 (bvmulnsw  %450.new  %510.new 8))
  (define %55 (bvaddnsw  %39  %53 32))
  (define %62.new.low.idx (+  %0.new0  24))
  (define %62.new.high.idx0 (+  %62.new.low.idx  7))
  (define %610.new (extract  %62.new.high.idx0 %62.new.low.idx src1))
  (define %670.new (extract  %62.new.high.idx0 %62.new.low.idx src2))
  (define %69 (bvmulnsw  %610.new  %670.new 8))
  (define %71 (bvaddnsw  %55  %69 32))
  %71
 )
 )
)
)
)
dst)
(define (VDP4A_sat_2_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmulnsw  %130.new  %190.new 8))
  (define %23 (bvaddnsw  %8  %21 32))
  (define %30.new.low.idx (+  %0.new0  8))
  (define %30.new.high.idx0 (+  %30.new.low.idx  7))
  (define %290.new (extract  %30.new.high.idx0 %30.new.low.idx src1))
  (define %350.new (extract  %30.new.high.idx0 %30.new.low.idx src2))
  (define %37 (bvmulnsw  %290.new  %350.new 8))
  (define %39 (bvaddnsw  %23  %37 32))
  (define %46.new.low.idx (+  %0.new0  16))
  (define %46.new.high.idx0 (+  %46.new.low.idx  7))
  (define %450.new (extract  %46.new.high.idx0 %46.new.low.idx src1))
  (define %510.new (extract  %46.new.high.idx0 %46.new.low.idx src2))
  (define %53 (bvmulnsw  %450.new  %510.new 8))
  (define %55 (bvaddnsw  %39  %53 32))
  (define %62.new.low.idx (+  %0.new0  24))
  (define %62.new.high.idx0 (+  %62.new.low.idx  7))
  (define %610.new (extract  %62.new.high.idx0 %62.new.low.idx src1))
  (define %670.new (extract  %62.new.high.idx0 %62.new.low.idx src2))
  (define %69 (bvmulnsw  %610.new  %670.new 8))
  (define %71 (bvaddnsw  %55  %69 32))
  %71
 )
 )
)
)
)
dst)
(define (VDP4A_sat_2_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmulnsw  %130.new  %190.new 8))
  (define %23 (bvaddnsw  %8  %21 32))
  (define %30.new.low.idx (+  %0.new0  8))
  (define %30.new.high.idx0 (+  %30.new.low.idx  7))
  (define %290.new (extract  %30.new.high.idx0 %30.new.low.idx src1))
  (define %350.new (extract  %30.new.high.idx0 %30.new.low.idx src2))
  (define %37 (bvmulnsw  %290.new  %350.new 8))
  (define %39 (bvaddnsw  %23  %37 32))
  (define %46.new.low.idx (+  %0.new0  16))
  (define %46.new.high.idx0 (+  %46.new.low.idx  7))
  (define %450.new (extract  %46.new.high.idx0 %46.new.low.idx src1))
  (define %510.new (extract  %46.new.high.idx0 %46.new.low.idx src2))
  (define %53 (bvmulnsw  %450.new  %510.new 8))
  (define %55 (bvaddnsw  %39  %53 32))
  (define %62.new.low.idx (+  %0.new0  24))
  (define %62.new.high.idx0 (+  %62.new.low.idx  7))
  (define %610.new (extract  %62.new.high.idx0 %62.new.low.idx src1))
  (define %670.new (extract  %62.new.high.idx0 %62.new.low.idx src2))
  (define %69 (bvmulnsw  %610.new  %670.new 8))
  (define %71 (bvaddnsw  %55  %69 32))
  %71
 )
 )
)
)
)
dst)
(define (VDP4A_sat_32_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmulnsw  %130.new  %190.new 8))
  (define %23 (bvaddnsw  %8  %21 32))
  (define %30.new.low.idx (+  %0.new0  8))
  (define %30.new.high.idx0 (+  %30.new.low.idx  7))
  (define %290.new (extract  %30.new.high.idx0 %30.new.low.idx src1))
  (define %350.new (extract  %30.new.high.idx0 %30.new.low.idx src2))
  (define %37 (bvmulnsw  %290.new  %350.new 8))
  (define %39 (bvaddnsw  %23  %37 32))
  (define %46.new.low.idx (+  %0.new0  16))
  (define %46.new.high.idx0 (+  %46.new.low.idx  7))
  (define %450.new (extract  %46.new.high.idx0 %46.new.low.idx src1))
  (define %510.new (extract  %46.new.high.idx0 %46.new.low.idx src2))
  (define %53 (bvmulnsw  %450.new  %510.new 8))
  (define %55 (bvaddnsw  %39  %53 32))
  (define %62.new.low.idx (+  %0.new0  24))
  (define %62.new.high.idx0 (+  %62.new.low.idx  7))
  (define %610.new (extract  %62.new.high.idx0 %62.new.low.idx src1))
  (define %670.new (extract  %62.new.high.idx0 %62.new.low.idx src2))
  (define %69 (bvmulnsw  %610.new  %670.new 8))
  (define %71 (bvaddnsw  %55  %69 32))
  %71
 )
 )
)
)
)
dst)
(define (VDP4A_sat_32_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmulnsw  %130.new  %190.new 8))
  (define %23 (bvaddnsw  %8  %21 32))
  (define %30.new.low.idx (+  %0.new0  8))
  (define %30.new.high.idx0 (+  %30.new.low.idx  7))
  (define %290.new (extract  %30.new.high.idx0 %30.new.low.idx src1))
  (define %350.new (extract  %30.new.high.idx0 %30.new.low.idx src2))
  (define %37 (bvmulnsw  %290.new  %350.new 8))
  (define %39 (bvaddnsw  %23  %37 32))
  (define %46.new.low.idx (+  %0.new0  16))
  (define %46.new.high.idx0 (+  %46.new.low.idx  7))
  (define %450.new (extract  %46.new.high.idx0 %46.new.low.idx src1))
  (define %510.new (extract  %46.new.high.idx0 %46.new.low.idx src2))
  (define %53 (bvmulnsw  %450.new  %510.new 8))
  (define %55 (bvaddnsw  %39  %53 32))
  (define %62.new.low.idx (+  %0.new0  24))
  (define %62.new.high.idx0 (+  %62.new.low.idx  7))
  (define %610.new (extract  %62.new.high.idx0 %62.new.low.idx src1))
  (define %670.new (extract  %62.new.high.idx0 %62.new.low.idx src2))
  (define %69 (bvmulnsw  %610.new  %670.new 8))
  (define %71 (bvaddnsw  %55  %69 32))
  %71
 )
 )
)
)
)
dst)
(define (VDP4A_sat_4_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmulnsw  %130.new  %190.new 8))
  (define %23 (bvaddnsw  %8  %21 32))
  (define %30.new.low.idx (+  %0.new0  8))
  (define %30.new.high.idx0 (+  %30.new.low.idx  7))
  (define %290.new (extract  %30.new.high.idx0 %30.new.low.idx src1))
  (define %350.new (extract  %30.new.high.idx0 %30.new.low.idx src2))
  (define %37 (bvmulnsw  %290.new  %350.new 8))
  (define %39 (bvaddnsw  %23  %37 32))
  (define %46.new.low.idx (+  %0.new0  16))
  (define %46.new.high.idx0 (+  %46.new.low.idx  7))
  (define %450.new (extract  %46.new.high.idx0 %46.new.low.idx src1))
  (define %510.new (extract  %46.new.high.idx0 %46.new.low.idx src2))
  (define %53 (bvmulnsw  %450.new  %510.new 8))
  (define %55 (bvaddnsw  %39  %53 32))
  (define %62.new.low.idx (+  %0.new0  24))
  (define %62.new.high.idx0 (+  %62.new.low.idx  7))
  (define %610.new (extract  %62.new.high.idx0 %62.new.low.idx src1))
  (define %670.new (extract  %62.new.high.idx0 %62.new.low.idx src2))
  (define %69 (bvmulnsw  %610.new  %670.new 8))
  (define %71 (bvaddnsw  %55  %69 32))
  %71
 )
 )
)
)
)
dst)
(define (VDP4A_sat_4_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmulnsw  %130.new  %190.new 8))
  (define %23 (bvaddnsw  %8  %21 32))
  (define %30.new.low.idx (+  %0.new0  8))
  (define %30.new.high.idx0 (+  %30.new.low.idx  7))
  (define %290.new (extract  %30.new.high.idx0 %30.new.low.idx src1))
  (define %350.new (extract  %30.new.high.idx0 %30.new.low.idx src2))
  (define %37 (bvmulnsw  %290.new  %350.new 8))
  (define %39 (bvaddnsw  %23  %37 32))
  (define %46.new.low.idx (+  %0.new0  16))
  (define %46.new.high.idx0 (+  %46.new.low.idx  7))
  (define %450.new (extract  %46.new.high.idx0 %46.new.low.idx src1))
  (define %510.new (extract  %46.new.high.idx0 %46.new.low.idx src2))
  (define %53 (bvmulnsw  %450.new  %510.new 8))
  (define %55 (bvaddnsw  %39  %53 32))
  (define %62.new.low.idx (+  %0.new0  24))
  (define %62.new.high.idx0 (+  %62.new.low.idx  7))
  (define %610.new (extract  %62.new.high.idx0 %62.new.low.idx src1))
  (define %670.new (extract  %62.new.high.idx0 %62.new.low.idx src2))
  (define %69 (bvmulnsw  %610.new  %670.new 8))
  (define %71 (bvaddnsw  %55  %69 32))
  %71
 )
 )
)
)
)
dst)
(define (VDP4A_sat_8_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmulnsw  %130.new  %190.new 8))
  (define %23 (bvaddnsw  %8  %21 32))
  (define %30.new.low.idx (+  %0.new0  8))
  (define %30.new.high.idx0 (+  %30.new.low.idx  7))
  (define %290.new (extract  %30.new.high.idx0 %30.new.low.idx src1))
  (define %350.new (extract  %30.new.high.idx0 %30.new.low.idx src2))
  (define %37 (bvmulnsw  %290.new  %350.new 8))
  (define %39 (bvaddnsw  %23  %37 32))
  (define %46.new.low.idx (+  %0.new0  16))
  (define %46.new.high.idx0 (+  %46.new.low.idx  7))
  (define %450.new (extract  %46.new.high.idx0 %46.new.low.idx src1))
  (define %510.new (extract  %46.new.high.idx0 %46.new.low.idx src2))
  (define %53 (bvmulnsw  %450.new  %510.new 8))
  (define %55 (bvaddnsw  %39  %53 32))
  (define %62.new.low.idx (+  %0.new0  24))
  (define %62.new.high.idx0 (+  %62.new.low.idx  7))
  (define %610.new (extract  %62.new.high.idx0 %62.new.low.idx src1))
  (define %670.new (extract  %62.new.high.idx0 %62.new.low.idx src2))
  (define %69 (bvmulnsw  %610.new  %670.new 8))
  (define %71 (bvaddnsw  %55  %69 32))
  %71
 )
 )
)
)
)
dst)
(define (VDP4A_sat_8_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %0.new0 (*  i0.new  4))
  (define %3 (+  %0.new0  31))
  (define %8 (extract  %3 %0.new0 src0))
  (define %14.new.high.idx0 (+  %0.new0  7))
  (define %130.new (extract  %14.new.high.idx0 %0.new0 src1))
  (define %190.new (extract  %14.new.high.idx0 %0.new0 src2))
  (define %21 (bvmulnsw  %130.new  %190.new 8))
  (define %23 (bvaddnsw  %8  %21 32))
  (define %30.new.low.idx (+  %0.new0  8))
  (define %30.new.high.idx0 (+  %30.new.low.idx  7))
  (define %290.new (extract  %30.new.high.idx0 %30.new.low.idx src1))
  (define %350.new (extract  %30.new.high.idx0 %30.new.low.idx src2))
  (define %37 (bvmulnsw  %290.new  %350.new 8))
  (define %39 (bvaddnsw  %23  %37 32))
  (define %46.new.low.idx (+  %0.new0  16))
  (define %46.new.high.idx0 (+  %46.new.low.idx  7))
  (define %450.new (extract  %46.new.high.idx0 %46.new.low.idx src1))
  (define %510.new (extract  %46.new.high.idx0 %46.new.low.idx src2))
  (define %53 (bvmulnsw  %450.new  %510.new 8))
  (define %55 (bvaddnsw  %39  %53 32))
  (define %62.new.low.idx (+  %0.new0  24))
  (define %62.new.high.idx0 (+  %62.new.low.idx  7))
  (define %610.new (extract  %62.new.high.idx0 %62.new.low.idx src1))
  (define %670.new (extract  %62.new.high.idx0 %62.new.low.idx src2))
  (define %69 (bvmulnsw  %610.new  %670.new 8))
  (define %71 (bvaddnsw  %55  %69 32))
  %71
 )
 )
)
)
)
dst)
(define (VMAD_16_B_B_B_B  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_16_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_16_UB_UB_UB_UB  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_16_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_16_UW_UW_UW_UW  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_16_W_W_W_W  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_1_B_B_B_B  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_1_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_1_UB_UB_UB_UB  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_1_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_1_UW_UW_UW_UW  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_1_W_W_W_W  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_2_B_B_B_B  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_2_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_2_UB_UB_UB_UB  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_2_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_2_UW_UW_UW_UW  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_2_W_W_W_W  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_32_B_B_B_B  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_32_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_32_UB_UB_UB_UB  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_32_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_32_UW_UW_UW_UW  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_32_W_W_W_W  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_4_B_B_B_B  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_4_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_4_UB_UB_UB_UB  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_4_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_4_UW_UW_UW_UW  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_4_W_W_W_W  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_8_B_B_B_B  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_8_D_D_D_D  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_8_UB_UB_UB_UB  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_8_UD_UD_UD_UD  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_8_UW_UW_UW_UW  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_8_W_W_W_W  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  (define %19 (extract  %3 i0.new src2))
  (define %20 (bvadd  %14  %19))
  %20
 )
 )
)
)
)
dst)
(define (VMAD_sat_16_B_B_B_B  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 8))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_16_UB_UB_UB_UB  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 8))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_16_UW_UW_UW_UW  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 16))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_16_W_W_W_W  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 16))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_1_B_B_B_B  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 8))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_1_UB_UB_UB_UB  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 8))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_1_UW_UW_UW_UW  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 16))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_1_W_W_W_W  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 16))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_2_B_B_B_B  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 8))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_2_UB_UB_UB_UB  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 8))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_2_UW_UW_UW_UW  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 16))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_2_W_W_W_W  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 16))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_32_B_B_B_B  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 8))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_32_UB_UB_UB_UB  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 8))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_32_UW_UW_UW_UW  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 16))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_32_W_W_W_W  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 16))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_4_B_B_B_B  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 8))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_4_UB_UB_UB_UB  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 8))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_4_UW_UW_UW_UW  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 16))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_4_W_W_W_W  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 16))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_8_B_B_B_B  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 8))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_8_UB_UB_UB_UB  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 8))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_8_UW_UW_UW_UW  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 16))
  %21
 )
 )
)
)
)
dst)
(define (VMAD_sat_8_W_W_W_W  src0 src1 src2 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  (define %20 (extract  %3 i0.new src2))
  (define %21 (bvaddnsw  %14  %20 16))
  %21
 )
 )
)
)
)
dst)
(define (VMOD_16_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_16_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_16_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_16_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_16_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_16_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_1_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_1_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_1_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_1_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_1_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_1_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_2_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_2_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_2_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_2_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_2_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_2_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_32_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_32_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_32_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_32_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_32_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_32_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_4_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_4_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_4_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_4_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_4_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_4_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_8_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_8_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_8_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_8_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_8_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOD_8_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvsmod  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMOV_16_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_16_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_16_Q_Q  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_16_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_16_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_16_UQ_UQ  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_16_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_16_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_1_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_1_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_1_Q_Q  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_1_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_1_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_1_UQ_UQ  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_1_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_1_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_2_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_2_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_2_Q_Q  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_2_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_2_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_2_UQ_UQ  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_2_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_2_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_32_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_32_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_32_Q_Q  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 2048 2048))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 2048 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_32_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_32_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_32_UQ_UQ  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 2048 2048))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 2048 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_32_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_32_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_4_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_4_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_4_Q_Q  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_4_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_4_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_4_UQ_UQ  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_4_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_4_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_8_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_8_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_8_Q_Q  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_8_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_8_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_8_UQ_UQ  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_8_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_8_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_16_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_16_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_16_Q_Q  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_16_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_16_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_16_UQ_UQ  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_16_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_16_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_1_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_1_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_1_Q_Q  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_1_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_1_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_1_UQ_UQ  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_1_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_1_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_2_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_2_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_2_Q_Q  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_2_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_2_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_2_UQ_UQ  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_2_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_2_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_32_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_32_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_32_Q_Q  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 2048 2048))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 2048 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_32_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_32_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_32_UQ_UQ  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 2048 2048))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 2048 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_32_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_32_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_4_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_4_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_4_Q_Q  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_4_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_4_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_4_UQ_UQ  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_4_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_4_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_8_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_8_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_8_Q_Q  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_8_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_8_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_8_UQ_UQ  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 64))])
  (define %3 (+  i0.new  63))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_8_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMOV_sat_8_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  %8
 )
 )
)
)
)
dst)
(define (VMULH_16_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMULH_16_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMULH_1_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMULH_1_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMULH_2_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMULH_2_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMULH_32_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMULH_32_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMULH_4_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMULH_4_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMULH_8_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMULH_8_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_16_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_16_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_16_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_16_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_16_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_16_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_1_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_1_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_1_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_1_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_1_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_1_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_2_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_2_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_2_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_2_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_2_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_2_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_32_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_32_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_32_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_32_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_32_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_32_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_4_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_4_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_4_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_4_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_4_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_4_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_8_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_8_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_8_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_8_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_8_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_8_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmul  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_16_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_16_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_16_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_16_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_1_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_1_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_1_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_1_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_2_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_2_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_2_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_2_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_32_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_32_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_32_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_32_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_4_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_4_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_4_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_4_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_8_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_8_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 8))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_8_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VMUL_sat_8_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvmulnsw  %8  %13 16))
  %14
 )
 )
)
)
)
dst)
(define (VNOT_16_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_16_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_16_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_16_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_16_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_16_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_1_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_1_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_1_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_1_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_1_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_1_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_2_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_2_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_2_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_2_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_2_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_2_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_32_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_32_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_32_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_32_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_32_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_32_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_4_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_4_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_4_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_4_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_4_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_4_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_8_B_B  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_8_D_D  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_8_UB_UB  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_8_UD_UD  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_8_UW_UW  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VNOT_8_W_W  src0 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %9 (bvnot  %8))
  %9
 )
 )
)
)
)
dst)
(define (VOR_16_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_16_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_16_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_16_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_16_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_16_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_1_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_1_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_1_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_1_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_1_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_1_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_2_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_2_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_2_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_2_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_2_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_2_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_32_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_32_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_32_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_32_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_32_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_32_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_4_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_4_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_4_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_4_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_4_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_4_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_8_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_8_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_8_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_8_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_8_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VOR_8_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_16_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_16_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_16_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_16_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_16_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_16_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_1_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_1_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_1_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_1_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_1_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_1_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_2_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_2_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_2_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_2_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_2_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_2_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_32_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_32_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_32_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_32_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_32_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_32_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_4_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_4_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_4_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_4_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_4_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_4_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_8_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_8_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_8_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_8_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_8_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_8_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_16_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_16_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_16_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_16_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_16_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_16_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_1_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_1_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_1_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_1_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_1_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_1_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_2_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_2_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_2_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_2_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_2_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_2_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_32_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_32_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_32_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_32_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_32_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_32_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_4_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_4_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_4_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_4_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_4_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_4_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_8_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_8_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_8_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_8_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_8_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHL_sat_8_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvshl  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_16_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_16_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_16_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_1_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_1_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_1_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_2_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_2_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_2_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_32_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_32_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_32_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_4_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_4_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_4_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_8_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_8_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_8_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_16_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_16_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_16_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_1_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_1_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_1_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_2_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_2_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_2_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_32_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_32_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_32_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_4_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_4_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_4_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_8_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_8_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VSHR_sat_8_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvlshr  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_16_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_16_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_16_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_16_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_16_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_16_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_1_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_1_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_1_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 8 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_1_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_1_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_1_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_2_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_2_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_2_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 16 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_2_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_2_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_2_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_32_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_32_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_32_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_32_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 1024 1024))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 1024 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_32_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_32_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 512 512))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 512 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_4_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_4_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_4_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 32 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_4_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_4_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_4_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_8_B_B_B  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_8_D_D_D  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_8_UB_UB_UB  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 64 8))])
  (define %3 (+  i0.new  7))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_8_UD_UD_UD  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 256 256))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 256 32))])
  (define %3 (+  i0.new  31))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_8_UW_UW_UW  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(define (VXOR_8_W_W_W  src0 src1 )
(define dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([i0.new (reverse (range 0 128 16))])
  (define %3 (+  i0.new  15))
  (define %8 (extract  %3 i0.new src0))
  (define %13 (extract  %3 i0.new src1))
  (define %14 (bvxor  %8  %13))
  %14
 )
 )
)
)
)
dst)
(provide (all-defined-out))