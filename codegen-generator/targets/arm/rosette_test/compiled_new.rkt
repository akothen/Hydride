#lang rosette
(require "bvops.rkt")
(define (vaba_s16  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 32)))
  (define %14.downcasted0 (extract  15 0 %13.downcasted0))
  (define %23 (extract  %3 e0.new a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vaba_s32  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 64)))
  (define %14.downcasted0 (extract  31 0 %13.downcasted0))
  (define %23 (extract  %3 e0.new a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vaba_s8  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 16)))
  (define %14.downcasted0 (extract  7 0 %13.downcasted0))
  (define %23 (extract  %3 e0.new a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vaba_u16  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 32)))
  (define %14.downcasted0 (extract  15 0 %13.downcasted0))
  (define %23 (extract  %3 e0.new a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vaba_u32  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 64)))
  (define %14.downcasted0 (extract  31 0 %13.downcasted0))
  (define %23 (extract  %3 e0.new a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vaba_u8  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 16)))
  (define %14.downcasted0 (extract  7 0 %13.downcasted0))
  (define %23 (extract  %3 e0.new a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vabal_high_s16  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  15))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvsub  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (integer->bitvector (abs (bitvector->integer %18.downcasted0)) (bitvector 32)))
  (define %20.downcasted0 (extract  31 0 %19.downcasted0))
  (define %24 (+  e0.new  31))
  (define %29 (extract  %24 e0.new a))
  (define %30 (bvadd  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vabal_high_s32  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  31))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvsub  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (integer->bitvector (abs (bitvector->integer %18.downcasted0)) (bitvector 64)))
  (define %20.downcasted0 (extract  63 0 %19.downcasted0))
  (define %24 (+  e0.new  63))
  (define %29 (extract  %24 e0.new a))
  (define %30 (bvadd  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vabal_high_s8  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  7))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 16)))
  (define %18.downcasted0 (bvsub  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (integer->bitvector (abs (bitvector->integer %18.downcasted0)) (bitvector 16)))
  (define %20.downcasted0 (extract  15 0 %19.downcasted0))
  (define %24 (+  e0.new  15))
  (define %29 (extract  %24 e0.new a))
  (define %30 (bvadd  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vabal_high_u16  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  15))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvsub  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (integer->bitvector (abs (bitvector->integer %18.downcasted0)) (bitvector 32)))
  (define %20.downcasted0 (extract  31 0 %19.downcasted0))
  (define %24 (+  e0.new  31))
  (define %29 (extract  %24 e0.new a))
  (define %30 (bvadd  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vabal_high_u32  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  31))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvsub  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (integer->bitvector (abs (bitvector->integer %18.downcasted0)) (bitvector 64)))
  (define %20.downcasted0 (extract  63 0 %19.downcasted0))
  (define %24 (+  e0.new  63))
  (define %29 (extract  %24 e0.new a))
  (define %30 (bvadd  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vabal_high_u8  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  7))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 16)))
  (define %18.downcasted0 (bvsub  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (integer->bitvector (abs (bitvector->integer %18.downcasted0)) (bitvector 16)))
  (define %20.downcasted0 (extract  15 0 %19.downcasted0))
  (define %24 (+  e0.new  15))
  (define %29 (extract  %24 e0.new a))
  (define %30 (bvadd  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vabal_s16  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 32)))
  (define %14.downcasted0 (extract  31 0 %13.downcasted0))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  31))
  (define %23 (extract  %18 %15.new0 a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vabal_s32  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 64)))
  (define %14.downcasted0 (extract  63 0 %13.downcasted0))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  63))
  (define %23 (extract  %18 %15.new0 a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vabal_s8  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 16)))
  (define %14.downcasted0 (extract  15 0 %13.downcasted0))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  15))
  (define %23 (extract  %18 %15.new0 a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vabal_u16  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 32)))
  (define %14.downcasted0 (extract  31 0 %13.downcasted0))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  31))
  (define %23 (extract  %18 %15.new0 a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vabal_u32  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 64)))
  (define %14.downcasted0 (extract  63 0 %13.downcasted0))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  63))
  (define %23 (extract  %18 %15.new0 a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vabal_u8  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 16)))
  (define %14.downcasted0 (extract  15 0 %13.downcasted0))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  15))
  (define %23 (extract  %18 %15.new0 a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vabaq_s16  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 32)))
  (define %14.downcasted0 (extract  15 0 %13.downcasted0))
  (define %23 (extract  %3 e0.new a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vabaq_s32  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 64)))
  (define %14.downcasted0 (extract  31 0 %13.downcasted0))
  (define %23 (extract  %3 e0.new a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vabaq_s8  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 16)))
  (define %14.downcasted0 (extract  7 0 %13.downcasted0))
  (define %23 (extract  %3 e0.new a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vabaq_u16  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 32)))
  (define %14.downcasted0 (extract  15 0 %13.downcasted0))
  (define %23 (extract  %3 e0.new a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vabaq_u32  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 64)))
  (define %14.downcasted0 (extract  31 0 %13.downcasted0))
  (define %23 (extract  %3 e0.new a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vabaq_u8  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (integer->bitvector (abs (bitvector->integer %12.downcasted0)) (bitvector 16)))
  (define %14.downcasted0 (extract  7 0 %13.downcasted0))
  (define %23 (extract  %3 e0.new a))
  (define %24 (bvadd  %23  %14.downcasted0))
  %24
 )
 )
)
)
)
result2)
(define (vabd_s16  a b )
(define result2
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
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 32)))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 16)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabd_s32  a b )
(define result2
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
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 64)))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 32)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabd_s8  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 16)))
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 16)))
  (define %15.downcasted0 (extract  7 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 8)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabd_u16  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (zero-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 32)))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 16)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabd_u32  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (zero-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 64)))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 32)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabd_u8  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (zero-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 16)))
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 16)))
  (define %15.downcasted0 (extract  7 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 8)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabdl_high_s16  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %7.new0 (/  e0.new  2))
  (define %10 (+  %7.new0  15))
  (define %11 (extract  %10 %7.new0 %2))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 32)))
  (define %17 (extract  %10 %7.new0 %5))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 32)))
  (define %19.downcasted0 (bvsub  %12.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (integer->bitvector (abs (bitvector->integer %19.downcasted0)) (bitvector 32)))
  (define %21.downcasted0 (extract  31 0 %20.downcasted0))
  (define %31 (bvadd  (bv 0 32)  %21.downcasted0))
  %31
 )
 )
)
)
)
result2)
(define (vabdl_high_s32  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %7.new0 (/  e0.new  2))
  (define %10 (+  %7.new0  31))
  (define %11 (extract  %10 %7.new0 %2))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %17 (extract  %10 %7.new0 %5))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 64)))
  (define %19.downcasted0 (bvsub  %12.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (integer->bitvector (abs (bitvector->integer %19.downcasted0)) (bitvector 64)))
  (define %21.downcasted0 (extract  63 0 %20.downcasted0))
  (define %31 (bvadd  (bv 0 64)  %21.downcasted0))
  %31
 )
 )
)
)
)
result2)
(define (vabdl_high_s8  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %7.new0 (/  e0.new  2))
  (define %10 (+  %7.new0  7))
  (define %11 (extract  %10 %7.new0 %2))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 16)))
  (define %17 (extract  %10 %7.new0 %5))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 16)))
  (define %19.downcasted0 (bvsub  %12.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (integer->bitvector (abs (bitvector->integer %19.downcasted0)) (bitvector 16)))
  (define %21.downcasted0 (extract  15 0 %20.downcasted0))
  (define %31 (bvadd  (bv 0 16)  %21.downcasted0))
  %31
 )
 )
)
)
)
result2)
(define (vabdl_high_u16  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %7.new0 (/  e0.new  2))
  (define %10 (+  %7.new0  15))
  (define %11 (extract  %10 %7.new0 %2))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %17 (extract  %10 %7.new0 %5))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 32)))
  (define %19.downcasted0 (bvsub  %12.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (integer->bitvector (abs (bitvector->integer %19.downcasted0)) (bitvector 32)))
  (define %21.downcasted0 (extract  31 0 %20.downcasted0))
  (define %31 (bvadd  (bv 0 32)  %21.downcasted0))
  %31
 )
 )
)
)
)
result2)
(define (vabdl_high_u32  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %7.new0 (/  e0.new  2))
  (define %10 (+  %7.new0  31))
  (define %11 (extract  %10 %7.new0 %2))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %17 (extract  %10 %7.new0 %5))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 64)))
  (define %19.downcasted0 (bvsub  %12.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (integer->bitvector (abs (bitvector->integer %19.downcasted0)) (bitvector 64)))
  (define %21.downcasted0 (extract  63 0 %20.downcasted0))
  (define %31 (bvadd  (bv 0 64)  %21.downcasted0))
  %31
 )
 )
)
)
)
result2)
(define (vabdl_high_u8  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %7.new0 (/  e0.new  2))
  (define %10 (+  %7.new0  7))
  (define %11 (extract  %10 %7.new0 %2))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 16)))
  (define %17 (extract  %10 %7.new0 %5))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 16)))
  (define %19.downcasted0 (bvsub  %12.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (integer->bitvector (abs (bitvector->integer %19.downcasted0)) (bitvector 16)))
  (define %21.downcasted0 (extract  15 0 %20.downcasted0))
  (define %31 (bvadd  (bv 0 16)  %21.downcasted0))
  %31
 )
 )
)
)
)
result2)
(define (vabdl_s16  a b )
(define result2
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
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 32)))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 32)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabdl_s32  a b )
(define result2
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
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 64)))
  (define %15.downcasted0 (extract  63 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 64)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabdl_s8  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 16)))
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 16)))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 16)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabdl_u16  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (zero-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 32)))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 32)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabdl_u32  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (zero-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 64)))
  (define %15.downcasted0 (extract  63 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 64)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabdl_u8  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (zero-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 16)))
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 16)))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 16)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabdq_s16  a b )
(define result2
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
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 32)))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 16)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabdq_s32  a b )
(define result2
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
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 64)))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 32)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabdq_s8  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 16)))
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 16)))
  (define %15.downcasted0 (extract  7 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 8)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabdq_u16  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (zero-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 32)))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 16)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabdq_u32  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (zero-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 64)))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 32)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabdq_u8  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (zero-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 16)))
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %14.downcasted0 (integer->bitvector (abs (bitvector->integer %13.downcasted0)) (bitvector 16)))
  (define %15.downcasted0 (extract  7 0 %14.downcasted0))
  (define %25 (bvadd  (bv 0 8)  %15.downcasted0))
  %25
 )
 )
)
)
)
result2)
(define (vabs_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 32)))
  (define %11.downcasted0 (extract  15 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vabs_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 64)))
  (define %11.downcasted0 (extract  31 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vabs_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 128)))
  (define %11.downcasted0 (extract  63 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vabs_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 16)))
  (define %11.downcasted0 (extract  7 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vabsd_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 128)))
  (define %11.downcasted0 (extract  63 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vabsq_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 32)))
  (define %11.downcasted0 (extract  15 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vabsq_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 64)))
  (define %11.downcasted0 (extract  31 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vabsq_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 128)))
  (define %11.downcasted0 (extract  63 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vabsq_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 16)))
  (define %11.downcasted0 (extract  7 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vadd_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vadd_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vadd_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vadd_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vadd_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vadd_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vadd_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vadd_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vaddd_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vaddd_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vaddhn_high_s16  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvadd  %5  %10))
  (define %17 (extract  15 8 %11))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vaddhn_high_s32  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvadd  %5  %10))
  (define %17 (extract  31 16 %11))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vaddhn_high_s64  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvadd  %5  %10))
  (define %17 (extract  63 32 %11))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vaddhn_high_u16  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvadd  %5  %10))
  (define %17 (extract  15 8 %11))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vaddhn_high_u32  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvadd  %5  %10))
  (define %17 (extract  31 16 %11))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vaddhn_high_u64  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvadd  %5  %10))
  (define %17 (extract  63 32 %11))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vaddhn_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  15))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvadd  %5  %10))
  (define %17 (extract  15 8 %11))
  %17
 )
 )
)
)
)
result)
(define (vaddhn_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  31))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvadd  %5  %10))
  (define %17 (extract  31 16 %11))
  %17
 )
 )
)
)
)
result)
(define (vaddhn_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  63))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvadd  %5  %10))
  (define %17 (extract  63 32 %11))
  %17
 )
 )
)
)
)
result)
(define (vaddhn_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  15))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvadd  %5  %10))
  (define %17 (extract  15 8 %11))
  %17
 )
 )
)
)
)
result)
(define (vaddhn_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  31))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvadd  %5  %10))
  (define %17 (extract  31 16 %11))
  %17
 )
 )
)
)
)
result)
(define (vaddhn_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  63))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvadd  %5  %10))
  (define %17 (extract  63 32 %11))
  %17
 )
 )
)
)
)
result)
(define (vaddl_high_s16  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  15))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvadd  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  31 0 %18.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vaddl_high_s32  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  31))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvadd  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  63 0 %18.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vaddl_high_s8  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  7))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 16)))
  (define %18.downcasted0 (bvadd  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  15 0 %18.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vaddl_high_u16  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  15))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvadd  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  31 0 %18.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vaddl_high_u32  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  31))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvadd  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  63 0 %18.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vaddl_high_u8  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  7))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 16)))
  (define %18.downcasted0 (bvadd  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  15 0 %18.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vaddl_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  31 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vaddl_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  63 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vaddl_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  15 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vaddl_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  31 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vaddl_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  63 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vaddl_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  15 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vaddq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vaddq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vaddq_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vaddq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vaddq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vaddq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vaddq_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vaddq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvadd  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vaddw_high_s16  a b )
(define %2 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  15))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvadd  %8.downcasted0  %14.downcasted0))
  (define %20.downcasted0 (extract  31 0 %15.downcasted0))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vaddw_high_s32  a b )
(define %2 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 128)))
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  31))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 128)))
  (define %15.downcasted0 (bvadd  %8.downcasted0  %14.downcasted0))
  (define %20.downcasted0 (extract  63 0 %15.downcasted0))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vaddw_high_s8  a b )
(define %2 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  7))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 32)))
  (define %15.downcasted0 (bvadd  %8.downcasted0  %14.downcasted0))
  (define %20.downcasted0 (extract  15 0 %15.downcasted0))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vaddw_high_u16  a b )
(define %2 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  15))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (zero-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvadd  %8.downcasted0  %14.downcasted0))
  (define %20.downcasted0 (extract  31 0 %15.downcasted0))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vaddw_high_u32  a b )
(define %2 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 128)))
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  31))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (zero-extend  %13 (bitvector 128)))
  (define %15.downcasted0 (bvadd  %8.downcasted0  %14.downcasted0))
  (define %20.downcasted0 (extract  63 0 %15.downcasted0))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vaddw_high_u8  a b )
(define %2 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 32)))
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  7))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (zero-extend  %13 (bitvector 32)))
  (define %15.downcasted0 (bvadd  %8.downcasted0  %14.downcasted0))
  (define %20.downcasted0 (extract  15 0 %15.downcasted0))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vaddw_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  31))
  (define %4 (extract  %3 %0.new0 a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  31 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vaddw_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  63))
  (define %4 (extract  %3 %0.new0 a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 128)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  63 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vaddw_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  15))
  (define %4 (extract  %3 %0.new0 a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %9 (+  e0.new  7))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  15 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vaddw_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  31))
  (define %4 (extract  %3 %0.new0 a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  31 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vaddw_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  63))
  (define %4 (extract  %3 %0.new0 a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 128)))
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 128)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  63 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vaddw_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  15))
  (define %4 (extract  %3 %0.new0 a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %9 (+  e0.new  7))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  15 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vceq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 65535 16) (bv 0 16)))
  %17
 )
 )
)
)
)
result)
(define (vceq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 4294967295 32) (bv 0 32)))
  %17
 )
 )
)
)
)
result)
(define (vceq_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %17
 )
 )
)
)
)
result)
(define (vceq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 255 8) (bv 0 8)))
  %17
 )
 )
)
)
)
result)
(define (vceq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 65535 16) (bv 0 16)))
  %17
 )
 )
)
)
)
result)
(define (vceq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 4294967295 32) (bv 0 32)))
  %17
 )
 )
)
)
)
result)
(define (vceq_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %17
 )
 )
)
)
)
result)
(define (vceq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 255 8) (bv 0 8)))
  %17
 )
 )
)
)
)
result)
(define (vceqd_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %17
 )
 )
)
)
)
result)
(define (vceqd_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %17
 )
 )
)
)
)
result)
(define (vceqq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 65535 16) (bv 0 16)))
  %17
 )
 )
)
)
)
result)
(define (vceqq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 4294967295 32) (bv 0 32)))
  %17
 )
 )
)
)
)
result)
(define (vceqq_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %17
 )
 )
)
)
)
result)
(define (vceqq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 255 8) (bv 0 8)))
  %17
 )
 )
)
)
)
result)
(define (vceqq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 65535 16) (bv 0 16)))
  %17
 )
 )
)
)
)
result)
(define (vceqq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 4294967295 32) (bv 0 32)))
  %17
 )
 )
)
)
)
result)
(define (vceqq_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %17
 )
 )
)
)
)
result)
(define (vceqq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bveq  %4  %9))
  (define %17 (if (equal? %10 #t) (bv 255 8) (bv 0 8)))
  %17
 )
 )
)
)
)
result)
(define (vceqz_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 16)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %13
 )
 )
)
)
)
result)
(define (vceqz_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 32)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %13
 )
 )
)
)
)
result)
(define (vceqz_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vceqz_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 8)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %13
 )
 )
)
)
)
result)
(define (vceqz_u16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 16)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %13
 )
 )
)
)
)
result)
(define (vceqz_u32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 32)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %13
 )
 )
)
)
)
result)
(define (vceqz_u64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vceqz_u8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 8)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %13
 )
 )
)
)
)
result)
(define (vceqzd_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vceqzd_u64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vceqzq_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 16)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %13
 )
 )
)
)
)
result)
(define (vceqzq_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 32)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %13
 )
 )
)
)
)
result)
(define (vceqzq_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vceqzq_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 8)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %13
 )
 )
)
)
)
result)
(define (vceqzq_u16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 16)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %13
 )
 )
)
)
)
result)
(define (vceqzq_u32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 32)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %13
 )
 )
)
)
)
result)
(define (vceqzq_u64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vceqzq_u8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bveq  %4  (bv 0 8)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %13
 )
 )
)
)
)
result)
(define (vcge_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vcge_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vcge_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcge_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vcge_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vcge_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vcge_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcge_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vcged_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcged_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcgeq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vcgeq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vcgeq_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcgeq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vcgeq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vcgeq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vcgeq_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcgeq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vcgez_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsge  %4  (bv 0 16)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %13
 )
 )
)
)
)
result)
(define (vcgez_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsge  %4  (bv 0 32)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %13
 )
 )
)
)
)
result)
(define (vcgez_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsge  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vcgez_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsge  %4  (bv 0 8)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %13
 )
 )
)
)
)
result)
(define (vcgezd_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsge  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vcgezq_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsge  %4  (bv 0 16)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %13
 )
 )
)
)
)
result)
(define (vcgezq_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsge  %4  (bv 0 32)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %13
 )
 )
)
)
)
result)
(define (vcgezq_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsge  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vcgezq_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsge  %4  (bv 0 8)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %13
 )
 )
)
)
)
result)
(define (vcgt_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vcgt_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vcgt_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcgt_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vcgt_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vcgt_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vcgt_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcgt_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vcgtd_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcgtd_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcgtq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vcgtq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vcgtq_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcgtq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vcgtq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vcgtq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vcgtq_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcgtq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vcgtz_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsgt  %4  (bv 0 16)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %13
 )
 )
)
)
)
result)
(define (vcgtz_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsgt  %4  (bv 0 32)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %13
 )
 )
)
)
)
result)
(define (vcgtz_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsgt  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vcgtz_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsgt  %4  (bv 0 8)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %13
 )
 )
)
)
)
result)
(define (vcgtzd_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsgt  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vcgtzq_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsgt  %4  (bv 0 16)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %13
 )
 )
)
)
)
result)
(define (vcgtzq_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsgt  %4  (bv 0 32)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %13
 )
 )
)
)
)
result)
(define (vcgtzq_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsgt  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vcgtzq_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsgt  %4  (bv 0 8)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %13
 )
 )
)
)
)
result)
(define (vcle_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vcle_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vcle_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcle_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vcle_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vcle_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vcle_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcle_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vcled_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcled_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcleq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vcleq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vcleq_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcleq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vcleq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vcleq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vcleq_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcleq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvuge  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vclez_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsle  %4  (bv 0 16)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %13
 )
 )
)
)
)
result)
(define (vclez_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsle  %4  (bv 0 32)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %13
 )
 )
)
)
)
result)
(define (vclez_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsle  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vclez_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsle  %4  (bv 0 8)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %13
 )
 )
)
)
)
result)
(define (vclezd_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsle  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vclezq_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsle  %4  (bv 0 16)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %13
 )
 )
)
)
)
result)
(define (vclezq_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsle  %4  (bv 0 32)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %13
 )
 )
)
)
)
result)
(define (vclezq_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsle  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vclezq_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvsle  %4  (bv 0 8)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %13
 )
 )
)
)
)
result)
(define (vclt_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vclt_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vclt_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vclt_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vclt_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vclt_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vclt_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vclt_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vcltd_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcltd_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcltq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vcltq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vcltq_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcltq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvsgt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vcltq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vcltq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vcltq_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vcltq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %10 (extract  %3 e0.new a))
  (define %12.downcasted0 (bvugt  %4  %10))
  (define %19 (if (equal? %12.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vcltz_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvslt  %4  (bv 0 16)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %13
 )
 )
)
)
)
result)
(define (vcltz_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvslt  %4  (bv 0 32)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %13
 )
 )
)
)
)
result)
(define (vcltz_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvslt  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vcltz_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvslt  %4  (bv 0 8)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %13
 )
 )
)
)
)
result)
(define (vcltzd_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvslt  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vcltzq_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvslt  %4  (bv 0 16)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %13
 )
 )
)
)
)
result)
(define (vcltzq_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvslt  %4  (bv 0 32)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %13
 )
 )
)
)
)
result)
(define (vcltzq_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvslt  %4  (bv 0 64)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %13
 )
 )
)
)
)
result)
(define (vcltzq_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %6.downcasted0 (bvslt  %4  (bv 0 8)))
  (define %13 (if (equal? %6.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %13
 )
 )
)
)
)
result)
(define (vcombine_s16  low high )
(define %3fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %15 (+  %inner.it  0))
  (define %16 (+  %15  63))
  (define %0 (extract  %16 %15 high))
  (define %1 (extract  %16 %15 low))
  (define %2 (concat %0 %1))
  %2
 )
 )
)
)
)
%3fakeReturn)
(define (vcombine_s32  low high )
(define %3fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %15 (+  %inner.it  0))
  (define %16 (+  %15  63))
  (define %0 (extract  %16 %15 high))
  (define %1 (extract  %16 %15 low))
  (define %2 (concat %0 %1))
  %2
 )
 )
)
)
)
%3fakeReturn)
(define (vcombine_s64  low high )
(define %3fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %15 (+  %inner.it  0))
  (define %16 (+  %15  63))
  (define %0 (extract  %16 %15 high))
  (define %1 (extract  %16 %15 low))
  (define %2 (concat %0 %1))
  %2
 )
 )
)
)
)
%3fakeReturn)
(define (vcombine_s8  low high )
(define %3fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %15 (+  %inner.it  0))
  (define %16 (+  %15  63))
  (define %0 (extract  %16 %15 high))
  (define %1 (extract  %16 %15 low))
  (define %2 (concat %0 %1))
  %2
 )
 )
)
)
)
%3fakeReturn)
(define (vcombine_u16  low high )
(define %3fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %15 (+  %inner.it  0))
  (define %16 (+  %15  63))
  (define %0 (extract  %16 %15 high))
  (define %1 (extract  %16 %15 low))
  (define %2 (concat %0 %1))
  %2
 )
 )
)
)
)
%3fakeReturn)
(define (vcombine_u32  low high )
(define %3fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %15 (+  %inner.it  0))
  (define %16 (+  %15  63))
  (define %0 (extract  %16 %15 high))
  (define %1 (extract  %16 %15 low))
  (define %2 (concat %0 %1))
  %2
 )
 )
)
)
)
%3fakeReturn)
(define (vcombine_u64  low high )
(define %3fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %15 (+  %inner.it  0))
  (define %16 (+  %15  63))
  (define %0 (extract  %16 %15 high))
  (define %1 (extract  %16 %15 low))
  (define %2 (concat %0 %1))
  %2
 )
 )
)
)
)
%3fakeReturn)
(define (vcombine_u8  low high )
(define %3fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %15 (+  %inner.it  0))
  (define %16 (+  %15  63))
  (define %0 (extract  %16 %15 high))
  (define %1 (extract  %16 %15 low))
  (define %2 (concat %0 %1))
  %2
 )
 )
)
)
)
%3fakeReturn)
(define (vdot_s32  r a b )
(define result2
(apply
concat
(for/list ([e0.new (reverse (range 0 64 32))])
 (define %83.clone.0 (+  e0.new  31))
 (define %84.clone.0 (extract  %83.clone.0 e0.new r))
 (define result2 %84.clone.0)
 (define %16.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 32 8))])
  (define %1.new0 (+  e0.new  iterator.0.new))
  (define %5.new0 (+  %1.new0  7))
  (define %6 (extract  %5.new0 %1.new0 a))
  (define %7 (sign-extend  %6 (bitvector 32)))
  (define %14 (extract  %5.new0 %1.new0 b))
  (define %15 (sign-extend  %14 (bitvector 32)))
  (define %16 (bvmul  %7  %15))
  %16
 )
))
 (define %88.clone.4.new1 (+  e0.new  31))
 (define %16.acc0 (bvadd %16.ext0.red result2))
 %16.acc0
)
)
)
result2)
(define (vdot_u32  r a b )
(define result2
(apply
concat
(for/list ([e0.new (reverse (range 0 64 32))])
 (define %83.clone.0 (+  e0.new  31))
 (define %84.clone.0 (extract  %83.clone.0 e0.new r))
 (define result2 %84.clone.0)
 (define %16.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 32 8))])
  (define %1.new0 (+  e0.new  iterator.0.new))
  (define %5.new0 (+  %1.new0  7))
  (define %6 (extract  %5.new0 %1.new0 a))
  (define %7 (zero-extend  %6 (bitvector 32)))
  (define %14 (extract  %5.new0 %1.new0 b))
  (define %15 (zero-extend  %14 (bitvector 32)))
  (define %16 (bvmul  %7  %15))
  %16
 )
))
 (define %88.clone.4.new1 (+  e0.new  31))
 (define %16.acc0 (bvadd %16.ext0.red result2))
 %16.acc0
)
)
)
result2)
(define (vdotq_s32  r a b )
(define result2
(apply
concat
(for/list ([e0.new (reverse (range 0 128 32))])
 (define %83.clone.0 (+  e0.new  31))
 (define %84.clone.0 (extract  %83.clone.0 e0.new r))
 (define result2 %84.clone.0)
 (define %16.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 32 8))])
  (define %1.new0 (+  e0.new  iterator.0.new))
  (define %5.new0 (+  %1.new0  7))
  (define %6 (extract  %5.new0 %1.new0 a))
  (define %7 (sign-extend  %6 (bitvector 32)))
  (define %14 (extract  %5.new0 %1.new0 b))
  (define %15 (sign-extend  %14 (bitvector 32)))
  (define %16 (bvmul  %7  %15))
  %16
 )
))
 (define %88.clone.4.new1 (+  e0.new  31))
 (define %16.acc0 (bvadd %16.ext0.red result2))
 %16.acc0
)
)
)
result2)
(define (vdotq_u32  r a b )
(define result2
(apply
concat
(for/list ([e0.new (reverse (range 0 128 32))])
 (define %83.clone.0 (+  e0.new  31))
 (define %84.clone.0 (extract  %83.clone.0 e0.new r))
 (define result2 %84.clone.0)
 (define %16.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 32 8))])
  (define %1.new0 (+  e0.new  iterator.0.new))
  (define %5.new0 (+  %1.new0  7))
  (define %6 (extract  %5.new0 %1.new0 a))
  (define %7 (zero-extend  %6 (bitvector 32)))
  (define %14 (extract  %5.new0 %1.new0 b))
  (define %15 (zero-extend  %14 (bitvector 32)))
  (define %16 (bvmul  %7  %15))
  %16
 )
))
 (define %88.clone.4.new1 (+  e0.new  31))
 (define %16.acc0 (bvadd %16.ext0.red result2))
 %16.acc0
)
)
)
result2)
(define (vdup_n_s16  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  value
 )
 )
)
)
)
result)
(define (vdup_n_s32  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  value
 )
 )
)
)
)
result)
(define (vdup_n_s8  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  value
 )
 )
)
)
)
result)
(define (vdup_n_u16  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  value
 )
 )
)
)
)
result)
(define (vdup_n_u32  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  value
 )
 )
)
)
)
result)
(define (vdup_n_u8  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  value
 )
 )
)
)
)
result)
(define (vdupq_n_s16  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  value
 )
 )
)
)
)
result)
(define (vdupq_n_s32  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  value
 )
 )
)
)
)
result)
(define (vdupq_n_s64  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  value
 )
 )
)
)
)
result)
(define (vdupq_n_s8  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  value
 )
 )
)
)
)
result)
(define (vdupq_n_u16  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  value
 )
 )
)
)
)
result)
(define (vdupq_n_u32  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  value
 )
 )
)
)
)
result)
(define (vdupq_n_u64  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  value
 )
 )
)
)
)
result)
(define (vdupq_n_u8  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  value
 )
 )
)
)
)
result)
(define (vget_high_s16  a )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %11 (+  %inner.it  64))
  (define %12 (+  %11  63))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)
(define (vget_high_s32  a )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %11 (+  %inner.it  64))
  (define %12 (+  %11  63))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)
(define (vget_high_s64  a )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %11 (+  %inner.it  64))
  (define %12 (+  %11  63))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)
(define (vget_high_s8  a )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %11 (+  %inner.it  64))
  (define %12 (+  %11  63))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)
(define (vget_high_u16  a )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %11 (+  %inner.it  64))
  (define %12 (+  %11  63))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)
(define (vget_high_u32  a )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %11 (+  %inner.it  64))
  (define %12 (+  %11  63))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)
(define (vget_high_u64  a )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %11 (+  %inner.it  64))
  (define %12 (+  %11  63))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)
(define (vget_high_u8  a )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %11 (+  %inner.it  64))
  (define %12 (+  %11  63))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)
(define (vget_low_s16  a )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %11 (+  %inner.it  0))
  (define %12 (+  %11  63))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)
(define (vget_low_s32  a )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %11 (+  %inner.it  0))
  (define %12 (+  %11  63))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)
(define (vget_low_s64  a )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %11 (+  %inner.it  0))
  (define %12 (+  %11  63))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)
(define (vget_low_s8  a )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %11 (+  %inner.it  0))
  (define %12 (+  %11  63))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)
(define (vget_low_u16  a )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %11 (+  %inner.it  0))
  (define %12 (+  %11  63))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)
(define (vget_low_u32  a )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %11 (+  %inner.it  0))
  (define %12 (+  %11  63))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)
(define (vget_low_u64  a )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %11 (+  %inner.it  0))
  (define %12 (+  %11  63))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)
(define (vget_low_u8  a )
(define %1fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %11 (+  %inner.it  0))
  (define %12 (+  %11  63))
  (define %0 (extract  %12 %11 a))
  %0
 )
 )
)
)
)
%1fakeReturn)
(define (vhadd_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  16 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhadd_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  32 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhadd_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  8 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhadd_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  16 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhadd_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  32 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhadd_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  8 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhaddq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  16 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhaddq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  32 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhaddq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  8 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhaddq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  16 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhaddq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  32 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhaddq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  8 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhsub_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  16 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhsub_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  32 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhsub_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  8 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhsub_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  16 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhsub_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  32 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhsub_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  8 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhsubq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  16 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhsubq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  32 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhsubq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  8 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhsubq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  16 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhsubq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  32 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vhsubq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  8 1 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmax_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsmax  %4  %10))
  (define %17.downcasted0 (extract  15 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmax_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsmax  %4  %10))
  (define %17.downcasted0 (extract  31 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmax_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsmax  %4  %10))
  (define %17.downcasted0 (extract  7 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmax_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvumax  %4  %10))
  (define %17.downcasted0 (extract  15 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmax_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvumax  %4  %10))
  (define %17.downcasted0 (extract  31 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmax_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvumax  %4  %10))
  (define %17.downcasted0 (extract  7 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmaxq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsmax  %4  %10))
  (define %17.downcasted0 (extract  15 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmaxq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsmax  %4  %10))
  (define %17.downcasted0 (extract  31 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmaxq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsmax  %4  %10))
  (define %17.downcasted0 (extract  7 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmaxq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvumax  %4  %10))
  (define %17.downcasted0 (extract  15 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmaxq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvumax  %4  %10))
  (define %17.downcasted0 (extract  31 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmaxq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvumax  %4  %10))
  (define %17.downcasted0 (extract  7 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmin_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsmin  %4  %10))
  (define %17.downcasted0 (extract  15 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmin_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsmin  %4  %10))
  (define %17.downcasted0 (extract  31 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmin_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsmin  %4  %10))
  (define %17.downcasted0 (extract  7 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmin_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvumin  %4  %10))
  (define %17.downcasted0 (extract  15 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmin_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvumin  %4  %10))
  (define %17.downcasted0 (extract  31 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmin_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvumin  %4  %10))
  (define %17.downcasted0 (extract  7 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vminq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsmin  %4  %10))
  (define %17.downcasted0 (extract  15 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vminq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsmin  %4  %10))
  (define %17.downcasted0 (extract  31 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vminq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsmin  %4  %10))
  (define %17.downcasted0 (extract  7 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vminq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvumin  %4  %10))
  (define %17.downcasted0 (extract  15 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vminq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvumin  %4  %10))
  (define %17.downcasted0 (extract  31 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vminq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvumin  %4  %10))
  (define %17.downcasted0 (extract  7 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmla_n_s16  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmla_n_s32  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmla_n_u16  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmla_n_u32  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmla_s16  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmla_s32  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmla_s8  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 16)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  7 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmla_u16  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmla_u32  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmla_u8  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 16)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  7 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlal_high_n_s16  a b c )
(define %2 (extract  127 64 b))
(define %7 (extract  15 0 c))
(define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  15))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 32)))
  (define %15.downcasted0 (bvmul  %14.downcasted0  %8.downcasted0))
  (define %16.downcasted0 (extract  31 0 %15.downcasted0))
  (define %20 (+  e0.new  31))
  (define %25 (extract  %20 e0.new a))
  (define %26 (bvadd  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result)
(define (vmlal_high_n_s32  a b c )
(define %2 (extract  127 64 b))
(define %7 (extract  31 0 c))
(define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  31))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvmul  %14.downcasted0  %8.downcasted0))
  (define %16.downcasted0 (extract  63 0 %15.downcasted0))
  (define %20 (+  e0.new  63))
  (define %25 (extract  %20 e0.new a))
  (define %26 (bvadd  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result)
(define (vmlal_high_n_u16  a b c )
(define %2 (extract  127 64 b))
(define %7 (extract  15 0 c))
(define %8.downcasted0 (zero-extend  %7 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  15))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (zero-extend  %13 (bitvector 32)))
  (define %15.downcasted0 (bvmul  %14.downcasted0  %8.downcasted0))
  (define %16.downcasted0 (extract  31 0 %15.downcasted0))
  (define %20 (+  e0.new  31))
  (define %25 (extract  %20 e0.new a))
  (define %26 (bvadd  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result)
(define (vmlal_high_n_u32  a b c )
(define %2 (extract  127 64 b))
(define %7 (extract  31 0 c))
(define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  31))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (zero-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvmul  %14.downcasted0  %8.downcasted0))
  (define %16.downcasted0 (extract  63 0 %15.downcasted0))
  (define %20 (+  e0.new  63))
  (define %25 (extract  %20 e0.new a))
  (define %26 (bvadd  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result)
(define (vmlal_high_s16  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  15))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  31 0 %18.downcasted0))
  (define %23 (+  e0.new  31))
  (define %24 (extract  %23 e0.new a))
  (define %25 (bvadd  %24  %19.downcasted0))
  %25
 )
 )
)
)
)
result)
(define (vmlal_high_s32  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  31))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  63 0 %18.downcasted0))
  (define %23 (+  e0.new  63))
  (define %24 (extract  %23 e0.new a))
  (define %25 (bvadd  %24  %19.downcasted0))
  %25
 )
 )
)
)
)
result)
(define (vmlal_high_s8  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  7))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 16)))
  (define %18.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  15 0 %18.downcasted0))
  (define %23 (+  e0.new  15))
  (define %24 (extract  %23 e0.new a))
  (define %25 (bvadd  %24  %19.downcasted0))
  %25
 )
 )
)
)
)
result)
(define (vmlal_high_u16  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  15))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  31 0 %18.downcasted0))
  (define %23 (+  e0.new  31))
  (define %24 (extract  %23 e0.new a))
  (define %25 (bvadd  %24  %19.downcasted0))
  %25
 )
 )
)
)
)
result)
(define (vmlal_high_u32  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  31))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  63 0 %18.downcasted0))
  (define %23 (+  e0.new  63))
  (define %24 (extract  %23 e0.new a))
  (define %25 (bvadd  %24  %19.downcasted0))
  %25
 )
 )
)
)
)
result)
(define (vmlal_high_u8  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  7))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 16)))
  (define %18.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  15 0 %18.downcasted0))
  (define %23 (+  e0.new  15))
  (define %24 (extract  %23 e0.new a))
  (define %25 (bvadd  %24  %19.downcasted0))
  %25
 )
 )
)
)
)
result)
(define (vmlal_n_s16  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  31))
  (define %22 (extract  %17 %14.new0 a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlal_n_s32  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  63 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  63))
  (define %22 (extract  %17 %14.new0 a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlal_n_u16  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  31))
  (define %22 (extract  %17 %14.new0 a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlal_n_u32  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  63 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  63))
  (define %22 (extract  %17 %14.new0 a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlal_s16  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  31))
  (define %18 (extract  %17 %14.new0 a))
  (define %19 (bvadd  %18  %13.downcasted0))
  %19
 )
 )
)
)
)
result)
(define (vmlal_s32  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  63 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  63))
  (define %18 (extract  %17 %14.new0 a))
  (define %19 (bvadd  %18  %13.downcasted0))
  %19
 )
 )
)
)
)
result)
(define (vmlal_s8  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  15))
  (define %18 (extract  %17 %14.new0 a))
  (define %19 (bvadd  %18  %13.downcasted0))
  %19
 )
 )
)
)
)
result)
(define (vmlal_u16  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  31))
  (define %18 (extract  %17 %14.new0 a))
  (define %19 (bvadd  %18  %13.downcasted0))
  %19
 )
 )
)
)
)
result)
(define (vmlal_u32  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  63 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  63))
  (define %18 (extract  %17 %14.new0 a))
  (define %19 (bvadd  %18  %13.downcasted0))
  %19
 )
 )
)
)
)
result)
(define (vmlal_u8  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  15))
  (define %18 (extract  %17 %14.new0 a))
  (define %19 (bvadd  %18  %13.downcasted0))
  %19
 )
 )
)
)
)
result)
(define (vmlaq_n_s16  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlaq_n_s32  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlaq_n_u16  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlaq_n_u32  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlaq_s16  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlaq_s32  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlaq_s8  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 16)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  7 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlaq_u16  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlaq_u32  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlaq_u8  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 16)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  7 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvadd  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmls_n_s16  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmls_n_s32  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmls_n_u16  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmls_n_u32  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmls_s16  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmls_s32  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmls_s8  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 16)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  7 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmls_u16  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmls_u32  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmls_u8  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 16)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  7 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlsl_high_n_s16  a b c )
(define %2 (extract  127 64 b))
(define %7 (extract  15 0 c))
(define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  15))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 32)))
  (define %15.downcasted0 (bvmul  %14.downcasted0  %8.downcasted0))
  (define %16.downcasted0 (extract  31 0 %15.downcasted0))
  (define %20 (+  e0.new  31))
  (define %25 (extract  %20 e0.new a))
  (define %26 (bvsub  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result)
(define (vmlsl_high_n_s32  a b c )
(define %2 (extract  127 64 b))
(define %7 (extract  31 0 c))
(define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  31))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvmul  %14.downcasted0  %8.downcasted0))
  (define %16.downcasted0 (extract  63 0 %15.downcasted0))
  (define %20 (+  e0.new  63))
  (define %25 (extract  %20 e0.new a))
  (define %26 (bvsub  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result)
(define (vmlsl_high_n_u16  a b c )
(define %2 (extract  127 64 b))
(define %7 (extract  15 0 c))
(define %8.downcasted0 (zero-extend  %7 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  15))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (zero-extend  %13 (bitvector 32)))
  (define %15.downcasted0 (bvmul  %14.downcasted0  %8.downcasted0))
  (define %16.downcasted0 (extract  31 0 %15.downcasted0))
  (define %20 (+  e0.new  31))
  (define %25 (extract  %20 e0.new a))
  (define %26 (bvsub  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result)
(define (vmlsl_high_n_u32  a b c )
(define %2 (extract  127 64 b))
(define %7 (extract  31 0 c))
(define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  31))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (zero-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvmul  %14.downcasted0  %8.downcasted0))
  (define %16.downcasted0 (extract  63 0 %15.downcasted0))
  (define %20 (+  e0.new  63))
  (define %25 (extract  %20 e0.new a))
  (define %26 (bvsub  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result)
(define (vmlsl_high_s16  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  15))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  31 0 %18.downcasted0))
  (define %23 (+  e0.new  31))
  (define %24 (extract  %23 e0.new a))
  (define %25 (bvsub  %24  %19.downcasted0))
  %25
 )
 )
)
)
)
result)
(define (vmlsl_high_s32  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  31))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  63 0 %18.downcasted0))
  (define %23 (+  e0.new  63))
  (define %24 (extract  %23 e0.new a))
  (define %25 (bvsub  %24  %19.downcasted0))
  %25
 )
 )
)
)
)
result)
(define (vmlsl_high_s8  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  7))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 16)))
  (define %18.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  15 0 %18.downcasted0))
  (define %23 (+  e0.new  15))
  (define %24 (extract  %23 e0.new a))
  (define %25 (bvsub  %24  %19.downcasted0))
  %25
 )
 )
)
)
)
result)
(define (vmlsl_high_u16  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  15))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  31 0 %18.downcasted0))
  (define %23 (+  e0.new  31))
  (define %24 (extract  %23 e0.new a))
  (define %25 (bvsub  %24  %19.downcasted0))
  %25
 )
 )
)
)
)
result)
(define (vmlsl_high_u32  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  31))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  63 0 %18.downcasted0))
  (define %23 (+  e0.new  63))
  (define %24 (extract  %23 e0.new a))
  (define %25 (bvsub  %24  %19.downcasted0))
  %25
 )
 )
)
)
)
result)
(define (vmlsl_high_u8  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  7))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 16)))
  (define %18.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  15 0 %18.downcasted0))
  (define %23 (+  e0.new  15))
  (define %24 (extract  %23 e0.new a))
  (define %25 (bvsub  %24  %19.downcasted0))
  %25
 )
 )
)
)
)
result)
(define (vmlsl_n_s16  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  31))
  (define %22 (extract  %17 %14.new0 a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlsl_n_s32  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  63 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  63))
  (define %22 (extract  %17 %14.new0 a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlsl_n_u16  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  31))
  (define %22 (extract  %17 %14.new0 a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlsl_n_u32  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  63 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  63))
  (define %22 (extract  %17 %14.new0 a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlsl_s16  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  31))
  (define %18 (extract  %17 %14.new0 a))
  (define %19 (bvsub  %18  %13.downcasted0))
  %19
 )
 )
)
)
)
result)
(define (vmlsl_s32  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  63 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  63))
  (define %18 (extract  %17 %14.new0 a))
  (define %19 (bvsub  %18  %13.downcasted0))
  %19
 )
 )
)
)
)
result)
(define (vmlsl_s8  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  15))
  (define %18 (extract  %17 %14.new0 a))
  (define %19 (bvsub  %18  %13.downcasted0))
  %19
 )
 )
)
)
)
result)
(define (vmlsl_u16  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  31))
  (define %18 (extract  %17 %14.new0 a))
  (define %19 (bvsub  %18  %13.downcasted0))
  %19
 )
 )
)
)
)
result)
(define (vmlsl_u32  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  63 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  63))
  (define %18 (extract  %17 %14.new0 a))
  (define %19 (bvsub  %18  %13.downcasted0))
  %19
 )
 )
)
)
)
result)
(define (vmlsl_u8  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %14.new0 (*  e0.new  2))
  (define %17 (+  %14.new0  15))
  (define %18 (extract  %17 %14.new0 a))
  (define %19 (bvsub  %18  %13.downcasted0))
  %19
 )
 )
)
)
)
result)
(define (vmlsq_n_s16  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlsq_n_s32  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlsq_n_u16  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlsq_n_u32  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %22 (extract  %9 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlsq_s16  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlsq_s32  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlsq_s8  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 16)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  7 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlsq_u16  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlsq_u32  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmlsq_u8  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %9 (extract  %3 e0.new c))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 16)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  7 0 %12.downcasted0))
  (define %22 (extract  %3 e0.new a))
  (define %23 (bvsub  %22  %13.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vmov_n_s16  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  value
 )
 )
)
)
)
result)
(define (vmov_n_s32  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  value
 )
 )
)
)
)
result)
(define (vmov_n_s8  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  value
 )
 )
)
)
)
result)
(define (vmov_n_u16  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  value
 )
 )
)
)
)
result)
(define (vmov_n_u32  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  value
 )
 )
)
)
)
result)
(define (vmov_n_u8  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  value
 )
 )
)
)
)
result)
(define (vmovl_high_s16  a )
(define %2 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3.new0 (/  e0.new  2))
  (define %6 (+  %3.new0  15))
  (define %7 (extract  %6 %3.new0 %2))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
  (define %13.downcasted0 (extract  31 0 %8.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmovl_high_s32  a )
(define %2 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3.new0 (/  e0.new  2))
  (define %6 (+  %3.new0  31))
  (define %7 (extract  %6 %3.new0 %2))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %13.downcasted0 (extract  63 0 %8.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmovl_high_s8  a )
(define %2 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3.new0 (/  e0.new  2))
  (define %6 (+  %3.new0  7))
  (define %7 (extract  %6 %3.new0 %2))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 16)))
  (define %13.downcasted0 (extract  15 0 %8.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmovl_high_u16  a )
(define %2 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3.new0 (/  e0.new  2))
  (define %6 (+  %3.new0  15))
  (define %7 (extract  %6 %3.new0 %2))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 32)))
  (define %13.downcasted0 (extract  31 0 %8.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmovl_high_u32  a )
(define %2 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3.new0 (/  e0.new  2))
  (define %6 (+  %3.new0  31))
  (define %7 (extract  %6 %3.new0 %2))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %13.downcasted0 (extract  63 0 %8.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmovl_high_u8  a )
(define %2 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3.new0 (/  e0.new  2))
  (define %6 (+  %3.new0  7))
  (define %7 (extract  %6 %3.new0 %2))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 16)))
  (define %13.downcasted0 (extract  15 0 %8.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmovl_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10.downcasted0 (extract  31 0 %5.downcasted0))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vmovl_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10.downcasted0 (extract  63 0 %5.downcasted0))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vmovl_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10.downcasted0 (extract  15 0 %5.downcasted0))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vmovl_u16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10.downcasted0 (extract  31 0 %5.downcasted0))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vmovl_u32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10.downcasted0 (extract  63 0 %5.downcasted0))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vmovl_u8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10.downcasted0 (extract  15 0 %5.downcasted0))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vmovn_high_s16  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %0.new0 (*  e0.new  2))
  (define %9.new.high.idx0 (+  %0.new0  7))
  (define %40.new (extract  %9.new.high.idx0 %0.new0 a))
  %40.new
 )
 )
)
)
)
(define %10 (concat result r))
%10)
(define (vmovn_high_s32  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %0.new0 (*  e0.new  2))
  (define %9.new.high.idx0 (+  %0.new0  15))
  (define %40.new (extract  %9.new.high.idx0 %0.new0 a))
  %40.new
 )
 )
)
)
)
(define %10 (concat result r))
%10)
(define (vmovn_high_s64  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %0.new0 (*  e0.new  2))
  (define %9.new.high.idx0 (+  %0.new0  31))
  (define %40.new (extract  %9.new.high.idx0 %0.new0 a))
  %40.new
 )
 )
)
)
)
(define %10 (concat result r))
%10)
(define (vmovn_high_u16  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %0.new0 (*  e0.new  2))
  (define %9.new.high.idx0 (+  %0.new0  7))
  (define %40.new (extract  %9.new.high.idx0 %0.new0 a))
  %40.new
 )
 )
)
)
)
(define %10 (concat result r))
%10)
(define (vmovn_high_u32  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %0.new0 (*  e0.new  2))
  (define %9.new.high.idx0 (+  %0.new0  15))
  (define %40.new (extract  %9.new.high.idx0 %0.new0 a))
  %40.new
 )
 )
)
)
)
(define %10 (concat result r))
%10)
(define (vmovn_high_u64  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %0.new0 (*  e0.new  2))
  (define %9.new.high.idx0 (+  %0.new0  31))
  (define %40.new (extract  %9.new.high.idx0 %0.new0 a))
  %40.new
 )
 )
)
)
)
(define %10 (concat result r))
%10)
(define (vmovn_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %0.new0 (*  e0.new  2))
  (define %9.new.high.idx0 (+  %0.new0  7))
  (define %40.new (extract  %9.new.high.idx0 %0.new0 a))
  %40.new
 )
 )
)
)
)
result)
(define (vmovn_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %0.new0 (*  e0.new  2))
  (define %9.new.high.idx0 (+  %0.new0  15))
  (define %40.new (extract  %9.new.high.idx0 %0.new0 a))
  %40.new
 )
 )
)
)
)
result)
(define (vmovn_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %0.new0 (*  e0.new  2))
  (define %9.new.high.idx0 (+  %0.new0  31))
  (define %40.new (extract  %9.new.high.idx0 %0.new0 a))
  %40.new
 )
 )
)
)
)
result)
(define (vmovn_u16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %0.new0 (*  e0.new  2))
  (define %9.new.high.idx0 (+  %0.new0  7))
  (define %40.new (extract  %9.new.high.idx0 %0.new0 a))
  %40.new
 )
 )
)
)
)
result)
(define (vmovn_u32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %0.new0 (*  e0.new  2))
  (define %9.new.high.idx0 (+  %0.new0  15))
  (define %40.new (extract  %9.new.high.idx0 %0.new0 a))
  %40.new
 )
 )
)
)
)
result)
(define (vmovn_u64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %0.new0 (*  e0.new  2))
  (define %9.new.high.idx0 (+  %0.new0  31))
  (define %40.new (extract  %9.new.high.idx0 %0.new0 a))
  %40.new
 )
 )
)
)
)
result)
(define (vmovq_n_s16  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  value
 )
 )
)
)
)
result)
(define (vmovq_n_s32  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  value
 )
 )
)
)
)
result)
(define (vmovq_n_s64  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  value
 )
 )
)
)
)
result)
(define (vmovq_n_s8  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  value
 )
 )
)
)
)
result)
(define (vmovq_n_u16  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  value
 )
 )
)
)
)
result)
(define (vmovq_n_u32  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  value
 )
 )
)
)
)
result)
(define (vmovq_n_u64  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  value
 )
 )
)
)
)
result)
(define (vmovq_n_u8  value )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  value
 )
 )
)
)
)
result)
(define (vmul_n_s16  a b )
(define %4 (extract  15 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmul_n_s32  a b )
(define %4 (extract  31 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmul_n_u16  a b )
(define %4 (extract  15 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmul_n_u32  a b )
(define %4 (extract  31 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmul_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmul_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmul_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 16)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  7 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmul_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmul_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmul_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 16)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  7 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmull_high_n_s16  a b )
(define %2 (extract  127 64 a))
(define %7 (extract  15 0 b))
(define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  15))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 32)))
  (define %15.downcasted0 (bvmul  %14.downcasted0  %8.downcasted0))
  (define %16.downcasted0 (extract  31 0 %15.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vmull_high_n_s32  a b )
(define %2 (extract  127 64 a))
(define %7 (extract  31 0 b))
(define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  31))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvmul  %14.downcasted0  %8.downcasted0))
  (define %16.downcasted0 (extract  63 0 %15.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vmull_high_n_u16  a b )
(define %2 (extract  127 64 a))
(define %7 (extract  15 0 b))
(define %8.downcasted0 (zero-extend  %7 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  15))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (zero-extend  %13 (bitvector 32)))
  (define %15.downcasted0 (bvmul  %14.downcasted0  %8.downcasted0))
  (define %16.downcasted0 (extract  31 0 %15.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vmull_high_n_u32  a b )
(define %2 (extract  127 64 a))
(define %7 (extract  31 0 b))
(define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  31))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (zero-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvmul  %14.downcasted0  %8.downcasted0))
  (define %16.downcasted0 (extract  63 0 %15.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vmull_high_s16  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  15))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 32)))
  (define %22.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  31 0 %22.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vmull_high_s32  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  31))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %22.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  63 0 %22.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vmull_high_s8  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  7))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 16)))
  (define %22.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  15 0 %22.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vmull_high_u16  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  15))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 32)))
  (define %22.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  31 0 %22.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vmull_high_u32  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  31))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %22.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  63 0 %22.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vmull_high_u8  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  7))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 16)))
  (define %22.downcasted0 (bvmul  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  15 0 %22.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vmull_n_s16  a b )
(define %4 (extract  15 0 b))
(define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmull_n_s32  a b )
(define %4 (extract  31 0 b))
(define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  63 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmull_n_u16  a b )
(define %4 (extract  15 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmull_n_u32  a b )
(define %4 (extract  31 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  63 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmull_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %16.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  31 0 %16.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmull_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %16.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  63 0 %16.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmull_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %16.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  15 0 %16.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmull_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %16.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  31 0 %16.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmull_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %16.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  63 0 %16.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmull_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %16.downcasted0 (bvmul  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  15 0 %16.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vmulq_n_s16  a b )
(define %4 (extract  15 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmulq_n_s32  a b )
(define %4 (extract  31 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmulq_n_u16  a b )
(define %4 (extract  15 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmulq_n_u32  a b )
(define %4 (extract  31 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %11.downcasted0  %5.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmulq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmulq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmulq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 16)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  7 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmulq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 32)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  15 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmulq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  31 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmulq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %11.downcasted0 (zero-extend  %9 (bitvector 16)))
  (define %12.downcasted0 (bvmul  %10.downcasted0  %11.downcasted0))
  (define %13.downcasted0 (extract  7 0 %12.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vmvn_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (bvnot  %4))
  %9
 )
 )
)
)
)
result)
(define (vmvn_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (bvnot  %4))
  %9
 )
 )
)
)
)
result)
(define (vmvn_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (bvnot  %4))
  %9
 )
 )
)
)
)
result)
(define (vmvn_u16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (bvnot  %4))
  %9
 )
 )
)
)
)
result)
(define (vmvn_u32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (bvnot  %4))
  %9
 )
 )
)
)
)
result)
(define (vmvn_u8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (bvnot  %4))
  %9
 )
 )
)
)
)
result)
(define (vmvnq_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (bvnot  %4))
  %9
 )
 )
)
)
)
result)
(define (vmvnq_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (bvnot  %4))
  %9
 )
 )
)
)
)
result)
(define (vmvnq_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (bvnot  %4))
  %9
 )
 )
)
)
)
result)
(define (vmvnq_u16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (bvnot  %4))
  %9
 )
 )
)
)
)
result)
(define (vmvnq_u32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (bvnot  %4))
  %9
 )
 )
)
)
)
result)
(define (vmvnq_u8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (bvnot  %4))
  %9
 )
 )
)
)
)
result)
(define (vneg_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (extract  15 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vneg_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (extract  31 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vneg_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (extract  63 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vneg_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (extract  7 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vnegd_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (extract  63 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vnegq_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (extract  15 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vnegq_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (extract  31 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vnegq_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (extract  63 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vnegq_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (extract  7 0 %6.downcasted0))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vpadal_s16  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 16))])
  (define %1.new0 (*  e0.new  2))
  (define %5 (+  %1.new0  15))
  (define %6 (extract  %5 %1.new0 b))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 32)))
  (define %8.new0 (/  e0.new  8))
  (define %9 (+  %8.new0  1))
  (define %10 (*  %9  16))
  (define %15 (+  %10  15))
  (define %16 (extract  %15 %10 b))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvadd  %7.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  31 0 %18.downcasted0))
  (define %23 (+  %1.new0  31))
  (define %28 (extract  %23 %1.new0 a))
  (define %29 (bvadd  %28  %19.downcasted0))
  %29
 )
 )
)
)
)
result2)
(define (vpadal_s32  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %1.new0 (*  e0.new  2))
  (define %5 (+  %1.new0  31))
  (define %6 (extract  %5 %1.new0 b))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %8.new0 (/  e0.new  16))
  (define %9 (+  %8.new0  1))
  (define %10 (*  %9  32))
  (define %15 (+  %10  31))
  (define %16 (extract  %15 %10 b))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvadd  %7.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  63 0 %18.downcasted0))
  (define %23 (+  %1.new0  63))
  (define %28 (extract  %23 %1.new0 a))
  (define %29 (bvadd  %28  %19.downcasted0))
  %29
 )
 )
)
)
)
result2)
(define (vpadal_s8  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 8))])
  (define %1.new0 (*  e0.new  2))
  (define %5 (+  %1.new0  7))
  (define %6 (extract  %5 %1.new0 b))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 16)))
  (define %8.new0 (/  e0.new  4))
  (define %9 (+  %8.new0  1))
  (define %10 (*  %9  8))
  (define %15 (+  %10  7))
  (define %16 (extract  %15 %10 b))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 16)))
  (define %18.downcasted0 (bvadd  %7.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  15 0 %18.downcasted0))
  (define %23 (+  %1.new0  15))
  (define %28 (extract  %23 %1.new0 a))
  (define %29 (bvadd  %28  %19.downcasted0))
  %29
 )
 )
)
)
)
result2)
(define (vpadal_u16  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 16))])
  (define %1.new0 (*  e0.new  2))
  (define %5 (+  %1.new0  15))
  (define %6 (extract  %5 %1.new0 b))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 32)))
  (define %8.new0 (/  e0.new  8))
  (define %9 (+  %8.new0  1))
  (define %10 (*  %9  16))
  (define %15 (+  %10  15))
  (define %16 (extract  %15 %10 b))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvadd  %7.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  31 0 %18.downcasted0))
  (define %23 (+  %1.new0  31))
  (define %28 (extract  %23 %1.new0 a))
  (define %29 (bvadd  %28  %19.downcasted0))
  %29
 )
 )
)
)
)
result2)
(define (vpadal_u32  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %1.new0 (*  e0.new  2))
  (define %5 (+  %1.new0  31))
  (define %6 (extract  %5 %1.new0 b))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 64)))
  (define %8.new0 (/  e0.new  16))
  (define %9 (+  %8.new0  1))
  (define %10 (*  %9  32))
  (define %15 (+  %10  31))
  (define %16 (extract  %15 %10 b))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvadd  %7.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  63 0 %18.downcasted0))
  (define %23 (+  %1.new0  63))
  (define %28 (extract  %23 %1.new0 a))
  (define %29 (bvadd  %28  %19.downcasted0))
  %29
 )
 )
)
)
)
result2)
(define (vpadal_u8  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 8))])
  (define %1.new0 (*  e0.new  2))
  (define %5 (+  %1.new0  7))
  (define %6 (extract  %5 %1.new0 b))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 16)))
  (define %8.new0 (/  e0.new  4))
  (define %9 (+  %8.new0  1))
  (define %10 (*  %9  8))
  (define %15 (+  %10  7))
  (define %16 (extract  %15 %10 b))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 16)))
  (define %18.downcasted0 (bvadd  %7.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  15 0 %18.downcasted0))
  (define %23 (+  %1.new0  15))
  (define %28 (extract  %23 %1.new0 a))
  (define %29 (bvadd  %28  %19.downcasted0))
  %29
 )
 )
)
)
)
result2)
(define (vpadalq_s16  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %1.new0 (*  e0.new  2))
  (define %5 (+  %1.new0  15))
  (define %6 (extract  %5 %1.new0 b))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 32)))
  (define %8.new0 (/  e0.new  8))
  (define %9 (+  %8.new0  1))
  (define %10 (*  %9  16))
  (define %15 (+  %10  15))
  (define %16 (extract  %15 %10 b))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvadd  %7.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  31 0 %18.downcasted0))
  (define %23 (+  %1.new0  31))
  (define %28 (extract  %23 %1.new0 a))
  (define %29 (bvadd  %28  %19.downcasted0))
  %29
 )
 )
)
)
)
result2)
(define (vpadalq_s32  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %1.new0 (*  e0.new  2))
  (define %5 (+  %1.new0  31))
  (define %6 (extract  %5 %1.new0 b))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %8.new0 (/  e0.new  16))
  (define %9 (+  %8.new0  1))
  (define %10 (*  %9  32))
  (define %15 (+  %10  31))
  (define %16 (extract  %15 %10 b))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvadd  %7.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  63 0 %18.downcasted0))
  (define %23 (+  %1.new0  63))
  (define %28 (extract  %23 %1.new0 a))
  (define %29 (bvadd  %28  %19.downcasted0))
  %29
 )
 )
)
)
)
result2)
(define (vpadalq_s8  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %1.new0 (*  e0.new  2))
  (define %5 (+  %1.new0  7))
  (define %6 (extract  %5 %1.new0 b))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 16)))
  (define %8.new0 (/  e0.new  4))
  (define %9 (+  %8.new0  1))
  (define %10 (*  %9  8))
  (define %15 (+  %10  7))
  (define %16 (extract  %15 %10 b))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 16)))
  (define %18.downcasted0 (bvadd  %7.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  15 0 %18.downcasted0))
  (define %23 (+  %1.new0  15))
  (define %28 (extract  %23 %1.new0 a))
  (define %29 (bvadd  %28  %19.downcasted0))
  %29
 )
 )
)
)
)
result2)
(define (vpadalq_u16  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %1.new0 (*  e0.new  2))
  (define %5 (+  %1.new0  15))
  (define %6 (extract  %5 %1.new0 b))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 32)))
  (define %8.new0 (/  e0.new  8))
  (define %9 (+  %8.new0  1))
  (define %10 (*  %9  16))
  (define %15 (+  %10  15))
  (define %16 (extract  %15 %10 b))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvadd  %7.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  31 0 %18.downcasted0))
  (define %23 (+  %1.new0  31))
  (define %28 (extract  %23 %1.new0 a))
  (define %29 (bvadd  %28  %19.downcasted0))
  %29
 )
 )
)
)
)
result2)
(define (vpadalq_u32  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %1.new0 (*  e0.new  2))
  (define %5 (+  %1.new0  31))
  (define %6 (extract  %5 %1.new0 b))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 64)))
  (define %8.new0 (/  e0.new  16))
  (define %9 (+  %8.new0  1))
  (define %10 (*  %9  32))
  (define %15 (+  %10  31))
  (define %16 (extract  %15 %10 b))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvadd  %7.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  63 0 %18.downcasted0))
  (define %23 (+  %1.new0  63))
  (define %28 (extract  %23 %1.new0 a))
  (define %29 (bvadd  %28  %19.downcasted0))
  %29
 )
 )
)
)
)
result2)
(define (vpadalq_u8  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %1.new0 (*  e0.new  2))
  (define %5 (+  %1.new0  7))
  (define %6 (extract  %5 %1.new0 b))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 16)))
  (define %8.new0 (/  e0.new  4))
  (define %9 (+  %8.new0  1))
  (define %10 (*  %9  8))
  (define %15 (+  %10  7))
  (define %16 (extract  %15 %10 b))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 16)))
  (define %18.downcasted0 (bvadd  %7.downcasted0  %17.downcasted0))
  (define %19.downcasted0 (extract  15 0 %18.downcasted0))
  (define %23 (+  %1.new0  15))
  (define %28 (extract  %23 %1.new0 a))
  (define %29 (bvadd  %28  %19.downcasted0))
  %29
 )
 )
)
)
)
result2)
(define (vpadd_s16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 64 16))])
 (define result (bv #b0 16))
 (define %7.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 32 16))])
  (define iterator.0.new.div (/  iterator.0.new  16))
  (define %1.new1 (/  e0.new  8))
  (define %1.new0 (+  %1.new1  iterator.0.new.div))
  (define %2 (*  %1.new0  16))
  (define %6.new0 (+  %2  15))
  (define %7 (extract  %6.new0 %2 %0))
  %7
 )
))
 (define %20.clone.0.new1 (+  e0.new  15))
 (define %7.acc0 (bvadd %7.ext0.red result))
 %7.acc0
)
)
)
result)
(define (vpadd_s32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 64 32))])
 (define result (bv #b0 32))
 (define %7.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 64 32))])
  (define iterator.0.new.div (/  iterator.0.new  32))
  (define %1.new1 (/  e0.new  16))
  (define %1.new0 (+  %1.new1  iterator.0.new.div))
  (define %2 (*  %1.new0  32))
  (define %6.new0 (+  %2  31))
  (define %7 (extract  %6.new0 %2 %0))
  %7
 )
))
 (define %20.clone.0.new1 (+  e0.new  31))
 (define %7.acc0 (bvadd %7.ext0.red result))
 %7.acc0
)
)
)
result)
(define (vpadd_s8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 64 8))])
 (define result (bv #b0 8))
 (define %7.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 16 8))])
  (define iterator.0.new.div (/  iterator.0.new  8))
  (define %1.new1 (/  e0.new  4))
  (define %1.new0 (+  %1.new1  iterator.0.new.div))
  (define %2 (*  %1.new0  8))
  (define %6.new0 (+  %2  7))
  (define %7 (extract  %6.new0 %2 %0))
  %7
 )
))
 (define %20.clone.0.new1 (+  e0.new  7))
 (define %7.acc0 (bvadd %7.ext0.red result))
 %7.acc0
)
)
)
result)
(define (vpadd_u16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 64 16))])
 (define result (bv #b0 16))
 (define %7.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 32 16))])
  (define iterator.0.new.div (/  iterator.0.new  16))
  (define %1.new1 (/  e0.new  8))
  (define %1.new0 (+  %1.new1  iterator.0.new.div))
  (define %2 (*  %1.new0  16))
  (define %6.new0 (+  %2  15))
  (define %7 (extract  %6.new0 %2 %0))
  %7
 )
))
 (define %20.clone.0.new1 (+  e0.new  15))
 (define %7.acc0 (bvadd %7.ext0.red result))
 %7.acc0
)
)
)
result)
(define (vpadd_u32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 64 32))])
 (define result (bv #b0 32))
 (define %7.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 64 32))])
  (define iterator.0.new.div (/  iterator.0.new  32))
  (define %1.new1 (/  e0.new  16))
  (define %1.new0 (+  %1.new1  iterator.0.new.div))
  (define %2 (*  %1.new0  32))
  (define %6.new0 (+  %2  31))
  (define %7 (extract  %6.new0 %2 %0))
  %7
 )
))
 (define %20.clone.0.new1 (+  e0.new  31))
 (define %7.acc0 (bvadd %7.ext0.red result))
 %7.acc0
)
)
)
result)
(define (vpadd_u8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 64 8))])
 (define result (bv #b0 8))
 (define %7.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 16 8))])
  (define iterator.0.new.div (/  iterator.0.new  8))
  (define %1.new1 (/  e0.new  4))
  (define %1.new0 (+  %1.new1  iterator.0.new.div))
  (define %2 (*  %1.new0  8))
  (define %6.new0 (+  %2  7))
  (define %7 (extract  %6.new0 %2 %0))
  %7
 )
))
 (define %20.clone.0.new1 (+  e0.new  7))
 (define %7.acc0 (bvadd %7.ext0.red result))
 %7.acc0
)
)
)
result)
(define (vpaddl_s16  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 16))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  15))
  (define %7 (extract  %6 %2.new0 a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
  (define %9.new0 (/  e0.new  8))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  16))
  (define %16 (+  %11  15))
  (define %17 (extract  %16 %11 a))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 32)))
  (define %19.downcasted0 (bvadd  %8.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (extract  31 0 %19.downcasted0))
  (define %30 (bvadd  (bv 0 32)  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vpaddl_s32  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  31))
  (define %7 (extract  %6 %2.new0 a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %9.new0 (/  e0.new  16))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  32))
  (define %16 (+  %11  31))
  (define %17 (extract  %16 %11 a))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 64)))
  (define %19.downcasted0 (bvadd  %8.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (extract  63 0 %19.downcasted0))
  (define %30 (bvadd  (bv 0 64)  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vpaddl_s8  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 8))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  7))
  (define %7 (extract  %6 %2.new0 a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 16)))
  (define %9.new0 (/  e0.new  4))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  8))
  (define %16 (+  %11  7))
  (define %17 (extract  %16 %11 a))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 16)))
  (define %19.downcasted0 (bvadd  %8.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (extract  15 0 %19.downcasted0))
  (define %30 (bvadd  (bv 0 16)  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vpaddl_u16  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 16))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  15))
  (define %7 (extract  %6 %2.new0 a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 32)))
  (define %9.new0 (/  e0.new  8))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  16))
  (define %16 (+  %11  15))
  (define %17 (extract  %16 %11 a))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 32)))
  (define %19.downcasted0 (bvadd  %8.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (extract  31 0 %19.downcasted0))
  (define %30 (bvadd  (bv 0 32)  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vpaddl_u32  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  31))
  (define %7 (extract  %6 %2.new0 a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %9.new0 (/  e0.new  16))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  32))
  (define %16 (+  %11  31))
  (define %17 (extract  %16 %11 a))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 64)))
  (define %19.downcasted0 (bvadd  %8.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (extract  63 0 %19.downcasted0))
  (define %30 (bvadd  (bv 0 64)  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vpaddl_u8  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 8))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  7))
  (define %7 (extract  %6 %2.new0 a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 16)))
  (define %9.new0 (/  e0.new  4))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  8))
  (define %16 (+  %11  7))
  (define %17 (extract  %16 %11 a))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 16)))
  (define %19.downcasted0 (bvadd  %8.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (extract  15 0 %19.downcasted0))
  (define %30 (bvadd  (bv 0 16)  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vpaddlq_s16  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  15))
  (define %7 (extract  %6 %2.new0 a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
  (define %9.new0 (/  e0.new  8))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  16))
  (define %16 (+  %11  15))
  (define %17 (extract  %16 %11 a))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 32)))
  (define %19.downcasted0 (bvadd  %8.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (extract  31 0 %19.downcasted0))
  (define %30 (bvadd  (bv 0 32)  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vpaddlq_s32  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  31))
  (define %7 (extract  %6 %2.new0 a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %9.new0 (/  e0.new  16))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  32))
  (define %16 (+  %11  31))
  (define %17 (extract  %16 %11 a))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 64)))
  (define %19.downcasted0 (bvadd  %8.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (extract  63 0 %19.downcasted0))
  (define %30 (bvadd  (bv 0 64)  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vpaddlq_s8  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  7))
  (define %7 (extract  %6 %2.new0 a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 16)))
  (define %9.new0 (/  e0.new  4))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  8))
  (define %16 (+  %11  7))
  (define %17 (extract  %16 %11 a))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 16)))
  (define %19.downcasted0 (bvadd  %8.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (extract  15 0 %19.downcasted0))
  (define %30 (bvadd  (bv 0 16)  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vpaddlq_u16  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  15))
  (define %7 (extract  %6 %2.new0 a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 32)))
  (define %9.new0 (/  e0.new  8))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  16))
  (define %16 (+  %11  15))
  (define %17 (extract  %16 %11 a))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 32)))
  (define %19.downcasted0 (bvadd  %8.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (extract  31 0 %19.downcasted0))
  (define %30 (bvadd  (bv 0 32)  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vpaddlq_u32  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  31))
  (define %7 (extract  %6 %2.new0 a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %9.new0 (/  e0.new  16))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  32))
  (define %16 (+  %11  31))
  (define %17 (extract  %16 %11 a))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 64)))
  (define %19.downcasted0 (bvadd  %8.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (extract  63 0 %19.downcasted0))
  (define %30 (bvadd  (bv 0 64)  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vpaddlq_u8  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  7))
  (define %7 (extract  %6 %2.new0 a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 16)))
  (define %9.new0 (/  e0.new  4))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  8))
  (define %16 (+  %11  7))
  (define %17 (extract  %16 %11 a))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 16)))
  (define %19.downcasted0 (bvadd  %8.downcasted0  %18.downcasted0))
  (define %20.downcasted0 (extract  15 0 %19.downcasted0))
  (define %30 (bvadd  (bv 0 16)  %20.downcasted0))
  %30
 )
 )
)
)
)
result2)
(define (vpaddq_s16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 128 16))])
 (define result (bv #b0 16))
 (define %7.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 32 16))])
  (define iterator.0.new.div (/  iterator.0.new  16))
  (define %1.new1 (/  e0.new  8))
  (define %1.new0 (+  %1.new1  iterator.0.new.div))
  (define %2 (*  %1.new0  16))
  (define %6.new0 (+  %2  15))
  (define %7 (extract  %6.new0 %2 %0))
  %7
 )
))
 (define %20.clone.0.new1 (+  e0.new  15))
 (define %7.acc0 (bvadd %7.ext0.red result))
 %7.acc0
)
)
)
result)
(define (vpaddq_s32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 128 32))])
 (define result (bv #b0 32))
 (define %7.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 64 32))])
  (define iterator.0.new.div (/  iterator.0.new  32))
  (define %1.new1 (/  e0.new  16))
  (define %1.new0 (+  %1.new1  iterator.0.new.div))
  (define %2 (*  %1.new0  32))
  (define %6.new0 (+  %2  31))
  (define %7 (extract  %6.new0 %2 %0))
  %7
 )
))
 (define %20.clone.0.new1 (+  e0.new  31))
 (define %7.acc0 (bvadd %7.ext0.red result))
 %7.acc0
)
)
)
result)
(define (vpaddq_s64  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 128 64))])
 (define result (bv #b0 64))
 (define %7.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 128 64))])
  (define iterator.0.new.div (/  iterator.0.new  64))
  (define %1.new1 (/  e0.new  32))
  (define %1.new0 (+  %1.new1  iterator.0.new.div))
  (define %2 (*  %1.new0  64))
  (define %6.new0 (+  %2  63))
  (define %7 (extract  %6.new0 %2 %0))
  %7
 )
))
 (define %20.clone.0.new1 (+  e0.new  63))
 (define %7.acc0 (bvadd %7.ext0.red result))
 %7.acc0
)
)
)
result)
(define (vpaddq_s8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 128 8))])
 (define result (bv #b0 8))
 (define %7.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 16 8))])
  (define iterator.0.new.div (/  iterator.0.new  8))
  (define %1.new1 (/  e0.new  4))
  (define %1.new0 (+  %1.new1  iterator.0.new.div))
  (define %2 (*  %1.new0  8))
  (define %6.new0 (+  %2  7))
  (define %7 (extract  %6.new0 %2 %0))
  %7
 )
))
 (define %20.clone.0.new1 (+  e0.new  7))
 (define %7.acc0 (bvadd %7.ext0.red result))
 %7.acc0
)
)
)
result)
(define (vpaddq_u16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 128 16))])
 (define result (bv #b0 16))
 (define %7.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 32 16))])
  (define iterator.0.new.div (/  iterator.0.new  16))
  (define %1.new1 (/  e0.new  8))
  (define %1.new0 (+  %1.new1  iterator.0.new.div))
  (define %2 (*  %1.new0  16))
  (define %6.new0 (+  %2  15))
  (define %7 (extract  %6.new0 %2 %0))
  %7
 )
))
 (define %20.clone.0.new1 (+  e0.new  15))
 (define %7.acc0 (bvadd %7.ext0.red result))
 %7.acc0
)
)
)
result)
(define (vpaddq_u32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 128 32))])
 (define result (bv #b0 32))
 (define %7.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 64 32))])
  (define iterator.0.new.div (/  iterator.0.new  32))
  (define %1.new1 (/  e0.new  16))
  (define %1.new0 (+  %1.new1  iterator.0.new.div))
  (define %2 (*  %1.new0  32))
  (define %6.new0 (+  %2  31))
  (define %7 (extract  %6.new0 %2 %0))
  %7
 )
))
 (define %20.clone.0.new1 (+  e0.new  31))
 (define %7.acc0 (bvadd %7.ext0.red result))
 %7.acc0
)
)
)
result)
(define (vpaddq_u64  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 128 64))])
 (define result (bv #b0 64))
 (define %7.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 128 64))])
  (define iterator.0.new.div (/  iterator.0.new  64))
  (define %1.new1 (/  e0.new  32))
  (define %1.new0 (+  %1.new1  iterator.0.new.div))
  (define %2 (*  %1.new0  64))
  (define %6.new0 (+  %2  63))
  (define %7 (extract  %6.new0 %2 %0))
  %7
 )
))
 (define %20.clone.0.new1 (+  e0.new  63))
 (define %7.acc0 (bvadd %7.ext0.red result))
 %7.acc0
)
)
)
result)
(define (vpaddq_u8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 128 8))])
 (define result (bv #b0 8))
 (define %7.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 16 8))])
  (define iterator.0.new.div (/  iterator.0.new  8))
  (define %1.new1 (/  e0.new  4))
  (define %1.new0 (+  %1.new1  iterator.0.new.div))
  (define %2 (*  %1.new0  8))
  (define %6.new0 (+  %2  7))
  (define %7 (extract  %6.new0 %2 %0))
  %7
 )
))
 (define %20.clone.0.new1 (+  e0.new  7))
 (define %7.acc0 (bvadd %7.ext0.red result))
 %7.acc0
)
)
)
result)
(define (vpmax_s16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  15))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  8))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  16))
  (define %16 (+  %11  15))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvsmax  %7  %17))
  (define %24.downcasted0 (extract  15 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpmax_s32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  31))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  16))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  32))
  (define %16 (+  %11  31))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvsmax  %7  %17))
  (define %24.downcasted0 (extract  31 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpmax_s8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  7))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  4))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  8))
  (define %16 (+  %11  7))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvsmax  %7  %17))
  (define %24.downcasted0 (extract  7 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpmax_u16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  15))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  8))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  16))
  (define %16 (+  %11  15))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvumax  %7  %17))
  (define %24.downcasted0 (extract  15 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpmax_u32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  31))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  16))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  32))
  (define %16 (+  %11  31))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvumax  %7  %17))
  (define %24.downcasted0 (extract  31 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpmax_u8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  7))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  4))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  8))
  (define %16 (+  %11  7))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvumax  %7  %17))
  (define %24.downcasted0 (extract  7 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpmaxq_s16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  15))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  8))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  16))
  (define %16 (+  %11  15))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvsmax  %7  %17))
  (define %24.downcasted0 (extract  15 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpmaxq_s32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  31))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  16))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  32))
  (define %16 (+  %11  31))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvsmax  %7  %17))
  (define %24.downcasted0 (extract  31 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpmaxq_s8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  7))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  4))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  8))
  (define %16 (+  %11  7))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvsmax  %7  %17))
  (define %24.downcasted0 (extract  7 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpmaxq_u16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  15))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  8))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  16))
  (define %16 (+  %11  15))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvumax  %7  %17))
  (define %24.downcasted0 (extract  15 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpmaxq_u32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  31))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  16))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  32))
  (define %16 (+  %11  31))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvumax  %7  %17))
  (define %24.downcasted0 (extract  31 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpmaxq_u8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  7))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  4))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  8))
  (define %16 (+  %11  7))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvumax  %7  %17))
  (define %24.downcasted0 (extract  7 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpmin_s16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  15))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  8))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  16))
  (define %16 (+  %11  15))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvsmin  %7  %17))
  (define %24.downcasted0 (extract  15 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpmin_s32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  31))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  16))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  32))
  (define %16 (+  %11  31))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvsmin  %7  %17))
  (define %24.downcasted0 (extract  31 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpmin_s8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  7))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  4))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  8))
  (define %16 (+  %11  7))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvsmin  %7  %17))
  (define %24.downcasted0 (extract  7 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpmin_u16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  15))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  8))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  16))
  (define %16 (+  %11  15))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvumin  %7  %17))
  (define %24.downcasted0 (extract  15 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpmin_u32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  31))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  16))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  32))
  (define %16 (+  %11  31))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvumin  %7  %17))
  (define %24.downcasted0 (extract  31 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpmin_u8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  7))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  4))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  8))
  (define %16 (+  %11  7))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvumin  %7  %17))
  (define %24.downcasted0 (extract  7 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpminq_s16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  15))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  8))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  16))
  (define %16 (+  %11  15))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvsmin  %7  %17))
  (define %24.downcasted0 (extract  15 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpminq_s32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  31))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  16))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  32))
  (define %16 (+  %11  31))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvsmin  %7  %17))
  (define %24.downcasted0 (extract  31 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpminq_s8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  7))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  4))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  8))
  (define %16 (+  %11  7))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvsmin  %7  %17))
  (define %24.downcasted0 (extract  7 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpminq_u16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  15))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  8))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  16))
  (define %16 (+  %11  15))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvumin  %7  %17))
  (define %24.downcasted0 (extract  15 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpminq_u32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  31))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  16))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  32))
  (define %16 (+  %11  31))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvumin  %7  %17))
  (define %24.downcasted0 (extract  31 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vpminq_u8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %2.new0 (*  e0.new  2))
  (define %6 (+  %2.new0  7))
  (define %7 (extract  %6 %2.new0 %0))
  (define %9.new0 (/  e0.new  4))
  (define %10 (+  %9.new0  1))
  (define %11 (*  %10  8))
  (define %16 (+  %11  7))
  (define %17 (extract  %16 %11 %0))
  (define %19.downcasted0 (bvumin  %7  %17))
  (define %24.downcasted0 (extract  7 0 %19.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define (vqabs_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 32)))
  (define %11.downcasted0 (bvssat %6.downcasted0 32 16 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqabs_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 64)))
  (define %11.downcasted0 (bvssat %6.downcasted0 64 32 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqabs_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 128)))
  (define %11.downcasted0 (bvssat %6.downcasted0 128 64 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqabs_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 16)))
  (define %11.downcasted0 (bvssat %6.downcasted0 16 8 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqabsb_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 16)))
  (define %11.downcasted0 (bvssat %6.downcasted0 16 8 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqabsd_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 128)))
  (define %11.downcasted0 (bvssat %6.downcasted0 128 64 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqabsh_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 32)))
  (define %11.downcasted0 (bvssat %6.downcasted0 32 16 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqabsq_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 32)))
  (define %11.downcasted0 (bvssat %6.downcasted0 32 16 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqabsq_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 64)))
  (define %11.downcasted0 (bvssat %6.downcasted0 64 32 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqabsq_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 128)))
  (define %11.downcasted0 (bvssat %6.downcasted0 128 64 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqabsq_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 16)))
  (define %11.downcasted0 (bvssat %6.downcasted0 16 8 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqabss_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %6.downcasted0 (integer->bitvector (abs (bitvector->integer %5.downcasted0)) (bitvector 64)))
  (define %11.downcasted0 (bvssat %6.downcasted0 64 32 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqadd_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnsw  %4  %10 16))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqadd_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnsw  %4  %10 32))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqadd_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnsw  %4  %10 64))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqadd_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnsw  %4  %10 8))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqadd_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnuw  %4  %10 16))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqadd_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnuw  %4  %10 32))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqadd_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnuw  %4  %10 64))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqadd_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnuw  %4  %10 8))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqaddb_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnsw  %4  %10 8))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqaddb_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnuw  %4  %10 8))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqaddd_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnsw  %4  %10 64))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqaddd_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnuw  %4  %10 64))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqaddh_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnsw  %4  %10 16))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqaddh_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnuw  %4  %10 16))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqaddq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnsw  %4  %10 16))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqaddq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnsw  %4  %10 32))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqaddq_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnsw  %4  %10 64))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqaddq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnsw  %4  %10 8))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqaddq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnuw  %4  %10 16))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqaddq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnuw  %4  %10 32))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqaddq_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnuw  %4  %10 64))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqaddq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnuw  %4  %10 8))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqadds_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnsw  %4  %10 32))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqadds_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvaddnuw  %4  %10 32))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlal_high_n_s16  a b c )
(define %2 (extract  127 64 b))
(define %7 (extract  15 0 c))
(define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  15))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 32)))
  (define %15.downcasted0 (bvmul  (bv 2 32)  %14.downcasted0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %8.downcasted0 32))
  (define %21 (+  e0.new  31))
  (define %22 (extract  %21 e0.new a))
  (define %25.downcasted0 (bvaddnsw  %22  %16.downcasted0 32))
  %25.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlal_high_n_s32  a b c )
(define %2 (extract  127 64 b))
(define %7 (extract  31 0 c))
(define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  31))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvmul  (bv 2 64)  %14.downcasted0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %8.downcasted0 64))
  (define %21 (+  e0.new  63))
  (define %22 (extract  %21 e0.new a))
  (define %25.downcasted0 (bvaddnsw  %22  %16.downcasted0 64))
  %25.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlal_high_s16  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  15))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvmul  (bv 2 32)  %11.downcasted0))
  (define %19.downcasted0 (bvmulnsw  %18.downcasted0  %17.downcasted0 32))
  (define %24 (+  e0.new  31))
  (define %25 (extract  %24 e0.new a))
  (define %28.downcasted0 (bvaddnsw  %25  %19.downcasted0 32))
  %28.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlal_high_s32  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  31))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvmul  (bv 2 64)  %11.downcasted0))
  (define %19.downcasted0 (bvmulnsw  %18.downcasted0  %17.downcasted0 64))
  (define %24 (+  e0.new  63))
  (define %25 (extract  %24 e0.new a))
  (define %28.downcasted0 (bvaddnsw  %25  %19.downcasted0 64))
  %28.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlal_n_s16  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  (bv 2 32)  %11.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %5.downcasted0 32))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  31))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0 (bvaddnsw  %19  %13.downcasted0 32))
  %22.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlal_n_s32  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  (bv 2 64)  %11.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %5.downcasted0 64))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  63))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0 (bvaddnsw  %19  %13.downcasted0 64))
  %22.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlal_s16  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  (bv 2 32)  %5.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %11.downcasted0 32))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  31))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0 (bvaddnsw  %19  %13.downcasted0 32))
  %22.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlal_s32  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  (bv 2 64)  %5.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %11.downcasted0 64))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  63))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0 (bvaddnsw  %19  %13.downcasted0 64))
  %22.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlalh_s16  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  (bv 2 32)  %5.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %11.downcasted0 32))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  31))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0 (bvaddnsw  %19  %13.downcasted0 32))
  %22.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlals_s32  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  (bv 2 64)  %5.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %11.downcasted0 64))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  63))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0 (bvaddnsw  %19  %13.downcasted0 64))
  %22.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlsl_high_n_s16  a b c )
(define %2 (extract  127 64 b))
(define %7 (extract  15 0 c))
(define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  15))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 32)))
  (define %15.downcasted0 (bvmul  (bv 2 32)  %14.downcasted0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %8.downcasted0 32))
  (define %21 (+  e0.new  31))
  (define %22 (extract  %21 e0.new a))
  (define %25.downcasted0 (bvsubnsw  %22  %16.downcasted0 32))
  %25.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlsl_high_n_s32  a b c )
(define %2 (extract  127 64 b))
(define %7 (extract  31 0 c))
(define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  31))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvmul  (bv 2 64)  %14.downcasted0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %8.downcasted0 64))
  (define %21 (+  e0.new  63))
  (define %22 (extract  %21 e0.new a))
  (define %25.downcasted0 (bvsubnsw  %22  %16.downcasted0 64))
  %25.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlsl_high_s16  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  15))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvmul  (bv 2 32)  %11.downcasted0))
  (define %19.downcasted0 (bvmulnsw  %18.downcasted0  %17.downcasted0 32))
  (define %24 (+  e0.new  31))
  (define %25 (extract  %24 e0.new a))
  (define %28.downcasted0 (bvsubnsw  %25  %19.downcasted0 32))
  %28.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlsl_high_s32  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  31))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvmul  (bv 2 64)  %11.downcasted0))
  (define %19.downcasted0 (bvmulnsw  %18.downcasted0  %17.downcasted0 64))
  (define %24 (+  e0.new  63))
  (define %25 (extract  %24 e0.new a))
  (define %28.downcasted0 (bvsubnsw  %25  %19.downcasted0 64))
  %28.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlsl_n_s16  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  (bv 2 32)  %11.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %5.downcasted0 32))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  31))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0 (bvsubnsw  %19  %13.downcasted0 32))
  %22.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlsl_n_s32  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  (bv 2 64)  %11.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %5.downcasted0 64))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  63))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0 (bvsubnsw  %19  %13.downcasted0 64))
  %22.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlsl_s16  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  (bv 2 32)  %5.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %11.downcasted0 32))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  31))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0 (bvsubnsw  %19  %13.downcasted0 32))
  %22.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlsl_s32  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  (bv 2 64)  %5.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %11.downcasted0 64))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  63))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0 (bvsubnsw  %19  %13.downcasted0 64))
  %22.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlslh_s16  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  (bv 2 32)  %5.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %11.downcasted0 32))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  31))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0 (bvsubnsw  %19  %13.downcasted0 32))
  %22.downcasted0
 )
 )
)
)
)
result)
(define (vqdmlsls_s32  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new c))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  (bv 2 64)  %5.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %11.downcasted0 64))
  (define %15.new0 (*  e0.new  2))
  (define %18 (+  %15.new0  63))
  (define %19 (extract  %18 %15.new0 a))
  (define %22.downcasted0 (bvsubnsw  %19  %13.downcasted0 64))
  %22.downcasted0
 )
 )
)
)
)
result)
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
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %6.downcasted0 32))
  (define %20 (bvashr  %13.downcasted0  (bv 15 32)))
  (define %21 (extract  15 0 %20))
  %21
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
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %6.downcasted0 64))
  (define %20 (bvashr  %13.downcasted0  (bv 31 64)))
  (define %21 (extract  31 0 %20))
  %21
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
  (define %13.downcasted0 (bvmulnsw  %6.downcasted0  %12.downcasted0 32))
  (define %20 (bvashr  %13.downcasted0  (bv 15 32)))
  (define %21 (extract  15 0 %20))
  %21
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
  (define %13.downcasted0 (bvmulnsw  %6.downcasted0  %12.downcasted0 64))
  (define %20 (bvashr  %13.downcasted0  (bv 31 64)))
  (define %21 (extract  31 0 %20))
  %21
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
  (define %13.downcasted0 (bvmulnsw  %6.downcasted0  %12.downcasted0 32))
  (define %20 (bvashr  %13.downcasted0  (bv 15 32)))
  (define %21 (extract  15 0 %20))
  %21
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
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %6.downcasted0 32))
  (define %20 (bvashr  %13.downcasted0  (bv 15 32)))
  (define %21 (extract  15 0 %20))
  %21
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
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %6.downcasted0 64))
  (define %20 (bvashr  %13.downcasted0  (bv 31 64)))
  (define %21 (extract  31 0 %20))
  %21
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
  (define %13.downcasted0 (bvmulnsw  %6.downcasted0  %12.downcasted0 32))
  (define %20 (bvashr  %13.downcasted0  (bv 15 32)))
  (define %21 (extract  15 0 %20))
  %21
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
  (define %13.downcasted0 (bvmulnsw  %6.downcasted0  %12.downcasted0 64))
  (define %20 (bvashr  %13.downcasted0  (bv 31 64)))
  (define %21 (extract  31 0 %20))
  %21
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
  (define %13.downcasted0 (bvmulnsw  %6.downcasted0  %12.downcasted0 64))
  (define %20 (bvashr  %13.downcasted0  (bv 31 64)))
  (define %21 (extract  31 0 %20))
  %21
 )
 )
)
)
)
result)
(define (vqdmull_high_n_s16  a b )
(define %2 (extract  127 64 a))
(define %7 (extract  15 0 b))
(define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  15))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 32)))
  (define %15.downcasted0 (bvmul  (bv 2 32)  %14.downcasted0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %8.downcasted0 32))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqdmull_high_n_s32  a b )
(define %2 (extract  127 64 a))
(define %7 (extract  31 0 b))
(define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  31))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvmul  (bv 2 64)  %14.downcasted0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %8.downcasted0 64))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqdmull_high_s16  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  15))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvmul  (bv 2 32)  %11.downcasted0))
  (define %19.downcasted0 (bvmulnsw  %18.downcasted0  %17.downcasted0 32))
  %19.downcasted0
 )
 )
)
)
)
result)
(define (vqdmull_high_s32  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  31))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvmul  (bv 2 64)  %11.downcasted0))
  (define %19.downcasted0 (bvmulnsw  %18.downcasted0  %17.downcasted0 64))
  %19.downcasted0
 )
 )
)
)
)
result)
(define (vqdmull_n_s16  a b )
(define %4 (extract  15 0 b))
(define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  (bv 2 32)  %11.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %5.downcasted0 32))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqdmull_n_s32  a b )
(define %4 (extract  31 0 b))
(define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  (bv 2 64)  %11.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %5.downcasted0 64))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqdmull_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  (bv 2 32)  %5.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %11.downcasted0 32))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqdmull_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  (bv 2 64)  %5.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %11.downcasted0 64))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqdmullh_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvmul  (bv 2 32)  %5.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %11.downcasted0 32))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqdmulls_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvmul  (bv 2 64)  %5.downcasted0))
  (define %13.downcasted0 (bvmulnsw  %12.downcasted0  %11.downcasted0 64))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqmovn_high_s16  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10.downcasted0 (bvssat %9.downcasted0 32 8 ))
  %10.downcasted0
 )
 )
)
)
)
(define %11 (concat result r))
%11)
(define (vqmovn_high_s32  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10.downcasted0 (bvssat %9.downcasted0 64 16 ))
  %10.downcasted0
 )
 )
)
)
)
(define %11 (concat result r))
%11)
(define (vqmovn_high_s64  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %10.downcasted0 (bvssat %9.downcasted0 128 32 ))
  %10.downcasted0
 )
 )
)
)
)
(define %11 (concat result r))
%11)
(define (vqmovn_high_u16  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10.downcasted0 (bvusat %9.downcasted0 32 8 ))
  %10.downcasted0
 )
 )
)
)
)
(define %11 (concat result r))
%11)
(define (vqmovn_high_u32  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10.downcasted0 (bvusat %9.downcasted0 64 16 ))
  %10.downcasted0
 )
 )
)
)
)
(define %11 (concat result r))
%11)
(define (vqmovn_high_u64  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9.downcasted0 (zero-extend  %4 (bitvector 128)))
  (define %10.downcasted0 (bvusat %9.downcasted0 128 32 ))
  %10.downcasted0
 )
 )
)
)
)
(define %11 (concat result r))
%11)
(define (vqmovn_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  15))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10.downcasted0 (bvssat %9.downcasted0 32 8 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqmovn_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  31))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10.downcasted0 (bvssat %9.downcasted0 64 16 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqmovn_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  63))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %10.downcasted0 (bvssat %9.downcasted0 128 32 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqmovn_u16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  15))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10.downcasted0 (bvusat %9.downcasted0 32 8 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqmovn_u32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  31))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10.downcasted0 (bvusat %9.downcasted0 64 16 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqmovn_u64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  63))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (zero-extend  %4 (bitvector 128)))
  (define %10.downcasted0 (bvusat %9.downcasted0 128 32 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqmovnd_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  63))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %10.downcasted0 (bvssat %9.downcasted0 128 32 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqmovnd_u64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  63))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (zero-extend  %4 (bitvector 128)))
  (define %10.downcasted0 (bvusat %9.downcasted0 128 32 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqmovnh_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  15))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10.downcasted0 (bvssat %9.downcasted0 32 8 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqmovnh_u16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  15))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10.downcasted0 (bvusat %9.downcasted0 32 8 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqmovns_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  31))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10.downcasted0 (bvssat %9.downcasted0 64 16 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqmovns_u32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  31))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10.downcasted0 (bvusat %9.downcasted0 64 16 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqmovun_high_s16  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10.downcasted0 (bvusat %9.downcasted0 32 8 ))
  %10.downcasted0
 )
 )
)
)
)
(define %11 (concat result r))
%11)
(define (vqmovun_high_s32  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10.downcasted0 (bvusat %9.downcasted0 64 16 ))
  %10.downcasted0
 )
 )
)
)
)
(define %11 (concat result r))
%11)
(define (vqmovun_high_s64  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %10.downcasted0 (bvusat %9.downcasted0 128 32 ))
  %10.downcasted0
 )
 )
)
)
)
(define %11 (concat result r))
%11)
(define (vqmovun_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  15))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10.downcasted0 (bvusat %9.downcasted0 32 8 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqmovun_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  31))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10.downcasted0 (bvusat %9.downcasted0 64 16 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqmovun_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  63))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %10.downcasted0 (bvusat %9.downcasted0 128 32 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqmovund_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  63))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %10.downcasted0 (bvusat %9.downcasted0 128 32 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqmovunh_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  15))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10.downcasted0 (bvusat %9.downcasted0 32 8 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqmovuns_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  31))
  (define %4 (extract  %3 %0.new0 a))
  (define %9.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10.downcasted0 (bvusat %9.downcasted0 64 16 ))
  %10.downcasted0
 )
 )
)
)
)
result)
(define (vqneg_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (bvssat %6.downcasted0 32 16 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqneg_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (bvssat %6.downcasted0 64 32 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqneg_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (bvssat %6.downcasted0 128 64 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqneg_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (bvssat %6.downcasted0 16 8 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqnegb_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (bvssat %6.downcasted0 16 8 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqnegd_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (bvssat %6.downcasted0 128 64 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqnegh_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (bvssat %6.downcasted0 32 16 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqnegq_s16  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (bvssat %6.downcasted0 32 16 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqnegq_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (bvssat %6.downcasted0 64 32 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqnegq_s64  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (bvssat %6.downcasted0 128 64 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqnegq_s8  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (bvssat %6.downcasted0 16 8 ))
  %11.downcasted0
 )
 )
)
)
)
result)
(define (vqnegs_s32  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %6.downcasted0 (bvneg  %5.downcasted0))
  (define %11.downcasted0 (bvssat %6.downcasted0 64 32 ))
  %11.downcasted0
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
  (define %19.downcasted0 (bvssat %14.downcasted0 64 32 ))
  (define %20 (bvashr  %19.downcasted0  (bv 15 32)))
  (define %21 (extract  15 0 %20))
  %21
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
  (define %19.downcasted0 (bvssat %14.downcasted0 128 64 ))
  (define %20 (bvashr  %19.downcasted0  (bv 31 64)))
  (define %21 (extract  31 0 %20))
  %21
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
  (define %19.downcasted0 (bvssat %14.downcasted0 64 32 ))
  (define %20 (bvashr  %19.downcasted0  (bv 15 32)))
  (define %21 (extract  15 0 %20))
  %21
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
  (define %19.downcasted0 (bvssat %14.downcasted0 128 64 ))
  (define %20 (bvashr  %19.downcasted0  (bv 31 64)))
  (define %21 (extract  31 0 %20))
  %21
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
  (define %19.downcasted0 (bvssat %14.downcasted0 64 32 ))
  (define %20 (bvashr  %19.downcasted0  (bv 15 32)))
  (define %21 (extract  15 0 %20))
  %21
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
  (define %19.downcasted0 (bvssat %14.downcasted0 64 32 ))
  (define %20 (bvashr  %19.downcasted0  (bv 15 32)))
  (define %21 (extract  15 0 %20))
  %21
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
  (define %19.downcasted0 (bvssat %14.downcasted0 128 64 ))
  (define %20 (bvashr  %19.downcasted0  (bv 31 64)))
  (define %21 (extract  31 0 %20))
  %21
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
  (define %19.downcasted0 (bvssat %14.downcasted0 64 32 ))
  (define %20 (bvashr  %19.downcasted0  (bv 15 32)))
  (define %21 (extract  15 0 %20))
  %21
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
  (define %19.downcasted0 (bvssat %14.downcasted0 128 64 ))
  (define %20 (bvashr  %19.downcasted0  (bv 31 64)))
  (define %21 (extract  31 0 %20))
  %21
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
  (define %19.downcasted0 (bvssat %14.downcasted0 128 64 ))
  (define %20 (bvashr  %19.downcasted0  (bv 31 64)))
  (define %21 (extract  31 0 %20))
  %21
 )
 )
)
)
)
result)
(define (vqrshl_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 32)))
  (define %9 (bvshl  (bv 1 32)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 32)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvssat %17 32 16 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshl_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 64)))
  (define %9 (bvshl  (bv 1 64)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 64)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvssat %17 64 32 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshl_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 128)))
  (define %9 (bvshl  (bv 1 128)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 128)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvssat %17 128 64 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshl_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 16)))
  (define %9 (bvshl  (bv 1 16)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 16)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvssat %17 16 8 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshl_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 32)))
  (define %9 (bvshl  (bv 1 32)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 32)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvusat %17 32 16 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshl_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 64)))
  (define %9 (bvshl  (bv 1 64)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 64)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvusat %17 64 32 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshl_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 128)))
  (define %9 (bvshl  (bv 1 128)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 128)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvusat %17 128 64 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshl_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 16)))
  (define %9 (bvshl  (bv 1 16)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 16)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvusat %17 16 8 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshlb_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 16)))
  (define %9 (bvshl  (bv 1 16)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 16)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvssat %17 16 8 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshlb_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 16)))
  (define %9 (bvshl  (bv 1 16)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 16)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvusat %17 16 8 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshld_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 128)))
  (define %9 (bvshl  (bv 1 128)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 128)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvssat %17 128 64 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshld_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 128)))
  (define %9 (bvshl  (bv 1 128)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 128)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvusat %17 128 64 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshlh_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 32)))
  (define %9 (bvshl  (bv 1 32)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 32)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvssat %17 32 16 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshlh_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 32)))
  (define %9 (bvshl  (bv 1 32)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 32)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvusat %17 32 16 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshlq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 32)))
  (define %9 (bvshl  (bv 1 32)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 32)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvssat %17 32 16 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshlq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 64)))
  (define %9 (bvshl  (bv 1 64)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 64)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvssat %17 64 32 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshlq_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 128)))
  (define %9 (bvshl  (bv 1 128)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 128)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvssat %17 128 64 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshlq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 16)))
  (define %9 (bvshl  (bv 1 16)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 16)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvssat %17 16 8 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshlq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 32)))
  (define %9 (bvshl  (bv 1 32)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 32)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvusat %17 32 16 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshlq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 64)))
  (define %9 (bvshl  (bv 1 64)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 64)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvusat %17 64 32 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshlq_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 128)))
  (define %9 (bvshl  (bv 1 128)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 128)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvusat %17 128 64 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshlq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 16)))
  (define %9 (bvshl  (bv 1 16)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 16)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvusat %17 16 8 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshls_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 64)))
  (define %9 (bvshl  (bv 1 64)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 64)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvssat %17 64 32 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshls_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 64)))
  (define %9 (bvshl  (bv 1 64)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 64)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (bvusat %17 64 32 ))
  %22
 )
 )
)
)
)
result)
(define (vqrshrn_high_n_s16  r a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %16.downcasted0 (bvssat %11.downcasted0 64 8 ))
  %16.downcasted0
 )
 )
)
)
)
(define %17 (concat result r))
%17)
(define (vqrshrn_high_n_s32  r a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %16.downcasted0 (bvssat %11.downcasted0 64 16 ))
  %16.downcasted0
 )
 )
)
)
)
(define %17 (concat result r))
%17)
(define (vqrshrn_high_n_s64  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  %1.downcasted0))
  (define %16.downcasted0 (bvssat %11.downcasted0 128 32 ))
  %16.downcasted0
 )
 )
)
)
)
(define %17 (concat result r))
%17)
(define (vqrshrn_high_n_u16  r a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %16.downcasted0 (bvusat %11.downcasted0 64 8 ))
  %16.downcasted0
 )
 )
)
)
)
(define %17 (concat result r))
%17)
(define (vqrshrn_high_n_u32  r a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %16.downcasted0 (bvusat %11.downcasted0 64 16 ))
  %16.downcasted0
 )
 )
)
)
)
(define %17 (concat result r))
%17)
(define (vqrshrn_high_n_u64  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  %1.downcasted0))
  (define %16.downcasted0 (bvusat %11.downcasted0 128 32 ))
  %16.downcasted0
 )
 )
)
)
)
(define %17 (concat result r))
%17)
(define (vqrshrn_n_s16  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  15))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %16.downcasted0 (bvssat %11.downcasted0 64 8 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqrshrn_n_s32  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  31))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %16.downcasted0 (bvssat %11.downcasted0 64 16 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqrshrn_n_s64  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  63))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  %1.downcasted0))
  (define %16.downcasted0 (bvssat %11.downcasted0 128 32 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqrshrn_n_u16  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  15))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %16.downcasted0 (bvusat %11.downcasted0 64 8 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqrshrn_n_u32  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  31))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %16.downcasted0 (bvusat %11.downcasted0 64 16 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqrshrn_n_u64  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  63))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  %1.downcasted0))
  (define %16.downcasted0 (bvusat %11.downcasted0 128 32 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqrshrnd_n_s64  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  63))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  %1.downcasted0))
  (define %16.downcasted0 (bvssat %11.downcasted0 128 32 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqrshrnd_n_u64  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  63))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  %1.downcasted0))
  (define %16.downcasted0 (bvusat %11.downcasted0 128 32 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqrshrnh_n_s16  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  15))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %16.downcasted0 (bvssat %11.downcasted0 64 8 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqrshrnh_n_u16  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  15))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %16.downcasted0 (bvusat %11.downcasted0 64 8 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqrshrns_n_s32  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  31))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %16.downcasted0 (bvssat %11.downcasted0 64 16 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqrshrns_n_u32  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  31))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %16.downcasted0 (bvusat %11.downcasted0 64 16 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqrshrun_high_n_s16  r a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %16.downcasted0 (bvusat %11.downcasted0 64 8 ))
  %16.downcasted0
 )
 )
)
)
)
(define %17 (concat result r))
%17)
(define (vqrshrun_high_n_s32  r a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %16.downcasted0 (bvusat %11.downcasted0 64 16 ))
  %16.downcasted0
 )
 )
)
)
)
(define %17 (concat result r))
%17)
(define (vqrshrun_high_n_s64  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  %1.downcasted0))
  (define %16.downcasted0 (bvusat %11.downcasted0 128 32 ))
  %16.downcasted0
 )
 )
)
)
)
(define %17 (concat result r))
%17)
(define (vqrshrun_n_s16  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  15))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %16.downcasted0 (bvusat %11.downcasted0 64 8 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqrshrun_n_s32  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  31))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %16.downcasted0 (bvusat %11.downcasted0 64 16 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqrshrun_n_s64  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  63))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  %1.downcasted0))
  (define %16.downcasted0 (bvusat %11.downcasted0 128 32 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqrshrund_n_s64  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  63))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  %1.downcasted0))
  (define %16.downcasted0 (bvusat %11.downcasted0 128 32 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqrshrunh_n_s16  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  15))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %16.downcasted0 (bvusat %11.downcasted0 64 8 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqrshruns_n_s32  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  31))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %16.downcasted0 (bvusat %11.downcasted0 64 16 ))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vqshl_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 32)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvssat %14 32 16 ))
  %19
 )
 )
)
)
)
result)
(define (vqshl_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 64)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvssat %14 64 32 ))
  %19
 )
 )
)
)
)
result)
(define (vqshl_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 128)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvssat %14 128 64 ))
  %19
 )
 )
)
)
)
result)
(define (vqshl_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 16)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvssat %14 16 8 ))
  %19
 )
 )
)
)
)
result)
(define (vqshl_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 32)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvusat %14 32 16 ))
  %19
 )
 )
)
)
)
result)
(define (vqshl_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 64)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvusat %14 64 32 ))
  %19
 )
 )
)
)
)
result)
(define (vqshl_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 128)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvusat %14 128 64 ))
  %19
 )
 )
)
)
)
result)
(define (vqshl_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 16)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvusat %14 16 8 ))
  %19
 )
 )
)
)
)
result)
(define (vqshlb_n_s8  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (bvssat %8.downcasted0 64 8 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshlb_n_u8  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (bvusat %8.downcasted0 64 8 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshlb_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 16)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvssat %14 16 8 ))
  %19
 )
 )
)
)
)
result)
(define (vqshlb_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 16)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvusat %14 16 8 ))
  %19
 )
 )
)
)
)
result)
(define (vqshld_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 128)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvssat %14 128 64 ))
  %19
 )
 )
)
)
)
result)
(define (vqshld_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 128)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvusat %14 128 64 ))
  %19
 )
 )
)
)
)
result)
(define (vqshlh_n_s16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (bvssat %8.downcasted0 64 16 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshlh_n_u16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (bvusat %8.downcasted0 64 16 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshlh_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 32)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvssat %14 32 16 ))
  %19
 )
 )
)
)
)
result)
(define (vqshlh_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 32)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvusat %14 32 16 ))
  %19
 )
 )
)
)
)
result)
(define (vqshlq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 32)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvssat %14 32 16 ))
  %19
 )
 )
)
)
)
result)
(define (vqshlq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 64)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvssat %14 64 32 ))
  %19
 )
 )
)
)
)
result)
(define (vqshlq_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 128)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvssat %14 128 64 ))
  %19
 )
 )
)
)
)
result)
(define (vqshlq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 16)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvssat %14 16 8 ))
  %19
 )
 )
)
)
)
result)
(define (vqshlq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 32)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvusat %14 32 16 ))
  %19
 )
 )
)
)
)
result)
(define (vqshlq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 64)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvusat %14 64 32 ))
  %19
 )
 )
)
)
)
result)
(define (vqshlq_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 128)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvusat %14 128 64 ))
  %19
 )
 )
)
)
)
result)
(define (vqshlq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 16)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvusat %14 16 8 ))
  %19
 )
 )
)
)
)
result)
(define (vqshls_n_s32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %5 (+  e0.new  31))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (bvssat %8.downcasted0 64 32 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshls_n_u32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %5 (+  e0.new  31))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (bvusat %8.downcasted0 64 32 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshls_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 64)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvssat %14 64 32 ))
  %19
 )
 )
)
)
)
result)
(define (vqshls_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 64)))
  (define %14 (bvshl  %12  %6))
  (define %19 (bvusat %14 64 32 ))
  %19
 )
 )
)
)
)
result)
(define (vqshlu_n_s16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (bvusat %8.downcasted0 64 16 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshlu_n_s32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %5 (+  e0.new  31))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (bvusat %8.downcasted0 64 32 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshlu_n_s64  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %5 (+  e0.new  63))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 128)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  %1.downcasted0))
  (define %13.downcasted0 (bvusat %8.downcasted0 128 64 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshlu_n_s8  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (bvusat %8.downcasted0 64 8 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshlub_n_s8  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (bvusat %8.downcasted0 64 8 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshlud_n_s64  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %5 (+  e0.new  63))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 128)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  %1.downcasted0))
  (define %13.downcasted0 (bvusat %8.downcasted0 128 64 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshluh_n_s16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (bvusat %8.downcasted0 64 16 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshluq_n_s16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (bvusat %8.downcasted0 64 16 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshluq_n_s32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %5 (+  e0.new  31))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (bvusat %8.downcasted0 64 32 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshluq_n_s64  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %5 (+  e0.new  63))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 128)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  %1.downcasted0))
  (define %13.downcasted0 (bvusat %8.downcasted0 128 64 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshluq_n_s8  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (bvusat %8.downcasted0 64 8 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshlus_n_s32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %5 (+  e0.new  31))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (bvusat %8.downcasted0 64 32 ))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vqshrn_high_n_s16  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %15.downcasted0 (bvssat %10.downcasted0 64 8 ))
  %15.downcasted0
 )
 )
)
)
)
(define %16 (concat result r))
%16)
(define (vqshrn_high_n_s32  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %15.downcasted0 (bvssat %10.downcasted0 64 16 ))
  %15.downcasted0
 )
 )
)
)
)
(define %16 (concat result r))
%16)
(define (vqshrn_high_n_s64  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new a))
  (define %10.downcasted0 (bvashr  %7  n))
  (define %15.downcasted0 (bvssat %10.downcasted0 64 32 ))
  %15.downcasted0
 )
 )
)
)
)
(define %16 (concat result r))
%16)
(define (vqshrn_high_n_u16  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 8 ))
  %15.downcasted0
 )
 )
)
)
)
(define %16 (concat result r))
%16)
(define (vqshrn_high_n_u32  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 16 ))
  %15.downcasted0
 )
 )
)
)
)
(define %16 (concat result r))
%16)
(define (vqshrn_high_n_u64  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new a))
  (define %10.downcasted0 (bvlshr  %7  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 32 ))
  %15.downcasted0
 )
 )
)
)
)
(define %16 (concat result r))
%16)
(define (vqshrn_n_s16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  15))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %15.downcasted0 (bvssat %10.downcasted0 64 8 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqshrn_n_s32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  31))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %15.downcasted0 (bvssat %10.downcasted0 64 16 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqshrn_n_s64  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  63))
  (define %7 (extract  %6 %3.new0 a))
  (define %10.downcasted0 (bvashr  %7  n))
  (define %15.downcasted0 (bvssat %10.downcasted0 64 32 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqshrn_n_u16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  15))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 8 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqshrn_n_u32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  31))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 16 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqshrn_n_u64  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  63))
  (define %7 (extract  %6 %3.new0 a))
  (define %10.downcasted0 (bvlshr  %7  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 32 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqshrnd_n_s64  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  63))
  (define %7 (extract  %6 %3.new0 a))
  (define %10.downcasted0 (bvashr  %7  n))
  (define %15.downcasted0 (bvssat %10.downcasted0 64 32 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqshrnd_n_u64  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  63))
  (define %7 (extract  %6 %3.new0 a))
  (define %10.downcasted0 (bvlshr  %7  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 32 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqshrnh_n_s16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  15))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %15.downcasted0 (bvssat %10.downcasted0 64 8 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqshrnh_n_u16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  15))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 8 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqshrns_n_s32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  31))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %15.downcasted0 (bvssat %10.downcasted0 64 16 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqshrns_n_u32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  31))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 16 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqshrun_high_n_s16  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 8 ))
  %15.downcasted0
 )
 )
)
)
)
(define %16 (concat result r))
%16)
(define (vqshrun_high_n_s32  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 16 ))
  %15.downcasted0
 )
 )
)
)
)
(define %16 (concat result r))
%16)
(define (vqshrun_high_n_s64  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new a))
  (define %10.downcasted0 (bvashr  %7  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 32 ))
  %15.downcasted0
 )
 )
)
)
)
(define %16 (concat result r))
%16)
(define (vqshrun_n_s16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  15))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 8 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqshrun_n_s32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  31))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 16 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqshrun_n_s64  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  63))
  (define %7 (extract  %6 %3.new0 a))
  (define %10.downcasted0 (bvashr  %7  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 32 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqshrund_n_s64  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  63))
  (define %7 (extract  %6 %3.new0 a))
  (define %10.downcasted0 (bvashr  %7  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 32 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqshrunh_n_s16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  15))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 8 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqshruns_n_s32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  31))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %15.downcasted0 (bvusat %10.downcasted0 64 16 ))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vqsub_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnsw  %4  %10 16))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsub_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnsw  %4  %10 32))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsub_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnsw  %4  %10 64))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsub_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnsw  %4  %10 8))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsub_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnuw  %4  %10 16))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsub_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnuw  %4  %10 32))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsub_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnuw  %4  %10 64))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsub_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnuw  %4  %10 8))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsubb_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnsw  %4  %10 8))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsubb_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnuw  %4  %10 8))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsubd_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnsw  %4  %10 64))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsubd_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnuw  %4  %10 64))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsubh_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnsw  %4  %10 16))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsubh_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnuw  %4  %10 16))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsubq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnsw  %4  %10 16))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsubq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnsw  %4  %10 32))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsubq_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnsw  %4  %10 64))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsubq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnsw  %4  %10 8))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsubq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnuw  %4  %10 16))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsubq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnuw  %4  %10 32))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsubq_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnuw  %4  %10 64))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsubq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnuw  %4  %10 8))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsubs_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnsw  %4  %10 32))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vqsubs_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %10 (extract  %3 e0.new b))
  (define %12.downcasted0 (bvsubnuw  %4  %10 32))
  %12.downcasted0
 )
 )
)
)
)
result)
(define (vraddhn_high_s16  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvadd  %5  %10))
  (define %12 (bvadd  %11  (bv 128 16)))
  (define %17 (extract  15 8 %12))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vraddhn_high_s32  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvadd  %5  %10))
  (define %12 (bvadd  %11  (bv 32768 32)))
  (define %17 (extract  31 16 %12))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vraddhn_high_s64  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvadd  %5  %10))
  (define %12 (bvadd  %11  (bv 2147483648 64)))
  (define %17 (extract  63 32 %12))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vraddhn_high_u16  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvadd  %5  %10))
  (define %12 (bvadd  %11  (bv 128 16)))
  (define %17 (extract  15 8 %12))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vraddhn_high_u32  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvadd  %5  %10))
  (define %12 (bvadd  %11  (bv 32768 32)))
  (define %17 (extract  31 16 %12))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vraddhn_high_u64  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvadd  %5  %10))
  (define %12 (bvadd  %11  (bv 2147483648 64)))
  (define %17 (extract  63 32 %12))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vraddhn_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  15))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvadd  %5  %10))
  (define %12 (bvadd  %11  (bv 128 16)))
  (define %17 (extract  15 8 %12))
  %17
 )
 )
)
)
)
result)
(define (vraddhn_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  31))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvadd  %5  %10))
  (define %12 (bvadd  %11  (bv 32768 32)))
  (define %17 (extract  31 16 %12))
  %17
 )
 )
)
)
)
result)
(define (vraddhn_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  63))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvadd  %5  %10))
  (define %12 (bvadd  %11  (bv 2147483648 64)))
  (define %17 (extract  63 32 %12))
  %17
 )
 )
)
)
)
result)
(define (vraddhn_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  15))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvadd  %5  %10))
  (define %12 (bvadd  %11  (bv 128 16)))
  (define %17 (extract  15 8 %12))
  %17
 )
 )
)
)
)
result)
(define (vraddhn_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  31))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvadd  %5  %10))
  (define %12 (bvadd  %11  (bv 32768 32)))
  (define %17 (extract  31 16 %12))
  %17
 )
 )
)
)
)
result)
(define (vraddhn_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  63))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvadd  %5  %10))
  (define %12 (bvadd  %11  (bv 2147483648 64)))
  (define %17 (extract  63 32 %12))
  %17
 )
 )
)
)
)
result)
(define (vrhadd_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 1 32)))
  (define %18.downcasted0 (extract  16 1 %17.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define (vrhadd_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 1 64)))
  (define %18.downcasted0 (extract  32 1 %17.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define (vrhadd_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 1 16)))
  (define %18.downcasted0 (extract  8 1 %17.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define (vrhadd_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 1 32)))
  (define %18.downcasted0 (extract  16 1 %17.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define (vrhadd_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 1 64)))
  (define %18.downcasted0 (extract  32 1 %17.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define (vrhadd_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 1 16)))
  (define %18.downcasted0 (extract  8 1 %17.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define (vrhaddq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 1 32)))
  (define %18.downcasted0 (extract  16 1 %17.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define (vrhaddq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 1 64)))
  (define %18.downcasted0 (extract  32 1 %17.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define (vrhaddq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 1 16)))
  (define %18.downcasted0 (extract  8 1 %17.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define (vrhaddq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 1 32)))
  (define %18.downcasted0 (extract  16 1 %17.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define (vrhaddq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 1 64)))
  (define %18.downcasted0 (extract  32 1 %17.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define (vrhaddq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 1 16)))
  (define %18.downcasted0 (extract  8 1 %17.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define (vrshl_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 32)))
  (define %9 (bvshl  (bv 1 32)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 32)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  15 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshl_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 64)))
  (define %9 (bvshl  (bv 1 64)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 64)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  31 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshl_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 128)))
  (define %9 (bvshl  (bv 1 128)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 128)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  63 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshl_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 16)))
  (define %9 (bvshl  (bv 1 16)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 16)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  7 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshl_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 32)))
  (define %9 (bvshl  (bv 1 32)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 32)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  15 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshl_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 64)))
  (define %9 (bvshl  (bv 1 64)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 64)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  31 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshl_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 128)))
  (define %9 (bvshl  (bv 1 128)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 128)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  63 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshl_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 16)))
  (define %9 (bvshl  (bv 1 16)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 16)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  7 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshld_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 128)))
  (define %9 (bvshl  (bv 1 128)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 128)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  63 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshld_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 128)))
  (define %9 (bvshl  (bv 1 128)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 128)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  63 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshlq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 32)))
  (define %9 (bvshl  (bv 1 32)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 32)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  15 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshlq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 64)))
  (define %9 (bvshl  (bv 1 64)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 64)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  31 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshlq_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 128)))
  (define %9 (bvshl  (bv 1 128)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 128)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  63 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshlq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 16)))
  (define %9 (bvshl  (bv 1 16)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (sign-extend  %14 (bitvector 16)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  7 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshlq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 32)))
  (define %9 (bvshl  (bv 1 32)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 32)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  15 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshlq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 64)))
  (define %9 (bvshl  (bv 1 64)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 64)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  31 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshlq_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 128)))
  (define %9 (bvshl  (bv 1 128)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 128)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  63 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshlq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %7 (bvneg  %6))
  (define %8 (bvsub  %7  (bv 1 16)))
  (define %9 (bvshl  (bv 1 16)  %8))
  (define %14 (extract  %4 e0.new a))
  (define %15 (zero-extend  %14 (bitvector 16)))
  (define %16 (bvadd  %15  %9))
  (define %17 (bvshl  %16  %6))
  (define %22 (extract  7 0 %17))
  %22
 )
 )
)
)
)
result)
(define (vrshr_n_s16  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  n))
  (define %22.downcasted0 (extract  15 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 16)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrshr_n_s32  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  n))
  (define %22.downcasted0 (extract  31 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 32)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrshr_n_s64  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (extract  63 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 64)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrshr_n_s8  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  n))
  (define %22.downcasted0 (extract  7 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 8)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrshr_n_u16  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  n))
  (define %22.downcasted0 (extract  15 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 16)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrshr_n_u32  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  n))
  (define %22.downcasted0 (extract  31 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 32)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrshr_n_u64  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 128)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (extract  63 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 64)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrshr_n_u8  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  n))
  (define %22.downcasted0 (extract  7 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 8)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrshrd_n_s64  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (extract  63 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 64)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrshrd_n_u64  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 128)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (extract  63 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 64)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrshrn_high_n_s16  r a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %16.downcasted0 (extract  7 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
(define %17 (concat result r))
%17)
(define (vrshrn_high_n_s32  r a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %16.downcasted0 (extract  15 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
(define %17 (concat result r))
%17)
(define (vrshrn_high_n_s64  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  %1.downcasted0))
  (define %16.downcasted0 (extract  31 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
(define %17 (concat result r))
%17)
(define (vrshrn_high_n_u16  r a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %16.downcasted0 (extract  7 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
(define %17 (concat result r))
%17)
(define (vrshrn_high_n_u32  r a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %16.downcasted0 (extract  15 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
(define %17 (concat result r))
%17)
(define (vrshrn_high_n_u64  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  %1.downcasted0))
  (define %16.downcasted0 (extract  31 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
(define %17 (concat result r))
%17)
(define (vrshrn_n_s16  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  15))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %16.downcasted0 (extract  7 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vrshrn_n_s32  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  31))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %16.downcasted0 (extract  15 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vrshrn_n_s64  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  63))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  %1.downcasted0))
  (define %16.downcasted0 (extract  31 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vrshrn_n_u16  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  15))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %16.downcasted0 (extract  7 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vrshrn_n_u32  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  31))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %16.downcasted0 (extract  15 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vrshrn_n_u64  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %7 (+  %4.new0  63))
  (define %8 (extract  %7 %4.new0 a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  %1.downcasted0))
  (define %16.downcasted0 (extract  31 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vrshrq_n_s16  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  n))
  (define %22.downcasted0 (extract  15 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 16)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrshrq_n_s32  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  n))
  (define %22.downcasted0 (extract  31 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 32)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrshrq_n_s64  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (extract  63 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 64)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrshrq_n_s8  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  n))
  (define %22.downcasted0 (extract  7 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 8)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrshrq_n_u16  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  n))
  (define %22.downcasted0 (extract  15 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 16)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrshrq_n_u32  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  n))
  (define %22.downcasted0 (extract  31 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 32)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrshrq_n_u64  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 128)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (extract  63 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 64)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrshrq_n_u8  a n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  n))
  (define %22.downcasted0 (extract  7 0 %12.downcasted0))
  (define %23 (bvadd  (bv 0 8)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define (vrsra_n_s16  a b n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  15 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsra_n_s32  a b n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  31 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsra_n_s64  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  %1.downcasted0))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  63 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsra_n_s8  a b n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7 (+  e0.new  7))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  7 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsra_n_u16  a b n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  15 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsra_n_u32  a b n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  31 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsra_n_u64  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  %1.downcasted0))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  63 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsra_n_u8  a b n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7 (+  e0.new  7))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  7 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsrad_n_s64  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  %1.downcasted0))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  63 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsrad_n_u64  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  %1.downcasted0))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  63 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsraq_n_s16  a b n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  15 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsraq_n_s32  a b n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  31 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsraq_n_s64  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  %1.downcasted0))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  63 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsraq_n_s8  a b n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %7 (+  e0.new  7))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvashr  %10.downcasted0  n))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  7 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsraq_n_u16  a b n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  15 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsraq_n_u32  a b n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  31 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsraq_n_u64  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %3.downcasted0 (bvshl  (bv 1 128)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 128)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  %1.downcasted0))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  63 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsraq_n_u8  a b n )
(define %2.downcasted0 (bvsub  n  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %7 (+  e0.new  7))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %10.downcasted0 (bvadd  %9.downcasted0  %3.downcasted0))
  (define %11.downcasted0 (bvlshr  %10.downcasted0  n))
  (define %20 (extract  %7 e0.new a))
  (define %21.downcasted0 (extract  7 0 %11.downcasted0))
  (define %22 (bvadd  %20  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vrsubhn_high_s16  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvsub  %5  %10))
  (define %12 (bvadd  %11  (bv 128 16)))
  (define %17 (extract  15 8 %12))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vrsubhn_high_s32  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvsub  %5  %10))
  (define %12 (bvadd  %11  (bv 32768 32)))
  (define %17 (extract  31 16 %12))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vrsubhn_high_s64  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvsub  %5  %10))
  (define %12 (bvadd  %11  (bv 2147483648 64)))
  (define %17 (extract  63 32 %12))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vrsubhn_high_u16  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvsub  %5  %10))
  (define %12 (bvadd  %11  (bv 128 16)))
  (define %17 (extract  15 8 %12))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vrsubhn_high_u32  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvsub  %5  %10))
  (define %12 (bvadd  %11  (bv 32768 32)))
  (define %17 (extract  31 16 %12))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vrsubhn_high_u64  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvsub  %5  %10))
  (define %12 (bvadd  %11  (bv 2147483648 64)))
  (define %17 (extract  63 32 %12))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vrsubhn_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  15))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvsub  %5  %10))
  (define %12 (bvadd  %11  (bv 128 16)))
  (define %17 (extract  15 8 %12))
  %17
 )
 )
)
)
)
result)
(define (vrsubhn_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  31))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvsub  %5  %10))
  (define %12 (bvadd  %11  (bv 32768 32)))
  (define %17 (extract  31 16 %12))
  %17
 )
 )
)
)
)
result)
(define (vrsubhn_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  63))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvsub  %5  %10))
  (define %12 (bvadd  %11  (bv 2147483648 64)))
  (define %17 (extract  63 32 %12))
  %17
 )
 )
)
)
)
result)
(define (vrsubhn_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  15))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvsub  %5  %10))
  (define %12 (bvadd  %11  (bv 128 16)))
  (define %17 (extract  15 8 %12))
  %17
 )
 )
)
)
)
result)
(define (vrsubhn_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  31))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvsub  %5  %10))
  (define %12 (bvadd  %11  (bv 32768 32)))
  (define %17 (extract  31 16 %12))
  %17
 )
 )
)
)
)
result)
(define (vrsubhn_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  63))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvsub  %5  %10))
  (define %12 (bvadd  %11  (bv 2147483648 64)))
  (define %17 (extract  63 32 %12))
  %17
 )
 )
)
)
)
result)
(define (vshl_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 32)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  15 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshl_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 64)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  31 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshl_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 128)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  63 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshl_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 16)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  7 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshl_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 32)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  15 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshl_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 64)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  31 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshl_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 128)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  63 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshl_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 16)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  7 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshld_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 128)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  63 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshld_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 128)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  63 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshll_high_n_s16  a n )
(define %4 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %5.new0 (/  e0.new  2))
  (define %8 (+  %5.new0  15))
  (define %9 (extract  %8 %5.new0 %4))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvshl  %10.downcasted0  n))
  (define %16.downcasted0 (extract  31 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vshll_high_n_s32  a n )
(define %4 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %5.new0 (/  e0.new  2))
  (define %8 (+  %5.new0  31))
  (define %9 (extract  %8 %5.new0 %4))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvshl  %10.downcasted0  n))
  (define %16.downcasted0 (extract  63 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vshll_high_n_s8  a n )
(define %4 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %5.new0 (/  e0.new  2))
  (define %8 (+  %5.new0  7))
  (define %9 (extract  %8 %5.new0 %4))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvshl  %10.downcasted0  n))
  (define %16.downcasted0 (extract  15 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vshll_high_n_u16  a n )
(define %4 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %5.new0 (/  e0.new  2))
  (define %8 (+  %5.new0  15))
  (define %9 (extract  %8 %5.new0 %4))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvshl  %10.downcasted0  n))
  (define %16.downcasted0 (extract  31 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vshll_high_n_u32  a n )
(define %4 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %5.new0 (/  e0.new  2))
  (define %8 (+  %5.new0  31))
  (define %9 (extract  %8 %5.new0 %4))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvshl  %10.downcasted0  n))
  (define %16.downcasted0 (extract  63 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vshll_high_n_u8  a n )
(define %4 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %5.new0 (/  e0.new  2))
  (define %8 (+  %5.new0  7))
  (define %9 (extract  %8 %5.new0 %4))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvshl  %10.downcasted0  n))
  (define %16.downcasted0 (extract  15 0 %11.downcasted0))
  %16.downcasted0
 )
 )
)
)
)
result)
(define (vshll_n_s16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (extract  31 0 %8.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vshll_n_s32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %5 (+  e0.new  31))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (extract  63 0 %8.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vshll_n_s8  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (extract  15 0 %8.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vshll_n_u16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (extract  31 0 %8.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vshll_n_u32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %5 (+  e0.new  31))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (extract  63 0 %8.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vshll_n_u8  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 64)))
  (define %8.downcasted0 (bvshl  %7.downcasted0  n))
  (define %13.downcasted0 (extract  15 0 %8.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define (vshlq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 32)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  15 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshlq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 64)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  31 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshlq_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 128)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  63 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshlq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (sign-extend  %11 (bitvector 16)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  7 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshlq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 32)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  15 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshlq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 64)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  31 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshlq_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 128)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 128)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  63 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshlq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6 (sign-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new a))
  (define %12 (zero-extend  %11 (bitvector 16)))
  (define %14 (bvshl  %12  %6))
  (define %19 (extract  7 0 %14))
  %19
 )
 )
)
)
)
result)
(define (vshr_n_s16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %11.downcasted0 (bvashr  %9.downcasted0  n))
  (define %21.downcasted0 (extract  15 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 16)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vshr_n_s32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %11.downcasted0 (bvashr  %9.downcasted0  n))
  (define %21.downcasted0 (extract  31 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 32)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vshr_n_s64  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new a))
  (define %11.downcasted0 (bvashr  %8  n))
  (define %21.downcasted0 (extract  63 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 64)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vshr_n_s8  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7 (+  e0.new  7))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %11.downcasted0 (bvashr  %9.downcasted0  n))
  (define %21.downcasted0 (extract  7 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 8)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vshr_n_u16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %11.downcasted0 (bvlshr  %9.downcasted0  n))
  (define %21.downcasted0 (extract  15 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 16)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vshr_n_u32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %11.downcasted0 (bvlshr  %9.downcasted0  n))
  (define %21.downcasted0 (extract  31 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 32)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vshr_n_u64  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new a))
  (define %11.downcasted0 (bvlshr  %8  n))
  (define %21.downcasted0 (extract  63 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 64)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vshr_n_u8  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7 (+  e0.new  7))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %11.downcasted0 (bvlshr  %9.downcasted0  n))
  (define %21.downcasted0 (extract  7 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 8)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vshrd_n_s64  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new a))
  (define %11.downcasted0 (bvashr  %8  n))
  (define %21.downcasted0 (extract  63 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 64)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vshrd_n_u64  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new a))
  (define %11.downcasted0 (bvlshr  %8  n))
  (define %21.downcasted0 (extract  63 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 64)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vshrn_high_n_s16  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %15.downcasted0 (extract  7 0 %10.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
(define %16 (concat result r))
%16)
(define (vshrn_high_n_s32  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %15.downcasted0 (extract  15 0 %10.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
(define %16 (concat result r))
%16)
(define (vshrn_high_n_s64  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new a))
  (define %10.downcasted0 (bvlshr  %7  n))
  (define %15.downcasted0 (extract  31 0 %10.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
(define %16 (concat result r))
%16)
(define (vshrn_high_n_u16  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %15.downcasted0 (extract  7 0 %10.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
(define %16 (concat result r))
%16)
(define (vshrn_high_n_u32  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %15.downcasted0 (extract  15 0 %10.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
(define %16 (concat result r))
%16)
(define (vshrn_high_n_u64  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new a))
  (define %10.downcasted0 (bvlshr  %7  n))
  (define %15.downcasted0 (extract  31 0 %10.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
(define %16 (concat result r))
%16)
(define (vshrn_n_s16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  15))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %15.downcasted0 (extract  7 0 %10.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vshrn_n_s32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  31))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %15.downcasted0 (extract  15 0 %10.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vshrn_n_s64  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  63))
  (define %7 (extract  %6 %3.new0 a))
  (define %10.downcasted0 (bvlshr  %7  n))
  (define %15.downcasted0 (extract  31 0 %10.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vshrn_n_u16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  15))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %15.downcasted0 (extract  7 0 %10.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vshrn_n_u32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  31))
  (define %7 (extract  %6 %3.new0 a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %15.downcasted0 (extract  15 0 %10.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vshrn_n_u64  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3.new0 (*  e0.new  2))
  (define %6 (+  %3.new0  63))
  (define %7 (extract  %6 %3.new0 a))
  (define %10.downcasted0 (bvlshr  %7  n))
  (define %15.downcasted0 (extract  31 0 %10.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define (vshrq_n_s16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %11.downcasted0 (bvashr  %9.downcasted0  n))
  (define %21.downcasted0 (extract  15 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 16)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vshrq_n_s32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %11.downcasted0 (bvashr  %9.downcasted0  n))
  (define %21.downcasted0 (extract  31 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 32)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vshrq_n_s64  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new a))
  (define %11.downcasted0 (bvashr  %8  n))
  (define %21.downcasted0 (extract  63 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 64)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vshrq_n_s8  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %7 (+  e0.new  7))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %11.downcasted0 (bvashr  %9.downcasted0  n))
  (define %21.downcasted0 (extract  7 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 8)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vshrq_n_u16  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %11.downcasted0 (bvlshr  %9.downcasted0  n))
  (define %21.downcasted0 (extract  15 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 16)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vshrq_n_u32  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %11.downcasted0 (bvlshr  %9.downcasted0  n))
  (define %21.downcasted0 (extract  31 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 32)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vshrq_n_u64  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new a))
  (define %11.downcasted0 (bvlshr  %8  n))
  (define %21.downcasted0 (extract  63 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 64)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vshrq_n_u8  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %7 (+  e0.new  7))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %11.downcasted0 (bvlshr  %9.downcasted0  n))
  (define %21.downcasted0 (extract  7 0 %11.downcasted0))
  (define %22 (bvadd  (bv 0 8)  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define (vsqadd_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvusat %16.downcasted0 32 16 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsqadd_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvusat %16.downcasted0 64 32 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsqadd_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvusat %16.downcasted0 128 64 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsqadd_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvusat %16.downcasted0 16 8 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsqaddb_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvusat %16.downcasted0 16 8 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsqaddd_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvusat %16.downcasted0 128 64 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsqaddh_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvusat %16.downcasted0 32 16 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsqaddq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvusat %16.downcasted0 32 16 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsqaddq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvusat %16.downcasted0 64 32 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsqaddq_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvusat %16.downcasted0 128 64 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsqaddq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvusat %16.downcasted0 16 8 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsqadds_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvusat %16.downcasted0 64 32 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsra_n_s16  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  15 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsra_n_s32  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  31 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsra_n_s64  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvashr  %7  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  63 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsra_n_s8  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %6 (+  e0.new  7))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  7 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsra_n_u16  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  15 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsra_n_u32  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  31 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsra_n_u64  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvlshr  %7  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  63 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsra_n_u8  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %6 (+  e0.new  7))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  7 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsrad_n_s64  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvashr  %7  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  63 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsrad_n_u64  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvlshr  %7  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  63 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsraq_n_s16  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  15 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsraq_n_s32  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  31 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsraq_n_s64  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvashr  %7  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  63 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsraq_n_s8  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %6 (+  e0.new  7))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  7 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsraq_n_u16  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  15 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsraq_n_u32  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  31 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsraq_n_u64  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvlshr  %7  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  63 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsraq_n_u8  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %6 (+  e0.new  7))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %20.downcasted0 (extract  7 0 %10.downcasted0))
  (define %21 (bvadd  %19  %20.downcasted0))
  %21
 )
 )
)
)
)
result)
(define (vsub_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsub_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsub_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsub_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsub_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsub_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsub_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsub_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsubd_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsubd_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsubhn_high_s16  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvsub  %5  %10))
  (define %17 (extract  15 8 %11))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vsubhn_high_s32  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvsub  %5  %10))
  (define %17 (extract  31 16 %11))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vsubhn_high_s64  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvsub  %5  %10))
  (define %17 (extract  63 32 %11))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vsubhn_high_u16  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvsub  %5  %10))
  (define %17 (extract  15 8 %11))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vsubhn_high_u32  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvsub  %5  %10))
  (define %17 (extract  31 16 %11))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vsubhn_high_u64  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvsub  %5  %10))
  (define %17 (extract  63 32 %11))
  %17
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define (vsubhn_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  15))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvsub  %5  %10))
  (define %17 (extract  15 8 %11))
  %17
 )
 )
)
)
)
result)
(define (vsubhn_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  31))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvsub  %5  %10))
  (define %17 (extract  31 16 %11))
  %17
 )
 )
)
)
)
result)
(define (vsubhn_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  63))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvsub  %5  %10))
  (define %17 (extract  63 32 %11))
  %17
 )
 )
)
)
)
result)
(define (vsubhn_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  15))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvsub  %5  %10))
  (define %17 (extract  15 8 %11))
  %17
 )
 )
)
)
)
result)
(define (vsubhn_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  31))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvsub  %5  %10))
  (define %17 (extract  31 16 %11))
  %17
 )
 )
)
)
)
result)
(define (vsubhn_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %1.new0 (*  e0.new  2))
  (define %4 (+  %1.new0  63))
  (define %5 (extract  %4 %1.new0 a))
  (define %10 (extract  %4 %1.new0 b))
  (define %11 (bvsub  %5  %10))
  (define %17 (extract  63 32 %11))
  %17
 )
 )
)
)
)
result)
(define (vsubl_high_s16  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  15))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvsub  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  31 0 %18.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vsubl_high_s32  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  31))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvsub  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  63 0 %18.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vsubl_high_s8  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  7))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 16)))
  (define %18.downcasted0 (bvsub  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  15 0 %18.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vsubl_high_u16  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  15))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvsub  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  31 0 %18.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vsubl_high_u32  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  31))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvsub  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  63 0 %18.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vsubl_high_u8  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6.new0 (/  e0.new  2))
  (define %9 (+  %6.new0  7))
  (define %10 (extract  %9 %6.new0 %2))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %16 (extract  %9 %6.new0 %5))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 16)))
  (define %18.downcasted0 (bvsub  %11.downcasted0  %17.downcasted0))
  (define %23.downcasted0 (extract  15 0 %18.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define (vsubl_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  31 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsubl_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  63 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsubl_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  15 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsubl_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  31 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsubl_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  63 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsubl_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  15 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsubq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsubq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsubq_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsubq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsubq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsubq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsubq_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsubq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %14 (bvsub  %4  %9))
  %14
 )
 )
)
)
)
result)
(define (vsubw_high_s16  a b )
(define %2 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  15))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvsub  %8.downcasted0  %14.downcasted0))
  (define %20.downcasted0 (extract  31 0 %15.downcasted0))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vsubw_high_s32  a b )
(define %2 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 128)))
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  31))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 128)))
  (define %15.downcasted0 (bvsub  %8.downcasted0  %14.downcasted0))
  (define %20.downcasted0 (extract  63 0 %15.downcasted0))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vsubw_high_s8  a b )
(define %2 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  7))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 32)))
  (define %15.downcasted0 (bvsub  %8.downcasted0  %14.downcasted0))
  (define %20.downcasted0 (extract  15 0 %15.downcasted0))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vsubw_high_u16  a b )
(define %2 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  15))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (zero-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvsub  %8.downcasted0  %14.downcasted0))
  (define %20.downcasted0 (extract  31 0 %15.downcasted0))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vsubw_high_u32  a b )
(define %2 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 128)))
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  31))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (zero-extend  %13 (bitvector 128)))
  (define %15.downcasted0 (bvsub  %8.downcasted0  %14.downcasted0))
  (define %20.downcasted0 (extract  63 0 %15.downcasted0))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vsubw_high_u8  a b )
(define %2 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 32)))
  (define %9.new0 (/  e0.new  2))
  (define %12 (+  %9.new0  7))
  (define %13 (extract  %12 %9.new0 %2))
  (define %14.downcasted0 (zero-extend  %13 (bitvector 32)))
  (define %15.downcasted0 (bvsub  %8.downcasted0  %14.downcasted0))
  (define %20.downcasted0 (extract  15 0 %15.downcasted0))
  %20.downcasted0
 )
 )
)
)
)
result)
(define (vsubw_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  31))
  (define %4 (extract  %3 %0.new0 a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  31 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsubw_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  63))
  (define %4 (extract  %3 %0.new0 a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 128)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  63 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsubw_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  15))
  (define %4 (extract  %3 %0.new0 a))
  (define %5.downcasted0 (sign-extend  %4 (bitvector 32)))
  (define %9 (+  e0.new  7))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  15 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsubw_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  31))
  (define %4 (extract  %3 %0.new0 a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  31 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsubw_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  63))
  (define %4 (extract  %3 %0.new0 a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 128)))
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 128)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  63 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vsubw_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %0.new0 (*  e0.new  2))
  (define %3 (+  %0.new0  15))
  (define %4 (extract  %3 %0.new0 a))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %9 (+  e0.new  7))
  (define %10 (extract  %9 e0.new b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.downcasted0 (bvsub  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (extract  15 0 %12.downcasted0))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vtrn1_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 16))])
  (define %1.new0 (*  p0.new  2))
  (define %5 (+  %1.new0  15))
  (define %12 (extract  %5 %1.new0 a))
  (define %27 (extract  %5 %1.new0 b))
(concat %27 %12)
 )
 )
)
)
)
result)
(define (vtrn1_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 32))])
  (define %1.new0 (*  p0.new  2))
  (define %5 (+  %1.new0  31))
  (define %12 (extract  %5 %1.new0 a))
  (define %27 (extract  %5 %1.new0 b))
(concat %27 %12)
 )
 )
)
)
)
result)
(define (vtrn1_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 8))])
  (define %1.new0 (*  p0.new  2))
  (define %5 (+  %1.new0  7))
  (define %12 (extract  %5 %1.new0 a))
  (define %27 (extract  %5 %1.new0 b))
(concat %27 %12)
 )
 )
)
)
)
result)
(define (vtrn1_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 16))])
  (define %1.new0 (*  p0.new  2))
  (define %5 (+  %1.new0  15))
  (define %12 (extract  %5 %1.new0 a))
  (define %27 (extract  %5 %1.new0 b))
(concat %27 %12)
 )
 )
)
)
)
result)
(define (vtrn1_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 32))])
  (define %1.new0 (*  p0.new  2))
  (define %5 (+  %1.new0  31))
  (define %12 (extract  %5 %1.new0 a))
  (define %27 (extract  %5 %1.new0 b))
(concat %27 %12)
 )
 )
)
)
)
result)
(define (vtrn1_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 8))])
  (define %1.new0 (*  p0.new  2))
  (define %5 (+  %1.new0  7))
  (define %12 (extract  %5 %1.new0 a))
  (define %27 (extract  %5 %1.new0 b))
(concat %27 %12)
 )
 )
)
)
)
result)
(define (vtrn1q_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 16))])
  (define %1.new0 (*  p0.new  2))
  (define %5 (+  %1.new0  15))
  (define %12 (extract  %5 %1.new0 a))
  (define %27 (extract  %5 %1.new0 b))
(concat %27 %12)
 )
 )
)
)
)
result)
(define (vtrn1q_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 32))])
  (define %1.new0 (*  p0.new  2))
  (define %5 (+  %1.new0  31))
  (define %12 (extract  %5 %1.new0 a))
  (define %27 (extract  %5 %1.new0 b))
(concat %27 %12)
 )
 )
)
)
)
result)
(define (vtrn1q_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 64))])
  (define %1.new0 (*  p0.new  2))
  (define %5 (+  %1.new0  63))
  (define %12 (extract  %5 %1.new0 a))
  (define %27 (extract  %5 %1.new0 b))
(concat %27 %12)
 )
 )
)
)
)
result)
(define (vtrn1q_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 8))])
  (define %1.new0 (*  p0.new  2))
  (define %5 (+  %1.new0  7))
  (define %12 (extract  %5 %1.new0 a))
  (define %27 (extract  %5 %1.new0 b))
(concat %27 %12)
 )
 )
)
)
)
result)
(define (vtrn1q_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 16))])
  (define %1.new0 (*  p0.new  2))
  (define %5 (+  %1.new0  15))
  (define %12 (extract  %5 %1.new0 a))
  (define %27 (extract  %5 %1.new0 b))
(concat %27 %12)
 )
 )
)
)
)
result)
(define (vtrn1q_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 32))])
  (define %1.new0 (*  p0.new  2))
  (define %5 (+  %1.new0  31))
  (define %12 (extract  %5 %1.new0 a))
  (define %27 (extract  %5 %1.new0 b))
(concat %27 %12)
 )
 )
)
)
)
result)
(define (vtrn1q_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 64))])
  (define %1.new0 (*  p0.new  2))
  (define %5 (+  %1.new0  63))
  (define %12 (extract  %5 %1.new0 a))
  (define %27 (extract  %5 %1.new0 b))
(concat %27 %12)
 )
 )
)
)
)
result)
(define (vtrn1q_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 8))])
  (define %1.new0 (*  p0.new  2))
  (define %5 (+  %1.new0  7))
  (define %12 (extract  %5 %1.new0 a))
  (define %27 (extract  %5 %1.new0 b))
(concat %27 %12)
 )
 )
)
)
)
result)
(define (vtrn2_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 16))])
  (define %6.new0 (/  p0.new  8))
  (define %7 (+  %6.new0  1))
  (define %8 (*  %7  16))
  (define %13 (+  %8  15))
  (define %14 (extract  %13 %8 a))
  (define %31 (extract  %13 %8 b))
(concat %31 %14)
 )
 )
)
)
)
result)
(define (vtrn2_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 32))])
  (define %6.new0 (/  p0.new  16))
  (define %7 (+  %6.new0  1))
  (define %8 (*  %7  32))
  (define %13 (+  %8  31))
  (define %14 (extract  %13 %8 a))
  (define %31 (extract  %13 %8 b))
(concat %31 %14)
 )
 )
)
)
)
result)
(define (vtrn2_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 8))])
  (define %6.new0 (/  p0.new  4))
  (define %7 (+  %6.new0  1))
  (define %8 (*  %7  8))
  (define %13 (+  %8  7))
  (define %14 (extract  %13 %8 a))
  (define %31 (extract  %13 %8 b))
(concat %31 %14)
 )
 )
)
)
)
result)
(define (vtrn2_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 16))])
  (define %6.new0 (/  p0.new  8))
  (define %7 (+  %6.new0  1))
  (define %8 (*  %7  16))
  (define %13 (+  %8  15))
  (define %14 (extract  %13 %8 a))
  (define %31 (extract  %13 %8 b))
(concat %31 %14)
 )
 )
)
)
)
result)
(define (vtrn2_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 32))])
  (define %6.new0 (/  p0.new  16))
  (define %7 (+  %6.new0  1))
  (define %8 (*  %7  32))
  (define %13 (+  %8  31))
  (define %14 (extract  %13 %8 a))
  (define %31 (extract  %13 %8 b))
(concat %31 %14)
 )
 )
)
)
)
result)
(define (vtrn2_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 8))])
  (define %6.new0 (/  p0.new  4))
  (define %7 (+  %6.new0  1))
  (define %8 (*  %7  8))
  (define %13 (+  %8  7))
  (define %14 (extract  %13 %8 a))
  (define %31 (extract  %13 %8 b))
(concat %31 %14)
 )
 )
)
)
)
result)
(define (vtrn2q_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 16))])
  (define %6.new0 (/  p0.new  8))
  (define %7 (+  %6.new0  1))
  (define %8 (*  %7  16))
  (define %13 (+  %8  15))
  (define %14 (extract  %13 %8 a))
  (define %31 (extract  %13 %8 b))
(concat %31 %14)
 )
 )
)
)
)
result)
(define (vtrn2q_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 32))])
  (define %6.new0 (/  p0.new  16))
  (define %7 (+  %6.new0  1))
  (define %8 (*  %7  32))
  (define %13 (+  %8  31))
  (define %14 (extract  %13 %8 a))
  (define %31 (extract  %13 %8 b))
(concat %31 %14)
 )
 )
)
)
)
result)
(define (vtrn2q_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 64))])
  (define %6.new0 (/  p0.new  32))
  (define %7 (+  %6.new0  1))
  (define %8 (*  %7  64))
  (define %13 (+  %8  63))
  (define %14 (extract  %13 %8 a))
  (define %31 (extract  %13 %8 b))
(concat %31 %14)
 )
 )
)
)
)
result)
(define (vtrn2q_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 8))])
  (define %6.new0 (/  p0.new  4))
  (define %7 (+  %6.new0  1))
  (define %8 (*  %7  8))
  (define %13 (+  %8  7))
  (define %14 (extract  %13 %8 a))
  (define %31 (extract  %13 %8 b))
(concat %31 %14)
 )
 )
)
)
)
result)
(define (vtrn2q_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 16))])
  (define %6.new0 (/  p0.new  8))
  (define %7 (+  %6.new0  1))
  (define %8 (*  %7  16))
  (define %13 (+  %8  15))
  (define %14 (extract  %13 %8 a))
  (define %31 (extract  %13 %8 b))
(concat %31 %14)
 )
 )
)
)
)
result)
(define (vtrn2q_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 32))])
  (define %6.new0 (/  p0.new  16))
  (define %7 (+  %6.new0  1))
  (define %8 (*  %7  32))
  (define %13 (+  %8  31))
  (define %14 (extract  %13 %8 a))
  (define %31 (extract  %13 %8 b))
(concat %31 %14)
 )
 )
)
)
)
result)
(define (vtrn2q_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 64))])
  (define %6.new0 (/  p0.new  32))
  (define %7 (+  %6.new0  1))
  (define %8 (*  %7  64))
  (define %13 (+  %8  63))
  (define %14 (extract  %13 %8 a))
  (define %31 (extract  %13 %8 b))
(concat %31 %14)
 )
 )
)
)
)
result)
(define (vtrn2q_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 8))])
  (define %6.new0 (/  p0.new  4))
  (define %7 (+  %6.new0  1))
  (define %8 (*  %7  8))
  (define %13 (+  %8  7))
  (define %14 (extract  %13 %8 a))
  (define %31 (extract  %13 %8 b))
(concat %31 %14)
 )
 )
)
)
)
result)
(define (vtst_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vtst_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vtst_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vtst_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vtst_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vtst_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vtst_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vtst_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vtstd_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vtstd_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vtstq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vtstq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vtstq_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vtstq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vtstq_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 65535 16) (bv 0 16)))
  %19
 )
 )
)
)
)
result)
(define (vtstq_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 4294967295 32) (bv 0 32)))
  %19
 )
 )
)
)
)
result)
(define (vtstq_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %19
 )
 )
)
)
)
result)
(define (vtstq_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new a))
  (define %9 (extract  %3 e0.new b))
  (define %10 (bvand  %4  %9))
  (define %11 (bvzero  %10))
  (define %12 (not  %11))
  (define %19 (if (equal? %12 #t) (bv 255 8) (bv 0 8)))
  %19
 )
 )
)
)
)
result)
(define (vuqadd_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvssat %16.downcasted0 32 16 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vuqadd_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvssat %16.downcasted0 64 32 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vuqadd_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 128)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvssat %16.downcasted0 128 64 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vuqadd_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvssat %16.downcasted0 16 8 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vuqaddb_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvssat %16.downcasted0 16 8 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vuqaddd_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 128)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvssat %16.downcasted0 128 64 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vuqaddh_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvssat %16.downcasted0 32 16 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vuqaddq_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %3 (+  e0.new  15))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvssat %16.downcasted0 32 16 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vuqaddq_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvssat %16.downcasted0 64 32 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vuqaddq_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %3 (+  e0.new  63))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 128)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvssat %16.downcasted0 128 64 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vuqaddq_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %3 (+  e0.new  7))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 16)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvssat %16.downcasted0 16 8 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vuqadds_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %3 (+  e0.new  31))
  (define %4 (extract  %3 e0.new b))
  (define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
  (define %10 (extract  %3 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %5.downcasted0  %11.downcasted0))
  (define %17.downcasted0 (bvssat %16.downcasted0 64 32 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define (vuzp1_s16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %6.new0 (*  e0.new  2))
  (define %10 (+  %6.new0  15))
  (define %11 (extract  %10 %6.new0 %0))
  %11
 )
 )
)
)
)
result)
(define (vuzp1_s32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %6.new0 (*  e0.new  2))
  (define %10 (+  %6.new0  31))
  (define %11 (extract  %10 %6.new0 %0))
  %11
 )
 )
)
)
)
result)
(define (vuzp1_s8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %6.new0 (*  e0.new  2))
  (define %10 (+  %6.new0  7))
  (define %11 (extract  %10 %6.new0 %0))
  %11
 )
 )
)
)
)
result)
(define (vuzp1_u16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %6.new0 (*  e0.new  2))
  (define %10 (+  %6.new0  15))
  (define %11 (extract  %10 %6.new0 %0))
  %11
 )
 )
)
)
)
result)
(define (vuzp1_u32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %6.new0 (*  e0.new  2))
  (define %10 (+  %6.new0  31))
  (define %11 (extract  %10 %6.new0 %0))
  %11
 )
 )
)
)
)
result)
(define (vuzp1_u8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %6.new0 (*  e0.new  2))
  (define %10 (+  %6.new0  7))
  (define %11 (extract  %10 %6.new0 %0))
  %11
 )
 )
)
)
)
result)
(define (vuzp1q_s16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6.new0 (*  e0.new  2))
  (define %10 (+  %6.new0  15))
  (define %11 (extract  %10 %6.new0 %0))
  %11
 )
 )
)
)
)
result)
(define (vuzp1q_s32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6.new0 (*  e0.new  2))
  (define %10 (+  %6.new0  31))
  (define %11 (extract  %10 %6.new0 %0))
  %11
 )
 )
)
)
)
result)
(define (vuzp1q_s64  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6.new0 (*  e0.new  2))
  (define %10 (+  %6.new0  63))
  (define %11 (extract  %10 %6.new0 %0))
  %11
 )
 )
)
)
)
result)
(define (vuzp1q_s8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %6.new0 (*  e0.new  2))
  (define %10 (+  %6.new0  7))
  (define %11 (extract  %10 %6.new0 %0))
  %11
 )
 )
)
)
)
result)
(define (vuzp1q_u16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6.new0 (*  e0.new  2))
  (define %10 (+  %6.new0  15))
  (define %11 (extract  %10 %6.new0 %0))
  %11
 )
 )
)
)
)
result)
(define (vuzp1q_u32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6.new0 (*  e0.new  2))
  (define %10 (+  %6.new0  31))
  (define %11 (extract  %10 %6.new0 %0))
  %11
 )
 )
)
)
)
result)
(define (vuzp1q_u64  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6.new0 (*  e0.new  2))
  (define %10 (+  %6.new0  63))
  (define %11 (extract  %10 %6.new0 %0))
  %11
 )
 )
)
)
)
result)
(define (vuzp1q_u8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %6.new0 (*  e0.new  2))
  (define %10 (+  %6.new0  7))
  (define %11 (extract  %10 %6.new0 %0))
  %11
 )
 )
)
)
)
result)
(define (vuzp2_s16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5.new0 (/  e0.new  8))
  (define %6 (+  %5.new0  1))
  (define %7 (*  %6  16))
  (define %12 (+  %7  15))
  (define %13 (extract  %12 %7 %0))
  %13
 )
 )
)
)
)
result)
(define (vuzp2_s32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %5.new0 (/  e0.new  16))
  (define %6 (+  %5.new0  1))
  (define %7 (*  %6  32))
  (define %12 (+  %7  31))
  (define %13 (extract  %12 %7 %0))
  %13
 )
 )
)
)
)
result)
(define (vuzp2_s8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5.new0 (/  e0.new  4))
  (define %6 (+  %5.new0  1))
  (define %7 (*  %6  8))
  (define %12 (+  %7  7))
  (define %13 (extract  %12 %7 %0))
  %13
 )
 )
)
)
)
result)
(define (vuzp2_u16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5.new0 (/  e0.new  8))
  (define %6 (+  %5.new0  1))
  (define %7 (*  %6  16))
  (define %12 (+  %7  15))
  (define %13 (extract  %12 %7 %0))
  %13
 )
 )
)
)
)
result)
(define (vuzp2_u32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %5.new0 (/  e0.new  16))
  (define %6 (+  %5.new0  1))
  (define %7 (*  %6  32))
  (define %12 (+  %7  31))
  (define %13 (extract  %12 %7 %0))
  %13
 )
 )
)
)
)
result)
(define (vuzp2_u8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5.new0 (/  e0.new  4))
  (define %6 (+  %5.new0  1))
  (define %7 (*  %6  8))
  (define %12 (+  %7  7))
  (define %13 (extract  %12 %7 %0))
  %13
 )
 )
)
)
)
result)
(define (vuzp2q_s16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %5.new0 (/  e0.new  8))
  (define %6 (+  %5.new0  1))
  (define %7 (*  %6  16))
  (define %12 (+  %7  15))
  (define %13 (extract  %12 %7 %0))
  %13
 )
 )
)
)
)
result)
(define (vuzp2q_s32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %5.new0 (/  e0.new  16))
  (define %6 (+  %5.new0  1))
  (define %7 (*  %6  32))
  (define %12 (+  %7  31))
  (define %13 (extract  %12 %7 %0))
  %13
 )
 )
)
)
)
result)
(define (vuzp2q_s64  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %5.new0 (/  e0.new  32))
  (define %6 (+  %5.new0  1))
  (define %7 (*  %6  64))
  (define %12 (+  %7  63))
  (define %13 (extract  %12 %7 %0))
  %13
 )
 )
)
)
)
result)
(define (vuzp2q_s8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %5.new0 (/  e0.new  4))
  (define %6 (+  %5.new0  1))
  (define %7 (*  %6  8))
  (define %12 (+  %7  7))
  (define %13 (extract  %12 %7 %0))
  %13
 )
 )
)
)
)
result)
(define (vuzp2q_u16  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %5.new0 (/  e0.new  8))
  (define %6 (+  %5.new0  1))
  (define %7 (*  %6  16))
  (define %12 (+  %7  15))
  (define %13 (extract  %12 %7 %0))
  %13
 )
 )
)
)
)
result)
(define (vuzp2q_u32  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %5.new0 (/  e0.new  16))
  (define %6 (+  %5.new0  1))
  (define %7 (*  %6  32))
  (define %12 (+  %7  31))
  (define %13 (extract  %12 %7 %0))
  %13
 )
 )
)
)
)
result)
(define (vuzp2q_u64  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %5.new0 (/  e0.new  32))
  (define %6 (+  %5.new0  1))
  (define %7 (*  %6  64))
  (define %12 (+  %7  63))
  (define %13 (extract  %12 %7 %0))
  %13
 )
 )
)
)
)
result)
(define (vuzp2q_u8  a b )
(define %0 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %5.new0 (/  e0.new  4))
  (define %6 (+  %5.new0  1))
  (define %7 (*  %6  8))
  (define %12 (+  %7  7))
  (define %13 (extract  %12 %7 %0))
  %13
 )
 )
)
)
)
result)
(define (vzip1_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 16))])
  (define %12 (+  p0.new  15))
  (define %13 (extract  %12 p0.new a))
  (define %28 (extract  %12 p0.new b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip1_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 32))])
  (define %12 (+  p0.new  31))
  (define %13 (extract  %12 p0.new a))
  (define %28 (extract  %12 p0.new b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip1_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 8))])
  (define %12 (+  p0.new  7))
  (define %13 (extract  %12 p0.new a))
  (define %28 (extract  %12 p0.new b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip1_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 16))])
  (define %12 (+  p0.new  15))
  (define %13 (extract  %12 p0.new a))
  (define %28 (extract  %12 p0.new b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip1_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 32))])
  (define %12 (+  p0.new  31))
  (define %13 (extract  %12 p0.new a))
  (define %28 (extract  %12 p0.new b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip1_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 8))])
  (define %12 (+  p0.new  7))
  (define %13 (extract  %12 p0.new a))
  (define %28 (extract  %12 p0.new b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip1q_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 16))])
  (define %12 (+  p0.new  15))
  (define %13 (extract  %12 p0.new a))
  (define %28 (extract  %12 p0.new b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip1q_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 32))])
  (define %12 (+  p0.new  31))
  (define %13 (extract  %12 p0.new a))
  (define %28 (extract  %12 p0.new b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip1q_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 64))])
  (define %12 (+  p0.new  63))
  (define %13 (extract  %12 p0.new a))
  (define %28 (extract  %12 p0.new b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip1q_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 8))])
  (define %12 (+  p0.new  7))
  (define %13 (extract  %12 p0.new a))
  (define %28 (extract  %12 p0.new b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip1q_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 16))])
  (define %12 (+  p0.new  15))
  (define %13 (extract  %12 p0.new a))
  (define %28 (extract  %12 p0.new b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip1q_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 32))])
  (define %12 (+  p0.new  31))
  (define %13 (extract  %12 p0.new a))
  (define %28 (extract  %12 p0.new b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip1q_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 64))])
  (define %12 (+  p0.new  63))
  (define %13 (extract  %12 p0.new a))
  (define %28 (extract  %12 p0.new b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip1q_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 8))])
  (define %12 (+  p0.new  7))
  (define %13 (extract  %12 p0.new a))
  (define %28 (extract  %12 p0.new b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip2_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 16))])
  (define p0.new.div (/  p0.new  16))
  (define %7 (+  2  p0.new.div))
  (define %8 (*  %7  16))
  (define %12 (+  %8  15))
  (define %13 (extract  %12 %8 a))
  (define %28 (extract  %12 %8 b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip2_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 32))])
  (define p0.new.div (/  p0.new  32))
  (define %7 (+  1  p0.new.div))
  (define %8 (*  %7  32))
  (define %12 (+  %8  31))
  (define %13 (extract  %12 %8 a))
  (define %28 (extract  %12 %8 b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip2_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 8))])
  (define p0.new.div (/  p0.new  8))
  (define %7 (+  4  p0.new.div))
  (define %8 (*  %7  8))
  (define %12 (+  %8  7))
  (define %13 (extract  %12 %8 a))
  (define %28 (extract  %12 %8 b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip2_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 16))])
  (define p0.new.div (/  p0.new  16))
  (define %7 (+  2  p0.new.div))
  (define %8 (*  %7  16))
  (define %12 (+  %8  15))
  (define %13 (extract  %12 %8 a))
  (define %28 (extract  %12 %8 b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip2_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 32))])
  (define p0.new.div (/  p0.new  32))
  (define %7 (+  1  p0.new.div))
  (define %8 (*  %7  32))
  (define %12 (+  %8  31))
  (define %13 (extract  %12 %8 a))
  (define %28 (extract  %12 %8 b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip2_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 32 8))])
  (define p0.new.div (/  p0.new  8))
  (define %7 (+  4  p0.new.div))
  (define %8 (*  %7  8))
  (define %12 (+  %8  7))
  (define %13 (extract  %12 %8 a))
  (define %28 (extract  %12 %8 b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip2q_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 16))])
  (define p0.new.div (/  p0.new  16))
  (define %7 (+  4  p0.new.div))
  (define %8 (*  %7  16))
  (define %12 (+  %8  15))
  (define %13 (extract  %12 %8 a))
  (define %28 (extract  %12 %8 b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip2q_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 32))])
  (define p0.new.div (/  p0.new  32))
  (define %7 (+  2  p0.new.div))
  (define %8 (*  %7  32))
  (define %12 (+  %8  31))
  (define %13 (extract  %12 %8 a))
  (define %28 (extract  %12 %8 b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip2q_s64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 64))])
  (define p0.new.div (/  p0.new  64))
  (define %7 (+  1  p0.new.div))
  (define %8 (*  %7  64))
  (define %12 (+  %8  63))
  (define %13 (extract  %12 %8 a))
  (define %28 (extract  %12 %8 b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip2q_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 8))])
  (define p0.new.div (/  p0.new  8))
  (define %7 (+  8  p0.new.div))
  (define %8 (*  %7  8))
  (define %12 (+  %8  7))
  (define %13 (extract  %12 %8 a))
  (define %28 (extract  %12 %8 b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip2q_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 16))])
  (define p0.new.div (/  p0.new  16))
  (define %7 (+  4  p0.new.div))
  (define %8 (*  %7  16))
  (define %12 (+  %8  15))
  (define %13 (extract  %12 %8 a))
  (define %28 (extract  %12 %8 b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip2q_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 32))])
  (define p0.new.div (/  p0.new  32))
  (define %7 (+  2  p0.new.div))
  (define %8 (*  %7  32))
  (define %12 (+  %8  31))
  (define %13 (extract  %12 %8 a))
  (define %28 (extract  %12 %8 b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip2q_u64  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 64))])
  (define p0.new.div (/  p0.new  64))
  (define %7 (+  1  p0.new.div))
  (define %8 (*  %7  64))
  (define %12 (+  %8  63))
  (define %13 (extract  %12 %8 a))
  (define %28 (extract  %12 %8 b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip2q_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 8))])
  (define p0.new.div (/  p0.new  8))
  (define %7 (+  8  p0.new.div))
  (define %8 (*  %7  8))
  (define %12 (+  %8  7))
  (define %13 (extract  %12 %8 a))
  (define %28 (extract  %12 %8 b))
(concat %28 %13)
 )
 )
)
)
)
result)
(define (vzip_s16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 16))])
  (define %9 (+  p0.new  15))
  (define %10 (extract  %9 p0.new a))
  (define %23 (extract  %9 p0.new b))
(concat %23 %10)
 )
 )
)
)
)
result)
(define (vzip_s32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 32))])
  (define %9 (+  p0.new  31))
  (define %10 (extract  %9 p0.new a))
  (define %23 (extract  %9 p0.new b))
(concat %23 %10)
 )
 )
)
)
)
result)
(define (vzip_s8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 8))])
  (define %9 (+  p0.new  7))
  (define %10 (extract  %9 p0.new a))
  (define %23 (extract  %9 p0.new b))
(concat %23 %10)
 )
 )
)
)
)
result)
(define (vzip_u16  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 16))])
  (define %9 (+  p0.new  15))
  (define %10 (extract  %9 p0.new a))
  (define %23 (extract  %9 p0.new b))
(concat %23 %10)
 )
 )
)
)
)
result)
(define (vzip_u32  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 32))])
  (define %9 (+  p0.new  31))
  (define %10 (extract  %9 p0.new a))
  (define %23 (extract  %9 p0.new b))
(concat %23 %10)
 )
 )
)
)
)
result)
(define (vzip_u8  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([p0.new (reverse (range 0 64 8))])
  (define %9 (+  p0.new  7))
  (define %10 (extract  %9 p0.new a))
  (define %23 (extract  %9 p0.new b))
(concat %23 %10)
 )
 )
)
)
)
result)
(provide (all-defined-out))