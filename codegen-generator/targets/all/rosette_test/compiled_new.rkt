#lang rosette
(require "bvops.rkt")
(define (vqdmulh_n_s16  a b )
(define %5 (extract  15 0 b))
(define %6.downcasted0 (sign-extend  %5 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %10 (+  e0.new  15))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 32)))
  (define %13.downcasted0 (bvmul  %12.downcasted0  %6.downcasted0))
  (define %19.downcasted0 (bvashr  %13.downcasted0  (bv 15 32)))
  (define %20.downcasted0 (bvssat %19.downcasted0 32 16 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqdmulh_n_s32  a b )
(define %5 (extract  31 0 b))
(define %6.downcasted0 (sign-extend  %5 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %10 (+  e0.new  31))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvmul  %12.downcasted0  %6.downcasted0))
  (define %19.downcasted0 (bvashr  %13.downcasted0  (bv 31 64)))
  (define %20.downcasted0 (bvssat %19.downcasted0 64 32 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqdmulh_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 32)))
  (define %13.downcasted0 (bvmul  %6.downcasted0  %12.downcasted0))
  (define %19.downcasted0 (bvashr  %13.downcasted0  (bv 15 32)))
  (define %20.downcasted0 (bvssat %19.downcasted0 32 16 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqdmulh_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvmul  %6.downcasted0  %12.downcasted0))
  (define %19.downcasted0 (bvashr  %13.downcasted0  (bv 31 64)))
  (define %20.downcasted0 (bvssat %19.downcasted0 64 32 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqdmulhh_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 32)))
  (define %13.downcasted0 (bvmul  %6.downcasted0  %12.downcasted0))
  (define %19.downcasted0 (bvashr  %13.downcasted0  (bv 15 32)))
  (define %20.downcasted0 (bvssat %19.downcasted0 32 16 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqdmulhq_n_s16  a b )
(define %5 (extract  15 0 b))
(define %6.downcasted0 (sign-extend  %5 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %10 (+  e0.new  15))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 32)))
  (define %13.downcasted0 (bvmul  %12.downcasted0  %6.downcasted0))
  (define %19.downcasted0 (bvashr  %13.downcasted0  (bv 15 32)))
  (define %20.downcasted0 (bvssat %19.downcasted0 32 16 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqdmulhq_n_s32  a b )
(define %5 (extract  31 0 b))
(define %6.downcasted0 (sign-extend  %5 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %10 (+  e0.new  31))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvmul  %12.downcasted0  %6.downcasted0))
  (define %19.downcasted0 (bvashr  %13.downcasted0  (bv 31 64)))
  (define %20.downcasted0 (bvssat %19.downcasted0 64 32 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqdmulhq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 32)))
  (define %13.downcasted0 (bvmul  %6.downcasted0  %12.downcasted0))
  (define %19.downcasted0 (bvashr  %13.downcasted0  (bv 15 32)))
  (define %20.downcasted0 (bvssat %19.downcasted0 32 16 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqdmulhq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvmul  %6.downcasted0  %12.downcasted0))
  (define %19.downcasted0 (bvashr  %13.downcasted0  (bv 31 64)))
  (define %20.downcasted0 (bvssat %19.downcasted0 64 32 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqdmulhs_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvmul  %6.downcasted0  %12.downcasted0))
  (define %19.downcasted0 (bvashr  %13.downcasted0  (bv 31 64)))
  (define %20.downcasted0 (bvssat %19.downcasted0 64 32 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqrdmulh_n_s16  a b )
(define %5 (extract  15 0 b))
(define %6.downcasted0 (sign-extend  %5 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %10 (+  e0.new  15))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvmul  %12.downcasted0  %6.downcasted0))
  (define %14.downcasted0 (bvadd  %13.downcasted0  (bv 16384 64)))
  (define %19.downcasted0 (bvashr  %14.downcasted0  (bv 15 64)))
  (define %20.downcasted0 (bvssat %19.downcasted0 64 16 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqrdmulh_n_s32  a b )
(define %5 (extract  31 0 b))
(define %6.downcasted0 (sign-extend  %5 (bitvector 128)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %10 (+  e0.new  31))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 128)))
  (define %13.downcasted0 (bvmul  %12.downcasted0  %6.downcasted0))
  (define %14.downcasted0 (bvadd  %13.downcasted0  (bv 1073741824 128)))
  (define %19.downcasted0 (bvashr  %14.downcasted0  (bv 31 128)))
  (define %20.downcasted0 (bvssat %19.downcasted0 128 32 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqrdmulh_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvmul  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (bvadd  %13.downcasted0  (bv 16384 64)))
  (define %19.downcasted0 (bvashr  %14.downcasted0  (bv 15 64)))
  (define %20.downcasted0 (bvssat %19.downcasted0 64 16 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqrdmulh_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 128)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 128)))
  (define %13.downcasted0 (bvmul  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (bvadd  %13.downcasted0  (bv 1073741824 128)))
  (define %19.downcasted0 (bvashr  %14.downcasted0  (bv 31 128)))
  (define %20.downcasted0 (bvssat %19.downcasted0 128 32 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqrdmulhh_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvmul  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (bvadd  %13.downcasted0  (bv 16384 64)))
  (define %19.downcasted0 (bvashr  %14.downcasted0  (bv 15 64)))
  (define %20.downcasted0 (bvssat %19.downcasted0 64 16 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqrdmulhq_n_s16  a b )
(define %5 (extract  15 0 b))
(define %6.downcasted0 (sign-extend  %5 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %10 (+  e0.new  15))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvmul  %12.downcasted0  %6.downcasted0))
  (define %14.downcasted0 (bvadd  %13.downcasted0  (bv 16384 64)))
  (define %19.downcasted0 (bvashr  %14.downcasted0  (bv 15 64)))
  (define %20.downcasted0 (bvssat %19.downcasted0 64 16 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqrdmulhq_n_s32  a b )
(define %5 (extract  31 0 b))
(define %6.downcasted0 (sign-extend  %5 (bitvector 128)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %10 (+  e0.new  31))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 128)))
  (define %13.downcasted0 (bvmul  %12.downcasted0  %6.downcasted0))
  (define %14.downcasted0 (bvadd  %13.downcasted0  (bv 1073741824 128)))
  (define %19.downcasted0 (bvashr  %14.downcasted0  (bv 31 128)))
  (define %20.downcasted0 (bvssat %19.downcasted0 128 32 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqrdmulhq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvmul  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (bvadd  %13.downcasted0  (bv 16384 64)))
  (define %19.downcasted0 (bvashr  %14.downcasted0  (bv 15 64)))
  (define %20.downcasted0 (bvssat %19.downcasted0 64 16 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqrdmulhq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 128)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 128)))
  (define %13.downcasted0 (bvmul  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (bvadd  %13.downcasted0  (bv 1073741824 128)))
  (define %19.downcasted0 (bvashr  %14.downcasted0  (bv 31 128)))
  (define %20.downcasted0 (bvssat %19.downcasted0 128 32 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vqrdmulhs_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 128)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 128)))
  (define %13.downcasted0 (bvmul  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (bvadd  %13.downcasted0  (bv 1073741824 128)))
  (define %19.downcasted0 (bvashr  %14.downcasted0  (bv 31 128)))
  (define %20.downcasted0 (bvssat %19.downcasted0 128 32 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(provide (all-defined-out))