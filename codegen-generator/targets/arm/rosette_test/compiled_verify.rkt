#lang rosette
(require "bvops.rkt")
(require "compiled.rkt")
(define (vaba_s16.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new c))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 32)))
  (define %14.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %15.downcasted0 (integer->bitvector (abs (bitvector->integer %14.downcasted0)) (bitvector 32)))
  (define %16.downcasted0 (extract  15 0 %15.downcasted0))
  (define %25 (extract  %4 e0.new a))
  (define %26 (bvadd  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result2)
(define-symbolic a_vaba_s16 (bitvector 64))
(define-symbolic b_vaba_s16 (bitvector 64))
(define-symbolic c_vaba_s16 (bitvector 64))
(verify (assert (equal? (vaba_s16.check a_vaba_s16 b_vaba_s16 c_vaba_s16 ) (vaba_s16 a_vaba_s16 b_vaba_s16 c_vaba_s16 ))))
(display "vaba_s16" (current-error-port))
(define (vaba_s32.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new c))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %14.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %15.downcasted0 (integer->bitvector (abs (bitvector->integer %14.downcasted0)) (bitvector 64)))
  (define %16.downcasted0 (extract  31 0 %15.downcasted0))
  (define %25 (extract  %4 e0.new a))
  (define %26 (bvadd  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result2)
(define-symbolic a_vaba_s32 (bitvector 64))
(define-symbolic b_vaba_s32 (bitvector 64))
(define-symbolic c_vaba_s32 (bitvector 64))
(verify (assert (equal? (vaba_s32.check a_vaba_s32 b_vaba_s32 c_vaba_s32 ) (vaba_s32 a_vaba_s32 b_vaba_s32 c_vaba_s32 ))))
(display "vaba_s32" (current-error-port))
(define (vaba_s8.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new c))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 16)))
  (define %14.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %15.downcasted0 (integer->bitvector (abs (bitvector->integer %14.downcasted0)) (bitvector 16)))
  (define %16.downcasted0 (extract  7 0 %15.downcasted0))
  (define %25 (extract  %4 e0.new a))
  (define %26 (bvadd  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result2)
(define-symbolic a_vaba_s8 (bitvector 64))
(define-symbolic b_vaba_s8 (bitvector 64))
(define-symbolic c_vaba_s8 (bitvector 64))
(verify (assert (equal? (vaba_s8.check a_vaba_s8 b_vaba_s8 c_vaba_s8 ) (vaba_s8 a_vaba_s8 b_vaba_s8 c_vaba_s8 ))))
(display "vaba_s8" (current-error-port))
(define (vaba_u16.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6.downcasted0 (zero-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %14.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %15.downcasted0 (integer->bitvector (abs (bitvector->integer %14.downcasted0)) (bitvector 32)))
  (define %16.downcasted0 (extract  15 0 %15.downcasted0))
  (define %25 (extract  %4 e0.new a))
  (define %26 (bvadd  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result2)
(define-symbolic a_vaba_u16 (bitvector 64))
(define-symbolic b_vaba_u16 (bitvector 64))
(define-symbolic c_vaba_u16 (bitvector 64))
(verify (assert (equal? (vaba_u16.check a_vaba_u16 b_vaba_u16 c_vaba_u16 ) (vaba_u16 a_vaba_u16 b_vaba_u16 c_vaba_u16 ))))
(display "vaba_u16" (current-error-port))
(define (vaba_u32.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6.downcasted0 (zero-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %14.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %15.downcasted0 (integer->bitvector (abs (bitvector->integer %14.downcasted0)) (bitvector 64)))
  (define %16.downcasted0 (extract  31 0 %15.downcasted0))
  (define %25 (extract  %4 e0.new a))
  (define %26 (bvadd  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result2)
(define-symbolic a_vaba_u32 (bitvector 64))
(define-symbolic b_vaba_u32 (bitvector 64))
(define-symbolic c_vaba_u32 (bitvector 64))
(verify (assert (equal? (vaba_u32.check a_vaba_u32 b_vaba_u32 c_vaba_u32 ) (vaba_u32 a_vaba_u32 b_vaba_u32 c_vaba_u32 ))))
(display "vaba_u32" (current-error-port))
(define (vaba_u8.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6.downcasted0 (zero-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 16)))
  (define %14.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %15.downcasted0 (integer->bitvector (abs (bitvector->integer %14.downcasted0)) (bitvector 16)))
  (define %16.downcasted0 (extract  7 0 %15.downcasted0))
  (define %25 (extract  %4 e0.new a))
  (define %26 (bvadd  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result2)
(define-symbolic a_vaba_u8 (bitvector 64))
(define-symbolic b_vaba_u8 (bitvector 64))
(define-symbolic c_vaba_u8 (bitvector 64))
(verify (assert (equal? (vaba_u8.check a_vaba_u8 b_vaba_u8 c_vaba_u8 ) (vaba_u8 a_vaba_u8 b_vaba_u8 c_vaba_u8 ))))
(display "vaba_u8" (current-error-port))
(define (vabal_high_s16.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %10.new0 (/  e0.new  2))
  (define %13 (+  %10.new0  15))
  (define %14 (extract  %13 %10.new0 %2))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 32)))
  (define %20 (extract  %13 %10.new0 %5))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 32)))
  (define %24.downcasted0 (bvsub  %15.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (integer->bitvector (abs (bitvector->integer %24.downcasted0)) (bitvector 32)))
  (define %26.downcasted0 (extract  31 0 %25.downcasted0))
  (define %33 (+  e0.new  31))
  (define %43 (extract  %33 e0.new a))
  (define %44 (bvadd  %43  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vabal_high_s16 (bitvector 128))
(define-symbolic b_vabal_high_s16 (bitvector 128))
(define-symbolic c_vabal_high_s16 (bitvector 128))
(verify (assert (equal? (vabal_high_s16.check a_vabal_high_s16 b_vabal_high_s16 c_vabal_high_s16 ) (vabal_high_s16 a_vabal_high_s16 b_vabal_high_s16 c_vabal_high_s16 ))))
(display "vabal_high_s16" (current-error-port))
(define (vabal_high_s32.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %10.new0 (/  e0.new  2))
  (define %13 (+  %10.new0  31))
  (define %14 (extract  %13 %10.new0 %2))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %20 (extract  %13 %10.new0 %5))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 64)))
  (define %24.downcasted0 (bvsub  %15.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (integer->bitvector (abs (bitvector->integer %24.downcasted0)) (bitvector 64)))
  (define %26.downcasted0 (extract  63 0 %25.downcasted0))
  (define %33 (+  e0.new  63))
  (define %43 (extract  %33 e0.new a))
  (define %44 (bvadd  %43  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vabal_high_s32 (bitvector 128))
(define-symbolic b_vabal_high_s32 (bitvector 128))
(define-symbolic c_vabal_high_s32 (bitvector 128))
(verify (assert (equal? (vabal_high_s32.check a_vabal_high_s32 b_vabal_high_s32 c_vabal_high_s32 ) (vabal_high_s32 a_vabal_high_s32 b_vabal_high_s32 c_vabal_high_s32 ))))
(display "vabal_high_s32" (current-error-port))
(define (vabal_high_s8.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %10.new0 (/  e0.new  2))
  (define %13 (+  %10.new0  7))
  (define %14 (extract  %13 %10.new0 %2))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 16)))
  (define %20 (extract  %13 %10.new0 %5))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 16)))
  (define %24.downcasted0 (bvsub  %15.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (integer->bitvector (abs (bitvector->integer %24.downcasted0)) (bitvector 16)))
  (define %26.downcasted0 (extract  15 0 %25.downcasted0))
  (define %33 (+  e0.new  15))
  (define %43 (extract  %33 e0.new a))
  (define %44 (bvadd  %43  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vabal_high_s8 (bitvector 128))
(define-symbolic b_vabal_high_s8 (bitvector 128))
(define-symbolic c_vabal_high_s8 (bitvector 128))
(verify (assert (equal? (vabal_high_s8.check a_vabal_high_s8 b_vabal_high_s8 c_vabal_high_s8 ) (vabal_high_s8 a_vabal_high_s8 b_vabal_high_s8 c_vabal_high_s8 ))))
(display "vabal_high_s8" (current-error-port))
(define (vabal_high_u16.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %10.new0 (/  e0.new  2))
  (define %13 (+  %10.new0  15))
  (define %14 (extract  %13 %10.new0 %2))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 32)))
  (define %20 (extract  %13 %10.new0 %5))
  (define %21.downcasted0 (zero-extend  %20 (bitvector 32)))
  (define %24.downcasted0 (bvsub  %15.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (integer->bitvector (abs (bitvector->integer %24.downcasted0)) (bitvector 32)))
  (define %26.downcasted0 (extract  31 0 %25.downcasted0))
  (define %33 (+  e0.new  31))
  (define %43 (extract  %33 e0.new a))
  (define %44 (bvadd  %43  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vabal_high_u16 (bitvector 128))
(define-symbolic b_vabal_high_u16 (bitvector 128))
(define-symbolic c_vabal_high_u16 (bitvector 128))
(verify (assert (equal? (vabal_high_u16.check a_vabal_high_u16 b_vabal_high_u16 c_vabal_high_u16 ) (vabal_high_u16 a_vabal_high_u16 b_vabal_high_u16 c_vabal_high_u16 ))))
(display "vabal_high_u16" (current-error-port))
(define (vabal_high_u32.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %10.new0 (/  e0.new  2))
  (define %13 (+  %10.new0  31))
  (define %14 (extract  %13 %10.new0 %2))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %20 (extract  %13 %10.new0 %5))
  (define %21.downcasted0 (zero-extend  %20 (bitvector 64)))
  (define %24.downcasted0 (bvsub  %15.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (integer->bitvector (abs (bitvector->integer %24.downcasted0)) (bitvector 64)))
  (define %26.downcasted0 (extract  63 0 %25.downcasted0))
  (define %33 (+  e0.new  63))
  (define %43 (extract  %33 e0.new a))
  (define %44 (bvadd  %43  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vabal_high_u32 (bitvector 128))
(define-symbolic b_vabal_high_u32 (bitvector 128))
(define-symbolic c_vabal_high_u32 (bitvector 128))
(verify (assert (equal? (vabal_high_u32.check a_vabal_high_u32 b_vabal_high_u32 c_vabal_high_u32 ) (vabal_high_u32 a_vabal_high_u32 b_vabal_high_u32 c_vabal_high_u32 ))))
(display "vabal_high_u32" (current-error-port))
(define (vabal_high_u8.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %10.new0 (/  e0.new  2))
  (define %13 (+  %10.new0  7))
  (define %14 (extract  %13 %10.new0 %2))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 16)))
  (define %20 (extract  %13 %10.new0 %5))
  (define %21.downcasted0 (zero-extend  %20 (bitvector 16)))
  (define %24.downcasted0 (bvsub  %15.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (integer->bitvector (abs (bitvector->integer %24.downcasted0)) (bitvector 16)))
  (define %26.downcasted0 (extract  15 0 %25.downcasted0))
  (define %33 (+  e0.new  15))
  (define %43 (extract  %33 e0.new a))
  (define %44 (bvadd  %43  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vabal_high_u8 (bitvector 128))
(define-symbolic b_vabal_high_u8 (bitvector 128))
(define-symbolic c_vabal_high_u8 (bitvector 128))
(verify (assert (equal? (vabal_high_u8.check a_vabal_high_u8 b_vabal_high_u8 c_vabal_high_u8 ) (vabal_high_u8 a_vabal_high_u8 b_vabal_high_u8 c_vabal_high_u8 ))))
(display "vabal_high_u8" (current-error-port))
(define (vabal_s16.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 32)))
  (define %14 (extract  %7 e0.new c))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 32)))
  (define %18.downcasted0 (bvsub  %9.downcasted0  %15.downcasted0))
  (define %19.downcasted0 (integer->bitvector (abs (bitvector->integer %18.downcasted0)) (bitvector 32)))
  (define %20.downcasted0 (extract  31 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  31))
  (define %37 (extract  %27 %22.new0 a))
  (define %38 (bvadd  %37  %20.downcasted0))
  %38
 )
 )
)
)
)
result2)
(define-symbolic a_vabal_s16 (bitvector 128))
(define-symbolic b_vabal_s16 (bitvector 64))
(define-symbolic c_vabal_s16 (bitvector 64))
(verify (assert (equal? (vabal_s16.check a_vabal_s16 b_vabal_s16 c_vabal_s16 ) (vabal_s16 a_vabal_s16 b_vabal_s16 c_vabal_s16 ))))
(display "vabal_s16" (current-error-port))
(define (vabal_s32.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %14 (extract  %7 e0.new c))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %18.downcasted0 (bvsub  %9.downcasted0  %15.downcasted0))
  (define %19.downcasted0 (integer->bitvector (abs (bitvector->integer %18.downcasted0)) (bitvector 64)))
  (define %20.downcasted0 (extract  63 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  63))
  (define %37 (extract  %27 %22.new0 a))
  (define %38 (bvadd  %37  %20.downcasted0))
  %38
 )
 )
)
)
)
result2)
(define-symbolic a_vabal_s32 (bitvector 128))
(define-symbolic b_vabal_s32 (bitvector 64))
(define-symbolic c_vabal_s32 (bitvector 64))
(verify (assert (equal? (vabal_s32.check a_vabal_s32 b_vabal_s32 c_vabal_s32 ) (vabal_s32 a_vabal_s32 b_vabal_s32 c_vabal_s32 ))))
(display "vabal_s32" (current-error-port))
(define (vabal_s8.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7 (+  e0.new  7))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 16)))
  (define %14 (extract  %7 e0.new c))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 16)))
  (define %18.downcasted0 (bvsub  %9.downcasted0  %15.downcasted0))
  (define %19.downcasted0 (integer->bitvector (abs (bitvector->integer %18.downcasted0)) (bitvector 16)))
  (define %20.downcasted0 (extract  15 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  15))
  (define %37 (extract  %27 %22.new0 a))
  (define %38 (bvadd  %37  %20.downcasted0))
  %38
 )
 )
)
)
)
result2)
(define-symbolic a_vabal_s8 (bitvector 128))
(define-symbolic b_vabal_s8 (bitvector 64))
(define-symbolic c_vabal_s8 (bitvector 64))
(verify (assert (equal? (vabal_s8.check a_vabal_s8 b_vabal_s8 c_vabal_s8 ) (vabal_s8 a_vabal_s8 b_vabal_s8 c_vabal_s8 ))))
(display "vabal_s8" (current-error-port))
(define (vabal_u16.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 32)))
  (define %14 (extract  %7 e0.new c))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 32)))
  (define %18.downcasted0 (bvsub  %9.downcasted0  %15.downcasted0))
  (define %19.downcasted0 (integer->bitvector (abs (bitvector->integer %18.downcasted0)) (bitvector 32)))
  (define %20.downcasted0 (extract  31 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  31))
  (define %37 (extract  %27 %22.new0 a))
  (define %38 (bvadd  %37  %20.downcasted0))
  %38
 )
 )
)
)
)
result2)
(define-symbolic a_vabal_u16 (bitvector 128))
(define-symbolic b_vabal_u16 (bitvector 64))
(define-symbolic c_vabal_u16 (bitvector 64))
(verify (assert (equal? (vabal_u16.check a_vabal_u16 b_vabal_u16 c_vabal_u16 ) (vabal_u16 a_vabal_u16 b_vabal_u16 c_vabal_u16 ))))
(display "vabal_u16" (current-error-port))
(define (vabal_u32.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 64)))
  (define %14 (extract  %7 e0.new c))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %18.downcasted0 (bvsub  %9.downcasted0  %15.downcasted0))
  (define %19.downcasted0 (integer->bitvector (abs (bitvector->integer %18.downcasted0)) (bitvector 64)))
  (define %20.downcasted0 (extract  63 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  63))
  (define %37 (extract  %27 %22.new0 a))
  (define %38 (bvadd  %37  %20.downcasted0))
  %38
 )
 )
)
)
)
result2)
(define-symbolic a_vabal_u32 (bitvector 128))
(define-symbolic b_vabal_u32 (bitvector 64))
(define-symbolic c_vabal_u32 (bitvector 64))
(verify (assert (equal? (vabal_u32.check a_vabal_u32 b_vabal_u32 c_vabal_u32 ) (vabal_u32 a_vabal_u32 b_vabal_u32 c_vabal_u32 ))))
(display "vabal_u32" (current-error-port))
(define (vabal_u8.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7 (+  e0.new  7))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 16)))
  (define %14 (extract  %7 e0.new c))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 16)))
  (define %18.downcasted0 (bvsub  %9.downcasted0  %15.downcasted0))
  (define %19.downcasted0 (integer->bitvector (abs (bitvector->integer %18.downcasted0)) (bitvector 16)))
  (define %20.downcasted0 (extract  15 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  15))
  (define %37 (extract  %27 %22.new0 a))
  (define %38 (bvadd  %37  %20.downcasted0))
  %38
 )
 )
)
)
)
result2)
(define-symbolic a_vabal_u8 (bitvector 128))
(define-symbolic b_vabal_u8 (bitvector 64))
(define-symbolic c_vabal_u8 (bitvector 64))
(verify (assert (equal? (vabal_u8.check a_vabal_u8 b_vabal_u8 c_vabal_u8 ) (vabal_u8 a_vabal_u8 b_vabal_u8 c_vabal_u8 ))))
(display "vabal_u8" (current-error-port))
(define (vabaq_s16.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new c))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 32)))
  (define %14.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %15.downcasted0 (integer->bitvector (abs (bitvector->integer %14.downcasted0)) (bitvector 32)))
  (define %16.downcasted0 (extract  15 0 %15.downcasted0))
  (define %25 (extract  %4 e0.new a))
  (define %26 (bvadd  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result2)
(define-symbolic a_vabaq_s16 (bitvector 128))
(define-symbolic b_vabaq_s16 (bitvector 128))
(define-symbolic c_vabaq_s16 (bitvector 128))
(verify (assert (equal? (vabaq_s16.check a_vabaq_s16 b_vabaq_s16 c_vabaq_s16 ) (vabaq_s16 a_vabaq_s16 b_vabaq_s16 c_vabaq_s16 ))))
(display "vabaq_s16" (current-error-port))
(define (vabaq_s32.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new c))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %14.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %15.downcasted0 (integer->bitvector (abs (bitvector->integer %14.downcasted0)) (bitvector 64)))
  (define %16.downcasted0 (extract  31 0 %15.downcasted0))
  (define %25 (extract  %4 e0.new a))
  (define %26 (bvadd  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result2)
(define-symbolic a_vabaq_s32 (bitvector 128))
(define-symbolic b_vabaq_s32 (bitvector 128))
(define-symbolic c_vabaq_s32 (bitvector 128))
(verify (assert (equal? (vabaq_s32.check a_vabaq_s32 b_vabaq_s32 c_vabaq_s32 ) (vabaq_s32 a_vabaq_s32 b_vabaq_s32 c_vabaq_s32 ))))
(display "vabaq_s32" (current-error-port))
(define (vabaq_s8.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new c))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 16)))
  (define %14.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %15.downcasted0 (integer->bitvector (abs (bitvector->integer %14.downcasted0)) (bitvector 16)))
  (define %16.downcasted0 (extract  7 0 %15.downcasted0))
  (define %25 (extract  %4 e0.new a))
  (define %26 (bvadd  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result2)
(define-symbolic a_vabaq_s8 (bitvector 128))
(define-symbolic b_vabaq_s8 (bitvector 128))
(define-symbolic c_vabaq_s8 (bitvector 128))
(verify (assert (equal? (vabaq_s8.check a_vabaq_s8 b_vabaq_s8 c_vabaq_s8 ) (vabaq_s8 a_vabaq_s8 b_vabaq_s8 c_vabaq_s8 ))))
(display "vabaq_s8" (current-error-port))
(define (vabaq_u16.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %6.downcasted0 (zero-extend  %5 (bitvector 32)))
  (define %11 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %14.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %15.downcasted0 (integer->bitvector (abs (bitvector->integer %14.downcasted0)) (bitvector 32)))
  (define %16.downcasted0 (extract  15 0 %15.downcasted0))
  (define %25 (extract  %4 e0.new a))
  (define %26 (bvadd  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result2)
(define-symbolic a_vabaq_u16 (bitvector 128))
(define-symbolic b_vabaq_u16 (bitvector 128))
(define-symbolic c_vabaq_u16 (bitvector 128))
(verify (assert (equal? (vabaq_u16.check a_vabaq_u16 b_vabaq_u16 c_vabaq_u16 ) (vabaq_u16 a_vabaq_u16 b_vabaq_u16 c_vabaq_u16 ))))
(display "vabaq_u16" (current-error-port))
(define (vabaq_u32.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %6.downcasted0 (zero-extend  %5 (bitvector 64)))
  (define %11 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %14.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %15.downcasted0 (integer->bitvector (abs (bitvector->integer %14.downcasted0)) (bitvector 64)))
  (define %16.downcasted0 (extract  31 0 %15.downcasted0))
  (define %25 (extract  %4 e0.new a))
  (define %26 (bvadd  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result2)
(define-symbolic a_vabaq_u32 (bitvector 128))
(define-symbolic b_vabaq_u32 (bitvector 128))
(define-symbolic c_vabaq_u32 (bitvector 128))
(verify (assert (equal? (vabaq_u32.check a_vabaq_u32 b_vabaq_u32 c_vabaq_u32 ) (vabaq_u32 a_vabaq_u32 b_vabaq_u32 c_vabaq_u32 ))))
(display "vabaq_u32" (current-error-port))
(define (vabaq_u8.check  a b c )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %6.downcasted0 (zero-extend  %5 (bitvector 16)))
  (define %11 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 16)))
  (define %14.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %15.downcasted0 (integer->bitvector (abs (bitvector->integer %14.downcasted0)) (bitvector 16)))
  (define %16.downcasted0 (extract  7 0 %15.downcasted0))
  (define %25 (extract  %4 e0.new a))
  (define %26 (bvadd  %25  %16.downcasted0))
  %26
 )
 )
)
)
)
result2)
(define-symbolic a_vabaq_u8 (bitvector 128))
(define-symbolic b_vabaq_u8 (bitvector 128))
(define-symbolic c_vabaq_u8 (bitvector 128))
(verify (assert (equal? (vabaq_u8.check a_vabaq_u8 b_vabaq_u8 c_vabaq_u8 ) (vabaq_u8 a_vabaq_u8 b_vabaq_u8 c_vabaq_u8 ))))
(display "vabaq_u8" (current-error-port))
(define (vabd_s16.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 32)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 32)))
  (define %15.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %16.downcasted0 (integer->bitvector (abs (bitvector->integer %15.downcasted0)) (bitvector 32)))
  (define %17.downcasted0 (extract  15 0 %16.downcasted0))
  (define %27 (bvadd  (bv 0 16)  %17.downcasted0))
  %27
 )
 )
)
)
)
result2)
(define-symbolic a_vabd_s16 (bitvector 64))
(define-symbolic b_vabd_s16 (bitvector 64))
(verify (assert (equal? (vabd_s16.check a_vabd_s16 b_vabd_s16 ) (vabd_s16 a_vabd_s16 b_vabd_s16 ))))
(display "vabd_s16" (current-error-port))
(define (vabd_s32.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %5 (+  e0.new  31))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 64)))
  (define %15.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %16.downcasted0 (integer->bitvector (abs (bitvector->integer %15.downcasted0)) (bitvector 64)))
  (define %17.downcasted0 (extract  31 0 %16.downcasted0))
  (define %27 (bvadd  (bv 0 32)  %17.downcasted0))
  %27
 )
 )
)
)
)
result2)
(define-symbolic a_vabd_s32 (bitvector 64))
(define-symbolic b_vabd_s32 (bitvector 64))
(verify (assert (equal? (vabd_s32.check a_vabd_s32 b_vabd_s32 ) (vabd_s32 a_vabd_s32 b_vabd_s32 ))))
(display "vabd_s32" (current-error-port))
(define (vabd_s8.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 16)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 16)))
  (define %15.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %16.downcasted0 (integer->bitvector (abs (bitvector->integer %15.downcasted0)) (bitvector 16)))
  (define %17.downcasted0 (extract  7 0 %16.downcasted0))
  (define %27 (bvadd  (bv 0 8)  %17.downcasted0))
  %27
 )
 )
)
)
)
result2)
(define-symbolic a_vabd_s8 (bitvector 64))
(define-symbolic b_vabd_s8 (bitvector 64))
(verify (assert (equal? (vabd_s8.check a_vabd_s8 b_vabd_s8 ) (vabd_s8 a_vabd_s8 b_vabd_s8 ))))
(display "vabd_s8" (current-error-port))
(define (vabd_u16.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 32)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 32)))
  (define %15.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %16.downcasted0 (integer->bitvector (abs (bitvector->integer %15.downcasted0)) (bitvector 32)))
  (define %17.downcasted0 (extract  15 0 %16.downcasted0))
  (define %27 (bvadd  (bv 0 16)  %17.downcasted0))
  %27
 )
 )
)
)
)
result2)
(define-symbolic a_vabd_u16 (bitvector 64))
(define-symbolic b_vabd_u16 (bitvector 64))
(verify (assert (equal? (vabd_u16.check a_vabd_u16 b_vabd_u16 ) (vabd_u16 a_vabd_u16 b_vabd_u16 ))))
(display "vabd_u16" (current-error-port))
(define (vabd_u32.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %5 (+  e0.new  31))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 64)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 64)))
  (define %15.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %16.downcasted0 (integer->bitvector (abs (bitvector->integer %15.downcasted0)) (bitvector 64)))
  (define %17.downcasted0 (extract  31 0 %16.downcasted0))
  (define %27 (bvadd  (bv 0 32)  %17.downcasted0))
  %27
 )
 )
)
)
)
result2)
(define-symbolic a_vabd_u32 (bitvector 64))
(define-symbolic b_vabd_u32 (bitvector 64))
(verify (assert (equal? (vabd_u32.check a_vabd_u32 b_vabd_u32 ) (vabd_u32 a_vabd_u32 b_vabd_u32 ))))
(display "vabd_u32" (current-error-port))
(define (vabd_u8.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 16)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 16)))
  (define %15.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %16.downcasted0 (integer->bitvector (abs (bitvector->integer %15.downcasted0)) (bitvector 16)))
  (define %17.downcasted0 (extract  7 0 %16.downcasted0))
  (define %27 (bvadd  (bv 0 8)  %17.downcasted0))
  %27
 )
 )
)
)
)
result2)
(define-symbolic a_vabd_u8 (bitvector 64))
(define-symbolic b_vabd_u8 (bitvector 64))
(verify (assert (equal? (vabd_u8.check a_vabd_u8 b_vabd_u8 ) (vabd_u8 a_vabd_u8 b_vabd_u8 ))))
(display "vabd_u8" (current-error-port))
(define (vabdl_high_s16.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  15))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 32)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (sign-extend  %21 (bitvector 32)))
  (define %25.downcasted0 (bvsub  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (integer->bitvector (abs (bitvector->integer %25.downcasted0)) (bitvector 32)))
  (define %27.downcasted0 (extract  31 0 %26.downcasted0))
  (define %45 (bvadd  (bv 0 32)  %27.downcasted0))
  %45
 )
 )
)
)
)
result2)
(define-symbolic a_vabdl_high_s16 (bitvector 128))
(define-symbolic b_vabdl_high_s16 (bitvector 128))
(verify (assert (equal? (vabdl_high_s16.check a_vabdl_high_s16 b_vabdl_high_s16 ) (vabdl_high_s16 a_vabdl_high_s16 b_vabdl_high_s16 ))))
(display "vabdl_high_s16" (current-error-port))
(define (vabdl_high_s32.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  31))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 64)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (sign-extend  %21 (bitvector 64)))
  (define %25.downcasted0 (bvsub  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (integer->bitvector (abs (bitvector->integer %25.downcasted0)) (bitvector 64)))
  (define %27.downcasted0 (extract  63 0 %26.downcasted0))
  (define %45 (bvadd  (bv 0 64)  %27.downcasted0))
  %45
 )
 )
)
)
)
result2)
(define-symbolic a_vabdl_high_s32 (bitvector 128))
(define-symbolic b_vabdl_high_s32 (bitvector 128))
(verify (assert (equal? (vabdl_high_s32.check a_vabdl_high_s32 b_vabdl_high_s32 ) (vabdl_high_s32 a_vabdl_high_s32 b_vabdl_high_s32 ))))
(display "vabdl_high_s32" (current-error-port))
(define (vabdl_high_s8.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  7))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 16)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (sign-extend  %21 (bitvector 16)))
  (define %25.downcasted0 (bvsub  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (integer->bitvector (abs (bitvector->integer %25.downcasted0)) (bitvector 16)))
  (define %27.downcasted0 (extract  15 0 %26.downcasted0))
  (define %45 (bvadd  (bv 0 16)  %27.downcasted0))
  %45
 )
 )
)
)
)
result2)
(define-symbolic a_vabdl_high_s8 (bitvector 128))
(define-symbolic b_vabdl_high_s8 (bitvector 128))
(verify (assert (equal? (vabdl_high_s8.check a_vabdl_high_s8 b_vabdl_high_s8 ) (vabdl_high_s8 a_vabdl_high_s8 b_vabdl_high_s8 ))))
(display "vabdl_high_s8" (current-error-port))
(define (vabdl_high_u16.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  15))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 32)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (zero-extend  %21 (bitvector 32)))
  (define %25.downcasted0 (bvsub  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (integer->bitvector (abs (bitvector->integer %25.downcasted0)) (bitvector 32)))
  (define %27.downcasted0 (extract  31 0 %26.downcasted0))
  (define %45 (bvadd  (bv 0 32)  %27.downcasted0))
  %45
 )
 )
)
)
)
result2)
(define-symbolic a_vabdl_high_u16 (bitvector 128))
(define-symbolic b_vabdl_high_u16 (bitvector 128))
(verify (assert (equal? (vabdl_high_u16.check a_vabdl_high_u16 b_vabdl_high_u16 ) (vabdl_high_u16 a_vabdl_high_u16 b_vabdl_high_u16 ))))
(display "vabdl_high_u16" (current-error-port))
(define (vabdl_high_u32.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  31))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 64)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (zero-extend  %21 (bitvector 64)))
  (define %25.downcasted0 (bvsub  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (integer->bitvector (abs (bitvector->integer %25.downcasted0)) (bitvector 64)))
  (define %27.downcasted0 (extract  63 0 %26.downcasted0))
  (define %45 (bvadd  (bv 0 64)  %27.downcasted0))
  %45
 )
 )
)
)
)
result2)
(define-symbolic a_vabdl_high_u32 (bitvector 128))
(define-symbolic b_vabdl_high_u32 (bitvector 128))
(verify (assert (equal? (vabdl_high_u32.check a_vabdl_high_u32 b_vabdl_high_u32 ) (vabdl_high_u32 a_vabdl_high_u32 b_vabdl_high_u32 ))))
(display "vabdl_high_u32" (current-error-port))
(define (vabdl_high_u8.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  7))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 16)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (zero-extend  %21 (bitvector 16)))
  (define %25.downcasted0 (bvsub  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (integer->bitvector (abs (bitvector->integer %25.downcasted0)) (bitvector 16)))
  (define %27.downcasted0 (extract  15 0 %26.downcasted0))
  (define %45 (bvadd  (bv 0 16)  %27.downcasted0))
  %45
 )
 )
)
)
)
result2)
(define-symbolic a_vabdl_high_u8 (bitvector 128))
(define-symbolic b_vabdl_high_u8 (bitvector 128))
(verify (assert (equal? (vabdl_high_u8.check a_vabdl_high_u8 b_vabdl_high_u8 ) (vabdl_high_u8 a_vabdl_high_u8 b_vabdl_high_u8 ))))
(display "vabdl_high_u8" (current-error-port))
(define (vabdl_s16.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 32)))
  (define %15 (extract  %8 e0.new b))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 32)))
  (define %19.downcasted0 (bvsub  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (integer->bitvector (abs (bitvector->integer %19.downcasted0)) (bitvector 32)))
  (define %21.downcasted0 (extract  31 0 %20.downcasted0))
  (define %39 (bvadd  (bv 0 32)  %21.downcasted0))
  %39
 )
 )
)
)
)
result2)
(define-symbolic a_vabdl_s16 (bitvector 64))
(define-symbolic b_vabdl_s16 (bitvector 64))
(verify (assert (equal? (vabdl_s16.check a_vabdl_s16 b_vabdl_s16 ) (vabdl_s16 a_vabdl_s16 b_vabdl_s16 ))))
(display "vabdl_s16" (current-error-port))
(define (vabdl_s32.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %15 (extract  %8 e0.new b))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 64)))
  (define %19.downcasted0 (bvsub  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (integer->bitvector (abs (bitvector->integer %19.downcasted0)) (bitvector 64)))
  (define %21.downcasted0 (extract  63 0 %20.downcasted0))
  (define %39 (bvadd  (bv 0 64)  %21.downcasted0))
  %39
 )
 )
)
)
)
result2)
(define-symbolic a_vabdl_s32 (bitvector 64))
(define-symbolic b_vabdl_s32 (bitvector 64))
(verify (assert (equal? (vabdl_s32.check a_vabdl_s32 b_vabdl_s32 ) (vabdl_s32 a_vabdl_s32 b_vabdl_s32 ))))
(display "vabdl_s32" (current-error-port))
(define (vabdl_s8.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 16)))
  (define %15 (extract  %8 e0.new b))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 16)))
  (define %19.downcasted0 (bvsub  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (integer->bitvector (abs (bitvector->integer %19.downcasted0)) (bitvector 16)))
  (define %21.downcasted0 (extract  15 0 %20.downcasted0))
  (define %39 (bvadd  (bv 0 16)  %21.downcasted0))
  %39
 )
 )
)
)
)
result2)
(define-symbolic a_vabdl_s8 (bitvector 64))
(define-symbolic b_vabdl_s8 (bitvector 64))
(verify (assert (equal? (vabdl_s8.check a_vabdl_s8 b_vabdl_s8 ) (vabdl_s8 a_vabdl_s8 b_vabdl_s8 ))))
(display "vabdl_s8" (current-error-port))
(define (vabdl_u16.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 32)))
  (define %15 (extract  %8 e0.new b))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 32)))
  (define %19.downcasted0 (bvsub  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (integer->bitvector (abs (bitvector->integer %19.downcasted0)) (bitvector 32)))
  (define %21.downcasted0 (extract  31 0 %20.downcasted0))
  (define %39 (bvadd  (bv 0 32)  %21.downcasted0))
  %39
 )
 )
)
)
)
result2)
(define-symbolic a_vabdl_u16 (bitvector 64))
(define-symbolic b_vabdl_u16 (bitvector 64))
(verify (assert (equal? (vabdl_u16.check a_vabdl_u16 b_vabdl_u16 ) (vabdl_u16 a_vabdl_u16 b_vabdl_u16 ))))
(display "vabdl_u16" (current-error-port))
(define (vabdl_u32.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %15 (extract  %8 e0.new b))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 64)))
  (define %19.downcasted0 (bvsub  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (integer->bitvector (abs (bitvector->integer %19.downcasted0)) (bitvector 64)))
  (define %21.downcasted0 (extract  63 0 %20.downcasted0))
  (define %39 (bvadd  (bv 0 64)  %21.downcasted0))
  %39
 )
 )
)
)
)
result2)
(define-symbolic a_vabdl_u32 (bitvector 64))
(define-symbolic b_vabdl_u32 (bitvector 64))
(verify (assert (equal? (vabdl_u32.check a_vabdl_u32 b_vabdl_u32 ) (vabdl_u32 a_vabdl_u32 b_vabdl_u32 ))))
(display "vabdl_u32" (current-error-port))
(define (vabdl_u8.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new a))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 16)))
  (define %15 (extract  %8 e0.new b))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 16)))
  (define %19.downcasted0 (bvsub  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (integer->bitvector (abs (bitvector->integer %19.downcasted0)) (bitvector 16)))
  (define %21.downcasted0 (extract  15 0 %20.downcasted0))
  (define %39 (bvadd  (bv 0 16)  %21.downcasted0))
  %39
 )
 )
)
)
)
result2)
(define-symbolic a_vabdl_u8 (bitvector 64))
(define-symbolic b_vabdl_u8 (bitvector 64))
(verify (assert (equal? (vabdl_u8.check a_vabdl_u8 b_vabdl_u8 ) (vabdl_u8 a_vabdl_u8 b_vabdl_u8 ))))
(display "vabdl_u8" (current-error-port))
(define (vabdq_s16.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 32)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 32)))
  (define %15.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %16.downcasted0 (integer->bitvector (abs (bitvector->integer %15.downcasted0)) (bitvector 32)))
  (define %17.downcasted0 (extract  15 0 %16.downcasted0))
  (define %27 (bvadd  (bv 0 16)  %17.downcasted0))
  %27
 )
 )
)
)
)
result2)
(define-symbolic a_vabdq_s16 (bitvector 128))
(define-symbolic b_vabdq_s16 (bitvector 128))
(verify (assert (equal? (vabdq_s16.check a_vabdq_s16 b_vabdq_s16 ) (vabdq_s16 a_vabdq_s16 b_vabdq_s16 ))))
(display "vabdq_s16" (current-error-port))
(define (vabdq_s32.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %5 (+  e0.new  31))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 64)))
  (define %15.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %16.downcasted0 (integer->bitvector (abs (bitvector->integer %15.downcasted0)) (bitvector 64)))
  (define %17.downcasted0 (extract  31 0 %16.downcasted0))
  (define %27 (bvadd  (bv 0 32)  %17.downcasted0))
  %27
 )
 )
)
)
)
result2)
(define-symbolic a_vabdq_s32 (bitvector 128))
(define-symbolic b_vabdq_s32 (bitvector 128))
(verify (assert (equal? (vabdq_s32.check a_vabdq_s32 b_vabdq_s32 ) (vabdq_s32 a_vabdq_s32 b_vabdq_s32 ))))
(display "vabdq_s32" (current-error-port))
(define (vabdq_s8.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 16)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 16)))
  (define %15.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %16.downcasted0 (integer->bitvector (abs (bitvector->integer %15.downcasted0)) (bitvector 16)))
  (define %17.downcasted0 (extract  7 0 %16.downcasted0))
  (define %27 (bvadd  (bv 0 8)  %17.downcasted0))
  %27
 )
 )
)
)
)
result2)
(define-symbolic a_vabdq_s8 (bitvector 128))
(define-symbolic b_vabdq_s8 (bitvector 128))
(verify (assert (equal? (vabdq_s8.check a_vabdq_s8 b_vabdq_s8 ) (vabdq_s8 a_vabdq_s8 b_vabdq_s8 ))))
(display "vabdq_s8" (current-error-port))
(define (vabdq_u16.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 32)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 32)))
  (define %15.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %16.downcasted0 (integer->bitvector (abs (bitvector->integer %15.downcasted0)) (bitvector 32)))
  (define %17.downcasted0 (extract  15 0 %16.downcasted0))
  (define %27 (bvadd  (bv 0 16)  %17.downcasted0))
  %27
 )
 )
)
)
)
result2)
(define-symbolic a_vabdq_u16 (bitvector 128))
(define-symbolic b_vabdq_u16 (bitvector 128))
(verify (assert (equal? (vabdq_u16.check a_vabdq_u16 b_vabdq_u16 ) (vabdq_u16 a_vabdq_u16 b_vabdq_u16 ))))
(display "vabdq_u16" (current-error-port))
(define (vabdq_u32.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %5 (+  e0.new  31))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 64)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 64)))
  (define %15.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %16.downcasted0 (integer->bitvector (abs (bitvector->integer %15.downcasted0)) (bitvector 64)))
  (define %17.downcasted0 (extract  31 0 %16.downcasted0))
  (define %27 (bvadd  (bv 0 32)  %17.downcasted0))
  %27
 )
 )
)
)
)
result2)
(define-symbolic a_vabdq_u32 (bitvector 128))
(define-symbolic b_vabdq_u32 (bitvector 128))
(verify (assert (equal? (vabdq_u32.check a_vabdq_u32 b_vabdq_u32 ) (vabdq_u32 a_vabdq_u32 b_vabdq_u32 ))))
(display "vabdq_u32" (current-error-port))
(define (vabdq_u8.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 16)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 16)))
  (define %15.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %16.downcasted0 (integer->bitvector (abs (bitvector->integer %15.downcasted0)) (bitvector 16)))
  (define %17.downcasted0 (extract  7 0 %16.downcasted0))
  (define %27 (bvadd  (bv 0 8)  %17.downcasted0))
  %27
 )
 )
)
)
)
result2)
(define-symbolic a_vabdq_u8 (bitvector 128))
(define-symbolic b_vabdq_u8 (bitvector 128))
(verify (assert (equal? (vabdq_u8.check a_vabdq_u8 b_vabdq_u8 ) (vabdq_u8 a_vabdq_u8 b_vabdq_u8 ))))
(display "vabdq_u8" (current-error-port))
(define (vabs_s16.check  a )
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
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %6.downcasted0)) (bitvector 32)))
  (define %13.downcasted0 (extract  15 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vabs_s16 (bitvector 64))
(verify (assert (equal? (vabs_s16.check a_vabs_s16 ) (vabs_s16 a_vabs_s16 ))))
(display "vabs_s16" (current-error-port))
(define (vabs_s32.check  a )
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
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %6.downcasted0)) (bitvector 64)))
  (define %13.downcasted0 (extract  31 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vabs_s32 (bitvector 64))
(verify (assert (equal? (vabs_s32.check a_vabs_s32 ) (vabs_s32 a_vabs_s32 ))))
(display "vabs_s32" (current-error-port))
(define (vabs_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 128)))
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %6.downcasted0)) (bitvector 128)))
  (define %13.downcasted0 (extract  63 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vabs_s64 (bitvector 64))
(verify (assert (equal? (vabs_s64.check a_vabs_s64 ) (vabs_s64 a_vabs_s64 ))))
(display "vabs_s64" (current-error-port))
(define (vabs_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 16)))
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %6.downcasted0)) (bitvector 16)))
  (define %13.downcasted0 (extract  7 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vabs_s8 (bitvector 64))
(verify (assert (equal? (vabs_s8.check a_vabs_s8 ) (vabs_s8 a_vabs_s8 ))))
(display "vabs_s8" (current-error-port))
(define (vabsd_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 128)))
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %6.downcasted0)) (bitvector 128)))
  (define %13.downcasted0 (extract  63 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vabsd_s64 (bitvector 64))
(verify (assert (equal? (vabsd_s64.check a_vabsd_s64 ) (vabsd_s64 a_vabsd_s64 ))))
(display "vabsd_s64" (current-error-port))
(define (vabsq_s16.check  a )
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
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %6.downcasted0)) (bitvector 32)))
  (define %13.downcasted0 (extract  15 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vabsq_s16 (bitvector 128))
(verify (assert (equal? (vabsq_s16.check a_vabsq_s16 ) (vabsq_s16 a_vabsq_s16 ))))
(display "vabsq_s16" (current-error-port))
(define (vabsq_s32.check  a )
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
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %6.downcasted0)) (bitvector 64)))
  (define %13.downcasted0 (extract  31 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vabsq_s32 (bitvector 128))
(verify (assert (equal? (vabsq_s32.check a_vabsq_s32 ) (vabsq_s32 a_vabsq_s32 ))))
(display "vabsq_s32" (current-error-port))
(define (vabsq_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 128)))
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %6.downcasted0)) (bitvector 128)))
  (define %13.downcasted0 (extract  63 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vabsq_s64 (bitvector 128))
(verify (assert (equal? (vabsq_s64.check a_vabsq_s64 ) (vabsq_s64 a_vabsq_s64 ))))
(display "vabsq_s64" (current-error-port))
(define (vabsq_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 16)))
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %6.downcasted0)) (bitvector 16)))
  (define %13.downcasted0 (extract  7 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vabsq_s8 (bitvector 128))
(verify (assert (equal? (vabsq_s8.check a_vabsq_s8 ) (vabsq_s8 a_vabsq_s8 ))))
(display "vabsq_s8" (current-error-port))
(define (vadd_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vadd_s16 (bitvector 64))
(define-symbolic b_vadd_s16 (bitvector 64))
(verify (assert (equal? (vadd_s16.check a_vadd_s16 b_vadd_s16 ) (vadd_s16 a_vadd_s16 b_vadd_s16 ))))
(display "vadd_s16" (current-error-port))
(define (vadd_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vadd_s32 (bitvector 64))
(define-symbolic b_vadd_s32 (bitvector 64))
(verify (assert (equal? (vadd_s32.check a_vadd_s32 b_vadd_s32 ) (vadd_s32 a_vadd_s32 b_vadd_s32 ))))
(display "vadd_s32" (current-error-port))
(define (vadd_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vadd_s64 (bitvector 64))
(define-symbolic b_vadd_s64 (bitvector 64))
(verify (assert (equal? (vadd_s64.check a_vadd_s64 b_vadd_s64 ) (vadd_s64 a_vadd_s64 b_vadd_s64 ))))
(display "vadd_s64" (current-error-port))
(define (vadd_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vadd_s8 (bitvector 64))
(define-symbolic b_vadd_s8 (bitvector 64))
(verify (assert (equal? (vadd_s8.check a_vadd_s8 b_vadd_s8 ) (vadd_s8 a_vadd_s8 b_vadd_s8 ))))
(display "vadd_s8" (current-error-port))
(define (vadd_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vadd_u16 (bitvector 64))
(define-symbolic b_vadd_u16 (bitvector 64))
(verify (assert (equal? (vadd_u16.check a_vadd_u16 b_vadd_u16 ) (vadd_u16 a_vadd_u16 b_vadd_u16 ))))
(display "vadd_u16" (current-error-port))
(define (vadd_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vadd_u32 (bitvector 64))
(define-symbolic b_vadd_u32 (bitvector 64))
(verify (assert (equal? (vadd_u32.check a_vadd_u32 b_vadd_u32 ) (vadd_u32 a_vadd_u32 b_vadd_u32 ))))
(display "vadd_u32" (current-error-port))
(define (vadd_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vadd_u64 (bitvector 64))
(define-symbolic b_vadd_u64 (bitvector 64))
(verify (assert (equal? (vadd_u64.check a_vadd_u64 b_vadd_u64 ) (vadd_u64 a_vadd_u64 b_vadd_u64 ))))
(display "vadd_u64" (current-error-port))
(define (vadd_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vadd_u8 (bitvector 64))
(define-symbolic b_vadd_u8 (bitvector 64))
(verify (assert (equal? (vadd_u8.check a_vadd_u8 b_vadd_u8 ) (vadd_u8 a_vadd_u8 b_vadd_u8 ))))
(display "vadd_u8" (current-error-port))
(define (vaddd_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vaddd_s64 (bitvector 64))
(define-symbolic b_vaddd_s64 (bitvector 64))
(verify (assert (equal? (vaddd_s64.check a_vaddd_s64 b_vaddd_s64 ) (vaddd_s64 a_vaddd_s64 b_vaddd_s64 ))))
(display "vaddd_s64" (current-error-port))
(define (vaddd_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vaddd_u64 (bitvector 64))
(define-symbolic b_vaddd_u64 (bitvector 64))
(verify (assert (equal? (vaddd_u64.check a_vaddd_u64 b_vaddd_u64 ) (vaddd_u64 a_vaddd_u64 b_vaddd_u64 ))))
(display "vaddd_u64" (current-error-port))
(define (vaddhn_high_s16.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %12 (+  e0.new  15))
  (define %14 (extract  %12 e0.new a))
  (define %23 (extract  %12 e0.new b))
  (define %24 (bvadd  %14  %23))
  (define %32 (extract  15 8 %24))
  %32
 )
 )
)
)
)
(define %33 (concat result r))
%33)
(define-symbolic r_vaddhn_high_s16 (bitvector 64))
(define-symbolic a_vaddhn_high_s16 (bitvector 128))
(define-symbolic b_vaddhn_high_s16 (bitvector 128))
(verify (assert (equal? (vaddhn_high_s16.check r_vaddhn_high_s16 a_vaddhn_high_s16 b_vaddhn_high_s16 ) (vaddhn_high_s16 r_vaddhn_high_s16 a_vaddhn_high_s16 b_vaddhn_high_s16 ))))
(display "vaddhn_high_s16" (current-error-port))
(define (vaddhn_high_s32.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %12 (+  e0.new  31))
  (define %14 (extract  %12 e0.new a))
  (define %23 (extract  %12 e0.new b))
  (define %24 (bvadd  %14  %23))
  (define %32 (extract  31 16 %24))
  %32
 )
 )
)
)
)
(define %33 (concat result r))
%33)
(define-symbolic r_vaddhn_high_s32 (bitvector 64))
(define-symbolic a_vaddhn_high_s32 (bitvector 128))
(define-symbolic b_vaddhn_high_s32 (bitvector 128))
(verify (assert (equal? (vaddhn_high_s32.check r_vaddhn_high_s32 a_vaddhn_high_s32 b_vaddhn_high_s32 ) (vaddhn_high_s32 r_vaddhn_high_s32 a_vaddhn_high_s32 b_vaddhn_high_s32 ))))
(display "vaddhn_high_s32" (current-error-port))
(define (vaddhn_high_s64.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %12 (+  e0.new  63))
  (define %14 (extract  %12 e0.new a))
  (define %23 (extract  %12 e0.new b))
  (define %24 (bvadd  %14  %23))
  (define %32 (extract  63 32 %24))
  %32
 )
 )
)
)
)
(define %33 (concat result r))
%33)
(define-symbolic r_vaddhn_high_s64 (bitvector 64))
(define-symbolic a_vaddhn_high_s64 (bitvector 128))
(define-symbolic b_vaddhn_high_s64 (bitvector 128))
(verify (assert (equal? (vaddhn_high_s64.check r_vaddhn_high_s64 a_vaddhn_high_s64 b_vaddhn_high_s64 ) (vaddhn_high_s64 r_vaddhn_high_s64 a_vaddhn_high_s64 b_vaddhn_high_s64 ))))
(display "vaddhn_high_s64" (current-error-port))
(define (vaddhn_high_u16.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %12 (+  e0.new  15))
  (define %14 (extract  %12 e0.new a))
  (define %23 (extract  %12 e0.new b))
  (define %24 (bvadd  %14  %23))
  (define %32 (extract  15 8 %24))
  %32
 )
 )
)
)
)
(define %33 (concat result r))
%33)
(define-symbolic r_vaddhn_high_u16 (bitvector 64))
(define-symbolic a_vaddhn_high_u16 (bitvector 128))
(define-symbolic b_vaddhn_high_u16 (bitvector 128))
(verify (assert (equal? (vaddhn_high_u16.check r_vaddhn_high_u16 a_vaddhn_high_u16 b_vaddhn_high_u16 ) (vaddhn_high_u16 r_vaddhn_high_u16 a_vaddhn_high_u16 b_vaddhn_high_u16 ))))
(display "vaddhn_high_u16" (current-error-port))
(define (vaddhn_high_u32.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %12 (+  e0.new  31))
  (define %14 (extract  %12 e0.new a))
  (define %23 (extract  %12 e0.new b))
  (define %24 (bvadd  %14  %23))
  (define %32 (extract  31 16 %24))
  %32
 )
 )
)
)
)
(define %33 (concat result r))
%33)
(define-symbolic r_vaddhn_high_u32 (bitvector 64))
(define-symbolic a_vaddhn_high_u32 (bitvector 128))
(define-symbolic b_vaddhn_high_u32 (bitvector 128))
(verify (assert (equal? (vaddhn_high_u32.check r_vaddhn_high_u32 a_vaddhn_high_u32 b_vaddhn_high_u32 ) (vaddhn_high_u32 r_vaddhn_high_u32 a_vaddhn_high_u32 b_vaddhn_high_u32 ))))
(display "vaddhn_high_u32" (current-error-port))
(define (vaddhn_high_u64.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %12 (+  e0.new  63))
  (define %14 (extract  %12 e0.new a))
  (define %23 (extract  %12 e0.new b))
  (define %24 (bvadd  %14  %23))
  (define %32 (extract  63 32 %24))
  %32
 )
 )
)
)
)
(define %33 (concat result r))
%33)
(define-symbolic r_vaddhn_high_u64 (bitvector 64))
(define-symbolic a_vaddhn_high_u64 (bitvector 128))
(define-symbolic b_vaddhn_high_u64 (bitvector 128))
(verify (assert (equal? (vaddhn_high_u64.check r_vaddhn_high_u64 a_vaddhn_high_u64 b_vaddhn_high_u64 ) (vaddhn_high_u64 r_vaddhn_high_u64 a_vaddhn_high_u64 b_vaddhn_high_u64 ))))
(display "vaddhn_high_u64" (current-error-port))
(define (vaddhn_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  15))
  (define %14 (extract  %12 %7.new0 a))
  (define %23 (extract  %12 %7.new0 b))
  (define %24 (bvadd  %14  %23))
  (define %32 (extract  15 8 %24))
  %32
 )
 )
)
)
)
result)
(define-symbolic a_vaddhn_s16 (bitvector 128))
(define-symbolic b_vaddhn_s16 (bitvector 128))
(verify (assert (equal? (vaddhn_s16.check a_vaddhn_s16 b_vaddhn_s16 ) (vaddhn_s16 a_vaddhn_s16 b_vaddhn_s16 ))))
(display "vaddhn_s16" (current-error-port))
(define (vaddhn_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  31))
  (define %14 (extract  %12 %7.new0 a))
  (define %23 (extract  %12 %7.new0 b))
  (define %24 (bvadd  %14  %23))
  (define %32 (extract  31 16 %24))
  %32
 )
 )
)
)
)
result)
(define-symbolic a_vaddhn_s32 (bitvector 128))
(define-symbolic b_vaddhn_s32 (bitvector 128))
(verify (assert (equal? (vaddhn_s32.check a_vaddhn_s32 b_vaddhn_s32 ) (vaddhn_s32 a_vaddhn_s32 b_vaddhn_s32 ))))
(display "vaddhn_s32" (current-error-port))
(define (vaddhn_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  63))
  (define %14 (extract  %12 %7.new0 a))
  (define %23 (extract  %12 %7.new0 b))
  (define %24 (bvadd  %14  %23))
  (define %32 (extract  63 32 %24))
  %32
 )
 )
)
)
)
result)
(define-symbolic a_vaddhn_s64 (bitvector 128))
(define-symbolic b_vaddhn_s64 (bitvector 128))
(verify (assert (equal? (vaddhn_s64.check a_vaddhn_s64 b_vaddhn_s64 ) (vaddhn_s64 a_vaddhn_s64 b_vaddhn_s64 ))))
(display "vaddhn_s64" (current-error-port))
(define (vaddhn_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  15))
  (define %14 (extract  %12 %7.new0 a))
  (define %23 (extract  %12 %7.new0 b))
  (define %24 (bvadd  %14  %23))
  (define %32 (extract  15 8 %24))
  %32
 )
 )
)
)
)
result)
(define-symbolic a_vaddhn_u16 (bitvector 128))
(define-symbolic b_vaddhn_u16 (bitvector 128))
(verify (assert (equal? (vaddhn_u16.check a_vaddhn_u16 b_vaddhn_u16 ) (vaddhn_u16 a_vaddhn_u16 b_vaddhn_u16 ))))
(display "vaddhn_u16" (current-error-port))
(define (vaddhn_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  31))
  (define %14 (extract  %12 %7.new0 a))
  (define %23 (extract  %12 %7.new0 b))
  (define %24 (bvadd  %14  %23))
  (define %32 (extract  31 16 %24))
  %32
 )
 )
)
)
)
result)
(define-symbolic a_vaddhn_u32 (bitvector 128))
(define-symbolic b_vaddhn_u32 (bitvector 128))
(verify (assert (equal? (vaddhn_u32.check a_vaddhn_u32 b_vaddhn_u32 ) (vaddhn_u32 a_vaddhn_u32 b_vaddhn_u32 ))))
(display "vaddhn_u32" (current-error-port))
(define (vaddhn_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  63))
  (define %14 (extract  %12 %7.new0 a))
  (define %23 (extract  %12 %7.new0 b))
  (define %24 (bvadd  %14  %23))
  (define %32 (extract  63 32 %24))
  %32
 )
 )
)
)
)
result)
(define-symbolic a_vaddhn_u64 (bitvector 128))
(define-symbolic b_vaddhn_u64 (bitvector 128))
(verify (assert (equal? (vaddhn_u64.check a_vaddhn_u64 b_vaddhn_u64 ) (vaddhn_u64 a_vaddhn_u64 b_vaddhn_u64 ))))
(display "vaddhn_u64" (current-error-port))
(define (vaddl_high_s16.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  15))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 32)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (sign-extend  %18 (bitvector 32)))
  (define %20.downcasted0 (bvadd  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  31 0 %20.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddl_high_s16 (bitvector 128))
(define-symbolic b_vaddl_high_s16 (bitvector 128))
(verify (assert (equal? (vaddl_high_s16.check a_vaddl_high_s16 b_vaddl_high_s16 ) (vaddl_high_s16 a_vaddl_high_s16 b_vaddl_high_s16 ))))
(display "vaddl_high_s16" (current-error-port))
(define (vaddl_high_s32.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  31))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 64)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (sign-extend  %18 (bitvector 64)))
  (define %20.downcasted0 (bvadd  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  63 0 %20.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddl_high_s32 (bitvector 128))
(define-symbolic b_vaddl_high_s32 (bitvector 128))
(verify (assert (equal? (vaddl_high_s32.check a_vaddl_high_s32 b_vaddl_high_s32 ) (vaddl_high_s32 a_vaddl_high_s32 b_vaddl_high_s32 ))))
(display "vaddl_high_s32" (current-error-port))
(define (vaddl_high_s8.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  7))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 16)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (sign-extend  %18 (bitvector 16)))
  (define %20.downcasted0 (bvadd  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  15 0 %20.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddl_high_s8 (bitvector 128))
(define-symbolic b_vaddl_high_s8 (bitvector 128))
(verify (assert (equal? (vaddl_high_s8.check a_vaddl_high_s8 b_vaddl_high_s8 ) (vaddl_high_s8 a_vaddl_high_s8 b_vaddl_high_s8 ))))
(display "vaddl_high_s8" (current-error-port))
(define (vaddl_high_u16.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  15))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 32)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (zero-extend  %18 (bitvector 32)))
  (define %20.downcasted0 (bvadd  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  31 0 %20.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddl_high_u16 (bitvector 128))
(define-symbolic b_vaddl_high_u16 (bitvector 128))
(verify (assert (equal? (vaddl_high_u16.check a_vaddl_high_u16 b_vaddl_high_u16 ) (vaddl_high_u16 a_vaddl_high_u16 b_vaddl_high_u16 ))))
(display "vaddl_high_u16" (current-error-port))
(define (vaddl_high_u32.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  31))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 64)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (zero-extend  %18 (bitvector 64)))
  (define %20.downcasted0 (bvadd  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  63 0 %20.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddl_high_u32 (bitvector 128))
(define-symbolic b_vaddl_high_u32 (bitvector 128))
(verify (assert (equal? (vaddl_high_u32.check a_vaddl_high_u32 b_vaddl_high_u32 ) (vaddl_high_u32 a_vaddl_high_u32 b_vaddl_high_u32 ))))
(display "vaddl_high_u32" (current-error-port))
(define (vaddl_high_u8.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  7))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 16)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (zero-extend  %18 (bitvector 16)))
  (define %20.downcasted0 (bvadd  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  15 0 %20.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddl_high_u8 (bitvector 128))
(define-symbolic b_vaddl_high_u8 (bitvector 128))
(verify (assert (equal? (vaddl_high_u8.check a_vaddl_high_u8 b_vaddl_high_u8 ) (vaddl_high_u8 a_vaddl_high_u8 b_vaddl_high_u8 ))))
(display "vaddl_high_u8" (current-error-port))
(define (vaddl_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 32)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 32)))
  (define %14.downcasted0 (bvadd  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  31 0 %14.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddl_s16 (bitvector 64))
(define-symbolic b_vaddl_s16 (bitvector 64))
(verify (assert (equal? (vaddl_s16.check a_vaddl_s16 b_vaddl_s16 ) (vaddl_s16 a_vaddl_s16 b_vaddl_s16 ))))
(display "vaddl_s16" (current-error-port))
(define (vaddl_s32.check  a b )
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
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 64)))
  (define %14.downcasted0 (bvadd  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  63 0 %14.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddl_s32 (bitvector 64))
(define-symbolic b_vaddl_s32 (bitvector 64))
(verify (assert (equal? (vaddl_s32.check a_vaddl_s32 b_vaddl_s32 ) (vaddl_s32 a_vaddl_s32 b_vaddl_s32 ))))
(display "vaddl_s32" (current-error-port))
(define (vaddl_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 16)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 16)))
  (define %14.downcasted0 (bvadd  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  15 0 %14.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddl_s8 (bitvector 64))
(define-symbolic b_vaddl_s8 (bitvector 64))
(verify (assert (equal? (vaddl_s8.check a_vaddl_s8 b_vaddl_s8 ) (vaddl_s8 a_vaddl_s8 b_vaddl_s8 ))))
(display "vaddl_s8" (current-error-port))
(define (vaddl_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 32)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 32)))
  (define %14.downcasted0 (bvadd  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  31 0 %14.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddl_u16 (bitvector 64))
(define-symbolic b_vaddl_u16 (bitvector 64))
(verify (assert (equal? (vaddl_u16.check a_vaddl_u16 b_vaddl_u16 ) (vaddl_u16 a_vaddl_u16 b_vaddl_u16 ))))
(display "vaddl_u16" (current-error-port))
(define (vaddl_u32.check  a b )
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
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 64)))
  (define %14.downcasted0 (bvadd  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  63 0 %14.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddl_u32 (bitvector 64))
(define-symbolic b_vaddl_u32 (bitvector 64))
(verify (assert (equal? (vaddl_u32.check a_vaddl_u32 b_vaddl_u32 ) (vaddl_u32 a_vaddl_u32 b_vaddl_u32 ))))
(display "vaddl_u32" (current-error-port))
(define (vaddl_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 16)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 16)))
  (define %14.downcasted0 (bvadd  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  15 0 %14.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddl_u8 (bitvector 64))
(define-symbolic b_vaddl_u8 (bitvector 64))
(verify (assert (equal? (vaddl_u8.check a_vaddl_u8 b_vaddl_u8 ) (vaddl_u8 a_vaddl_u8 b_vaddl_u8 ))))
(display "vaddl_u8" (current-error-port))
(define (vaddq_s16.check  a b )
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
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vaddq_s16 (bitvector 128))
(define-symbolic b_vaddq_s16 (bitvector 128))
(verify (assert (equal? (vaddq_s16.check a_vaddq_s16 b_vaddq_s16 ) (vaddq_s16 a_vaddq_s16 b_vaddq_s16 ))))
(display "vaddq_s16" (current-error-port))
(define (vaddq_s32.check  a b )
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
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vaddq_s32 (bitvector 128))
(define-symbolic b_vaddq_s32 (bitvector 128))
(verify (assert (equal? (vaddq_s32.check a_vaddq_s32 b_vaddq_s32 ) (vaddq_s32 a_vaddq_s32 b_vaddq_s32 ))))
(display "vaddq_s32" (current-error-port))
(define (vaddq_s64.check  a b )
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
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vaddq_s64 (bitvector 128))
(define-symbolic b_vaddq_s64 (bitvector 128))
(verify (assert (equal? (vaddq_s64.check a_vaddq_s64 b_vaddq_s64 ) (vaddq_s64 a_vaddq_s64 b_vaddq_s64 ))))
(display "vaddq_s64" (current-error-port))
(define (vaddq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vaddq_s8 (bitvector 128))
(define-symbolic b_vaddq_s8 (bitvector 128))
(verify (assert (equal? (vaddq_s8.check a_vaddq_s8 b_vaddq_s8 ) (vaddq_s8 a_vaddq_s8 b_vaddq_s8 ))))
(display "vaddq_s8" (current-error-port))
(define (vaddq_u16.check  a b )
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
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vaddq_u16 (bitvector 128))
(define-symbolic b_vaddq_u16 (bitvector 128))
(verify (assert (equal? (vaddq_u16.check a_vaddq_u16 b_vaddq_u16 ) (vaddq_u16 a_vaddq_u16 b_vaddq_u16 ))))
(display "vaddq_u16" (current-error-port))
(define (vaddq_u32.check  a b )
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
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vaddq_u32 (bitvector 128))
(define-symbolic b_vaddq_u32 (bitvector 128))
(verify (assert (equal? (vaddq_u32.check a_vaddq_u32 b_vaddq_u32 ) (vaddq_u32 a_vaddq_u32 b_vaddq_u32 ))))
(display "vaddq_u32" (current-error-port))
(define (vaddq_u64.check  a b )
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
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vaddq_u64 (bitvector 128))
(define-symbolic b_vaddq_u64 (bitvector 128))
(verify (assert (equal? (vaddq_u64.check a_vaddq_u64 b_vaddq_u64 ) (vaddq_u64 a_vaddq_u64 b_vaddq_u64 ))))
(display "vaddq_u64" (current-error-port))
(define (vaddq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvadd  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vaddq_u8 (bitvector 128))
(define-symbolic b_vaddq_u8 (bitvector 128))
(verify (assert (equal? (vaddq_u8.check a_vaddq_u8 b_vaddq_u8 ) (vaddq_u8 a_vaddq_u8 b_vaddq_u8 ))))
(display "vaddq_u8" (current-error-port))
(define (vaddw_high_s16.check  a b )
(define %3 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %12 (+  e0.new  31))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.new0 (/  e0.new  2))
  (define %19 (+  %16.new0  15))
  (define %20 (extract  %19 %16.new0 %3))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 64)))
  (define %22.downcasted0 (bvadd  %15.downcasted0  %21.downcasted0))
  (define %33.downcasted0 (extract  31 0 %22.downcasted0))
  %33.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddw_high_s16 (bitvector 128))
(define-symbolic b_vaddw_high_s16 (bitvector 128))
(verify (assert (equal? (vaddw_high_s16.check a_vaddw_high_s16 b_vaddw_high_s16 ) (vaddw_high_s16 a_vaddw_high_s16 b_vaddw_high_s16 ))))
(display "vaddw_high_s16" (current-error-port))
(define (vaddw_high_s32.check  a b )
(define %3 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %12 (+  e0.new  63))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 128)))
  (define %16.new0 (/  e0.new  2))
  (define %19 (+  %16.new0  31))
  (define %20 (extract  %19 %16.new0 %3))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %15.downcasted0  %21.downcasted0))
  (define %33.downcasted0 (extract  63 0 %22.downcasted0))
  %33.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddw_high_s32 (bitvector 128))
(define-symbolic b_vaddw_high_s32 (bitvector 128))
(verify (assert (equal? (vaddw_high_s32.check a_vaddw_high_s32 b_vaddw_high_s32 ) (vaddw_high_s32 a_vaddw_high_s32 b_vaddw_high_s32 ))))
(display "vaddw_high_s32" (current-error-port))
(define (vaddw_high_s8.check  a b )
(define %3 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %12 (+  e0.new  15))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 32)))
  (define %16.new0 (/  e0.new  2))
  (define %19 (+  %16.new0  7))
  (define %20 (extract  %19 %16.new0 %3))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 32)))
  (define %22.downcasted0 (bvadd  %15.downcasted0  %21.downcasted0))
  (define %33.downcasted0 (extract  15 0 %22.downcasted0))
  %33.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddw_high_s8 (bitvector 128))
(define-symbolic b_vaddw_high_s8 (bitvector 128))
(verify (assert (equal? (vaddw_high_s8.check a_vaddw_high_s8 b_vaddw_high_s8 ) (vaddw_high_s8 a_vaddw_high_s8 b_vaddw_high_s8 ))))
(display "vaddw_high_s8" (current-error-port))
(define (vaddw_high_u16.check  a b )
(define %3 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %12 (+  e0.new  31))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %16.new0 (/  e0.new  2))
  (define %19 (+  %16.new0  15))
  (define %20 (extract  %19 %16.new0 %3))
  (define %21.downcasted0 (zero-extend  %20 (bitvector 64)))
  (define %22.downcasted0 (bvadd  %15.downcasted0  %21.downcasted0))
  (define %33.downcasted0 (extract  31 0 %22.downcasted0))
  %33.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddw_high_u16 (bitvector 128))
(define-symbolic b_vaddw_high_u16 (bitvector 128))
(verify (assert (equal? (vaddw_high_u16.check a_vaddw_high_u16 b_vaddw_high_u16 ) (vaddw_high_u16 a_vaddw_high_u16 b_vaddw_high_u16 ))))
(display "vaddw_high_u16" (current-error-port))
(define (vaddw_high_u32.check  a b )
(define %3 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %12 (+  e0.new  63))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 128)))
  (define %16.new0 (/  e0.new  2))
  (define %19 (+  %16.new0  31))
  (define %20 (extract  %19 %16.new0 %3))
  (define %21.downcasted0 (zero-extend  %20 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %15.downcasted0  %21.downcasted0))
  (define %33.downcasted0 (extract  63 0 %22.downcasted0))
  %33.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddw_high_u32 (bitvector 128))
(define-symbolic b_vaddw_high_u32 (bitvector 128))
(verify (assert (equal? (vaddw_high_u32.check a_vaddw_high_u32 b_vaddw_high_u32 ) (vaddw_high_u32 a_vaddw_high_u32 b_vaddw_high_u32 ))))
(display "vaddw_high_u32" (current-error-port))
(define (vaddw_high_u8.check  a b )
(define %3 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %12 (+  e0.new  15))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 32)))
  (define %16.new0 (/  e0.new  2))
  (define %19 (+  %16.new0  7))
  (define %20 (extract  %19 %16.new0 %3))
  (define %21.downcasted0 (zero-extend  %20 (bitvector 32)))
  (define %22.downcasted0 (bvadd  %15.downcasted0  %21.downcasted0))
  (define %33.downcasted0 (extract  15 0 %22.downcasted0))
  %33.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddw_high_u8 (bitvector 128))
(define-symbolic b_vaddw_high_u8 (bitvector 128))
(verify (assert (equal? (vaddw_high_u8.check a_vaddw_high_u8 b_vaddw_high_u8 ) (vaddw_high_u8 a_vaddw_high_u8 b_vaddw_high_u8 ))))
(display "vaddw_high_u8" (current-error-port))
(define (vaddw_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  31))
  (define %11 (extract  %9 %4.new0 a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %16 (+  e0.new  15))
  (define %17 (extract  %16 e0.new b))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 64)))
  (define %19.downcasted0 (bvadd  %12.downcasted0  %18.downcasted0))
  (define %30.downcasted0 (extract  31 0 %19.downcasted0))
  %30.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddw_s16 (bitvector 128))
(define-symbolic b_vaddw_s16 (bitvector 64))
(verify (assert (equal? (vaddw_s16.check a_vaddw_s16 b_vaddw_s16 ) (vaddw_s16 a_vaddw_s16 b_vaddw_s16 ))))
(display "vaddw_s16" (current-error-port))
(define (vaddw_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  63))
  (define %11 (extract  %9 %4.new0 a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 128)))
  (define %16 (+  e0.new  31))
  (define %17 (extract  %16 e0.new b))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 128)))
  (define %19.downcasted0 (bvadd  %12.downcasted0  %18.downcasted0))
  (define %30.downcasted0 (extract  63 0 %19.downcasted0))
  %30.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddw_s32 (bitvector 128))
(define-symbolic b_vaddw_s32 (bitvector 64))
(verify (assert (equal? (vaddw_s32.check a_vaddw_s32 b_vaddw_s32 ) (vaddw_s32 a_vaddw_s32 b_vaddw_s32 ))))
(display "vaddw_s32" (current-error-port))
(define (vaddw_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  15))
  (define %11 (extract  %9 %4.new0 a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 32)))
  (define %16 (+  e0.new  7))
  (define %17 (extract  %16 e0.new b))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 32)))
  (define %19.downcasted0 (bvadd  %12.downcasted0  %18.downcasted0))
  (define %30.downcasted0 (extract  15 0 %19.downcasted0))
  %30.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddw_s8 (bitvector 128))
(define-symbolic b_vaddw_s8 (bitvector 64))
(verify (assert (equal? (vaddw_s8.check a_vaddw_s8 b_vaddw_s8 ) (vaddw_s8 a_vaddw_s8 b_vaddw_s8 ))))
(display "vaddw_s8" (current-error-port))
(define (vaddw_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  31))
  (define %11 (extract  %9 %4.new0 a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %16 (+  e0.new  15))
  (define %17 (extract  %16 e0.new b))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 64)))
  (define %19.downcasted0 (bvadd  %12.downcasted0  %18.downcasted0))
  (define %30.downcasted0 (extract  31 0 %19.downcasted0))
  %30.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddw_u16 (bitvector 128))
(define-symbolic b_vaddw_u16 (bitvector 64))
(verify (assert (equal? (vaddw_u16.check a_vaddw_u16 b_vaddw_u16 ) (vaddw_u16 a_vaddw_u16 b_vaddw_u16 ))))
(display "vaddw_u16" (current-error-port))
(define (vaddw_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  63))
  (define %11 (extract  %9 %4.new0 a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 128)))
  (define %16 (+  e0.new  31))
  (define %17 (extract  %16 e0.new b))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 128)))
  (define %19.downcasted0 (bvadd  %12.downcasted0  %18.downcasted0))
  (define %30.downcasted0 (extract  63 0 %19.downcasted0))
  %30.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddw_u32 (bitvector 128))
(define-symbolic b_vaddw_u32 (bitvector 64))
(verify (assert (equal? (vaddw_u32.check a_vaddw_u32 b_vaddw_u32 ) (vaddw_u32 a_vaddw_u32 b_vaddw_u32 ))))
(display "vaddw_u32" (current-error-port))
(define (vaddw_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  15))
  (define %11 (extract  %9 %4.new0 a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %16 (+  e0.new  7))
  (define %17 (extract  %16 e0.new b))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 32)))
  (define %19.downcasted0 (bvadd  %12.downcasted0  %18.downcasted0))
  (define %30.downcasted0 (extract  15 0 %19.downcasted0))
  %30.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vaddw_u8 (bitvector 128))
(define-symbolic b_vaddw_u8 (bitvector 64))
(verify (assert (equal? (vaddw_u8.check a_vaddw_u8 b_vaddw_u8 ) (vaddw_u8 a_vaddw_u8 b_vaddw_u8 ))))
(display "vaddw_u8" (current-error-port))
(define (vceq_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 65535 16) (bv 0 16)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceq_s16 (bitvector 64))
(define-symbolic b_vceq_s16 (bitvector 64))
(verify (assert (equal? (vceq_s16.check a_vceq_s16 b_vceq_s16 ) (vceq_s16 a_vceq_s16 b_vceq_s16 ))))
(display "vceq_s16" (current-error-port))
(define (vceq_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 4294967295 32) (bv 0 32)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceq_s32 (bitvector 64))
(define-symbolic b_vceq_s32 (bitvector 64))
(verify (assert (equal? (vceq_s32.check a_vceq_s32 b_vceq_s32 ) (vceq_s32 a_vceq_s32 b_vceq_s32 ))))
(display "vceq_s32" (current-error-port))
(define (vceq_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceq_s64 (bitvector 64))
(define-symbolic b_vceq_s64 (bitvector 64))
(verify (assert (equal? (vceq_s64.check a_vceq_s64 b_vceq_s64 ) (vceq_s64 a_vceq_s64 b_vceq_s64 ))))
(display "vceq_s64" (current-error-port))
(define (vceq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 255 8) (bv 0 8)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceq_s8 (bitvector 64))
(define-symbolic b_vceq_s8 (bitvector 64))
(verify (assert (equal? (vceq_s8.check a_vceq_s8 b_vceq_s8 ) (vceq_s8 a_vceq_s8 b_vceq_s8 ))))
(display "vceq_s8" (current-error-port))
(define (vceq_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 65535 16) (bv 0 16)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceq_u16 (bitvector 64))
(define-symbolic b_vceq_u16 (bitvector 64))
(verify (assert (equal? (vceq_u16.check a_vceq_u16 b_vceq_u16 ) (vceq_u16 a_vceq_u16 b_vceq_u16 ))))
(display "vceq_u16" (current-error-port))
(define (vceq_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 4294967295 32) (bv 0 32)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceq_u32 (bitvector 64))
(define-symbolic b_vceq_u32 (bitvector 64))
(verify (assert (equal? (vceq_u32.check a_vceq_u32 b_vceq_u32 ) (vceq_u32 a_vceq_u32 b_vceq_u32 ))))
(display "vceq_u32" (current-error-port))
(define (vceq_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceq_u64 (bitvector 64))
(define-symbolic b_vceq_u64 (bitvector 64))
(verify (assert (equal? (vceq_u64.check a_vceq_u64 b_vceq_u64 ) (vceq_u64 a_vceq_u64 b_vceq_u64 ))))
(display "vceq_u64" (current-error-port))
(define (vceq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 255 8) (bv 0 8)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceq_u8 (bitvector 64))
(define-symbolic b_vceq_u8 (bitvector 64))
(verify (assert (equal? (vceq_u8.check a_vceq_u8 b_vceq_u8 ) (vceq_u8 a_vceq_u8 b_vceq_u8 ))))
(display "vceq_u8" (current-error-port))
(define (vceqd_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceqd_s64 (bitvector 64))
(define-symbolic b_vceqd_s64 (bitvector 64))
(verify (assert (equal? (vceqd_s64.check a_vceqd_s64 b_vceqd_s64 ) (vceqd_s64 a_vceqd_s64 b_vceqd_s64 ))))
(display "vceqd_s64" (current-error-port))
(define (vceqd_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceqd_u64 (bitvector 64))
(define-symbolic b_vceqd_u64 (bitvector 64))
(verify (assert (equal? (vceqd_u64.check a_vceqd_u64 b_vceqd_u64 ) (vceqd_u64 a_vceqd_u64 b_vceqd_u64 ))))
(display "vceqd_u64" (current-error-port))
(define (vceqq_s16.check  a b )
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
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 65535 16) (bv 0 16)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceqq_s16 (bitvector 128))
(define-symbolic b_vceqq_s16 (bitvector 128))
(verify (assert (equal? (vceqq_s16.check a_vceqq_s16 b_vceqq_s16 ) (vceqq_s16 a_vceqq_s16 b_vceqq_s16 ))))
(display "vceqq_s16" (current-error-port))
(define (vceqq_s32.check  a b )
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
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 4294967295 32) (bv 0 32)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceqq_s32 (bitvector 128))
(define-symbolic b_vceqq_s32 (bitvector 128))
(verify (assert (equal? (vceqq_s32.check a_vceqq_s32 b_vceqq_s32 ) (vceqq_s32 a_vceqq_s32 b_vceqq_s32 ))))
(display "vceqq_s32" (current-error-port))
(define (vceqq_s64.check  a b )
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
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceqq_s64 (bitvector 128))
(define-symbolic b_vceqq_s64 (bitvector 128))
(verify (assert (equal? (vceqq_s64.check a_vceqq_s64 b_vceqq_s64 ) (vceqq_s64 a_vceqq_s64 b_vceqq_s64 ))))
(display "vceqq_s64" (current-error-port))
(define (vceqq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 255 8) (bv 0 8)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceqq_s8 (bitvector 128))
(define-symbolic b_vceqq_s8 (bitvector 128))
(verify (assert (equal? (vceqq_s8.check a_vceqq_s8 b_vceqq_s8 ) (vceqq_s8 a_vceqq_s8 b_vceqq_s8 ))))
(display "vceqq_s8" (current-error-port))
(define (vceqq_u16.check  a b )
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
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 65535 16) (bv 0 16)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceqq_u16 (bitvector 128))
(define-symbolic b_vceqq_u16 (bitvector 128))
(verify (assert (equal? (vceqq_u16.check a_vceqq_u16 b_vceqq_u16 ) (vceqq_u16 a_vceqq_u16 b_vceqq_u16 ))))
(display "vceqq_u16" (current-error-port))
(define (vceqq_u32.check  a b )
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
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 4294967295 32) (bv 0 32)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceqq_u32 (bitvector 128))
(define-symbolic b_vceqq_u32 (bitvector 128))
(verify (assert (equal? (vceqq_u32.check a_vceqq_u32 b_vceqq_u32 ) (vceqq_u32 a_vceqq_u32 b_vceqq_u32 ))))
(display "vceqq_u32" (current-error-port))
(define (vceqq_u64.check  a b )
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
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceqq_u64 (bitvector 128))
(define-symbolic b_vceqq_u64 (bitvector 128))
(verify (assert (equal? (vceqq_u64.check a_vceqq_u64 b_vceqq_u64 ) (vceqq_u64 a_vceqq_u64 b_vceqq_u64 ))))
(display "vceqq_u64" (current-error-port))
(define (vceqq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bveq  %5  %10))
  (define %18 (if (equal? %11 #t) (bv 255 8) (bv 0 8)))
  %18
 )
 )
)
)
)
result)
(define-symbolic a_vceqq_u8 (bitvector 128))
(define-symbolic b_vceqq_u8 (bitvector 128))
(verify (assert (equal? (vceqq_u8.check a_vceqq_u8 b_vceqq_u8 ) (vceqq_u8 a_vceqq_u8 b_vceqq_u8 ))))
(display "vceqq_u8" (current-error-port))
(define (vceqz_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 16)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqz_s16 (bitvector 64))
(verify (assert (equal? (vceqz_s16.check a_vceqz_s16 ) (vceqz_s16 a_vceqz_s16 ))))
(display "vceqz_s16" (current-error-port))
(define (vceqz_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 32)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqz_s32 (bitvector 64))
(verify (assert (equal? (vceqz_s32.check a_vceqz_s32 ) (vceqz_s32 a_vceqz_s32 ))))
(display "vceqz_s32" (current-error-port))
(define (vceqz_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqz_s64 (bitvector 64))
(verify (assert (equal? (vceqz_s64.check a_vceqz_s64 ) (vceqz_s64 a_vceqz_s64 ))))
(display "vceqz_s64" (current-error-port))
(define (vceqz_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 8)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqz_s8 (bitvector 64))
(verify (assert (equal? (vceqz_s8.check a_vceqz_s8 ) (vceqz_s8 a_vceqz_s8 ))))
(display "vceqz_s8" (current-error-port))
(define (vceqz_u16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 16)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqz_u16 (bitvector 64))
(verify (assert (equal? (vceqz_u16.check a_vceqz_u16 ) (vceqz_u16 a_vceqz_u16 ))))
(display "vceqz_u16" (current-error-port))
(define (vceqz_u32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 32)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqz_u32 (bitvector 64))
(verify (assert (equal? (vceqz_u32.check a_vceqz_u32 ) (vceqz_u32 a_vceqz_u32 ))))
(display "vceqz_u32" (current-error-port))
(define (vceqz_u64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqz_u64 (bitvector 64))
(verify (assert (equal? (vceqz_u64.check a_vceqz_u64 ) (vceqz_u64 a_vceqz_u64 ))))
(display "vceqz_u64" (current-error-port))
(define (vceqz_u8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 8)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqz_u8 (bitvector 64))
(verify (assert (equal? (vceqz_u8.check a_vceqz_u8 ) (vceqz_u8 a_vceqz_u8 ))))
(display "vceqz_u8" (current-error-port))
(define (vceqzd_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqzd_s64 (bitvector 64))
(verify (assert (equal? (vceqzd_s64.check a_vceqzd_s64 ) (vceqzd_s64 a_vceqzd_s64 ))))
(display "vceqzd_s64" (current-error-port))
(define (vceqzd_u64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqzd_u64 (bitvector 64))
(verify (assert (equal? (vceqzd_u64.check a_vceqzd_u64 ) (vceqzd_u64 a_vceqzd_u64 ))))
(display "vceqzd_u64" (current-error-port))
(define (vceqzq_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 16)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqzq_s16 (bitvector 128))
(verify (assert (equal? (vceqzq_s16.check a_vceqzq_s16 ) (vceqzq_s16 a_vceqzq_s16 ))))
(display "vceqzq_s16" (current-error-port))
(define (vceqzq_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 32)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqzq_s32 (bitvector 128))
(verify (assert (equal? (vceqzq_s32.check a_vceqzq_s32 ) (vceqzq_s32 a_vceqzq_s32 ))))
(display "vceqzq_s32" (current-error-port))
(define (vceqzq_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqzq_s64 (bitvector 128))
(verify (assert (equal? (vceqzq_s64.check a_vceqzq_s64 ) (vceqzq_s64 a_vceqzq_s64 ))))
(display "vceqzq_s64" (current-error-port))
(define (vceqzq_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 8)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqzq_s8 (bitvector 128))
(verify (assert (equal? (vceqzq_s8.check a_vceqzq_s8 ) (vceqzq_s8 a_vceqzq_s8 ))))
(display "vceqzq_s8" (current-error-port))
(define (vceqzq_u16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 16)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqzq_u16 (bitvector 128))
(verify (assert (equal? (vceqzq_u16.check a_vceqzq_u16 ) (vceqzq_u16 a_vceqzq_u16 ))))
(display "vceqzq_u16" (current-error-port))
(define (vceqzq_u32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 32)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqzq_u32 (bitvector 128))
(verify (assert (equal? (vceqzq_u32.check a_vceqzq_u32 ) (vceqzq_u32 a_vceqzq_u32 ))))
(display "vceqzq_u32" (current-error-port))
(define (vceqzq_u64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqzq_u64 (bitvector 128))
(verify (assert (equal? (vceqzq_u64.check a_vceqzq_u64 ) (vceqzq_u64 a_vceqzq_u64 ))))
(display "vceqzq_u64" (current-error-port))
(define (vceqzq_u8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bveq  %5  (bv 0 8)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vceqzq_u8 (bitvector 128))
(verify (assert (equal? (vceqzq_u8.check a_vceqzq_u8 ) (vceqzq_u8 a_vceqzq_u8 ))))
(display "vceqzq_u8" (current-error-port))
(define (vcge_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcge_s16 (bitvector 64))
(define-symbolic b_vcge_s16 (bitvector 64))
(verify (assert (equal? (vcge_s16.check a_vcge_s16 b_vcge_s16 ) (vcge_s16 a_vcge_s16 b_vcge_s16 ))))
(display "vcge_s16" (current-error-port))
(define (vcge_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcge_s32 (bitvector 64))
(define-symbolic b_vcge_s32 (bitvector 64))
(verify (assert (equal? (vcge_s32.check a_vcge_s32 b_vcge_s32 ) (vcge_s32 a_vcge_s32 b_vcge_s32 ))))
(display "vcge_s32" (current-error-port))
(define (vcge_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcge_s64 (bitvector 64))
(define-symbolic b_vcge_s64 (bitvector 64))
(verify (assert (equal? (vcge_s64.check a_vcge_s64 b_vcge_s64 ) (vcge_s64 a_vcge_s64 b_vcge_s64 ))))
(display "vcge_s64" (current-error-port))
(define (vcge_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcge_s8 (bitvector 64))
(define-symbolic b_vcge_s8 (bitvector 64))
(verify (assert (equal? (vcge_s8.check a_vcge_s8 b_vcge_s8 ) (vcge_s8 a_vcge_s8 b_vcge_s8 ))))
(display "vcge_s8" (current-error-port))
(define (vcge_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcge_u16 (bitvector 64))
(define-symbolic b_vcge_u16 (bitvector 64))
(verify (assert (equal? (vcge_u16.check a_vcge_u16 b_vcge_u16 ) (vcge_u16 a_vcge_u16 b_vcge_u16 ))))
(display "vcge_u16" (current-error-port))
(define (vcge_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcge_u32 (bitvector 64))
(define-symbolic b_vcge_u32 (bitvector 64))
(verify (assert (equal? (vcge_u32.check a_vcge_u32 b_vcge_u32 ) (vcge_u32 a_vcge_u32 b_vcge_u32 ))))
(display "vcge_u32" (current-error-port))
(define (vcge_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcge_u64 (bitvector 64))
(define-symbolic b_vcge_u64 (bitvector 64))
(verify (assert (equal? (vcge_u64.check a_vcge_u64 b_vcge_u64 ) (vcge_u64 a_vcge_u64 b_vcge_u64 ))))
(display "vcge_u64" (current-error-port))
(define (vcge_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcge_u8 (bitvector 64))
(define-symbolic b_vcge_u8 (bitvector 64))
(verify (assert (equal? (vcge_u8.check a_vcge_u8 b_vcge_u8 ) (vcge_u8 a_vcge_u8 b_vcge_u8 ))))
(display "vcge_u8" (current-error-port))
(define (vcged_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcged_s64 (bitvector 64))
(define-symbolic b_vcged_s64 (bitvector 64))
(verify (assert (equal? (vcged_s64.check a_vcged_s64 b_vcged_s64 ) (vcged_s64 a_vcged_s64 b_vcged_s64 ))))
(display "vcged_s64" (current-error-port))
(define (vcged_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcged_u64 (bitvector 64))
(define-symbolic b_vcged_u64 (bitvector 64))
(verify (assert (equal? (vcged_u64.check a_vcged_u64 b_vcged_u64 ) (vcged_u64 a_vcged_u64 b_vcged_u64 ))))
(display "vcged_u64" (current-error-port))
(define (vcgeq_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgeq_s16 (bitvector 128))
(define-symbolic b_vcgeq_s16 (bitvector 128))
(verify (assert (equal? (vcgeq_s16.check a_vcgeq_s16 b_vcgeq_s16 ) (vcgeq_s16 a_vcgeq_s16 b_vcgeq_s16 ))))
(display "vcgeq_s16" (current-error-port))
(define (vcgeq_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgeq_s32 (bitvector 128))
(define-symbolic b_vcgeq_s32 (bitvector 128))
(verify (assert (equal? (vcgeq_s32.check a_vcgeq_s32 b_vcgeq_s32 ) (vcgeq_s32 a_vcgeq_s32 b_vcgeq_s32 ))))
(display "vcgeq_s32" (current-error-port))
(define (vcgeq_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgeq_s64 (bitvector 128))
(define-symbolic b_vcgeq_s64 (bitvector 128))
(verify (assert (equal? (vcgeq_s64.check a_vcgeq_s64 b_vcgeq_s64 ) (vcgeq_s64 a_vcgeq_s64 b_vcgeq_s64 ))))
(display "vcgeq_s64" (current-error-port))
(define (vcgeq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgeq_s8 (bitvector 128))
(define-symbolic b_vcgeq_s8 (bitvector 128))
(verify (assert (equal? (vcgeq_s8.check a_vcgeq_s8 b_vcgeq_s8 ) (vcgeq_s8 a_vcgeq_s8 b_vcgeq_s8 ))))
(display "vcgeq_s8" (current-error-port))
(define (vcgeq_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgeq_u16 (bitvector 128))
(define-symbolic b_vcgeq_u16 (bitvector 128))
(verify (assert (equal? (vcgeq_u16.check a_vcgeq_u16 b_vcgeq_u16 ) (vcgeq_u16 a_vcgeq_u16 b_vcgeq_u16 ))))
(display "vcgeq_u16" (current-error-port))
(define (vcgeq_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgeq_u32 (bitvector 128))
(define-symbolic b_vcgeq_u32 (bitvector 128))
(verify (assert (equal? (vcgeq_u32.check a_vcgeq_u32 b_vcgeq_u32 ) (vcgeq_u32 a_vcgeq_u32 b_vcgeq_u32 ))))
(display "vcgeq_u32" (current-error-port))
(define (vcgeq_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgeq_u64 (bitvector 128))
(define-symbolic b_vcgeq_u64 (bitvector 128))
(verify (assert (equal? (vcgeq_u64.check a_vcgeq_u64 b_vcgeq_u64 ) (vcgeq_u64 a_vcgeq_u64 b_vcgeq_u64 ))))
(display "vcgeq_u64" (current-error-port))
(define (vcgeq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgeq_u8 (bitvector 128))
(define-symbolic b_vcgeq_u8 (bitvector 128))
(verify (assert (equal? (vcgeq_u8.check a_vcgeq_u8 b_vcgeq_u8 ) (vcgeq_u8 a_vcgeq_u8 b_vcgeq_u8 ))))
(display "vcgeq_u8" (current-error-port))
(define (vcgez_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsge  %5  (bv 0 16)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgez_s16 (bitvector 64))
(verify (assert (equal? (vcgez_s16.check a_vcgez_s16 ) (vcgez_s16 a_vcgez_s16 ))))
(display "vcgez_s16" (current-error-port))
(define (vcgez_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsge  %5  (bv 0 32)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgez_s32 (bitvector 64))
(verify (assert (equal? (vcgez_s32.check a_vcgez_s32 ) (vcgez_s32 a_vcgez_s32 ))))
(display "vcgez_s32" (current-error-port))
(define (vcgez_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsge  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgez_s64 (bitvector 64))
(verify (assert (equal? (vcgez_s64.check a_vcgez_s64 ) (vcgez_s64 a_vcgez_s64 ))))
(display "vcgez_s64" (current-error-port))
(define (vcgez_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsge  %5  (bv 0 8)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgez_s8 (bitvector 64))
(verify (assert (equal? (vcgez_s8.check a_vcgez_s8 ) (vcgez_s8 a_vcgez_s8 ))))
(display "vcgez_s8" (current-error-port))
(define (vcgezd_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsge  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgezd_s64 (bitvector 64))
(verify (assert (equal? (vcgezd_s64.check a_vcgezd_s64 ) (vcgezd_s64 a_vcgezd_s64 ))))
(display "vcgezd_s64" (current-error-port))
(define (vcgezq_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsge  %5  (bv 0 16)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgezq_s16 (bitvector 128))
(verify (assert (equal? (vcgezq_s16.check a_vcgezq_s16 ) (vcgezq_s16 a_vcgezq_s16 ))))
(display "vcgezq_s16" (current-error-port))
(define (vcgezq_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsge  %5  (bv 0 32)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgezq_s32 (bitvector 128))
(verify (assert (equal? (vcgezq_s32.check a_vcgezq_s32 ) (vcgezq_s32 a_vcgezq_s32 ))))
(display "vcgezq_s32" (current-error-port))
(define (vcgezq_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsge  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgezq_s64 (bitvector 128))
(verify (assert (equal? (vcgezq_s64.check a_vcgezq_s64 ) (vcgezq_s64 a_vcgezq_s64 ))))
(display "vcgezq_s64" (current-error-port))
(define (vcgezq_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsge  %5  (bv 0 8)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgezq_s8 (bitvector 128))
(verify (assert (equal? (vcgezq_s8.check a_vcgezq_s8 ) (vcgezq_s8 a_vcgezq_s8 ))))
(display "vcgezq_s8" (current-error-port))
(define (vcgt_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgt_s16 (bitvector 64))
(define-symbolic b_vcgt_s16 (bitvector 64))
(verify (assert (equal? (vcgt_s16.check a_vcgt_s16 b_vcgt_s16 ) (vcgt_s16 a_vcgt_s16 b_vcgt_s16 ))))
(display "vcgt_s16" (current-error-port))
(define (vcgt_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgt_s32 (bitvector 64))
(define-symbolic b_vcgt_s32 (bitvector 64))
(verify (assert (equal? (vcgt_s32.check a_vcgt_s32 b_vcgt_s32 ) (vcgt_s32 a_vcgt_s32 b_vcgt_s32 ))))
(display "vcgt_s32" (current-error-port))
(define (vcgt_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgt_s64 (bitvector 64))
(define-symbolic b_vcgt_s64 (bitvector 64))
(verify (assert (equal? (vcgt_s64.check a_vcgt_s64 b_vcgt_s64 ) (vcgt_s64 a_vcgt_s64 b_vcgt_s64 ))))
(display "vcgt_s64" (current-error-port))
(define (vcgt_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgt_s8 (bitvector 64))
(define-symbolic b_vcgt_s8 (bitvector 64))
(verify (assert (equal? (vcgt_s8.check a_vcgt_s8 b_vcgt_s8 ) (vcgt_s8 a_vcgt_s8 b_vcgt_s8 ))))
(display "vcgt_s8" (current-error-port))
(define (vcgt_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgt_u16 (bitvector 64))
(define-symbolic b_vcgt_u16 (bitvector 64))
(verify (assert (equal? (vcgt_u16.check a_vcgt_u16 b_vcgt_u16 ) (vcgt_u16 a_vcgt_u16 b_vcgt_u16 ))))
(display "vcgt_u16" (current-error-port))
(define (vcgt_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgt_u32 (bitvector 64))
(define-symbolic b_vcgt_u32 (bitvector 64))
(verify (assert (equal? (vcgt_u32.check a_vcgt_u32 b_vcgt_u32 ) (vcgt_u32 a_vcgt_u32 b_vcgt_u32 ))))
(display "vcgt_u32" (current-error-port))
(define (vcgt_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgt_u64 (bitvector 64))
(define-symbolic b_vcgt_u64 (bitvector 64))
(verify (assert (equal? (vcgt_u64.check a_vcgt_u64 b_vcgt_u64 ) (vcgt_u64 a_vcgt_u64 b_vcgt_u64 ))))
(display "vcgt_u64" (current-error-port))
(define (vcgt_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgt_u8 (bitvector 64))
(define-symbolic b_vcgt_u8 (bitvector 64))
(verify (assert (equal? (vcgt_u8.check a_vcgt_u8 b_vcgt_u8 ) (vcgt_u8 a_vcgt_u8 b_vcgt_u8 ))))
(display "vcgt_u8" (current-error-port))
(define (vcgtd_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgtd_s64 (bitvector 64))
(define-symbolic b_vcgtd_s64 (bitvector 64))
(verify (assert (equal? (vcgtd_s64.check a_vcgtd_s64 b_vcgtd_s64 ) (vcgtd_s64 a_vcgtd_s64 b_vcgtd_s64 ))))
(display "vcgtd_s64" (current-error-port))
(define (vcgtd_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgtd_u64 (bitvector 64))
(define-symbolic b_vcgtd_u64 (bitvector 64))
(verify (assert (equal? (vcgtd_u64.check a_vcgtd_u64 b_vcgtd_u64 ) (vcgtd_u64 a_vcgtd_u64 b_vcgtd_u64 ))))
(display "vcgtd_u64" (current-error-port))
(define (vcgtq_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgtq_s16 (bitvector 128))
(define-symbolic b_vcgtq_s16 (bitvector 128))
(verify (assert (equal? (vcgtq_s16.check a_vcgtq_s16 b_vcgtq_s16 ) (vcgtq_s16 a_vcgtq_s16 b_vcgtq_s16 ))))
(display "vcgtq_s16" (current-error-port))
(define (vcgtq_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgtq_s32 (bitvector 128))
(define-symbolic b_vcgtq_s32 (bitvector 128))
(verify (assert (equal? (vcgtq_s32.check a_vcgtq_s32 b_vcgtq_s32 ) (vcgtq_s32 a_vcgtq_s32 b_vcgtq_s32 ))))
(display "vcgtq_s32" (current-error-port))
(define (vcgtq_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgtq_s64 (bitvector 128))
(define-symbolic b_vcgtq_s64 (bitvector 128))
(verify (assert (equal? (vcgtq_s64.check a_vcgtq_s64 b_vcgtq_s64 ) (vcgtq_s64 a_vcgtq_s64 b_vcgtq_s64 ))))
(display "vcgtq_s64" (current-error-port))
(define (vcgtq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgtq_s8 (bitvector 128))
(define-symbolic b_vcgtq_s8 (bitvector 128))
(verify (assert (equal? (vcgtq_s8.check a_vcgtq_s8 b_vcgtq_s8 ) (vcgtq_s8 a_vcgtq_s8 b_vcgtq_s8 ))))
(display "vcgtq_s8" (current-error-port))
(define (vcgtq_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgtq_u16 (bitvector 128))
(define-symbolic b_vcgtq_u16 (bitvector 128))
(verify (assert (equal? (vcgtq_u16.check a_vcgtq_u16 b_vcgtq_u16 ) (vcgtq_u16 a_vcgtq_u16 b_vcgtq_u16 ))))
(display "vcgtq_u16" (current-error-port))
(define (vcgtq_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgtq_u32 (bitvector 128))
(define-symbolic b_vcgtq_u32 (bitvector 128))
(verify (assert (equal? (vcgtq_u32.check a_vcgtq_u32 b_vcgtq_u32 ) (vcgtq_u32 a_vcgtq_u32 b_vcgtq_u32 ))))
(display "vcgtq_u32" (current-error-port))
(define (vcgtq_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgtq_u64 (bitvector 128))
(define-symbolic b_vcgtq_u64 (bitvector 128))
(verify (assert (equal? (vcgtq_u64.check a_vcgtq_u64 b_vcgtq_u64 ) (vcgtq_u64 a_vcgtq_u64 b_vcgtq_u64 ))))
(display "vcgtq_u64" (current-error-port))
(define (vcgtq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcgtq_u8 (bitvector 128))
(define-symbolic b_vcgtq_u8 (bitvector 128))
(verify (assert (equal? (vcgtq_u8.check a_vcgtq_u8 b_vcgtq_u8 ) (vcgtq_u8 a_vcgtq_u8 b_vcgtq_u8 ))))
(display "vcgtq_u8" (current-error-port))
(define (vcgtz_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsgt  %5  (bv 0 16)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgtz_s16 (bitvector 64))
(verify (assert (equal? (vcgtz_s16.check a_vcgtz_s16 ) (vcgtz_s16 a_vcgtz_s16 ))))
(display "vcgtz_s16" (current-error-port))
(define (vcgtz_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsgt  %5  (bv 0 32)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgtz_s32 (bitvector 64))
(verify (assert (equal? (vcgtz_s32.check a_vcgtz_s32 ) (vcgtz_s32 a_vcgtz_s32 ))))
(display "vcgtz_s32" (current-error-port))
(define (vcgtz_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsgt  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgtz_s64 (bitvector 64))
(verify (assert (equal? (vcgtz_s64.check a_vcgtz_s64 ) (vcgtz_s64 a_vcgtz_s64 ))))
(display "vcgtz_s64" (current-error-port))
(define (vcgtz_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsgt  %5  (bv 0 8)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgtz_s8 (bitvector 64))
(verify (assert (equal? (vcgtz_s8.check a_vcgtz_s8 ) (vcgtz_s8 a_vcgtz_s8 ))))
(display "vcgtz_s8" (current-error-port))
(define (vcgtzd_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsgt  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgtzd_s64 (bitvector 64))
(verify (assert (equal? (vcgtzd_s64.check a_vcgtzd_s64 ) (vcgtzd_s64 a_vcgtzd_s64 ))))
(display "vcgtzd_s64" (current-error-port))
(define (vcgtzq_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsgt  %5  (bv 0 16)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgtzq_s16 (bitvector 128))
(verify (assert (equal? (vcgtzq_s16.check a_vcgtzq_s16 ) (vcgtzq_s16 a_vcgtzq_s16 ))))
(display "vcgtzq_s16" (current-error-port))
(define (vcgtzq_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsgt  %5  (bv 0 32)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgtzq_s32 (bitvector 128))
(verify (assert (equal? (vcgtzq_s32.check a_vcgtzq_s32 ) (vcgtzq_s32 a_vcgtzq_s32 ))))
(display "vcgtzq_s32" (current-error-port))
(define (vcgtzq_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsgt  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgtzq_s64 (bitvector 128))
(verify (assert (equal? (vcgtzq_s64.check a_vcgtzq_s64 ) (vcgtzq_s64 a_vcgtzq_s64 ))))
(display "vcgtzq_s64" (current-error-port))
(define (vcgtzq_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsgt  %5  (bv 0 8)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcgtzq_s8 (bitvector 128))
(verify (assert (equal? (vcgtzq_s8.check a_vcgtzq_s8 ) (vcgtzq_s8 a_vcgtzq_s8 ))))
(display "vcgtzq_s8" (current-error-port))
(define (vcle_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcle_s16 (bitvector 64))
(define-symbolic b_vcle_s16 (bitvector 64))
(verify (assert (equal? (vcle_s16.check a_vcle_s16 b_vcle_s16 ) (vcle_s16 a_vcle_s16 b_vcle_s16 ))))
(display "vcle_s16" (current-error-port))
(define (vcle_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcle_s32 (bitvector 64))
(define-symbolic b_vcle_s32 (bitvector 64))
(verify (assert (equal? (vcle_s32.check a_vcle_s32 b_vcle_s32 ) (vcle_s32 a_vcle_s32 b_vcle_s32 ))))
(display "vcle_s32" (current-error-port))
(define (vcle_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcle_s64 (bitvector 64))
(define-symbolic b_vcle_s64 (bitvector 64))
(verify (assert (equal? (vcle_s64.check a_vcle_s64 b_vcle_s64 ) (vcle_s64 a_vcle_s64 b_vcle_s64 ))))
(display "vcle_s64" (current-error-port))
(define (vcle_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcle_s8 (bitvector 64))
(define-symbolic b_vcle_s8 (bitvector 64))
(verify (assert (equal? (vcle_s8.check a_vcle_s8 b_vcle_s8 ) (vcle_s8 a_vcle_s8 b_vcle_s8 ))))
(display "vcle_s8" (current-error-port))
(define (vcle_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcle_u16 (bitvector 64))
(define-symbolic b_vcle_u16 (bitvector 64))
(verify (assert (equal? (vcle_u16.check a_vcle_u16 b_vcle_u16 ) (vcle_u16 a_vcle_u16 b_vcle_u16 ))))
(display "vcle_u16" (current-error-port))
(define (vcle_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcle_u32 (bitvector 64))
(define-symbolic b_vcle_u32 (bitvector 64))
(verify (assert (equal? (vcle_u32.check a_vcle_u32 b_vcle_u32 ) (vcle_u32 a_vcle_u32 b_vcle_u32 ))))
(display "vcle_u32" (current-error-port))
(define (vcle_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcle_u64 (bitvector 64))
(define-symbolic b_vcle_u64 (bitvector 64))
(verify (assert (equal? (vcle_u64.check a_vcle_u64 b_vcle_u64 ) (vcle_u64 a_vcle_u64 b_vcle_u64 ))))
(display "vcle_u64" (current-error-port))
(define (vcle_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcle_u8 (bitvector 64))
(define-symbolic b_vcle_u8 (bitvector 64))
(verify (assert (equal? (vcle_u8.check a_vcle_u8 b_vcle_u8 ) (vcle_u8 a_vcle_u8 b_vcle_u8 ))))
(display "vcle_u8" (current-error-port))
(define (vcled_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcled_s64 (bitvector 64))
(define-symbolic b_vcled_s64 (bitvector 64))
(verify (assert (equal? (vcled_s64.check a_vcled_s64 b_vcled_s64 ) (vcled_s64 a_vcled_s64 b_vcled_s64 ))))
(display "vcled_s64" (current-error-port))
(define (vcled_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcled_u64 (bitvector 64))
(define-symbolic b_vcled_u64 (bitvector 64))
(verify (assert (equal? (vcled_u64.check a_vcled_u64 b_vcled_u64 ) (vcled_u64 a_vcled_u64 b_vcled_u64 ))))
(display "vcled_u64" (current-error-port))
(define (vcleq_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcleq_s16 (bitvector 128))
(define-symbolic b_vcleq_s16 (bitvector 128))
(verify (assert (equal? (vcleq_s16.check a_vcleq_s16 b_vcleq_s16 ) (vcleq_s16 a_vcleq_s16 b_vcleq_s16 ))))
(display "vcleq_s16" (current-error-port))
(define (vcleq_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcleq_s32 (bitvector 128))
(define-symbolic b_vcleq_s32 (bitvector 128))
(verify (assert (equal? (vcleq_s32.check a_vcleq_s32 b_vcleq_s32 ) (vcleq_s32 a_vcleq_s32 b_vcleq_s32 ))))
(display "vcleq_s32" (current-error-port))
(define (vcleq_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcleq_s64 (bitvector 128))
(define-symbolic b_vcleq_s64 (bitvector 128))
(verify (assert (equal? (vcleq_s64.check a_vcleq_s64 b_vcleq_s64 ) (vcleq_s64 a_vcleq_s64 b_vcleq_s64 ))))
(display "vcleq_s64" (current-error-port))
(define (vcleq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcleq_s8 (bitvector 128))
(define-symbolic b_vcleq_s8 (bitvector 128))
(verify (assert (equal? (vcleq_s8.check a_vcleq_s8 b_vcleq_s8 ) (vcleq_s8 a_vcleq_s8 b_vcleq_s8 ))))
(display "vcleq_s8" (current-error-port))
(define (vcleq_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcleq_u16 (bitvector 128))
(define-symbolic b_vcleq_u16 (bitvector 128))
(verify (assert (equal? (vcleq_u16.check a_vcleq_u16 b_vcleq_u16 ) (vcleq_u16 a_vcleq_u16 b_vcleq_u16 ))))
(display "vcleq_u16" (current-error-port))
(define (vcleq_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcleq_u32 (bitvector 128))
(define-symbolic b_vcleq_u32 (bitvector 128))
(verify (assert (equal? (vcleq_u32.check a_vcleq_u32 b_vcleq_u32 ) (vcleq_u32 a_vcleq_u32 b_vcleq_u32 ))))
(display "vcleq_u32" (current-error-port))
(define (vcleq_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcleq_u64 (bitvector 128))
(define-symbolic b_vcleq_u64 (bitvector 128))
(verify (assert (equal? (vcleq_u64.check a_vcleq_u64 b_vcleq_u64 ) (vcleq_u64 a_vcleq_u64 b_vcleq_u64 ))))
(display "vcleq_u64" (current-error-port))
(define (vcleq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsge  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcleq_u8 (bitvector 128))
(define-symbolic b_vcleq_u8 (bitvector 128))
(verify (assert (equal? (vcleq_u8.check a_vcleq_u8 b_vcleq_u8 ) (vcleq_u8 a_vcleq_u8 b_vcleq_u8 ))))
(display "vcleq_u8" (current-error-port))
(define (vclez_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsle  %5  (bv 0 16)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vclez_s16 (bitvector 64))
(verify (assert (equal? (vclez_s16.check a_vclez_s16 ) (vclez_s16 a_vclez_s16 ))))
(display "vclez_s16" (current-error-port))
(define (vclez_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsle  %5  (bv 0 32)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vclez_s32 (bitvector 64))
(verify (assert (equal? (vclez_s32.check a_vclez_s32 ) (vclez_s32 a_vclez_s32 ))))
(display "vclez_s32" (current-error-port))
(define (vclez_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsle  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vclez_s64 (bitvector 64))
(verify (assert (equal? (vclez_s64.check a_vclez_s64 ) (vclez_s64 a_vclez_s64 ))))
(display "vclez_s64" (current-error-port))
(define (vclez_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsle  %5  (bv 0 8)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vclez_s8 (bitvector 64))
(verify (assert (equal? (vclez_s8.check a_vclez_s8 ) (vclez_s8 a_vclez_s8 ))))
(display "vclez_s8" (current-error-port))
(define (vclezd_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsle  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vclezd_s64 (bitvector 64))
(verify (assert (equal? (vclezd_s64.check a_vclezd_s64 ) (vclezd_s64 a_vclezd_s64 ))))
(display "vclezd_s64" (current-error-port))
(define (vclezq_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsle  %5  (bv 0 16)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vclezq_s16 (bitvector 128))
(verify (assert (equal? (vclezq_s16.check a_vclezq_s16 ) (vclezq_s16 a_vclezq_s16 ))))
(display "vclezq_s16" (current-error-port))
(define (vclezq_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsle  %5  (bv 0 32)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vclezq_s32 (bitvector 128))
(verify (assert (equal? (vclezq_s32.check a_vclezq_s32 ) (vclezq_s32 a_vclezq_s32 ))))
(display "vclezq_s32" (current-error-port))
(define (vclezq_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsle  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vclezq_s64 (bitvector 128))
(verify (assert (equal? (vclezq_s64.check a_vclezq_s64 ) (vclezq_s64 a_vclezq_s64 ))))
(display "vclezq_s64" (current-error-port))
(define (vclezq_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvsle  %5  (bv 0 8)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vclezq_s8 (bitvector 128))
(verify (assert (equal? (vclezq_s8.check a_vclezq_s8 ) (vclezq_s8 a_vclezq_s8 ))))
(display "vclezq_s8" (current-error-port))
(define (vclt_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vclt_s16 (bitvector 64))
(define-symbolic b_vclt_s16 (bitvector 64))
(verify (assert (equal? (vclt_s16.check a_vclt_s16 b_vclt_s16 ) (vclt_s16 a_vclt_s16 b_vclt_s16 ))))
(display "vclt_s16" (current-error-port))
(define (vclt_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vclt_s32 (bitvector 64))
(define-symbolic b_vclt_s32 (bitvector 64))
(verify (assert (equal? (vclt_s32.check a_vclt_s32 b_vclt_s32 ) (vclt_s32 a_vclt_s32 b_vclt_s32 ))))
(display "vclt_s32" (current-error-port))
(define (vclt_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vclt_s64 (bitvector 64))
(define-symbolic b_vclt_s64 (bitvector 64))
(verify (assert (equal? (vclt_s64.check a_vclt_s64 b_vclt_s64 ) (vclt_s64 a_vclt_s64 b_vclt_s64 ))))
(display "vclt_s64" (current-error-port))
(define (vclt_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vclt_s8 (bitvector 64))
(define-symbolic b_vclt_s8 (bitvector 64))
(verify (assert (equal? (vclt_s8.check a_vclt_s8 b_vclt_s8 ) (vclt_s8 a_vclt_s8 b_vclt_s8 ))))
(display "vclt_s8" (current-error-port))
(define (vclt_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vclt_u16 (bitvector 64))
(define-symbolic b_vclt_u16 (bitvector 64))
(verify (assert (equal? (vclt_u16.check a_vclt_u16 b_vclt_u16 ) (vclt_u16 a_vclt_u16 b_vclt_u16 ))))
(display "vclt_u16" (current-error-port))
(define (vclt_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vclt_u32 (bitvector 64))
(define-symbolic b_vclt_u32 (bitvector 64))
(verify (assert (equal? (vclt_u32.check a_vclt_u32 b_vclt_u32 ) (vclt_u32 a_vclt_u32 b_vclt_u32 ))))
(display "vclt_u32" (current-error-port))
(define (vclt_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vclt_u64 (bitvector 64))
(define-symbolic b_vclt_u64 (bitvector 64))
(verify (assert (equal? (vclt_u64.check a_vclt_u64 b_vclt_u64 ) (vclt_u64 a_vclt_u64 b_vclt_u64 ))))
(display "vclt_u64" (current-error-port))
(define (vclt_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vclt_u8 (bitvector 64))
(define-symbolic b_vclt_u8 (bitvector 64))
(verify (assert (equal? (vclt_u8.check a_vclt_u8 b_vclt_u8 ) (vclt_u8 a_vclt_u8 b_vclt_u8 ))))
(display "vclt_u8" (current-error-port))
(define (vcltd_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcltd_s64 (bitvector 64))
(define-symbolic b_vcltd_s64 (bitvector 64))
(verify (assert (equal? (vcltd_s64.check a_vcltd_s64 b_vcltd_s64 ) (vcltd_s64 a_vcltd_s64 b_vcltd_s64 ))))
(display "vcltd_s64" (current-error-port))
(define (vcltd_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcltd_u64 (bitvector 64))
(define-symbolic b_vcltd_u64 (bitvector 64))
(verify (assert (equal? (vcltd_u64.check a_vcltd_u64 b_vcltd_u64 ) (vcltd_u64 a_vcltd_u64 b_vcltd_u64 ))))
(display "vcltd_u64" (current-error-port))
(define (vcltq_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcltq_s16 (bitvector 128))
(define-symbolic b_vcltq_s16 (bitvector 128))
(verify (assert (equal? (vcltq_s16.check a_vcltq_s16 b_vcltq_s16 ) (vcltq_s16 a_vcltq_s16 b_vcltq_s16 ))))
(display "vcltq_s16" (current-error-port))
(define (vcltq_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcltq_s32 (bitvector 128))
(define-symbolic b_vcltq_s32 (bitvector 128))
(verify (assert (equal? (vcltq_s32.check a_vcltq_s32 b_vcltq_s32 ) (vcltq_s32 a_vcltq_s32 b_vcltq_s32 ))))
(display "vcltq_s32" (current-error-port))
(define (vcltq_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcltq_s64 (bitvector 128))
(define-symbolic b_vcltq_s64 (bitvector 128))
(verify (assert (equal? (vcltq_s64.check a_vcltq_s64 b_vcltq_s64 ) (vcltq_s64 a_vcltq_s64 b_vcltq_s64 ))))
(display "vcltq_s64" (current-error-port))
(define (vcltq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcltq_s8 (bitvector 128))
(define-symbolic b_vcltq_s8 (bitvector 128))
(verify (assert (equal? (vcltq_s8.check a_vcltq_s8 b_vcltq_s8 ) (vcltq_s8 a_vcltq_s8 b_vcltq_s8 ))))
(display "vcltq_s8" (current-error-port))
(define (vcltq_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcltq_u16 (bitvector 128))
(define-symbolic b_vcltq_u16 (bitvector 128))
(verify (assert (equal? (vcltq_u16.check a_vcltq_u16 b_vcltq_u16 ) (vcltq_u16 a_vcltq_u16 b_vcltq_u16 ))))
(display "vcltq_u16" (current-error-port))
(define (vcltq_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcltq_u32 (bitvector 128))
(define-symbolic b_vcltq_u32 (bitvector 128))
(verify (assert (equal? (vcltq_u32.check a_vcltq_u32 b_vcltq_u32 ) (vcltq_u32 a_vcltq_u32 b_vcltq_u32 ))))
(display "vcltq_u32" (current-error-port))
(define (vcltq_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcltq_u64 (bitvector 128))
(define-symbolic b_vcltq_u64 (bitvector 128))
(verify (assert (equal? (vcltq_u64.check a_vcltq_u64 b_vcltq_u64 ) (vcltq_u64 a_vcltq_u64 b_vcltq_u64 ))))
(display "vcltq_u64" (current-error-port))
(define (vcltq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %11 (extract  %4 e0.new a))
  (define %13.downcasted0 (bvsgt  %5  %11))
  (define %20 (if (equal? %13.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vcltq_u8 (bitvector 128))
(define-symbolic b_vcltq_u8 (bitvector 128))
(verify (assert (equal? (vcltq_u8.check a_vcltq_u8 b_vcltq_u8 ) (vcltq_u8 a_vcltq_u8 b_vcltq_u8 ))))
(display "vcltq_u8" (current-error-port))
(define (vcltz_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvslt  %5  (bv 0 16)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcltz_s16 (bitvector 64))
(verify (assert (equal? (vcltz_s16.check a_vcltz_s16 ) (vcltz_s16 a_vcltz_s16 ))))
(display "vcltz_s16" (current-error-port))
(define (vcltz_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvslt  %5  (bv 0 32)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcltz_s32 (bitvector 64))
(verify (assert (equal? (vcltz_s32.check a_vcltz_s32 ) (vcltz_s32 a_vcltz_s32 ))))
(display "vcltz_s32" (current-error-port))
(define (vcltz_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvslt  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcltz_s64 (bitvector 64))
(verify (assert (equal? (vcltz_s64.check a_vcltz_s64 ) (vcltz_s64 a_vcltz_s64 ))))
(display "vcltz_s64" (current-error-port))
(define (vcltz_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvslt  %5  (bv 0 8)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcltz_s8 (bitvector 64))
(verify (assert (equal? (vcltz_s8.check a_vcltz_s8 ) (vcltz_s8 a_vcltz_s8 ))))
(display "vcltz_s8" (current-error-port))
(define (vcltzd_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvslt  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcltzd_s64 (bitvector 64))
(verify (assert (equal? (vcltzd_s64.check a_vcltzd_s64 ) (vcltzd_s64 a_vcltzd_s64 ))))
(display "vcltzd_s64" (current-error-port))
(define (vcltzq_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvslt  %5  (bv 0 16)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 65535 16) (bv 0 16)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcltzq_s16 (bitvector 128))
(verify (assert (equal? (vcltzq_s16.check a_vcltzq_s16 ) (vcltzq_s16 a_vcltzq_s16 ))))
(display "vcltzq_s16" (current-error-port))
(define (vcltzq_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvslt  %5  (bv 0 32)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 4294967295 32) (bv 0 32)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcltzq_s32 (bitvector 128))
(verify (assert (equal? (vcltzq_s32.check a_vcltzq_s32 ) (vcltzq_s32 a_vcltzq_s32 ))))
(display "vcltzq_s32" (current-error-port))
(define (vcltzq_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvslt  %5  (bv 0 64)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcltzq_s64 (bitvector 128))
(verify (assert (equal? (vcltzq_s64.check a_vcltzq_s64 ) (vcltzq_s64 a_vcltzq_s64 ))))
(display "vcltzq_s64" (current-error-port))
(define (vcltzq_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvslt  %5  (bv 0 8)))
  (define %14 (if (equal? %7.downcasted0 #t) (bv 255 8) (bv 0 8)))
  %14
 )
 )
)
)
)
result)
(define-symbolic a_vcltzq_s8 (bitvector 128))
(verify (assert (equal? (vcltzq_s8.check a_vcltzq_s8 ) (vcltzq_s8 a_vcltzq_s8 ))))
(display "vcltzq_s8" (current-error-port))
(define (vcombine_s16.check  low high )
(define %5fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %19 (+  %inner.it  0))
  (define %20 (+  %19  63))
  (define %1 (extract  %20 %19 high))
  (define %3 (extract  %20 %19 low))
  (define %4 (concat %1 %3))
  %4
 )
 )
)
)
)
%5fakeReturn)
(define-symbolic low_vcombine_s16 (bitvector 64))
(define-symbolic high_vcombine_s16 (bitvector 64))
(verify (assert (equal? (vcombine_s16.check low_vcombine_s16 high_vcombine_s16 ) (vcombine_s16 low_vcombine_s16 high_vcombine_s16 ))))
(display "vcombine_s16" (current-error-port))
(define (vcombine_s32.check  low high )
(define %5fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %19 (+  %inner.it  0))
  (define %20 (+  %19  63))
  (define %1 (extract  %20 %19 high))
  (define %3 (extract  %20 %19 low))
  (define %4 (concat %1 %3))
  %4
 )
 )
)
)
)
%5fakeReturn)
(define-symbolic low_vcombine_s32 (bitvector 64))
(define-symbolic high_vcombine_s32 (bitvector 64))
(verify (assert (equal? (vcombine_s32.check low_vcombine_s32 high_vcombine_s32 ) (vcombine_s32 low_vcombine_s32 high_vcombine_s32 ))))
(display "vcombine_s32" (current-error-port))
(define (vcombine_s64.check  low high )
(define %5fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %19 (+  %inner.it  0))
  (define %20 (+  %19  63))
  (define %1 (extract  %20 %19 high))
  (define %3 (extract  %20 %19 low))
  (define %4 (concat %1 %3))
  %4
 )
 )
)
)
)
%5fakeReturn)
(define-symbolic low_vcombine_s64 (bitvector 64))
(define-symbolic high_vcombine_s64 (bitvector 64))
(verify (assert (equal? (vcombine_s64.check low_vcombine_s64 high_vcombine_s64 ) (vcombine_s64 low_vcombine_s64 high_vcombine_s64 ))))
(display "vcombine_s64" (current-error-port))
(define (vcombine_s8.check  low high )
(define %5fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %19 (+  %inner.it  0))
  (define %20 (+  %19  63))
  (define %1 (extract  %20 %19 high))
  (define %3 (extract  %20 %19 low))
  (define %4 (concat %1 %3))
  %4
 )
 )
)
)
)
%5fakeReturn)
(define-symbolic low_vcombine_s8 (bitvector 64))
(define-symbolic high_vcombine_s8 (bitvector 64))
(verify (assert (equal? (vcombine_s8.check low_vcombine_s8 high_vcombine_s8 ) (vcombine_s8 low_vcombine_s8 high_vcombine_s8 ))))
(display "vcombine_s8" (current-error-port))
(define (vcombine_u16.check  low high )
(define %5fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %19 (+  %inner.it  0))
  (define %20 (+  %19  63))
  (define %1 (extract  %20 %19 high))
  (define %3 (extract  %20 %19 low))
  (define %4 (concat %1 %3))
  %4
 )
 )
)
)
)
%5fakeReturn)
(define-symbolic low_vcombine_u16 (bitvector 64))
(define-symbolic high_vcombine_u16 (bitvector 64))
(verify (assert (equal? (vcombine_u16.check low_vcombine_u16 high_vcombine_u16 ) (vcombine_u16 low_vcombine_u16 high_vcombine_u16 ))))
(display "vcombine_u16" (current-error-port))
(define (vcombine_u32.check  low high )
(define %5fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %19 (+  %inner.it  0))
  (define %20 (+  %19  63))
  (define %1 (extract  %20 %19 high))
  (define %3 (extract  %20 %19 low))
  (define %4 (concat %1 %3))
  %4
 )
 )
)
)
)
%5fakeReturn)
(define-symbolic low_vcombine_u32 (bitvector 64))
(define-symbolic high_vcombine_u32 (bitvector 64))
(verify (assert (equal? (vcombine_u32.check low_vcombine_u32 high_vcombine_u32 ) (vcombine_u32 low_vcombine_u32 high_vcombine_u32 ))))
(display "vcombine_u32" (current-error-port))
(define (vcombine_u64.check  low high )
(define %5fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %19 (+  %inner.it  0))
  (define %20 (+  %19  63))
  (define %1 (extract  %20 %19 high))
  (define %3 (extract  %20 %19 low))
  (define %4 (concat %1 %3))
  %4
 )
 )
)
)
)
%5fakeReturn)
(define-symbolic low_vcombine_u64 (bitvector 64))
(define-symbolic high_vcombine_u64 (bitvector 64))
(verify (assert (equal? (vcombine_u64.check low_vcombine_u64 high_vcombine_u64 ) (vcombine_u64 low_vcombine_u64 high_vcombine_u64 ))))
(display "vcombine_u64" (current-error-port))
(define (vcombine_u8.check  low high )
(define %5fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %19 (+  %inner.it  0))
  (define %20 (+  %19  63))
  (define %1 (extract  %20 %19 high))
  (define %3 (extract  %20 %19 low))
  (define %4 (concat %1 %3))
  %4
 )
 )
)
)
)
%5fakeReturn)
(define-symbolic low_vcombine_u8 (bitvector 64))
(define-symbolic high_vcombine_u8 (bitvector 64))
(verify (assert (equal? (vcombine_u8.check low_vcombine_u8 high_vcombine_u8 ) (vcombine_u8 low_vcombine_u8 high_vcombine_u8 ))))
(display "vcombine_u8" (current-error-port))
(define (vdot_s32.check  r a b )
(define result2
(apply
concat
(for/list ([e0.new (reverse (range 0 64 32))])
 (define %120.clone.0 (+  e0.new  31))
 (define %121.clone.0 (extract  %120.clone.0 e0.new r))
 (define result2 %121.clone.0)
 (define %29.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 32 8))])
  (define %4.new0 (+  e0.new  iterator.0.new))
  (define %11.new0 (+  %4.new0  7))
  (define %13 (extract  %11.new0 %4.new0 a))
  (define %14 (sign-extend  %13 (bitvector 32)))
  (define %27 (extract  %11.new0 %4.new0 b))
  (define %28 (sign-extend  %27 (bitvector 32)))
  (define %29 (bvmul  %14  %28))
  %29
 )
))
 (define %126.clone.4.new1 (+  e0.new  31))
 (define %29.acc0 (bvadd %29.ext0.red result2))
 %29.acc0
)
)
)
result2)
(define-symbolic r_vdot_s32 (bitvector 64))
(define-symbolic a_vdot_s32 (bitvector 64))
(define-symbolic b_vdot_s32 (bitvector 64))
(verify (assert (equal? (vdot_s32.check r_vdot_s32 a_vdot_s32 b_vdot_s32 ) (vdot_s32 r_vdot_s32 a_vdot_s32 b_vdot_s32 ))))
(display "vdot_s32" (current-error-port))
(define (vdot_u32.check  r a b )
(define result2
(apply
concat
(for/list ([e0.new (reverse (range 0 64 32))])
 (define %120.clone.0 (+  e0.new  31))
 (define %121.clone.0 (extract  %120.clone.0 e0.new r))
 (define result2 %121.clone.0)
 (define %29.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 32 8))])
  (define %4.new0 (+  e0.new  iterator.0.new))
  (define %11.new0 (+  %4.new0  7))
  (define %13 (extract  %11.new0 %4.new0 a))
  (define %14 (zero-extend  %13 (bitvector 32)))
  (define %27 (extract  %11.new0 %4.new0 b))
  (define %28 (zero-extend  %27 (bitvector 32)))
  (define %29 (bvmul  %14  %28))
  %29
 )
))
 (define %126.clone.4.new1 (+  e0.new  31))
 (define %29.acc0 (bvadd %29.ext0.red result2))
 %29.acc0
)
)
)
result2)
(define-symbolic r_vdot_u32 (bitvector 64))
(define-symbolic a_vdot_u32 (bitvector 64))
(define-symbolic b_vdot_u32 (bitvector 64))
(verify (assert (equal? (vdot_u32.check r_vdot_u32 a_vdot_u32 b_vdot_u32 ) (vdot_u32 r_vdot_u32 a_vdot_u32 b_vdot_u32 ))))
(display "vdot_u32" (current-error-port))
(define (vdotq_s32.check  r a b )
(define result2
(apply
concat
(for/list ([e0.new (reverse (range 0 128 32))])
 (define %120.clone.0 (+  e0.new  31))
 (define %121.clone.0 (extract  %120.clone.0 e0.new r))
 (define result2 %121.clone.0)
 (define %29.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 32 8))])
  (define %4.new0 (+  e0.new  iterator.0.new))
  (define %11.new0 (+  %4.new0  7))
  (define %13 (extract  %11.new0 %4.new0 a))
  (define %14 (sign-extend  %13 (bitvector 32)))
  (define %27 (extract  %11.new0 %4.new0 b))
  (define %28 (sign-extend  %27 (bitvector 32)))
  (define %29 (bvmul  %14  %28))
  %29
 )
))
 (define %126.clone.4.new1 (+  e0.new  31))
 (define %29.acc0 (bvadd %29.ext0.red result2))
 %29.acc0
)
)
)
result2)
(define-symbolic r_vdotq_s32 (bitvector 128))
(define-symbolic a_vdotq_s32 (bitvector 128))
(define-symbolic b_vdotq_s32 (bitvector 128))
(verify (assert (equal? (vdotq_s32.check r_vdotq_s32 a_vdotq_s32 b_vdotq_s32 ) (vdotq_s32 r_vdotq_s32 a_vdotq_s32 b_vdotq_s32 ))))
(display "vdotq_s32" (current-error-port))
(define (vdotq_u32.check  r a b )
(define result2
(apply
concat
(for/list ([e0.new (reverse (range 0 128 32))])
 (define %120.clone.0 (+  e0.new  31))
 (define %121.clone.0 (extract  %120.clone.0 e0.new r))
 (define result2 %121.clone.0)
 (define %29.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 32 8))])
  (define %4.new0 (+  e0.new  iterator.0.new))
  (define %11.new0 (+  %4.new0  7))
  (define %13 (extract  %11.new0 %4.new0 a))
  (define %14 (zero-extend  %13 (bitvector 32)))
  (define %27 (extract  %11.new0 %4.new0 b))
  (define %28 (zero-extend  %27 (bitvector 32)))
  (define %29 (bvmul  %14  %28))
  %29
 )
))
 (define %126.clone.4.new1 (+  e0.new  31))
 (define %29.acc0 (bvadd %29.ext0.red result2))
 %29.acc0
)
)
)
result2)
(define-symbolic r_vdotq_u32 (bitvector 128))
(define-symbolic a_vdotq_u32 (bitvector 128))
(define-symbolic b_vdotq_u32 (bitvector 128))
(verify (assert (equal? (vdotq_u32.check r_vdotq_u32 a_vdotq_u32 b_vdotq_u32 ) (vdotq_u32 r_vdotq_u32 a_vdotq_u32 b_vdotq_u32 ))))
(display "vdotq_u32" (current-error-port))
(define (vdup_n_s16.check  value )
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
(define-symbolic value_vdup_n_s16 (bitvector 16))
(verify (assert (equal? (vdup_n_s16.check value_vdup_n_s16 ) (vdup_n_s16 value_vdup_n_s16 ))))
(display "vdup_n_s16" (current-error-port))
(define (vdup_n_s32.check  value )
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
(define-symbolic value_vdup_n_s32 (bitvector 32))
(verify (assert (equal? (vdup_n_s32.check value_vdup_n_s32 ) (vdup_n_s32 value_vdup_n_s32 ))))
(display "vdup_n_s32" (current-error-port))
(define (vdup_n_s8.check  value )
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
(define-symbolic value_vdup_n_s8 (bitvector 8))
(verify (assert (equal? (vdup_n_s8.check value_vdup_n_s8 ) (vdup_n_s8 value_vdup_n_s8 ))))
(display "vdup_n_s8" (current-error-port))
(define (vdup_n_u16.check  value )
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
(define-symbolic value_vdup_n_u16 (bitvector 16))
(verify (assert (equal? (vdup_n_u16.check value_vdup_n_u16 ) (vdup_n_u16 value_vdup_n_u16 ))))
(display "vdup_n_u16" (current-error-port))
(define (vdup_n_u32.check  value )
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
(define-symbolic value_vdup_n_u32 (bitvector 32))
(verify (assert (equal? (vdup_n_u32.check value_vdup_n_u32 ) (vdup_n_u32 value_vdup_n_u32 ))))
(display "vdup_n_u32" (current-error-port))
(define (vdup_n_u8.check  value )
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
(define-symbolic value_vdup_n_u8 (bitvector 8))
(verify (assert (equal? (vdup_n_u8.check value_vdup_n_u8 ) (vdup_n_u8 value_vdup_n_u8 ))))
(display "vdup_n_u8" (current-error-port))
(define (vdupq_n_s16.check  value )
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
(define-symbolic value_vdupq_n_s16 (bitvector 16))
(verify (assert (equal? (vdupq_n_s16.check value_vdupq_n_s16 ) (vdupq_n_s16 value_vdupq_n_s16 ))))
(display "vdupq_n_s16" (current-error-port))
(define (vdupq_n_s32.check  value )
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
(define-symbolic value_vdupq_n_s32 (bitvector 32))
(verify (assert (equal? (vdupq_n_s32.check value_vdupq_n_s32 ) (vdupq_n_s32 value_vdupq_n_s32 ))))
(display "vdupq_n_s32" (current-error-port))
(define (vdupq_n_s64.check  value )
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
(define-symbolic value_vdupq_n_s64 (bitvector 64))
(verify (assert (equal? (vdupq_n_s64.check value_vdupq_n_s64 ) (vdupq_n_s64 value_vdupq_n_s64 ))))
(display "vdupq_n_s64" (current-error-port))
(define (vdupq_n_s8.check  value )
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
(define-symbolic value_vdupq_n_s8 (bitvector 8))
(verify (assert (equal? (vdupq_n_s8.check value_vdupq_n_s8 ) (vdupq_n_s8 value_vdupq_n_s8 ))))
(display "vdupq_n_s8" (current-error-port))
(define (vdupq_n_u16.check  value )
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
(define-symbolic value_vdupq_n_u16 (bitvector 16))
(verify (assert (equal? (vdupq_n_u16.check value_vdupq_n_u16 ) (vdupq_n_u16 value_vdupq_n_u16 ))))
(display "vdupq_n_u16" (current-error-port))
(define (vdupq_n_u32.check  value )
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
(define-symbolic value_vdupq_n_u32 (bitvector 32))
(verify (assert (equal? (vdupq_n_u32.check value_vdupq_n_u32 ) (vdupq_n_u32 value_vdupq_n_u32 ))))
(display "vdupq_n_u32" (current-error-port))
(define (vdupq_n_u64.check  value )
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
(define-symbolic value_vdupq_n_u64 (bitvector 64))
(verify (assert (equal? (vdupq_n_u64.check value_vdupq_n_u64 ) (vdupq_n_u64 value_vdupq_n_u64 ))))
(display "vdupq_n_u64" (current-error-port))
(define (vdupq_n_u8.check  value )
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
(define-symbolic value_vdupq_n_u8 (bitvector 8))
(verify (assert (equal? (vdupq_n_u8.check value_vdupq_n_u8 ) (vdupq_n_u8 value_vdupq_n_u8 ))))
(display "vdupq_n_u8" (current-error-port))
(define (vget_high_s16.check  a )
(define %4fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %16 (+  %inner.it  64))
  (define %17 (+  %16  63))
  (define %3 (extract  %17 %16 a))
  %3
 )
 )
)
)
)
%4fakeReturn)
(define-symbolic a_vget_high_s16 (bitvector 128))
(verify (assert (equal? (vget_high_s16.check a_vget_high_s16 ) (vget_high_s16 a_vget_high_s16 ))))
(display "vget_high_s16" (current-error-port))
(define (vget_high_s32.check  a )
(define %4fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %16 (+  %inner.it  64))
  (define %17 (+  %16  63))
  (define %3 (extract  %17 %16 a))
  %3
 )
 )
)
)
)
%4fakeReturn)
(define-symbolic a_vget_high_s32 (bitvector 128))
(verify (assert (equal? (vget_high_s32.check a_vget_high_s32 ) (vget_high_s32 a_vget_high_s32 ))))
(display "vget_high_s32" (current-error-port))
(define (vget_high_s64.check  a )
(define %4fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %16 (+  %inner.it  64))
  (define %17 (+  %16  63))
  (define %3 (extract  %17 %16 a))
  %3
 )
 )
)
)
)
%4fakeReturn)
(define-symbolic a_vget_high_s64 (bitvector 128))
(verify (assert (equal? (vget_high_s64.check a_vget_high_s64 ) (vget_high_s64 a_vget_high_s64 ))))
(display "vget_high_s64" (current-error-port))
(define (vget_high_s8.check  a )
(define %4fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %16 (+  %inner.it  64))
  (define %17 (+  %16  63))
  (define %3 (extract  %17 %16 a))
  %3
 )
 )
)
)
)
%4fakeReturn)
(define-symbolic a_vget_high_s8 (bitvector 128))
(verify (assert (equal? (vget_high_s8.check a_vget_high_s8 ) (vget_high_s8 a_vget_high_s8 ))))
(display "vget_high_s8" (current-error-port))
(define (vget_high_u16.check  a )
(define %4fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %16 (+  %inner.it  64))
  (define %17 (+  %16  63))
  (define %3 (extract  %17 %16 a))
  %3
 )
 )
)
)
)
%4fakeReturn)
(define-symbolic a_vget_high_u16 (bitvector 128))
(verify (assert (equal? (vget_high_u16.check a_vget_high_u16 ) (vget_high_u16 a_vget_high_u16 ))))
(display "vget_high_u16" (current-error-port))
(define (vget_high_u32.check  a )
(define %4fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %16 (+  %inner.it  64))
  (define %17 (+  %16  63))
  (define %3 (extract  %17 %16 a))
  %3
 )
 )
)
)
)
%4fakeReturn)
(define-symbolic a_vget_high_u32 (bitvector 128))
(verify (assert (equal? (vget_high_u32.check a_vget_high_u32 ) (vget_high_u32 a_vget_high_u32 ))))
(display "vget_high_u32" (current-error-port))
(define (vget_high_u64.check  a )
(define %4fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %16 (+  %inner.it  64))
  (define %17 (+  %16  63))
  (define %3 (extract  %17 %16 a))
  %3
 )
 )
)
)
)
%4fakeReturn)
(define-symbolic a_vget_high_u64 (bitvector 128))
(verify (assert (equal? (vget_high_u64.check a_vget_high_u64 ) (vget_high_u64 a_vget_high_u64 ))))
(display "vget_high_u64" (current-error-port))
(define (vget_high_u8.check  a )
(define %4fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %16 (+  %inner.it  64))
  (define %17 (+  %16  63))
  (define %3 (extract  %17 %16 a))
  %3
 )
 )
)
)
)
%4fakeReturn)
(define-symbolic a_vget_high_u8 (bitvector 128))
(verify (assert (equal? (vget_high_u8.check a_vget_high_u8 ) (vget_high_u8 a_vget_high_u8 ))))
(display "vget_high_u8" (current-error-port))
(define (vget_low_s16.check  a )
(define %3fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %14 (+  %inner.it  0))
  (define %15 (+  %14  63))
  (define %2 (extract  %15 %14 a))
  %2
 )
 )
)
)
)
%3fakeReturn)
(define-symbolic a_vget_low_s16 (bitvector 128))
(verify (assert (equal? (vget_low_s16.check a_vget_low_s16 ) (vget_low_s16 a_vget_low_s16 ))))
(display "vget_low_s16" (current-error-port))
(define (vget_low_s32.check  a )
(define %3fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %14 (+  %inner.it  0))
  (define %15 (+  %14  63))
  (define %2 (extract  %15 %14 a))
  %2
 )
 )
)
)
)
%3fakeReturn)
(define-symbolic a_vget_low_s32 (bitvector 128))
(verify (assert (equal? (vget_low_s32.check a_vget_low_s32 ) (vget_low_s32 a_vget_low_s32 ))))
(display "vget_low_s32" (current-error-port))
(define (vget_low_s64.check  a )
(define %3fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %14 (+  %inner.it  0))
  (define %15 (+  %14  63))
  (define %2 (extract  %15 %14 a))
  %2
 )
 )
)
)
)
%3fakeReturn)
(define-symbolic a_vget_low_s64 (bitvector 128))
(verify (assert (equal? (vget_low_s64.check a_vget_low_s64 ) (vget_low_s64 a_vget_low_s64 ))))
(display "vget_low_s64" (current-error-port))
(define (vget_low_s8.check  a )
(define %3fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %14 (+  %inner.it  0))
  (define %15 (+  %14  63))
  (define %2 (extract  %15 %14 a))
  %2
 )
 )
)
)
)
%3fakeReturn)
(define-symbolic a_vget_low_s8 (bitvector 128))
(verify (assert (equal? (vget_low_s8.check a_vget_low_s8 ) (vget_low_s8 a_vget_low_s8 ))))
(display "vget_low_s8" (current-error-port))
(define (vget_low_u16.check  a )
(define %3fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %14 (+  %inner.it  0))
  (define %15 (+  %14  63))
  (define %2 (extract  %15 %14 a))
  %2
 )
 )
)
)
)
%3fakeReturn)
(define-symbolic a_vget_low_u16 (bitvector 128))
(verify (assert (equal? (vget_low_u16.check a_vget_low_u16 ) (vget_low_u16 a_vget_low_u16 ))))
(display "vget_low_u16" (current-error-port))
(define (vget_low_u32.check  a )
(define %3fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %14 (+  %inner.it  0))
  (define %15 (+  %14  63))
  (define %2 (extract  %15 %14 a))
  %2
 )
 )
)
)
)
%3fakeReturn)
(define-symbolic a_vget_low_u32 (bitvector 128))
(verify (assert (equal? (vget_low_u32.check a_vget_low_u32 ) (vget_low_u32 a_vget_low_u32 ))))
(display "vget_low_u32" (current-error-port))
(define (vget_low_u64.check  a )
(define %3fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %14 (+  %inner.it  0))
  (define %15 (+  %14  63))
  (define %2 (extract  %15 %14 a))
  %2
 )
 )
)
)
)
%3fakeReturn)
(define-symbolic a_vget_low_u64 (bitvector 128))
(verify (assert (equal? (vget_low_u64.check a_vget_low_u64 ) (vget_low_u64 a_vget_low_u64 ))))
(display "vget_low_u64" (current-error-port))
(define (vget_low_u8.check  a )
(define %3fakeReturn
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%inner.it (reverse (range 0 64 64))])
  (define %14 (+  %inner.it  0))
  (define %15 (+  %14  63))
  (define %2 (extract  %15 %14 a))
  %2
 )
 )
)
)
)
%3fakeReturn)
(define-symbolic a_vget_low_u8 (bitvector 128))
(verify (assert (equal? (vget_low_u8.check a_vget_low_u8 ) (vget_low_u8 a_vget_low_u8 ))))
(display "vget_low_u8" (current-error-port))
(define (vhadd_s16.check  a b )
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
  (define %13.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (extract  16 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhadd_s16 (bitvector 64))
(define-symbolic b_vhadd_s16 (bitvector 64))
(verify (assert (equal? (vhadd_s16.check a_vhadd_s16 b_vhadd_s16 ) (vhadd_s16 a_vhadd_s16 b_vhadd_s16 ))))
(display "vhadd_s16" (current-error-port))
(define (vhadd_s32.check  a b )
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
  (define %13.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (extract  32 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhadd_s32 (bitvector 64))
(define-symbolic b_vhadd_s32 (bitvector 64))
(verify (assert (equal? (vhadd_s32.check a_vhadd_s32 b_vhadd_s32 ) (vhadd_s32 a_vhadd_s32 b_vhadd_s32 ))))
(display "vhadd_s32" (current-error-port))
(define (vhadd_s8.check  a b )
(define result
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
  (define %13.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (extract  8 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhadd_s8 (bitvector 64))
(define-symbolic b_vhadd_s8 (bitvector 64))
(verify (assert (equal? (vhadd_s8.check a_vhadd_s8 b_vhadd_s8 ) (vhadd_s8 a_vhadd_s8 b_vhadd_s8 ))))
(display "vhadd_s8" (current-error-port))
(define (vhadd_u16.check  a b )
(define result
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
  (define %13.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (extract  16 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhadd_u16 (bitvector 64))
(define-symbolic b_vhadd_u16 (bitvector 64))
(verify (assert (equal? (vhadd_u16.check a_vhadd_u16 b_vhadd_u16 ) (vhadd_u16 a_vhadd_u16 b_vhadd_u16 ))))
(display "vhadd_u16" (current-error-port))
(define (vhadd_u32.check  a b )
(define result
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
  (define %13.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (extract  32 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhadd_u32 (bitvector 64))
(define-symbolic b_vhadd_u32 (bitvector 64))
(verify (assert (equal? (vhadd_u32.check a_vhadd_u32 b_vhadd_u32 ) (vhadd_u32 a_vhadd_u32 b_vhadd_u32 ))))
(display "vhadd_u32" (current-error-port))
(define (vhadd_u8.check  a b )
(define result
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
  (define %13.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (extract  8 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhadd_u8 (bitvector 64))
(define-symbolic b_vhadd_u8 (bitvector 64))
(verify (assert (equal? (vhadd_u8.check a_vhadd_u8 b_vhadd_u8 ) (vhadd_u8 a_vhadd_u8 b_vhadd_u8 ))))
(display "vhadd_u8" (current-error-port))
(define (vhaddq_s16.check  a b )
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
  (define %13.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (extract  16 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhaddq_s16 (bitvector 128))
(define-symbolic b_vhaddq_s16 (bitvector 128))
(verify (assert (equal? (vhaddq_s16.check a_vhaddq_s16 b_vhaddq_s16 ) (vhaddq_s16 a_vhaddq_s16 b_vhaddq_s16 ))))
(display "vhaddq_s16" (current-error-port))
(define (vhaddq_s32.check  a b )
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
  (define %13.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (extract  32 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhaddq_s32 (bitvector 128))
(define-symbolic b_vhaddq_s32 (bitvector 128))
(verify (assert (equal? (vhaddq_s32.check a_vhaddq_s32 b_vhaddq_s32 ) (vhaddq_s32 a_vhaddq_s32 b_vhaddq_s32 ))))
(display "vhaddq_s32" (current-error-port))
(define (vhaddq_s8.check  a b )
(define result
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
  (define %13.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (extract  8 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhaddq_s8 (bitvector 128))
(define-symbolic b_vhaddq_s8 (bitvector 128))
(verify (assert (equal? (vhaddq_s8.check a_vhaddq_s8 b_vhaddq_s8 ) (vhaddq_s8 a_vhaddq_s8 b_vhaddq_s8 ))))
(display "vhaddq_s8" (current-error-port))
(define (vhaddq_u16.check  a b )
(define result
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
  (define %13.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (extract  16 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhaddq_u16 (bitvector 128))
(define-symbolic b_vhaddq_u16 (bitvector 128))
(verify (assert (equal? (vhaddq_u16.check a_vhaddq_u16 b_vhaddq_u16 ) (vhaddq_u16 a_vhaddq_u16 b_vhaddq_u16 ))))
(display "vhaddq_u16" (current-error-port))
(define (vhaddq_u32.check  a b )
(define result
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
  (define %13.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (extract  32 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhaddq_u32 (bitvector 128))
(define-symbolic b_vhaddq_u32 (bitvector 128))
(verify (assert (equal? (vhaddq_u32.check a_vhaddq_u32 b_vhaddq_u32 ) (vhaddq_u32 a_vhaddq_u32 b_vhaddq_u32 ))))
(display "vhaddq_u32" (current-error-port))
(define (vhaddq_u8.check  a b )
(define result
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
  (define %13.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (extract  8 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhaddq_u8 (bitvector 128))
(define-symbolic b_vhaddq_u8 (bitvector 128))
(verify (assert (equal? (vhaddq_u8.check a_vhaddq_u8 b_vhaddq_u8 ) (vhaddq_u8 a_vhaddq_u8 b_vhaddq_u8 ))))
(display "vhaddq_u8" (current-error-port))
(define (vhsub_s16.check  a b )
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
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (extract  16 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhsub_s16 (bitvector 64))
(define-symbolic b_vhsub_s16 (bitvector 64))
(verify (assert (equal? (vhsub_s16.check a_vhsub_s16 b_vhsub_s16 ) (vhsub_s16 a_vhsub_s16 b_vhsub_s16 ))))
(display "vhsub_s16" (current-error-port))
(define (vhsub_s32.check  a b )
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
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (extract  32 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhsub_s32 (bitvector 64))
(define-symbolic b_vhsub_s32 (bitvector 64))
(verify (assert (equal? (vhsub_s32.check a_vhsub_s32 b_vhsub_s32 ) (vhsub_s32 a_vhsub_s32 b_vhsub_s32 ))))
(display "vhsub_s32" (current-error-port))
(define (vhsub_s8.check  a b )
(define result
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
  (define %18.downcasted0 (extract  8 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhsub_s8 (bitvector 64))
(define-symbolic b_vhsub_s8 (bitvector 64))
(verify (assert (equal? (vhsub_s8.check a_vhsub_s8 b_vhsub_s8 ) (vhsub_s8 a_vhsub_s8 b_vhsub_s8 ))))
(display "vhsub_s8" (current-error-port))
(define (vhsub_u16.check  a b )
(define result
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
  (define %18.downcasted0 (extract  16 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhsub_u16 (bitvector 64))
(define-symbolic b_vhsub_u16 (bitvector 64))
(verify (assert (equal? (vhsub_u16.check a_vhsub_u16 b_vhsub_u16 ) (vhsub_u16 a_vhsub_u16 b_vhsub_u16 ))))
(display "vhsub_u16" (current-error-port))
(define (vhsub_u32.check  a b )
(define result
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
  (define %18.downcasted0 (extract  32 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhsub_u32 (bitvector 64))
(define-symbolic b_vhsub_u32 (bitvector 64))
(verify (assert (equal? (vhsub_u32.check a_vhsub_u32 b_vhsub_u32 ) (vhsub_u32 a_vhsub_u32 b_vhsub_u32 ))))
(display "vhsub_u32" (current-error-port))
(define (vhsub_u8.check  a b )
(define result
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
  (define %18.downcasted0 (extract  8 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhsub_u8 (bitvector 64))
(define-symbolic b_vhsub_u8 (bitvector 64))
(verify (assert (equal? (vhsub_u8.check a_vhsub_u8 b_vhsub_u8 ) (vhsub_u8 a_vhsub_u8 b_vhsub_u8 ))))
(display "vhsub_u8" (current-error-port))
(define (vhsubq_s16.check  a b )
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
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (extract  16 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhsubq_s16 (bitvector 128))
(define-symbolic b_vhsubq_s16 (bitvector 128))
(verify (assert (equal? (vhsubq_s16.check a_vhsubq_s16 b_vhsubq_s16 ) (vhsubq_s16 a_vhsubq_s16 b_vhsubq_s16 ))))
(display "vhsubq_s16" (current-error-port))
(define (vhsubq_s32.check  a b )
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
  (define %13.downcasted0 (bvsub  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (extract  32 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhsubq_s32 (bitvector 128))
(define-symbolic b_vhsubq_s32 (bitvector 128))
(verify (assert (equal? (vhsubq_s32.check a_vhsubq_s32 b_vhsubq_s32 ) (vhsubq_s32 a_vhsubq_s32 b_vhsubq_s32 ))))
(display "vhsubq_s32" (current-error-port))
(define (vhsubq_s8.check  a b )
(define result
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
  (define %18.downcasted0 (extract  8 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhsubq_s8 (bitvector 128))
(define-symbolic b_vhsubq_s8 (bitvector 128))
(verify (assert (equal? (vhsubq_s8.check a_vhsubq_s8 b_vhsubq_s8 ) (vhsubq_s8 a_vhsubq_s8 b_vhsubq_s8 ))))
(display "vhsubq_s8" (current-error-port))
(define (vhsubq_u16.check  a b )
(define result
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
  (define %18.downcasted0 (extract  16 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhsubq_u16 (bitvector 128))
(define-symbolic b_vhsubq_u16 (bitvector 128))
(verify (assert (equal? (vhsubq_u16.check a_vhsubq_u16 b_vhsubq_u16 ) (vhsubq_u16 a_vhsubq_u16 b_vhsubq_u16 ))))
(display "vhsubq_u16" (current-error-port))
(define (vhsubq_u32.check  a b )
(define result
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
  (define %18.downcasted0 (extract  32 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhsubq_u32 (bitvector 128))
(define-symbolic b_vhsubq_u32 (bitvector 128))
(verify (assert (equal? (vhsubq_u32.check a_vhsubq_u32 b_vhsubq_u32 ) (vhsubq_u32 a_vhsubq_u32 b_vhsubq_u32 ))))
(display "vhsubq_u32" (current-error-port))
(define (vhsubq_u8.check  a b )
(define result
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
  (define %18.downcasted0 (extract  8 1 %13.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vhsubq_u8 (bitvector 128))
(define-symbolic b_vhsubq_u8 (bitvector 128))
(verify (assert (equal? (vhsubq_u8.check a_vhsubq_u8 b_vhsubq_u8 ) (vhsubq_u8 a_vhsubq_u8 b_vhsubq_u8 ))))
(display "vhsubq_u8" (current-error-port))
(define (vmax_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsmax  %5  %11))
  (define %19.downcasted0 (extract  15 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmax_s16 (bitvector 64))
(define-symbolic b_vmax_s16 (bitvector 64))
(verify (assert (equal? (vmax_s16.check a_vmax_s16 b_vmax_s16 ) (vmax_s16 a_vmax_s16 b_vmax_s16 ))))
(display "vmax_s16" (current-error-port))
(define (vmax_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsmax  %5  %11))
  (define %19.downcasted0 (extract  31 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmax_s32 (bitvector 64))
(define-symbolic b_vmax_s32 (bitvector 64))
(verify (assert (equal? (vmax_s32.check a_vmax_s32 b_vmax_s32 ) (vmax_s32 a_vmax_s32 b_vmax_s32 ))))
(display "vmax_s32" (current-error-port))
(define (vmax_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsmax  %5  %11))
  (define %19.downcasted0 (extract  7 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmax_s8 (bitvector 64))
(define-symbolic b_vmax_s8 (bitvector 64))
(verify (assert (equal? (vmax_s8.check a_vmax_s8 b_vmax_s8 ) (vmax_s8 a_vmax_s8 b_vmax_s8 ))))
(display "vmax_s8" (current-error-port))
(define (vmax_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvumax  %5  %11))
  (define %19.downcasted0 (extract  15 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmax_u16 (bitvector 64))
(define-symbolic b_vmax_u16 (bitvector 64))
(verify (assert (equal? (vmax_u16.check a_vmax_u16 b_vmax_u16 ) (vmax_u16 a_vmax_u16 b_vmax_u16 ))))
(display "vmax_u16" (current-error-port))
(define (vmax_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvumax  %5  %11))
  (define %19.downcasted0 (extract  31 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmax_u32 (bitvector 64))
(define-symbolic b_vmax_u32 (bitvector 64))
(verify (assert (equal? (vmax_u32.check a_vmax_u32 b_vmax_u32 ) (vmax_u32 a_vmax_u32 b_vmax_u32 ))))
(display "vmax_u32" (current-error-port))
(define (vmax_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvumax  %5  %11))
  (define %19.downcasted0 (extract  7 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmax_u8 (bitvector 64))
(define-symbolic b_vmax_u8 (bitvector 64))
(verify (assert (equal? (vmax_u8.check a_vmax_u8 b_vmax_u8 ) (vmax_u8 a_vmax_u8 b_vmax_u8 ))))
(display "vmax_u8" (current-error-port))
(define (vmaxq_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsmax  %5  %11))
  (define %19.downcasted0 (extract  15 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmaxq_s16 (bitvector 128))
(define-symbolic b_vmaxq_s16 (bitvector 128))
(verify (assert (equal? (vmaxq_s16.check a_vmaxq_s16 b_vmaxq_s16 ) (vmaxq_s16 a_vmaxq_s16 b_vmaxq_s16 ))))
(display "vmaxq_s16" (current-error-port))
(define (vmaxq_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsmax  %5  %11))
  (define %19.downcasted0 (extract  31 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmaxq_s32 (bitvector 128))
(define-symbolic b_vmaxq_s32 (bitvector 128))
(verify (assert (equal? (vmaxq_s32.check a_vmaxq_s32 b_vmaxq_s32 ) (vmaxq_s32 a_vmaxq_s32 b_vmaxq_s32 ))))
(display "vmaxq_s32" (current-error-port))
(define (vmaxq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsmax  %5  %11))
  (define %19.downcasted0 (extract  7 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmaxq_s8 (bitvector 128))
(define-symbolic b_vmaxq_s8 (bitvector 128))
(verify (assert (equal? (vmaxq_s8.check a_vmaxq_s8 b_vmaxq_s8 ) (vmaxq_s8 a_vmaxq_s8 b_vmaxq_s8 ))))
(display "vmaxq_s8" (current-error-port))
(define (vmaxq_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvumax  %5  %11))
  (define %19.downcasted0 (extract  15 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmaxq_u16 (bitvector 128))
(define-symbolic b_vmaxq_u16 (bitvector 128))
(verify (assert (equal? (vmaxq_u16.check a_vmaxq_u16 b_vmaxq_u16 ) (vmaxq_u16 a_vmaxq_u16 b_vmaxq_u16 ))))
(display "vmaxq_u16" (current-error-port))
(define (vmaxq_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvumax  %5  %11))
  (define %19.downcasted0 (extract  31 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmaxq_u32 (bitvector 128))
(define-symbolic b_vmaxq_u32 (bitvector 128))
(verify (assert (equal? (vmaxq_u32.check a_vmaxq_u32 b_vmaxq_u32 ) (vmaxq_u32 a_vmaxq_u32 b_vmaxq_u32 ))))
(display "vmaxq_u32" (current-error-port))
(define (vmaxq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvumax  %5  %11))
  (define %19.downcasted0 (extract  7 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmaxq_u8 (bitvector 128))
(define-symbolic b_vmaxq_u8 (bitvector 128))
(verify (assert (equal? (vmaxq_u8.check a_vmaxq_u8 b_vmaxq_u8 ) (vmaxq_u8 a_vmaxq_u8 b_vmaxq_u8 ))))
(display "vmaxq_u8" (current-error-port))
(define (vmin_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsmin  %5  %11))
  (define %19.downcasted0 (extract  15 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmin_s16 (bitvector 64))
(define-symbolic b_vmin_s16 (bitvector 64))
(verify (assert (equal? (vmin_s16.check a_vmin_s16 b_vmin_s16 ) (vmin_s16 a_vmin_s16 b_vmin_s16 ))))
(display "vmin_s16" (current-error-port))
(define (vmin_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsmin  %5  %11))
  (define %19.downcasted0 (extract  31 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmin_s32 (bitvector 64))
(define-symbolic b_vmin_s32 (bitvector 64))
(verify (assert (equal? (vmin_s32.check a_vmin_s32 b_vmin_s32 ) (vmin_s32 a_vmin_s32 b_vmin_s32 ))))
(display "vmin_s32" (current-error-port))
(define (vmin_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsmin  %5  %11))
  (define %19.downcasted0 (extract  7 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmin_s8 (bitvector 64))
(define-symbolic b_vmin_s8 (bitvector 64))
(verify (assert (equal? (vmin_s8.check a_vmin_s8 b_vmin_s8 ) (vmin_s8 a_vmin_s8 b_vmin_s8 ))))
(display "vmin_s8" (current-error-port))
(define (vmin_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvumin  %5  %11))
  (define %19.downcasted0 (extract  15 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmin_u16 (bitvector 64))
(define-symbolic b_vmin_u16 (bitvector 64))
(verify (assert (equal? (vmin_u16.check a_vmin_u16 b_vmin_u16 ) (vmin_u16 a_vmin_u16 b_vmin_u16 ))))
(display "vmin_u16" (current-error-port))
(define (vmin_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvumin  %5  %11))
  (define %19.downcasted0 (extract  31 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmin_u32 (bitvector 64))
(define-symbolic b_vmin_u32 (bitvector 64))
(verify (assert (equal? (vmin_u32.check a_vmin_u32 b_vmin_u32 ) (vmin_u32 a_vmin_u32 b_vmin_u32 ))))
(display "vmin_u32" (current-error-port))
(define (vmin_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvumin  %5  %11))
  (define %19.downcasted0 (extract  7 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmin_u8 (bitvector 64))
(define-symbolic b_vmin_u8 (bitvector 64))
(verify (assert (equal? (vmin_u8.check a_vmin_u8 b_vmin_u8 ) (vmin_u8 a_vmin_u8 b_vmin_u8 ))))
(display "vmin_u8" (current-error-port))
(define (vminq_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsmin  %5  %11))
  (define %19.downcasted0 (extract  15 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vminq_s16 (bitvector 128))
(define-symbolic b_vminq_s16 (bitvector 128))
(verify (assert (equal? (vminq_s16.check a_vminq_s16 b_vminq_s16 ) (vminq_s16 a_vminq_s16 b_vminq_s16 ))))
(display "vminq_s16" (current-error-port))
(define (vminq_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsmin  %5  %11))
  (define %19.downcasted0 (extract  31 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vminq_s32 (bitvector 128))
(define-symbolic b_vminq_s32 (bitvector 128))
(verify (assert (equal? (vminq_s32.check a_vminq_s32 b_vminq_s32 ) (vminq_s32 a_vminq_s32 b_vminq_s32 ))))
(display "vminq_s32" (current-error-port))
(define (vminq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsmin  %5  %11))
  (define %19.downcasted0 (extract  7 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vminq_s8 (bitvector 128))
(define-symbolic b_vminq_s8 (bitvector 128))
(verify (assert (equal? (vminq_s8.check a_vminq_s8 b_vminq_s8 ) (vminq_s8 a_vminq_s8 b_vminq_s8 ))))
(display "vminq_s8" (current-error-port))
(define (vminq_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvumin  %5  %11))
  (define %19.downcasted0 (extract  15 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vminq_u16 (bitvector 128))
(define-symbolic b_vminq_u16 (bitvector 128))
(verify (assert (equal? (vminq_u16.check a_vminq_u16 b_vminq_u16 ) (vminq_u16 a_vminq_u16 b_vminq_u16 ))))
(display "vminq_u16" (current-error-port))
(define (vminq_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvumin  %5  %11))
  (define %19.downcasted0 (extract  31 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vminq_u32 (bitvector 128))
(define-symbolic b_vminq_u32 (bitvector 128))
(verify (assert (equal? (vminq_u32.check a_vminq_u32 b_vminq_u32 ) (vminq_u32 a_vminq_u32 b_vminq_u32 ))))
(display "vminq_u32" (current-error-port))
(define (vminq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvumin  %5  %11))
  (define %19.downcasted0 (extract  7 0 %13.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vminq_u8 (bitvector 128))
(define-symbolic b_vminq_u8 (bitvector 128))
(verify (assert (equal? (vminq_u8.check a_vminq_u8 b_vminq_u8 ) (vminq_u8 a_vminq_u8 b_vminq_u8 ))))
(display "vminq_u8" (current-error-port))
(define (vmla_n_s16.check  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %10 (+  e0.new  15))
  (define %11 (extract  %10 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %24 (extract  %10 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmla_n_s16 (bitvector 64))
(define-symbolic b_vmla_n_s16 (bitvector 64))
(define-symbolic c_vmla_n_s16 (bitvector 16))
(verify (assert (equal? (vmla_n_s16.check a_vmla_n_s16 b_vmla_n_s16 c_vmla_n_s16 ) (vmla_n_s16 a_vmla_n_s16 b_vmla_n_s16 c_vmla_n_s16 ))))
(display "vmla_n_s16" (current-error-port))
(define (vmla_n_s32.check  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %10 (+  e0.new  31))
  (define %11 (extract  %10 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %24 (extract  %10 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmla_n_s32 (bitvector 64))
(define-symbolic b_vmla_n_s32 (bitvector 64))
(define-symbolic c_vmla_n_s32 (bitvector 32))
(verify (assert (equal? (vmla_n_s32.check a_vmla_n_s32 b_vmla_n_s32 c_vmla_n_s32 ) (vmla_n_s32 a_vmla_n_s32 b_vmla_n_s32 c_vmla_n_s32 ))))
(display "vmla_n_s32" (current-error-port))
(define (vmla_n_u16.check  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %10 (+  e0.new  15))
  (define %11 (extract  %10 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %24 (extract  %10 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmla_n_u16 (bitvector 64))
(define-symbolic b_vmla_n_u16 (bitvector 64))
(define-symbolic c_vmla_n_u16 (bitvector 16))
(verify (assert (equal? (vmla_n_u16.check a_vmla_n_u16 b_vmla_n_u16 c_vmla_n_u16 ) (vmla_n_u16 a_vmla_n_u16 b_vmla_n_u16 c_vmla_n_u16 ))))
(display "vmla_n_u16" (current-error-port))
(define (vmla_n_u32.check  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %10 (+  e0.new  31))
  (define %11 (extract  %10 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %24 (extract  %10 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmla_n_u32 (bitvector 64))
(define-symbolic b_vmla_n_u32 (bitvector 64))
(define-symbolic c_vmla_n_u32 (bitvector 32))
(verify (assert (equal? (vmla_n_u32.check a_vmla_n_u32 b_vmla_n_u32 c_vmla_n_u32 ) (vmla_n_u32 a_vmla_n_u32 b_vmla_n_u32 c_vmla_n_u32 ))))
(display "vmla_n_u32" (current-error-port))
(define (vmla_s16.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 32)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmla_s16 (bitvector 64))
(define-symbolic b_vmla_s16 (bitvector 64))
(define-symbolic c_vmla_s16 (bitvector 64))
(verify (assert (equal? (vmla_s16.check a_vmla_s16 b_vmla_s16 c_vmla_s16 ) (vmla_s16 a_vmla_s16 b_vmla_s16 c_vmla_s16 ))))
(display "vmla_s16" (current-error-port))
(define (vmla_s32.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 64)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmla_s32 (bitvector 64))
(define-symbolic b_vmla_s32 (bitvector 64))
(define-symbolic c_vmla_s32 (bitvector 64))
(verify (assert (equal? (vmla_s32.check a_vmla_s32 b_vmla_s32 c_vmla_s32 ) (vmla_s32 a_vmla_s32 b_vmla_s32 c_vmla_s32 ))))
(display "vmla_s32" (current-error-port))
(define (vmla_s8.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 16)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  7 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmla_s8 (bitvector 64))
(define-symbolic b_vmla_s8 (bitvector 64))
(define-symbolic c_vmla_s8 (bitvector 64))
(verify (assert (equal? (vmla_s8.check a_vmla_s8 b_vmla_s8 c_vmla_s8 ) (vmla_s8 a_vmla_s8 b_vmla_s8 c_vmla_s8 ))))
(display "vmla_s8" (current-error-port))
(define (vmla_u16.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 32)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmla_u16 (bitvector 64))
(define-symbolic b_vmla_u16 (bitvector 64))
(define-symbolic c_vmla_u16 (bitvector 64))
(verify (assert (equal? (vmla_u16.check a_vmla_u16 b_vmla_u16 c_vmla_u16 ) (vmla_u16 a_vmla_u16 b_vmla_u16 c_vmla_u16 ))))
(display "vmla_u16" (current-error-port))
(define (vmla_u32.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 64)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmla_u32 (bitvector 64))
(define-symbolic b_vmla_u32 (bitvector 64))
(define-symbolic c_vmla_u32 (bitvector 64))
(verify (assert (equal? (vmla_u32.check a_vmla_u32 b_vmla_u32 c_vmla_u32 ) (vmla_u32 a_vmla_u32 b_vmla_u32 c_vmla_u32 ))))
(display "vmla_u32" (current-error-port))
(define (vmla_u8.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 16)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  7 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmla_u8 (bitvector 64))
(define-symbolic b_vmla_u8 (bitvector 64))
(define-symbolic c_vmla_u8 (bitvector 64))
(verify (assert (equal? (vmla_u8.check a_vmla_u8 b_vmla_u8 c_vmla_u8 ) (vmla_u8 a_vmla_u8 b_vmla_u8 c_vmla_u8 ))))
(display "vmla_u8" (current-error-port))
(define (vmlal_high_n_s16.check  a b c )
(define %2 (extract  127 64 b))
(define %10 (extract  15 0 c))
(define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %13.new0 (/  e0.new  2))
  (define %16 (+  %13.new0  15))
  (define %17 (extract  %16 %13.new0 %2))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 32)))
  (define %21.downcasted0 (bvmul  %18.downcasted0  %11.downcasted0))
  (define %22.downcasted0 (extract  31 0 %21.downcasted0))
  (define %29 (+  e0.new  31))
  (define %39 (extract  %29 e0.new a))
  (define %40 (bvadd  %39  %22.downcasted0))
  %40
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_high_n_s16 (bitvector 128))
(define-symbolic b_vmlal_high_n_s16 (bitvector 128))
(define-symbolic c_vmlal_high_n_s16 (bitvector 16))
(verify (assert (equal? (vmlal_high_n_s16.check a_vmlal_high_n_s16 b_vmlal_high_n_s16 c_vmlal_high_n_s16 ) (vmlal_high_n_s16 a_vmlal_high_n_s16 b_vmlal_high_n_s16 c_vmlal_high_n_s16 ))))
(display "vmlal_high_n_s16" (current-error-port))
(define (vmlal_high_n_s32.check  a b c )
(define %2 (extract  127 64 b))
(define %10 (extract  31 0 c))
(define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %13.new0 (/  e0.new  2))
  (define %16 (+  %13.new0  31))
  (define %17 (extract  %16 %13.new0 %2))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 64)))
  (define %21.downcasted0 (bvmul  %18.downcasted0  %11.downcasted0))
  (define %22.downcasted0 (extract  63 0 %21.downcasted0))
  (define %29 (+  e0.new  63))
  (define %39 (extract  %29 e0.new a))
  (define %40 (bvadd  %39  %22.downcasted0))
  %40
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_high_n_s32 (bitvector 128))
(define-symbolic b_vmlal_high_n_s32 (bitvector 128))
(define-symbolic c_vmlal_high_n_s32 (bitvector 32))
(verify (assert (equal? (vmlal_high_n_s32.check a_vmlal_high_n_s32 b_vmlal_high_n_s32 c_vmlal_high_n_s32 ) (vmlal_high_n_s32 a_vmlal_high_n_s32 b_vmlal_high_n_s32 c_vmlal_high_n_s32 ))))
(display "vmlal_high_n_s32" (current-error-port))
(define (vmlal_high_n_u16.check  a b c )
(define %2 (extract  127 64 b))
(define %10 (extract  15 0 c))
(define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %13.new0 (/  e0.new  2))
  (define %16 (+  %13.new0  15))
  (define %17 (extract  %16 %13.new0 %2))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 32)))
  (define %21.downcasted0 (bvmul  %18.downcasted0  %11.downcasted0))
  (define %22.downcasted0 (extract  31 0 %21.downcasted0))
  (define %29 (+  e0.new  31))
  (define %39 (extract  %29 e0.new a))
  (define %40 (bvadd  %39  %22.downcasted0))
  %40
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_high_n_u16 (bitvector 128))
(define-symbolic b_vmlal_high_n_u16 (bitvector 128))
(define-symbolic c_vmlal_high_n_u16 (bitvector 16))
(verify (assert (equal? (vmlal_high_n_u16.check a_vmlal_high_n_u16 b_vmlal_high_n_u16 c_vmlal_high_n_u16 ) (vmlal_high_n_u16 a_vmlal_high_n_u16 b_vmlal_high_n_u16 c_vmlal_high_n_u16 ))))
(display "vmlal_high_n_u16" (current-error-port))
(define (vmlal_high_n_u32.check  a b c )
(define %2 (extract  127 64 b))
(define %10 (extract  31 0 c))
(define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %13.new0 (/  e0.new  2))
  (define %16 (+  %13.new0  31))
  (define %17 (extract  %16 %13.new0 %2))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 64)))
  (define %21.downcasted0 (bvmul  %18.downcasted0  %11.downcasted0))
  (define %22.downcasted0 (extract  63 0 %21.downcasted0))
  (define %29 (+  e0.new  63))
  (define %39 (extract  %29 e0.new a))
  (define %40 (bvadd  %39  %22.downcasted0))
  %40
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_high_n_u32 (bitvector 128))
(define-symbolic b_vmlal_high_n_u32 (bitvector 128))
(define-symbolic c_vmlal_high_n_u32 (bitvector 32))
(verify (assert (equal? (vmlal_high_n_u32.check a_vmlal_high_n_u32 b_vmlal_high_n_u32 c_vmlal_high_n_u32 ) (vmlal_high_n_u32 a_vmlal_high_n_u32 b_vmlal_high_n_u32 c_vmlal_high_n_u32 ))))
(display "vmlal_high_n_u32" (current-error-port))
(define (vmlal_high_s16.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  15))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 32)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (sign-extend  %21 (bitvector 32)))
  (define %25.downcasted0 (bvmul  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  31 0 %25.downcasted0))
  (define %33 (+  e0.new  31))
  (define %35 (extract  %33 e0.new a))
  (define %36 (bvadd  %35  %26.downcasted0))
  %36
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_high_s16 (bitvector 128))
(define-symbolic b_vmlal_high_s16 (bitvector 128))
(define-symbolic c_vmlal_high_s16 (bitvector 128))
(verify (assert (equal? (vmlal_high_s16.check a_vmlal_high_s16 b_vmlal_high_s16 c_vmlal_high_s16 ) (vmlal_high_s16 a_vmlal_high_s16 b_vmlal_high_s16 c_vmlal_high_s16 ))))
(display "vmlal_high_s16" (current-error-port))
(define (vmlal_high_s32.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  31))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 64)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (sign-extend  %21 (bitvector 64)))
  (define %25.downcasted0 (bvmul  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  63 0 %25.downcasted0))
  (define %33 (+  e0.new  63))
  (define %35 (extract  %33 e0.new a))
  (define %36 (bvadd  %35  %26.downcasted0))
  %36
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_high_s32 (bitvector 128))
(define-symbolic b_vmlal_high_s32 (bitvector 128))
(define-symbolic c_vmlal_high_s32 (bitvector 128))
(verify (assert (equal? (vmlal_high_s32.check a_vmlal_high_s32 b_vmlal_high_s32 c_vmlal_high_s32 ) (vmlal_high_s32 a_vmlal_high_s32 b_vmlal_high_s32 c_vmlal_high_s32 ))))
(display "vmlal_high_s32" (current-error-port))
(define (vmlal_high_s8.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  7))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 16)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (sign-extend  %21 (bitvector 16)))
  (define %25.downcasted0 (bvmul  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  15 0 %25.downcasted0))
  (define %33 (+  e0.new  15))
  (define %35 (extract  %33 e0.new a))
  (define %36 (bvadd  %35  %26.downcasted0))
  %36
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_high_s8 (bitvector 128))
(define-symbolic b_vmlal_high_s8 (bitvector 128))
(define-symbolic c_vmlal_high_s8 (bitvector 128))
(verify (assert (equal? (vmlal_high_s8.check a_vmlal_high_s8 b_vmlal_high_s8 c_vmlal_high_s8 ) (vmlal_high_s8 a_vmlal_high_s8 b_vmlal_high_s8 c_vmlal_high_s8 ))))
(display "vmlal_high_s8" (current-error-port))
(define (vmlal_high_u16.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  15))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 32)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (zero-extend  %21 (bitvector 32)))
  (define %25.downcasted0 (bvmul  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  31 0 %25.downcasted0))
  (define %33 (+  e0.new  31))
  (define %35 (extract  %33 e0.new a))
  (define %36 (bvadd  %35  %26.downcasted0))
  %36
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_high_u16 (bitvector 128))
(define-symbolic b_vmlal_high_u16 (bitvector 128))
(define-symbolic c_vmlal_high_u16 (bitvector 128))
(verify (assert (equal? (vmlal_high_u16.check a_vmlal_high_u16 b_vmlal_high_u16 c_vmlal_high_u16 ) (vmlal_high_u16 a_vmlal_high_u16 b_vmlal_high_u16 c_vmlal_high_u16 ))))
(display "vmlal_high_u16" (current-error-port))
(define (vmlal_high_u32.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  31))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 64)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (zero-extend  %21 (bitvector 64)))
  (define %25.downcasted0 (bvmul  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  63 0 %25.downcasted0))
  (define %33 (+  e0.new  63))
  (define %35 (extract  %33 e0.new a))
  (define %36 (bvadd  %35  %26.downcasted0))
  %36
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_high_u32 (bitvector 128))
(define-symbolic b_vmlal_high_u32 (bitvector 128))
(define-symbolic c_vmlal_high_u32 (bitvector 128))
(verify (assert (equal? (vmlal_high_u32.check a_vmlal_high_u32 b_vmlal_high_u32 c_vmlal_high_u32 ) (vmlal_high_u32 a_vmlal_high_u32 b_vmlal_high_u32 c_vmlal_high_u32 ))))
(display "vmlal_high_u32" (current-error-port))
(define (vmlal_high_u8.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  7))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 16)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (zero-extend  %21 (bitvector 16)))
  (define %25.downcasted0 (bvmul  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  15 0 %25.downcasted0))
  (define %33 (+  e0.new  15))
  (define %35 (extract  %33 e0.new a))
  (define %36 (bvadd  %35  %26.downcasted0))
  %36
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_high_u8 (bitvector 128))
(define-symbolic b_vmlal_high_u8 (bitvector 128))
(define-symbolic c_vmlal_high_u8 (bitvector 128))
(verify (assert (equal? (vmlal_high_u8.check a_vmlal_high_u8 b_vmlal_high_u8 c_vmlal_high_u8 ) (vmlal_high_u8 a_vmlal_high_u8 b_vmlal_high_u8 c_vmlal_high_u8 ))))
(display "vmlal_high_u8" (current-error-port))
(define (vmlal_n_s16.check  a b c )
(define %7 (extract  15 0 c))
(define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %13 (+  e0.new  15))
  (define %14 (extract  %13 e0.new b))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 32)))
  (define %18.downcasted0 (bvmul  %15.downcasted0  %8.downcasted0))
  (define %19.downcasted0 (extract  31 0 %18.downcasted0))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  31))
  (define %36 (extract  %26 %21.new0 a))
  (define %37 (bvadd  %36  %19.downcasted0))
  %37
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_n_s16 (bitvector 128))
(define-symbolic b_vmlal_n_s16 (bitvector 64))
(define-symbolic c_vmlal_n_s16 (bitvector 16))
(verify (assert (equal? (vmlal_n_s16.check a_vmlal_n_s16 b_vmlal_n_s16 c_vmlal_n_s16 ) (vmlal_n_s16 a_vmlal_n_s16 b_vmlal_n_s16 c_vmlal_n_s16 ))))
(display "vmlal_n_s16" (current-error-port))
(define (vmlal_n_s32.check  a b c )
(define %7 (extract  31 0 c))
(define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %13 (+  e0.new  31))
  (define %14 (extract  %13 e0.new b))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %18.downcasted0 (bvmul  %15.downcasted0  %8.downcasted0))
  (define %19.downcasted0 (extract  63 0 %18.downcasted0))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  63))
  (define %36 (extract  %26 %21.new0 a))
  (define %37 (bvadd  %36  %19.downcasted0))
  %37
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_n_s32 (bitvector 128))
(define-symbolic b_vmlal_n_s32 (bitvector 64))
(define-symbolic c_vmlal_n_s32 (bitvector 32))
(verify (assert (equal? (vmlal_n_s32.check a_vmlal_n_s32 b_vmlal_n_s32 c_vmlal_n_s32 ) (vmlal_n_s32 a_vmlal_n_s32 b_vmlal_n_s32 c_vmlal_n_s32 ))))
(display "vmlal_n_s32" (current-error-port))
(define (vmlal_n_u16.check  a b c )
(define %7 (extract  15 0 c))
(define %8.downcasted0 (zero-extend  %7 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %13 (+  e0.new  15))
  (define %14 (extract  %13 e0.new b))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 32)))
  (define %18.downcasted0 (bvmul  %15.downcasted0  %8.downcasted0))
  (define %19.downcasted0 (extract  31 0 %18.downcasted0))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  31))
  (define %36 (extract  %26 %21.new0 a))
  (define %37 (bvadd  %36  %19.downcasted0))
  %37
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_n_u16 (bitvector 128))
(define-symbolic b_vmlal_n_u16 (bitvector 64))
(define-symbolic c_vmlal_n_u16 (bitvector 16))
(verify (assert (equal? (vmlal_n_u16.check a_vmlal_n_u16 b_vmlal_n_u16 c_vmlal_n_u16 ) (vmlal_n_u16 a_vmlal_n_u16 b_vmlal_n_u16 c_vmlal_n_u16 ))))
(display "vmlal_n_u16" (current-error-port))
(define (vmlal_n_u32.check  a b c )
(define %7 (extract  31 0 c))
(define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %13 (+  e0.new  31))
  (define %14 (extract  %13 e0.new b))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %18.downcasted0 (bvmul  %15.downcasted0  %8.downcasted0))
  (define %19.downcasted0 (extract  63 0 %18.downcasted0))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  63))
  (define %36 (extract  %26 %21.new0 a))
  (define %37 (bvadd  %36  %19.downcasted0))
  %37
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_n_u32 (bitvector 128))
(define-symbolic b_vmlal_n_u32 (bitvector 64))
(define-symbolic c_vmlal_n_u32 (bitvector 32))
(verify (assert (equal? (vmlal_n_u32.check a_vmlal_n_u32 b_vmlal_n_u32 c_vmlal_n_u32 ) (vmlal_n_u32 a_vmlal_n_u32 b_vmlal_n_u32 c_vmlal_n_u32 ))))
(display "vmlal_n_u32" (current-error-port))
(define (vmlal_s16.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 32)))
  (define %15 (extract  %8 e0.new c))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 32)))
  (define %19.downcasted0 (bvmul  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (extract  31 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  31))
  (define %29 (extract  %27 %22.new0 a))
  (define %30 (bvadd  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_s16 (bitvector 128))
(define-symbolic b_vmlal_s16 (bitvector 64))
(define-symbolic c_vmlal_s16 (bitvector 64))
(verify (assert (equal? (vmlal_s16.check a_vmlal_s16 b_vmlal_s16 c_vmlal_s16 ) (vmlal_s16 a_vmlal_s16 b_vmlal_s16 c_vmlal_s16 ))))
(display "vmlal_s16" (current-error-port))
(define (vmlal_s32.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %15 (extract  %8 e0.new c))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 64)))
  (define %19.downcasted0 (bvmul  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (extract  63 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  63))
  (define %29 (extract  %27 %22.new0 a))
  (define %30 (bvadd  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_s32 (bitvector 128))
(define-symbolic b_vmlal_s32 (bitvector 64))
(define-symbolic c_vmlal_s32 (bitvector 64))
(verify (assert (equal? (vmlal_s32.check a_vmlal_s32 b_vmlal_s32 c_vmlal_s32 ) (vmlal_s32 a_vmlal_s32 b_vmlal_s32 c_vmlal_s32 ))))
(display "vmlal_s32" (current-error-port))
(define (vmlal_s8.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 16)))
  (define %15 (extract  %8 e0.new c))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 16)))
  (define %19.downcasted0 (bvmul  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (extract  15 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  15))
  (define %29 (extract  %27 %22.new0 a))
  (define %30 (bvadd  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_s8 (bitvector 128))
(define-symbolic b_vmlal_s8 (bitvector 64))
(define-symbolic c_vmlal_s8 (bitvector 64))
(verify (assert (equal? (vmlal_s8.check a_vmlal_s8 b_vmlal_s8 c_vmlal_s8 ) (vmlal_s8 a_vmlal_s8 b_vmlal_s8 c_vmlal_s8 ))))
(display "vmlal_s8" (current-error-port))
(define (vmlal_u16.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 32)))
  (define %15 (extract  %8 e0.new c))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 32)))
  (define %19.downcasted0 (bvmul  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (extract  31 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  31))
  (define %29 (extract  %27 %22.new0 a))
  (define %30 (bvadd  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_u16 (bitvector 128))
(define-symbolic b_vmlal_u16 (bitvector 64))
(define-symbolic c_vmlal_u16 (bitvector 64))
(verify (assert (equal? (vmlal_u16.check a_vmlal_u16 b_vmlal_u16 c_vmlal_u16 ) (vmlal_u16 a_vmlal_u16 b_vmlal_u16 c_vmlal_u16 ))))
(display "vmlal_u16" (current-error-port))
(define (vmlal_u32.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %15 (extract  %8 e0.new c))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 64)))
  (define %19.downcasted0 (bvmul  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (extract  63 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  63))
  (define %29 (extract  %27 %22.new0 a))
  (define %30 (bvadd  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_u32 (bitvector 128))
(define-symbolic b_vmlal_u32 (bitvector 64))
(define-symbolic c_vmlal_u32 (bitvector 64))
(verify (assert (equal? (vmlal_u32.check a_vmlal_u32 b_vmlal_u32 c_vmlal_u32 ) (vmlal_u32 a_vmlal_u32 b_vmlal_u32 c_vmlal_u32 ))))
(display "vmlal_u32" (current-error-port))
(define (vmlal_u8.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 16)))
  (define %15 (extract  %8 e0.new c))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 16)))
  (define %19.downcasted0 (bvmul  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (extract  15 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  15))
  (define %29 (extract  %27 %22.new0 a))
  (define %30 (bvadd  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result)
(define-symbolic a_vmlal_u8 (bitvector 128))
(define-symbolic b_vmlal_u8 (bitvector 64))
(define-symbolic c_vmlal_u8 (bitvector 64))
(verify (assert (equal? (vmlal_u8.check a_vmlal_u8 b_vmlal_u8 c_vmlal_u8 ) (vmlal_u8 a_vmlal_u8 b_vmlal_u8 c_vmlal_u8 ))))
(display "vmlal_u8" (current-error-port))
(define (vmlaq_n_s16.check  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %10 (+  e0.new  15))
  (define %11 (extract  %10 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %24 (extract  %10 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlaq_n_s16 (bitvector 128))
(define-symbolic b_vmlaq_n_s16 (bitvector 128))
(define-symbolic c_vmlaq_n_s16 (bitvector 16))
(verify (assert (equal? (vmlaq_n_s16.check a_vmlaq_n_s16 b_vmlaq_n_s16 c_vmlaq_n_s16 ) (vmlaq_n_s16 a_vmlaq_n_s16 b_vmlaq_n_s16 c_vmlaq_n_s16 ))))
(display "vmlaq_n_s16" (current-error-port))
(define (vmlaq_n_s32.check  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %10 (+  e0.new  31))
  (define %11 (extract  %10 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %24 (extract  %10 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlaq_n_s32 (bitvector 128))
(define-symbolic b_vmlaq_n_s32 (bitvector 128))
(define-symbolic c_vmlaq_n_s32 (bitvector 32))
(verify (assert (equal? (vmlaq_n_s32.check a_vmlaq_n_s32 b_vmlaq_n_s32 c_vmlaq_n_s32 ) (vmlaq_n_s32 a_vmlaq_n_s32 b_vmlaq_n_s32 c_vmlaq_n_s32 ))))
(display "vmlaq_n_s32" (current-error-port))
(define (vmlaq_n_u16.check  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %10 (+  e0.new  15))
  (define %11 (extract  %10 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %24 (extract  %10 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlaq_n_u16 (bitvector 128))
(define-symbolic b_vmlaq_n_u16 (bitvector 128))
(define-symbolic c_vmlaq_n_u16 (bitvector 16))
(verify (assert (equal? (vmlaq_n_u16.check a_vmlaq_n_u16 b_vmlaq_n_u16 c_vmlaq_n_u16 ) (vmlaq_n_u16 a_vmlaq_n_u16 b_vmlaq_n_u16 c_vmlaq_n_u16 ))))
(display "vmlaq_n_u16" (current-error-port))
(define (vmlaq_n_u32.check  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %10 (+  e0.new  31))
  (define %11 (extract  %10 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %24 (extract  %10 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlaq_n_u32 (bitvector 128))
(define-symbolic b_vmlaq_n_u32 (bitvector 128))
(define-symbolic c_vmlaq_n_u32 (bitvector 32))
(verify (assert (equal? (vmlaq_n_u32.check a_vmlaq_n_u32 b_vmlaq_n_u32 c_vmlaq_n_u32 ) (vmlaq_n_u32 a_vmlaq_n_u32 b_vmlaq_n_u32 c_vmlaq_n_u32 ))))
(display "vmlaq_n_u32" (current-error-port))
(define (vmlaq_s16.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 32)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlaq_s16 (bitvector 128))
(define-symbolic b_vmlaq_s16 (bitvector 128))
(define-symbolic c_vmlaq_s16 (bitvector 128))
(verify (assert (equal? (vmlaq_s16.check a_vmlaq_s16 b_vmlaq_s16 c_vmlaq_s16 ) (vmlaq_s16 a_vmlaq_s16 b_vmlaq_s16 c_vmlaq_s16 ))))
(display "vmlaq_s16" (current-error-port))
(define (vmlaq_s32.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 64)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlaq_s32 (bitvector 128))
(define-symbolic b_vmlaq_s32 (bitvector 128))
(define-symbolic c_vmlaq_s32 (bitvector 128))
(verify (assert (equal? (vmlaq_s32.check a_vmlaq_s32 b_vmlaq_s32 c_vmlaq_s32 ) (vmlaq_s32 a_vmlaq_s32 b_vmlaq_s32 c_vmlaq_s32 ))))
(display "vmlaq_s32" (current-error-port))
(define (vmlaq_s8.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 16)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  7 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlaq_s8 (bitvector 128))
(define-symbolic b_vmlaq_s8 (bitvector 128))
(define-symbolic c_vmlaq_s8 (bitvector 128))
(verify (assert (equal? (vmlaq_s8.check a_vmlaq_s8 b_vmlaq_s8 c_vmlaq_s8 ) (vmlaq_s8 a_vmlaq_s8 b_vmlaq_s8 c_vmlaq_s8 ))))
(display "vmlaq_s8" (current-error-port))
(define (vmlaq_u16.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 32)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlaq_u16 (bitvector 128))
(define-symbolic b_vmlaq_u16 (bitvector 128))
(define-symbolic c_vmlaq_u16 (bitvector 128))
(verify (assert (equal? (vmlaq_u16.check a_vmlaq_u16 b_vmlaq_u16 c_vmlaq_u16 ) (vmlaq_u16 a_vmlaq_u16 b_vmlaq_u16 c_vmlaq_u16 ))))
(display "vmlaq_u16" (current-error-port))
(define (vmlaq_u32.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 64)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlaq_u32 (bitvector 128))
(define-symbolic b_vmlaq_u32 (bitvector 128))
(define-symbolic c_vmlaq_u32 (bitvector 128))
(verify (assert (equal? (vmlaq_u32.check a_vmlaq_u32 b_vmlaq_u32 c_vmlaq_u32 ) (vmlaq_u32 a_vmlaq_u32 b_vmlaq_u32 c_vmlaq_u32 ))))
(display "vmlaq_u32" (current-error-port))
(define (vmlaq_u8.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 16)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  7 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvadd  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlaq_u8 (bitvector 128))
(define-symbolic b_vmlaq_u8 (bitvector 128))
(define-symbolic c_vmlaq_u8 (bitvector 128))
(verify (assert (equal? (vmlaq_u8.check a_vmlaq_u8 b_vmlaq_u8 c_vmlaq_u8 ) (vmlaq_u8 a_vmlaq_u8 b_vmlaq_u8 c_vmlaq_u8 ))))
(display "vmlaq_u8" (current-error-port))
(define (vmls_n_s16.check  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %10 (+  e0.new  15))
  (define %11 (extract  %10 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %24 (extract  %10 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmls_n_s16 (bitvector 64))
(define-symbolic b_vmls_n_s16 (bitvector 64))
(define-symbolic c_vmls_n_s16 (bitvector 16))
(verify (assert (equal? (vmls_n_s16.check a_vmls_n_s16 b_vmls_n_s16 c_vmls_n_s16 ) (vmls_n_s16 a_vmls_n_s16 b_vmls_n_s16 c_vmls_n_s16 ))))
(display "vmls_n_s16" (current-error-port))
(define (vmls_n_s32.check  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %10 (+  e0.new  31))
  (define %11 (extract  %10 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %24 (extract  %10 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmls_n_s32 (bitvector 64))
(define-symbolic b_vmls_n_s32 (bitvector 64))
(define-symbolic c_vmls_n_s32 (bitvector 32))
(verify (assert (equal? (vmls_n_s32.check a_vmls_n_s32 b_vmls_n_s32 c_vmls_n_s32 ) (vmls_n_s32 a_vmls_n_s32 b_vmls_n_s32 c_vmls_n_s32 ))))
(display "vmls_n_s32" (current-error-port))
(define (vmls_n_u16.check  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %10 (+  e0.new  15))
  (define %11 (extract  %10 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %24 (extract  %10 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmls_n_u16 (bitvector 64))
(define-symbolic b_vmls_n_u16 (bitvector 64))
(define-symbolic c_vmls_n_u16 (bitvector 16))
(verify (assert (equal? (vmls_n_u16.check a_vmls_n_u16 b_vmls_n_u16 c_vmls_n_u16 ) (vmls_n_u16 a_vmls_n_u16 b_vmls_n_u16 c_vmls_n_u16 ))))
(display "vmls_n_u16" (current-error-port))
(define (vmls_n_u32.check  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %10 (+  e0.new  31))
  (define %11 (extract  %10 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %24 (extract  %10 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmls_n_u32 (bitvector 64))
(define-symbolic b_vmls_n_u32 (bitvector 64))
(define-symbolic c_vmls_n_u32 (bitvector 32))
(verify (assert (equal? (vmls_n_u32.check a_vmls_n_u32 b_vmls_n_u32 c_vmls_n_u32 ) (vmls_n_u32 a_vmls_n_u32 b_vmls_n_u32 c_vmls_n_u32 ))))
(display "vmls_n_u32" (current-error-port))
(define (vmls_s16.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 32)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmls_s16 (bitvector 64))
(define-symbolic b_vmls_s16 (bitvector 64))
(define-symbolic c_vmls_s16 (bitvector 64))
(verify (assert (equal? (vmls_s16.check a_vmls_s16 b_vmls_s16 c_vmls_s16 ) (vmls_s16 a_vmls_s16 b_vmls_s16 c_vmls_s16 ))))
(display "vmls_s16" (current-error-port))
(define (vmls_s32.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 64)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmls_s32 (bitvector 64))
(define-symbolic b_vmls_s32 (bitvector 64))
(define-symbolic c_vmls_s32 (bitvector 64))
(verify (assert (equal? (vmls_s32.check a_vmls_s32 b_vmls_s32 c_vmls_s32 ) (vmls_s32 a_vmls_s32 b_vmls_s32 c_vmls_s32 ))))
(display "vmls_s32" (current-error-port))
(define (vmls_s8.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 16)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  7 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmls_s8 (bitvector 64))
(define-symbolic b_vmls_s8 (bitvector 64))
(define-symbolic c_vmls_s8 (bitvector 64))
(verify (assert (equal? (vmls_s8.check a_vmls_s8 b_vmls_s8 c_vmls_s8 ) (vmls_s8 a_vmls_s8 b_vmls_s8 c_vmls_s8 ))))
(display "vmls_s8" (current-error-port))
(define (vmls_u16.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 32)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmls_u16 (bitvector 64))
(define-symbolic b_vmls_u16 (bitvector 64))
(define-symbolic c_vmls_u16 (bitvector 64))
(verify (assert (equal? (vmls_u16.check a_vmls_u16 b_vmls_u16 c_vmls_u16 ) (vmls_u16 a_vmls_u16 b_vmls_u16 c_vmls_u16 ))))
(display "vmls_u16" (current-error-port))
(define (vmls_u32.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 64)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmls_u32 (bitvector 64))
(define-symbolic b_vmls_u32 (bitvector 64))
(define-symbolic c_vmls_u32 (bitvector 64))
(verify (assert (equal? (vmls_u32.check a_vmls_u32 b_vmls_u32 c_vmls_u32 ) (vmls_u32 a_vmls_u32 b_vmls_u32 c_vmls_u32 ))))
(display "vmls_u32" (current-error-port))
(define (vmls_u8.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 16)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  7 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmls_u8 (bitvector 64))
(define-symbolic b_vmls_u8 (bitvector 64))
(define-symbolic c_vmls_u8 (bitvector 64))
(verify (assert (equal? (vmls_u8.check a_vmls_u8 b_vmls_u8 c_vmls_u8 ) (vmls_u8 a_vmls_u8 b_vmls_u8 c_vmls_u8 ))))
(display "vmls_u8" (current-error-port))
(define (vmlsl_high_n_s16.check  a b c )
(define %2 (extract  127 64 b))
(define %10 (extract  15 0 c))
(define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %13.new0 (/  e0.new  2))
  (define %16 (+  %13.new0  15))
  (define %17 (extract  %16 %13.new0 %2))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 32)))
  (define %21.downcasted0 (bvmul  %18.downcasted0  %11.downcasted0))
  (define %22.downcasted0 (extract  31 0 %21.downcasted0))
  (define %29 (+  e0.new  31))
  (define %39 (extract  %29 e0.new a))
  (define %40 (bvsub  %39  %22.downcasted0))
  %40
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_high_n_s16 (bitvector 128))
(define-symbolic b_vmlsl_high_n_s16 (bitvector 128))
(define-symbolic c_vmlsl_high_n_s16 (bitvector 16))
(verify (assert (equal? (vmlsl_high_n_s16.check a_vmlsl_high_n_s16 b_vmlsl_high_n_s16 c_vmlsl_high_n_s16 ) (vmlsl_high_n_s16 a_vmlsl_high_n_s16 b_vmlsl_high_n_s16 c_vmlsl_high_n_s16 ))))
(display "vmlsl_high_n_s16" (current-error-port))
(define (vmlsl_high_n_s32.check  a b c )
(define %2 (extract  127 64 b))
(define %10 (extract  31 0 c))
(define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %13.new0 (/  e0.new  2))
  (define %16 (+  %13.new0  31))
  (define %17 (extract  %16 %13.new0 %2))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 64)))
  (define %21.downcasted0 (bvmul  %18.downcasted0  %11.downcasted0))
  (define %22.downcasted0 (extract  63 0 %21.downcasted0))
  (define %29 (+  e0.new  63))
  (define %39 (extract  %29 e0.new a))
  (define %40 (bvsub  %39  %22.downcasted0))
  %40
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_high_n_s32 (bitvector 128))
(define-symbolic b_vmlsl_high_n_s32 (bitvector 128))
(define-symbolic c_vmlsl_high_n_s32 (bitvector 32))
(verify (assert (equal? (vmlsl_high_n_s32.check a_vmlsl_high_n_s32 b_vmlsl_high_n_s32 c_vmlsl_high_n_s32 ) (vmlsl_high_n_s32 a_vmlsl_high_n_s32 b_vmlsl_high_n_s32 c_vmlsl_high_n_s32 ))))
(display "vmlsl_high_n_s32" (current-error-port))
(define (vmlsl_high_n_u16.check  a b c )
(define %2 (extract  127 64 b))
(define %10 (extract  15 0 c))
(define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %13.new0 (/  e0.new  2))
  (define %16 (+  %13.new0  15))
  (define %17 (extract  %16 %13.new0 %2))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 32)))
  (define %21.downcasted0 (bvmul  %18.downcasted0  %11.downcasted0))
  (define %22.downcasted0 (extract  31 0 %21.downcasted0))
  (define %29 (+  e0.new  31))
  (define %39 (extract  %29 e0.new a))
  (define %40 (bvsub  %39  %22.downcasted0))
  %40
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_high_n_u16 (bitvector 128))
(define-symbolic b_vmlsl_high_n_u16 (bitvector 128))
(define-symbolic c_vmlsl_high_n_u16 (bitvector 16))
(verify (assert (equal? (vmlsl_high_n_u16.check a_vmlsl_high_n_u16 b_vmlsl_high_n_u16 c_vmlsl_high_n_u16 ) (vmlsl_high_n_u16 a_vmlsl_high_n_u16 b_vmlsl_high_n_u16 c_vmlsl_high_n_u16 ))))
(display "vmlsl_high_n_u16" (current-error-port))
(define (vmlsl_high_n_u32.check  a b c )
(define %2 (extract  127 64 b))
(define %10 (extract  31 0 c))
(define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %13.new0 (/  e0.new  2))
  (define %16 (+  %13.new0  31))
  (define %17 (extract  %16 %13.new0 %2))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 64)))
  (define %21.downcasted0 (bvmul  %18.downcasted0  %11.downcasted0))
  (define %22.downcasted0 (extract  63 0 %21.downcasted0))
  (define %29 (+  e0.new  63))
  (define %39 (extract  %29 e0.new a))
  (define %40 (bvsub  %39  %22.downcasted0))
  %40
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_high_n_u32 (bitvector 128))
(define-symbolic b_vmlsl_high_n_u32 (bitvector 128))
(define-symbolic c_vmlsl_high_n_u32 (bitvector 32))
(verify (assert (equal? (vmlsl_high_n_u32.check a_vmlsl_high_n_u32 b_vmlsl_high_n_u32 c_vmlsl_high_n_u32 ) (vmlsl_high_n_u32 a_vmlsl_high_n_u32 b_vmlsl_high_n_u32 c_vmlsl_high_n_u32 ))))
(display "vmlsl_high_n_u32" (current-error-port))
(define (vmlsl_high_s16.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  15))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 32)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (sign-extend  %21 (bitvector 32)))
  (define %25.downcasted0 (bvmul  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  31 0 %25.downcasted0))
  (define %33 (+  e0.new  31))
  (define %35 (extract  %33 e0.new a))
  (define %36 (bvsub  %35  %26.downcasted0))
  %36
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_high_s16 (bitvector 128))
(define-symbolic b_vmlsl_high_s16 (bitvector 128))
(define-symbolic c_vmlsl_high_s16 (bitvector 128))
(verify (assert (equal? (vmlsl_high_s16.check a_vmlsl_high_s16 b_vmlsl_high_s16 c_vmlsl_high_s16 ) (vmlsl_high_s16 a_vmlsl_high_s16 b_vmlsl_high_s16 c_vmlsl_high_s16 ))))
(display "vmlsl_high_s16" (current-error-port))
(define (vmlsl_high_s32.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  31))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 64)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (sign-extend  %21 (bitvector 64)))
  (define %25.downcasted0 (bvmul  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  63 0 %25.downcasted0))
  (define %33 (+  e0.new  63))
  (define %35 (extract  %33 e0.new a))
  (define %36 (bvsub  %35  %26.downcasted0))
  %36
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_high_s32 (bitvector 128))
(define-symbolic b_vmlsl_high_s32 (bitvector 128))
(define-symbolic c_vmlsl_high_s32 (bitvector 128))
(verify (assert (equal? (vmlsl_high_s32.check a_vmlsl_high_s32 b_vmlsl_high_s32 c_vmlsl_high_s32 ) (vmlsl_high_s32 a_vmlsl_high_s32 b_vmlsl_high_s32 c_vmlsl_high_s32 ))))
(display "vmlsl_high_s32" (current-error-port))
(define (vmlsl_high_s8.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  7))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 16)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (sign-extend  %21 (bitvector 16)))
  (define %25.downcasted0 (bvmul  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  15 0 %25.downcasted0))
  (define %33 (+  e0.new  15))
  (define %35 (extract  %33 e0.new a))
  (define %36 (bvsub  %35  %26.downcasted0))
  %36
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_high_s8 (bitvector 128))
(define-symbolic b_vmlsl_high_s8 (bitvector 128))
(define-symbolic c_vmlsl_high_s8 (bitvector 128))
(verify (assert (equal? (vmlsl_high_s8.check a_vmlsl_high_s8 b_vmlsl_high_s8 c_vmlsl_high_s8 ) (vmlsl_high_s8 a_vmlsl_high_s8 b_vmlsl_high_s8 c_vmlsl_high_s8 ))))
(display "vmlsl_high_s8" (current-error-port))
(define (vmlsl_high_u16.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  15))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 32)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (zero-extend  %21 (bitvector 32)))
  (define %25.downcasted0 (bvmul  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  31 0 %25.downcasted0))
  (define %33 (+  e0.new  31))
  (define %35 (extract  %33 e0.new a))
  (define %36 (bvsub  %35  %26.downcasted0))
  %36
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_high_u16 (bitvector 128))
(define-symbolic b_vmlsl_high_u16 (bitvector 128))
(define-symbolic c_vmlsl_high_u16 (bitvector 128))
(verify (assert (equal? (vmlsl_high_u16.check a_vmlsl_high_u16 b_vmlsl_high_u16 c_vmlsl_high_u16 ) (vmlsl_high_u16 a_vmlsl_high_u16 b_vmlsl_high_u16 c_vmlsl_high_u16 ))))
(display "vmlsl_high_u16" (current-error-port))
(define (vmlsl_high_u32.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  31))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 64)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (zero-extend  %21 (bitvector 64)))
  (define %25.downcasted0 (bvmul  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  63 0 %25.downcasted0))
  (define %33 (+  e0.new  63))
  (define %35 (extract  %33 e0.new a))
  (define %36 (bvsub  %35  %26.downcasted0))
  %36
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_high_u32 (bitvector 128))
(define-symbolic b_vmlsl_high_u32 (bitvector 128))
(define-symbolic c_vmlsl_high_u32 (bitvector 128))
(verify (assert (equal? (vmlsl_high_u32.check a_vmlsl_high_u32 b_vmlsl_high_u32 c_vmlsl_high_u32 ) (vmlsl_high_u32 a_vmlsl_high_u32 b_vmlsl_high_u32 c_vmlsl_high_u32 ))))
(display "vmlsl_high_u32" (current-error-port))
(define (vmlsl_high_u8.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %11.new0 (/  e0.new  2))
  (define %14 (+  %11.new0  7))
  (define %15 (extract  %14 %11.new0 %2))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 16)))
  (define %21 (extract  %14 %11.new0 %5))
  (define %22.downcasted0 (zero-extend  %21 (bitvector 16)))
  (define %25.downcasted0 (bvmul  %16.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  15 0 %25.downcasted0))
  (define %33 (+  e0.new  15))
  (define %35 (extract  %33 e0.new a))
  (define %36 (bvsub  %35  %26.downcasted0))
  %36
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_high_u8 (bitvector 128))
(define-symbolic b_vmlsl_high_u8 (bitvector 128))
(define-symbolic c_vmlsl_high_u8 (bitvector 128))
(verify (assert (equal? (vmlsl_high_u8.check a_vmlsl_high_u8 b_vmlsl_high_u8 c_vmlsl_high_u8 ) (vmlsl_high_u8 a_vmlsl_high_u8 b_vmlsl_high_u8 c_vmlsl_high_u8 ))))
(display "vmlsl_high_u8" (current-error-port))
(define (vmlsl_n_s16.check  a b c )
(define %7 (extract  15 0 c))
(define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %13 (+  e0.new  15))
  (define %14 (extract  %13 e0.new b))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 32)))
  (define %18.downcasted0 (bvmul  %15.downcasted0  %8.downcasted0))
  (define %19.downcasted0 (extract  31 0 %18.downcasted0))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  31))
  (define %36 (extract  %26 %21.new0 a))
  (define %37 (bvsub  %36  %19.downcasted0))
  %37
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_n_s16 (bitvector 128))
(define-symbolic b_vmlsl_n_s16 (bitvector 64))
(define-symbolic c_vmlsl_n_s16 (bitvector 16))
(verify (assert (equal? (vmlsl_n_s16.check a_vmlsl_n_s16 b_vmlsl_n_s16 c_vmlsl_n_s16 ) (vmlsl_n_s16 a_vmlsl_n_s16 b_vmlsl_n_s16 c_vmlsl_n_s16 ))))
(display "vmlsl_n_s16" (current-error-port))
(define (vmlsl_n_s32.check  a b c )
(define %7 (extract  31 0 c))
(define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %13 (+  e0.new  31))
  (define %14 (extract  %13 e0.new b))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %18.downcasted0 (bvmul  %15.downcasted0  %8.downcasted0))
  (define %19.downcasted0 (extract  63 0 %18.downcasted0))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  63))
  (define %36 (extract  %26 %21.new0 a))
  (define %37 (bvsub  %36  %19.downcasted0))
  %37
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_n_s32 (bitvector 128))
(define-symbolic b_vmlsl_n_s32 (bitvector 64))
(define-symbolic c_vmlsl_n_s32 (bitvector 32))
(verify (assert (equal? (vmlsl_n_s32.check a_vmlsl_n_s32 b_vmlsl_n_s32 c_vmlsl_n_s32 ) (vmlsl_n_s32 a_vmlsl_n_s32 b_vmlsl_n_s32 c_vmlsl_n_s32 ))))
(display "vmlsl_n_s32" (current-error-port))
(define (vmlsl_n_u16.check  a b c )
(define %7 (extract  15 0 c))
(define %8.downcasted0 (zero-extend  %7 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %13 (+  e0.new  15))
  (define %14 (extract  %13 e0.new b))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 32)))
  (define %18.downcasted0 (bvmul  %15.downcasted0  %8.downcasted0))
  (define %19.downcasted0 (extract  31 0 %18.downcasted0))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  31))
  (define %36 (extract  %26 %21.new0 a))
  (define %37 (bvsub  %36  %19.downcasted0))
  %37
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_n_u16 (bitvector 128))
(define-symbolic b_vmlsl_n_u16 (bitvector 64))
(define-symbolic c_vmlsl_n_u16 (bitvector 16))
(verify (assert (equal? (vmlsl_n_u16.check a_vmlsl_n_u16 b_vmlsl_n_u16 c_vmlsl_n_u16 ) (vmlsl_n_u16 a_vmlsl_n_u16 b_vmlsl_n_u16 c_vmlsl_n_u16 ))))
(display "vmlsl_n_u16" (current-error-port))
(define (vmlsl_n_u32.check  a b c )
(define %7 (extract  31 0 c))
(define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %13 (+  e0.new  31))
  (define %14 (extract  %13 e0.new b))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %18.downcasted0 (bvmul  %15.downcasted0  %8.downcasted0))
  (define %19.downcasted0 (extract  63 0 %18.downcasted0))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  63))
  (define %36 (extract  %26 %21.new0 a))
  (define %37 (bvsub  %36  %19.downcasted0))
  %37
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_n_u32 (bitvector 128))
(define-symbolic b_vmlsl_n_u32 (bitvector 64))
(define-symbolic c_vmlsl_n_u32 (bitvector 32))
(verify (assert (equal? (vmlsl_n_u32.check a_vmlsl_n_u32 b_vmlsl_n_u32 c_vmlsl_n_u32 ) (vmlsl_n_u32 a_vmlsl_n_u32 b_vmlsl_n_u32 c_vmlsl_n_u32 ))))
(display "vmlsl_n_u32" (current-error-port))
(define (vmlsl_s16.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 32)))
  (define %15 (extract  %8 e0.new c))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 32)))
  (define %19.downcasted0 (bvmul  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (extract  31 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  31))
  (define %29 (extract  %27 %22.new0 a))
  (define %30 (bvsub  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_s16 (bitvector 128))
(define-symbolic b_vmlsl_s16 (bitvector 64))
(define-symbolic c_vmlsl_s16 (bitvector 64))
(verify (assert (equal? (vmlsl_s16.check a_vmlsl_s16 b_vmlsl_s16 c_vmlsl_s16 ) (vmlsl_s16 a_vmlsl_s16 b_vmlsl_s16 c_vmlsl_s16 ))))
(display "vmlsl_s16" (current-error-port))
(define (vmlsl_s32.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %15 (extract  %8 e0.new c))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 64)))
  (define %19.downcasted0 (bvmul  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (extract  63 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  63))
  (define %29 (extract  %27 %22.new0 a))
  (define %30 (bvsub  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_s32 (bitvector 128))
(define-symbolic b_vmlsl_s32 (bitvector 64))
(define-symbolic c_vmlsl_s32 (bitvector 64))
(verify (assert (equal? (vmlsl_s32.check a_vmlsl_s32 b_vmlsl_s32 c_vmlsl_s32 ) (vmlsl_s32 a_vmlsl_s32 b_vmlsl_s32 c_vmlsl_s32 ))))
(display "vmlsl_s32" (current-error-port))
(define (vmlsl_s8.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 16)))
  (define %15 (extract  %8 e0.new c))
  (define %16.downcasted0 (sign-extend  %15 (bitvector 16)))
  (define %19.downcasted0 (bvmul  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (extract  15 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  15))
  (define %29 (extract  %27 %22.new0 a))
  (define %30 (bvsub  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_s8 (bitvector 128))
(define-symbolic b_vmlsl_s8 (bitvector 64))
(define-symbolic c_vmlsl_s8 (bitvector 64))
(verify (assert (equal? (vmlsl_s8.check a_vmlsl_s8 b_vmlsl_s8 c_vmlsl_s8 ) (vmlsl_s8 a_vmlsl_s8 b_vmlsl_s8 c_vmlsl_s8 ))))
(display "vmlsl_s8" (current-error-port))
(define (vmlsl_u16.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 32)))
  (define %15 (extract  %8 e0.new c))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 32)))
  (define %19.downcasted0 (bvmul  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (extract  31 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  31))
  (define %29 (extract  %27 %22.new0 a))
  (define %30 (bvsub  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_u16 (bitvector 128))
(define-symbolic b_vmlsl_u16 (bitvector 64))
(define-symbolic c_vmlsl_u16 (bitvector 64))
(verify (assert (equal? (vmlsl_u16.check a_vmlsl_u16 b_vmlsl_u16 c_vmlsl_u16 ) (vmlsl_u16 a_vmlsl_u16 b_vmlsl_u16 c_vmlsl_u16 ))))
(display "vmlsl_u16" (current-error-port))
(define (vmlsl_u32.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %15 (extract  %8 e0.new c))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 64)))
  (define %19.downcasted0 (bvmul  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (extract  63 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  63))
  (define %29 (extract  %27 %22.new0 a))
  (define %30 (bvsub  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_u32 (bitvector 128))
(define-symbolic b_vmlsl_u32 (bitvector 64))
(define-symbolic c_vmlsl_u32 (bitvector 64))
(verify (assert (equal? (vmlsl_u32.check a_vmlsl_u32 b_vmlsl_u32 c_vmlsl_u32 ) (vmlsl_u32 a_vmlsl_u32 b_vmlsl_u32 c_vmlsl_u32 ))))
(display "vmlsl_u32" (current-error-port))
(define (vmlsl_u8.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 16)))
  (define %15 (extract  %8 e0.new c))
  (define %16.downcasted0 (zero-extend  %15 (bitvector 16)))
  (define %19.downcasted0 (bvmul  %10.downcasted0  %16.downcasted0))
  (define %20.downcasted0 (extract  15 0 %19.downcasted0))
  (define %22.new0 (*  e0.new  2))
  (define %27 (+  %22.new0  15))
  (define %29 (extract  %27 %22.new0 a))
  (define %30 (bvsub  %29  %20.downcasted0))
  %30
 )
 )
)
)
)
result)
(define-symbolic a_vmlsl_u8 (bitvector 128))
(define-symbolic b_vmlsl_u8 (bitvector 64))
(define-symbolic c_vmlsl_u8 (bitvector 64))
(verify (assert (equal? (vmlsl_u8.check a_vmlsl_u8 b_vmlsl_u8 c_vmlsl_u8 ) (vmlsl_u8 a_vmlsl_u8 b_vmlsl_u8 c_vmlsl_u8 ))))
(display "vmlsl_u8" (current-error-port))
(define (vmlsq_n_s16.check  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %10 (+  e0.new  15))
  (define %11 (extract  %10 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %24 (extract  %10 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlsq_n_s16 (bitvector 128))
(define-symbolic b_vmlsq_n_s16 (bitvector 128))
(define-symbolic c_vmlsq_n_s16 (bitvector 16))
(verify (assert (equal? (vmlsq_n_s16.check a_vmlsq_n_s16 b_vmlsq_n_s16 c_vmlsq_n_s16 ) (vmlsq_n_s16 a_vmlsq_n_s16 b_vmlsq_n_s16 c_vmlsq_n_s16 ))))
(display "vmlsq_n_s16" (current-error-port))
(define (vmlsq_n_s32.check  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %10 (+  e0.new  31))
  (define %11 (extract  %10 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %24 (extract  %10 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlsq_n_s32 (bitvector 128))
(define-symbolic b_vmlsq_n_s32 (bitvector 128))
(define-symbolic c_vmlsq_n_s32 (bitvector 32))
(verify (assert (equal? (vmlsq_n_s32.check a_vmlsq_n_s32 b_vmlsq_n_s32 c_vmlsq_n_s32 ) (vmlsq_n_s32 a_vmlsq_n_s32 b_vmlsq_n_s32 c_vmlsq_n_s32 ))))
(display "vmlsq_n_s32" (current-error-port))
(define (vmlsq_n_u16.check  a b c )
(define %4 (extract  15 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %10 (+  e0.new  15))
  (define %11 (extract  %10 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %24 (extract  %10 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlsq_n_u16 (bitvector 128))
(define-symbolic b_vmlsq_n_u16 (bitvector 128))
(define-symbolic c_vmlsq_n_u16 (bitvector 16))
(verify (assert (equal? (vmlsq_n_u16.check a_vmlsq_n_u16 b_vmlsq_n_u16 c_vmlsq_n_u16 ) (vmlsq_n_u16 a_vmlsq_n_u16 b_vmlsq_n_u16 c_vmlsq_n_u16 ))))
(display "vmlsq_n_u16" (current-error-port))
(define (vmlsq_n_u32.check  a b c )
(define %4 (extract  31 0 c))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %10 (+  e0.new  31))
  (define %11 (extract  %10 e0.new b))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %24 (extract  %10 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlsq_n_u32 (bitvector 128))
(define-symbolic b_vmlsq_n_u32 (bitvector 128))
(define-symbolic c_vmlsq_n_u32 (bitvector 32))
(verify (assert (equal? (vmlsq_n_u32.check a_vmlsq_n_u32 b_vmlsq_n_u32 c_vmlsq_n_u32 ) (vmlsq_n_u32 a_vmlsq_n_u32 b_vmlsq_n_u32 c_vmlsq_n_u32 ))))
(display "vmlsq_n_u32" (current-error-port))
(define (vmlsq_s16.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 32)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlsq_s16 (bitvector 128))
(define-symbolic b_vmlsq_s16 (bitvector 128))
(define-symbolic c_vmlsq_s16 (bitvector 128))
(verify (assert (equal? (vmlsq_s16.check a_vmlsq_s16 b_vmlsq_s16 c_vmlsq_s16 ) (vmlsq_s16 a_vmlsq_s16 b_vmlsq_s16 c_vmlsq_s16 ))))
(display "vmlsq_s16" (current-error-port))
(define (vmlsq_s32.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 64)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlsq_s32 (bitvector 128))
(define-symbolic b_vmlsq_s32 (bitvector 128))
(define-symbolic c_vmlsq_s32 (bitvector 128))
(verify (assert (equal? (vmlsq_s32.check a_vmlsq_s32 b_vmlsq_s32 c_vmlsq_s32 ) (vmlsq_s32 a_vmlsq_s32 b_vmlsq_s32 c_vmlsq_s32 ))))
(display "vmlsq_s32" (current-error-port))
(define (vmlsq_s8.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 16)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  7 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlsq_s8 (bitvector 128))
(define-symbolic b_vmlsq_s8 (bitvector 128))
(define-symbolic c_vmlsq_s8 (bitvector 128))
(verify (assert (equal? (vmlsq_s8.check a_vmlsq_s8 b_vmlsq_s8 c_vmlsq_s8 ) (vmlsq_s8 a_vmlsq_s8 b_vmlsq_s8 c_vmlsq_s8 ))))
(display "vmlsq_s8" (current-error-port))
(define (vmlsq_u16.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 32)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlsq_u16 (bitvector 128))
(define-symbolic b_vmlsq_u16 (bitvector 128))
(define-symbolic c_vmlsq_u16 (bitvector 128))
(verify (assert (equal? (vmlsq_u16.check a_vmlsq_u16 b_vmlsq_u16 c_vmlsq_u16 ) (vmlsq_u16 a_vmlsq_u16 b_vmlsq_u16 c_vmlsq_u16 ))))
(display "vmlsq_u16" (current-error-port))
(define (vmlsq_u32.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 64)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlsq_u32 (bitvector 128))
(define-symbolic b_vmlsq_u32 (bitvector 128))
(define-symbolic c_vmlsq_u32 (bitvector 128))
(verify (assert (equal? (vmlsq_u32.check a_vmlsq_u32 b_vmlsq_u32 c_vmlsq_u32 ) (vmlsq_u32 a_vmlsq_u32 b_vmlsq_u32 c_vmlsq_u32 ))))
(display "vmlsq_u32" (current-error-port))
(define (vmlsq_u8.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %10 (extract  %4 e0.new c))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 16)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  7 0 %14.downcasted0))
  (define %24 (extract  %4 e0.new a))
  (define %25 (bvsub  %24  %15.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vmlsq_u8 (bitvector 128))
(define-symbolic b_vmlsq_u8 (bitvector 128))
(define-symbolic c_vmlsq_u8 (bitvector 128))
(verify (assert (equal? (vmlsq_u8.check a_vmlsq_u8 b_vmlsq_u8 c_vmlsq_u8 ) (vmlsq_u8 a_vmlsq_u8 b_vmlsq_u8 c_vmlsq_u8 ))))
(display "vmlsq_u8" (current-error-port))
(define (vmov_n_s16.check  value )
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
(define-symbolic value_vmov_n_s16 (bitvector 16))
(verify (assert (equal? (vmov_n_s16.check value_vmov_n_s16 ) (vmov_n_s16 value_vmov_n_s16 ))))
(display "vmov_n_s16" (current-error-port))
(define (vmov_n_s32.check  value )
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
(define-symbolic value_vmov_n_s32 (bitvector 32))
(verify (assert (equal? (vmov_n_s32.check value_vmov_n_s32 ) (vmov_n_s32 value_vmov_n_s32 ))))
(display "vmov_n_s32" (current-error-port))
(define (vmov_n_s8.check  value )
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
(define-symbolic value_vmov_n_s8 (bitvector 8))
(verify (assert (equal? (vmov_n_s8.check value_vmov_n_s8 ) (vmov_n_s8 value_vmov_n_s8 ))))
(display "vmov_n_s8" (current-error-port))
(define (vmov_n_u16.check  value )
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
(define-symbolic value_vmov_n_u16 (bitvector 16))
(verify (assert (equal? (vmov_n_u16.check value_vmov_n_u16 ) (vmov_n_u16 value_vmov_n_u16 ))))
(display "vmov_n_u16" (current-error-port))
(define (vmov_n_u32.check  value )
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
(define-symbolic value_vmov_n_u32 (bitvector 32))
(verify (assert (equal? (vmov_n_u32.check value_vmov_n_u32 ) (vmov_n_u32 value_vmov_n_u32 ))))
(display "vmov_n_u32" (current-error-port))
(define (vmov_n_u8.check  value )
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
(define-symbolic value_vmov_n_u8 (bitvector 8))
(verify (assert (equal? (vmov_n_u8.check value_vmov_n_u8 ) (vmov_n_u8 value_vmov_n_u8 ))))
(display "vmov_n_u8" (current-error-port))
(define (vmovl_high_s16.check  a )
(define %2 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %5.new0 (/  e0.new  2))
  (define %8 (+  %5.new0  15))
  (define %9 (extract  %8 %5.new0 %2))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 32)))
  (define %22.downcasted0 (extract  31 0 %10.downcasted0))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmovl_high_s16 (bitvector 128))
(verify (assert (equal? (vmovl_high_s16.check a_vmovl_high_s16 ) (vmovl_high_s16 a_vmovl_high_s16 ))))
(display "vmovl_high_s16" (current-error-port))
(define (vmovl_high_s32.check  a )
(define %2 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %5.new0 (/  e0.new  2))
  (define %8 (+  %5.new0  31))
  (define %9 (extract  %8 %5.new0 %2))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %22.downcasted0 (extract  63 0 %10.downcasted0))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmovl_high_s32 (bitvector 128))
(verify (assert (equal? (vmovl_high_s32.check a_vmovl_high_s32 ) (vmovl_high_s32 a_vmovl_high_s32 ))))
(display "vmovl_high_s32" (current-error-port))
(define (vmovl_high_s8.check  a )
(define %2 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %5.new0 (/  e0.new  2))
  (define %8 (+  %5.new0  7))
  (define %9 (extract  %8 %5.new0 %2))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 16)))
  (define %22.downcasted0 (extract  15 0 %10.downcasted0))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmovl_high_s8 (bitvector 128))
(verify (assert (equal? (vmovl_high_s8.check a_vmovl_high_s8 ) (vmovl_high_s8 a_vmovl_high_s8 ))))
(display "vmovl_high_s8" (current-error-port))
(define (vmovl_high_u16.check  a )
(define %2 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %5.new0 (/  e0.new  2))
  (define %8 (+  %5.new0  15))
  (define %9 (extract  %8 %5.new0 %2))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 32)))
  (define %22.downcasted0 (extract  31 0 %10.downcasted0))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmovl_high_u16 (bitvector 128))
(verify (assert (equal? (vmovl_high_u16.check a_vmovl_high_u16 ) (vmovl_high_u16 a_vmovl_high_u16 ))))
(display "vmovl_high_u16" (current-error-port))
(define (vmovl_high_u32.check  a )
(define %2 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %5.new0 (/  e0.new  2))
  (define %8 (+  %5.new0  31))
  (define %9 (extract  %8 %5.new0 %2))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %22.downcasted0 (extract  63 0 %10.downcasted0))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmovl_high_u32 (bitvector 128))
(verify (assert (equal? (vmovl_high_u32.check a_vmovl_high_u32 ) (vmovl_high_u32 a_vmovl_high_u32 ))))
(display "vmovl_high_u32" (current-error-port))
(define (vmovl_high_u8.check  a )
(define %2 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %5.new0 (/  e0.new  2))
  (define %8 (+  %5.new0  7))
  (define %9 (extract  %8 %5.new0 %2))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 16)))
  (define %22.downcasted0 (extract  15 0 %10.downcasted0))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmovl_high_u8 (bitvector 128))
(verify (assert (equal? (vmovl_high_u8.check a_vmovl_high_u8 ) (vmovl_high_u8 a_vmovl_high_u8 ))))
(display "vmovl_high_u8" (current-error-port))
(define (vmovl_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 32)))
  (define %19.downcasted0 (extract  31 0 %7.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmovl_s16 (bitvector 64))
(verify (assert (equal? (vmovl_s16.check a_vmovl_s16 ) (vmovl_s16 a_vmovl_s16 ))))
(display "vmovl_s16" (current-error-port))
(define (vmovl_s32.check  a )
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
  (define %19.downcasted0 (extract  63 0 %7.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmovl_s32 (bitvector 64))
(verify (assert (equal? (vmovl_s32.check a_vmovl_s32 ) (vmovl_s32 a_vmovl_s32 ))))
(display "vmovl_s32" (current-error-port))
(define (vmovl_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 16)))
  (define %19.downcasted0 (extract  15 0 %7.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmovl_s8 (bitvector 64))
(verify (assert (equal? (vmovl_s8.check a_vmovl_s8 ) (vmovl_s8 a_vmovl_s8 ))))
(display "vmovl_s8" (current-error-port))
(define (vmovl_u16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 32)))
  (define %19.downcasted0 (extract  31 0 %7.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmovl_u16 (bitvector 64))
(verify (assert (equal? (vmovl_u16.check a_vmovl_u16 ) (vmovl_u16 a_vmovl_u16 ))))
(display "vmovl_u16" (current-error-port))
(define (vmovl_u32.check  a )
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
  (define %19.downcasted0 (extract  63 0 %7.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmovl_u32 (bitvector 64))
(verify (assert (equal? (vmovl_u32.check a_vmovl_u32 ) (vmovl_u32 a_vmovl_u32 ))))
(display "vmovl_u32" (current-error-port))
(define (vmovl_u8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 16)))
  (define %19.downcasted0 (extract  15 0 %7.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmovl_u8 (bitvector 64))
(verify (assert (equal? (vmovl_u8.check a_vmovl_u8 ) (vmovl_u8 a_vmovl_u8 ))))
(display "vmovl_u8" (current-error-port))
(define (vmovn_high_s16.check  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %17.new.high.idx0 (+  %4.new0  7))
  (define %110.new (extract  %17.new.high.idx0 %4.new0 a))
  %110.new
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define-symbolic r_vmovn_high_s16 (bitvector 64))
(define-symbolic a_vmovn_high_s16 (bitvector 128))
(verify (assert (equal? (vmovn_high_s16.check r_vmovn_high_s16 a_vmovn_high_s16 ) (vmovn_high_s16 r_vmovn_high_s16 a_vmovn_high_s16 ))))
(display "vmovn_high_s16" (current-error-port))
(define (vmovn_high_s32.check  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %17.new.high.idx0 (+  %4.new0  15))
  (define %110.new (extract  %17.new.high.idx0 %4.new0 a))
  %110.new
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define-symbolic r_vmovn_high_s32 (bitvector 64))
(define-symbolic a_vmovn_high_s32 (bitvector 128))
(verify (assert (equal? (vmovn_high_s32.check r_vmovn_high_s32 a_vmovn_high_s32 ) (vmovn_high_s32 r_vmovn_high_s32 a_vmovn_high_s32 ))))
(display "vmovn_high_s32" (current-error-port))
(define (vmovn_high_s64.check  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %17.new.high.idx0 (+  %4.new0  31))
  (define %110.new (extract  %17.new.high.idx0 %4.new0 a))
  %110.new
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define-symbolic r_vmovn_high_s64 (bitvector 64))
(define-symbolic a_vmovn_high_s64 (bitvector 128))
(verify (assert (equal? (vmovn_high_s64.check r_vmovn_high_s64 a_vmovn_high_s64 ) (vmovn_high_s64 r_vmovn_high_s64 a_vmovn_high_s64 ))))
(display "vmovn_high_s64" (current-error-port))
(define (vmovn_high_u16.check  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %17.new.high.idx0 (+  %4.new0  7))
  (define %110.new (extract  %17.new.high.idx0 %4.new0 a))
  %110.new
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define-symbolic r_vmovn_high_u16 (bitvector 64))
(define-symbolic a_vmovn_high_u16 (bitvector 128))
(verify (assert (equal? (vmovn_high_u16.check r_vmovn_high_u16 a_vmovn_high_u16 ) (vmovn_high_u16 r_vmovn_high_u16 a_vmovn_high_u16 ))))
(display "vmovn_high_u16" (current-error-port))
(define (vmovn_high_u32.check  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %17.new.high.idx0 (+  %4.new0  15))
  (define %110.new (extract  %17.new.high.idx0 %4.new0 a))
  %110.new
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define-symbolic r_vmovn_high_u32 (bitvector 64))
(define-symbolic a_vmovn_high_u32 (bitvector 128))
(verify (assert (equal? (vmovn_high_u32.check r_vmovn_high_u32 a_vmovn_high_u32 ) (vmovn_high_u32 r_vmovn_high_u32 a_vmovn_high_u32 ))))
(display "vmovn_high_u32" (current-error-port))
(define (vmovn_high_u64.check  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %17.new.high.idx0 (+  %4.new0  31))
  (define %110.new (extract  %17.new.high.idx0 %4.new0 a))
  %110.new
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define-symbolic r_vmovn_high_u64 (bitvector 64))
(define-symbolic a_vmovn_high_u64 (bitvector 128))
(verify (assert (equal? (vmovn_high_u64.check r_vmovn_high_u64 a_vmovn_high_u64 ) (vmovn_high_u64 r_vmovn_high_u64 a_vmovn_high_u64 ))))
(display "vmovn_high_u64" (current-error-port))
(define (vmovn_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %17.new.high.idx0 (+  %4.new0  7))
  (define %110.new (extract  %17.new.high.idx0 %4.new0 a))
  %110.new
 )
 )
)
)
)
result)
(define-symbolic a_vmovn_s16 (bitvector 128))
(verify (assert (equal? (vmovn_s16.check a_vmovn_s16 ) (vmovn_s16 a_vmovn_s16 ))))
(display "vmovn_s16" (current-error-port))
(define (vmovn_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %17.new.high.idx0 (+  %4.new0  15))
  (define %110.new (extract  %17.new.high.idx0 %4.new0 a))
  %110.new
 )
 )
)
)
)
result)
(define-symbolic a_vmovn_s32 (bitvector 128))
(verify (assert (equal? (vmovn_s32.check a_vmovn_s32 ) (vmovn_s32 a_vmovn_s32 ))))
(display "vmovn_s32" (current-error-port))
(define (vmovn_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %17.new.high.idx0 (+  %4.new0  31))
  (define %110.new (extract  %17.new.high.idx0 %4.new0 a))
  %110.new
 )
 )
)
)
)
result)
(define-symbolic a_vmovn_s64 (bitvector 128))
(verify (assert (equal? (vmovn_s64.check a_vmovn_s64 ) (vmovn_s64 a_vmovn_s64 ))))
(display "vmovn_s64" (current-error-port))
(define (vmovn_u16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %17.new.high.idx0 (+  %4.new0  7))
  (define %110.new (extract  %17.new.high.idx0 %4.new0 a))
  %110.new
 )
 )
)
)
)
result)
(define-symbolic a_vmovn_u16 (bitvector 128))
(verify (assert (equal? (vmovn_u16.check a_vmovn_u16 ) (vmovn_u16 a_vmovn_u16 ))))
(display "vmovn_u16" (current-error-port))
(define (vmovn_u32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %17.new.high.idx0 (+  %4.new0  15))
  (define %110.new (extract  %17.new.high.idx0 %4.new0 a))
  %110.new
 )
 )
)
)
)
result)
(define-symbolic a_vmovn_u32 (bitvector 128))
(verify (assert (equal? (vmovn_u32.check a_vmovn_u32 ) (vmovn_u32 a_vmovn_u32 ))))
(display "vmovn_u32" (current-error-port))
(define (vmovn_u64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %17.new.high.idx0 (+  %4.new0  31))
  (define %110.new (extract  %17.new.high.idx0 %4.new0 a))
  %110.new
 )
 )
)
)
)
result)
(define-symbolic a_vmovn_u64 (bitvector 128))
(verify (assert (equal? (vmovn_u64.check a_vmovn_u64 ) (vmovn_u64 a_vmovn_u64 ))))
(display "vmovn_u64" (current-error-port))
(define (vmovq_n_s16.check  value )
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
(define-symbolic value_vmovq_n_s16 (bitvector 16))
(verify (assert (equal? (vmovq_n_s16.check value_vmovq_n_s16 ) (vmovq_n_s16 value_vmovq_n_s16 ))))
(display "vmovq_n_s16" (current-error-port))
(define (vmovq_n_s32.check  value )
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
(define-symbolic value_vmovq_n_s32 (bitvector 32))
(verify (assert (equal? (vmovq_n_s32.check value_vmovq_n_s32 ) (vmovq_n_s32 value_vmovq_n_s32 ))))
(display "vmovq_n_s32" (current-error-port))
(define (vmovq_n_s64.check  value )
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
(define-symbolic value_vmovq_n_s64 (bitvector 64))
(verify (assert (equal? (vmovq_n_s64.check value_vmovq_n_s64 ) (vmovq_n_s64 value_vmovq_n_s64 ))))
(display "vmovq_n_s64" (current-error-port))
(define (vmovq_n_s8.check  value )
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
(define-symbolic value_vmovq_n_s8 (bitvector 8))
(verify (assert (equal? (vmovq_n_s8.check value_vmovq_n_s8 ) (vmovq_n_s8 value_vmovq_n_s8 ))))
(display "vmovq_n_s8" (current-error-port))
(define (vmovq_n_u16.check  value )
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
(define-symbolic value_vmovq_n_u16 (bitvector 16))
(verify (assert (equal? (vmovq_n_u16.check value_vmovq_n_u16 ) (vmovq_n_u16 value_vmovq_n_u16 ))))
(display "vmovq_n_u16" (current-error-port))
(define (vmovq_n_u32.check  value )
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
(define-symbolic value_vmovq_n_u32 (bitvector 32))
(verify (assert (equal? (vmovq_n_u32.check value_vmovq_n_u32 ) (vmovq_n_u32 value_vmovq_n_u32 ))))
(display "vmovq_n_u32" (current-error-port))
(define (vmovq_n_u64.check  value )
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
(define-symbolic value_vmovq_n_u64 (bitvector 64))
(verify (assert (equal? (vmovq_n_u64.check value_vmovq_n_u64 ) (vmovq_n_u64 value_vmovq_n_u64 ))))
(display "vmovq_n_u64" (current-error-port))
(define (vmovq_n_u8.check  value )
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
(define-symbolic value_vmovq_n_u8 (bitvector 8))
(verify (assert (equal? (vmovq_n_u8.check value_vmovq_n_u8 ) (vmovq_n_u8 value_vmovq_n_u8 ))))
(display "vmovq_n_u8" (current-error-port))
(define (vmul_n_s16.check  a b )
(define %4 (extract  15 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %10 (+  e0.new  15))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmul_n_s16 (bitvector 64))
(define-symbolic b_vmul_n_s16 (bitvector 16))
(verify (assert (equal? (vmul_n_s16.check a_vmul_n_s16 b_vmul_n_s16 ) (vmul_n_s16 a_vmul_n_s16 b_vmul_n_s16 ))))
(display "vmul_n_s16" (current-error-port))
(define (vmul_n_s32.check  a b )
(define %4 (extract  31 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %10 (+  e0.new  31))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmul_n_s32 (bitvector 64))
(define-symbolic b_vmul_n_s32 (bitvector 32))
(verify (assert (equal? (vmul_n_s32.check a_vmul_n_s32 b_vmul_n_s32 ) (vmul_n_s32 a_vmul_n_s32 b_vmul_n_s32 ))))
(display "vmul_n_s32" (current-error-port))
(define (vmul_n_u16.check  a b )
(define %4 (extract  15 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %10 (+  e0.new  15))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmul_n_u16 (bitvector 64))
(define-symbolic b_vmul_n_u16 (bitvector 16))
(verify (assert (equal? (vmul_n_u16.check a_vmul_n_u16 b_vmul_n_u16 ) (vmul_n_u16 a_vmul_n_u16 b_vmul_n_u16 ))))
(display "vmul_n_u16" (current-error-port))
(define (vmul_n_u32.check  a b )
(define %4 (extract  31 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %10 (+  e0.new  31))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmul_n_u32 (bitvector 64))
(define-symbolic b_vmul_n_u32 (bitvector 32))
(verify (assert (equal? (vmul_n_u32.check a_vmul_n_u32 b_vmul_n_u32 ) (vmul_n_u32 a_vmul_n_u32 b_vmul_n_u32 ))))
(display "vmul_n_u32" (current-error-port))
(define (vmul_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 32)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmul_s16 (bitvector 64))
(define-symbolic b_vmul_s16 (bitvector 64))
(verify (assert (equal? (vmul_s16.check a_vmul_s16 b_vmul_s16 ) (vmul_s16 a_vmul_s16 b_vmul_s16 ))))
(display "vmul_s16" (current-error-port))
(define (vmul_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 64)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmul_s32 (bitvector 64))
(define-symbolic b_vmul_s32 (bitvector 64))
(verify (assert (equal? (vmul_s32.check a_vmul_s32 b_vmul_s32 ) (vmul_s32 a_vmul_s32 b_vmul_s32 ))))
(display "vmul_s32" (current-error-port))
(define (vmul_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 16)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  7 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmul_s8 (bitvector 64))
(define-symbolic b_vmul_s8 (bitvector 64))
(verify (assert (equal? (vmul_s8.check a_vmul_s8 b_vmul_s8 ) (vmul_s8 a_vmul_s8 b_vmul_s8 ))))
(display "vmul_s8" (current-error-port))
(define (vmul_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 32)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmul_u16 (bitvector 64))
(define-symbolic b_vmul_u16 (bitvector 64))
(verify (assert (equal? (vmul_u16.check a_vmul_u16 b_vmul_u16 ) (vmul_u16 a_vmul_u16 b_vmul_u16 ))))
(display "vmul_u16" (current-error-port))
(define (vmul_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 64)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmul_u32 (bitvector 64))
(define-symbolic b_vmul_u32 (bitvector 64))
(verify (assert (equal? (vmul_u32.check a_vmul_u32 b_vmul_u32 ) (vmul_u32 a_vmul_u32 b_vmul_u32 ))))
(display "vmul_u32" (current-error-port))
(define (vmul_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 16)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  7 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmul_u8 (bitvector 64))
(define-symbolic b_vmul_u8 (bitvector 64))
(verify (assert (equal? (vmul_u8.check a_vmul_u8 b_vmul_u8 ) (vmul_u8 a_vmul_u8 b_vmul_u8 ))))
(display "vmul_u8" (current-error-port))
(define (vmull_high_n_s16.check  a b )
(define %2 (extract  127 64 a))
(define %9 (extract  15 0 b))
(define %10.downcasted0 (sign-extend  %9 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %12.new0 (/  e0.new  2))
  (define %15 (+  %12.new0  15))
  (define %16 (extract  %15 %12.new0 %2))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 32)))
  (define %20.downcasted0 (bvmul  %17.downcasted0  %10.downcasted0))
  (define %21.downcasted0 (extract  31 0 %20.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_high_n_s16 (bitvector 128))
(define-symbolic b_vmull_high_n_s16 (bitvector 16))
(verify (assert (equal? (vmull_high_n_s16.check a_vmull_high_n_s16 b_vmull_high_n_s16 ) (vmull_high_n_s16 a_vmull_high_n_s16 b_vmull_high_n_s16 ))))
(display "vmull_high_n_s16" (current-error-port))
(define (vmull_high_n_s32.check  a b )
(define %2 (extract  127 64 a))
(define %9 (extract  31 0 b))
(define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %12.new0 (/  e0.new  2))
  (define %15 (+  %12.new0  31))
  (define %16 (extract  %15 %12.new0 %2))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvmul  %17.downcasted0  %10.downcasted0))
  (define %21.downcasted0 (extract  63 0 %20.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_high_n_s32 (bitvector 128))
(define-symbolic b_vmull_high_n_s32 (bitvector 32))
(verify (assert (equal? (vmull_high_n_s32.check a_vmull_high_n_s32 b_vmull_high_n_s32 ) (vmull_high_n_s32 a_vmull_high_n_s32 b_vmull_high_n_s32 ))))
(display "vmull_high_n_s32" (current-error-port))
(define (vmull_high_n_u16.check  a b )
(define %2 (extract  127 64 a))
(define %9 (extract  15 0 b))
(define %10.downcasted0 (zero-extend  %9 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %12.new0 (/  e0.new  2))
  (define %15 (+  %12.new0  15))
  (define %16 (extract  %15 %12.new0 %2))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 32)))
  (define %20.downcasted0 (bvmul  %17.downcasted0  %10.downcasted0))
  (define %21.downcasted0 (extract  31 0 %20.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_high_n_u16 (bitvector 128))
(define-symbolic b_vmull_high_n_u16 (bitvector 16))
(verify (assert (equal? (vmull_high_n_u16.check a_vmull_high_n_u16 b_vmull_high_n_u16 ) (vmull_high_n_u16 a_vmull_high_n_u16 b_vmull_high_n_u16 ))))
(display "vmull_high_n_u16" (current-error-port))
(define (vmull_high_n_u32.check  a b )
(define %2 (extract  127 64 a))
(define %9 (extract  31 0 b))
(define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %12.new0 (/  e0.new  2))
  (define %15 (+  %12.new0  31))
  (define %16 (extract  %15 %12.new0 %2))
  (define %17.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvmul  %17.downcasted0  %10.downcasted0))
  (define %21.downcasted0 (extract  63 0 %20.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_high_n_u32 (bitvector 128))
(define-symbolic b_vmull_high_n_u32 (bitvector 32))
(verify (assert (equal? (vmull_high_n_u32.check a_vmull_high_n_u32 b_vmull_high_n_u32 ) (vmull_high_n_u32 a_vmull_high_n_u32 b_vmull_high_n_u32 ))))
(display "vmull_high_n_u32" (current-error-port))
(define (vmull_high_s16.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  15))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 32)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (sign-extend  %18 (bitvector 32)))
  (define %30.downcasted0 (bvmul  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  31 0 %30.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_high_s16 (bitvector 128))
(define-symbolic b_vmull_high_s16 (bitvector 128))
(verify (assert (equal? (vmull_high_s16.check a_vmull_high_s16 b_vmull_high_s16 ) (vmull_high_s16 a_vmull_high_s16 b_vmull_high_s16 ))))
(display "vmull_high_s16" (current-error-port))
(define (vmull_high_s32.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  31))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 64)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (sign-extend  %18 (bitvector 64)))
  (define %30.downcasted0 (bvmul  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  63 0 %30.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_high_s32 (bitvector 128))
(define-symbolic b_vmull_high_s32 (bitvector 128))
(verify (assert (equal? (vmull_high_s32.check a_vmull_high_s32 b_vmull_high_s32 ) (vmull_high_s32 a_vmull_high_s32 b_vmull_high_s32 ))))
(display "vmull_high_s32" (current-error-port))
(define (vmull_high_s8.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  7))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 16)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (sign-extend  %18 (bitvector 16)))
  (define %30.downcasted0 (bvmul  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  15 0 %30.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_high_s8 (bitvector 128))
(define-symbolic b_vmull_high_s8 (bitvector 128))
(verify (assert (equal? (vmull_high_s8.check a_vmull_high_s8 b_vmull_high_s8 ) (vmull_high_s8 a_vmull_high_s8 b_vmull_high_s8 ))))
(display "vmull_high_s8" (current-error-port))
(define (vmull_high_u16.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  15))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 32)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (zero-extend  %18 (bitvector 32)))
  (define %30.downcasted0 (bvmul  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  31 0 %30.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_high_u16 (bitvector 128))
(define-symbolic b_vmull_high_u16 (bitvector 128))
(verify (assert (equal? (vmull_high_u16.check a_vmull_high_u16 b_vmull_high_u16 ) (vmull_high_u16 a_vmull_high_u16 b_vmull_high_u16 ))))
(display "vmull_high_u16" (current-error-port))
(define (vmull_high_u32.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  31))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 64)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (zero-extend  %18 (bitvector 64)))
  (define %30.downcasted0 (bvmul  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  63 0 %30.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_high_u32 (bitvector 128))
(define-symbolic b_vmull_high_u32 (bitvector 128))
(verify (assert (equal? (vmull_high_u32.check a_vmull_high_u32 b_vmull_high_u32 ) (vmull_high_u32 a_vmull_high_u32 b_vmull_high_u32 ))))
(display "vmull_high_u32" (current-error-port))
(define (vmull_high_u8.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  7))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 16)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (zero-extend  %18 (bitvector 16)))
  (define %30.downcasted0 (bvmul  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  15 0 %30.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_high_u8 (bitvector 128))
(define-symbolic b_vmull_high_u8 (bitvector 128))
(verify (assert (equal? (vmull_high_u8.check a_vmull_high_u8 b_vmull_high_u8 ) (vmull_high_u8 a_vmull_high_u8 b_vmull_high_u8 ))))
(display "vmull_high_u8" (current-error-port))
(define (vmull_n_s16.check  a b )
(define %6 (extract  15 0 b))
(define %7.downcasted0 (sign-extend  %6 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %12 (+  e0.new  15))
  (define %13 (extract  %12 e0.new a))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 32)))
  (define %17.downcasted0 (bvmul  %14.downcasted0  %7.downcasted0))
  (define %18.downcasted0 (extract  31 0 %17.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_n_s16 (bitvector 64))
(define-symbolic b_vmull_n_s16 (bitvector 16))
(verify (assert (equal? (vmull_n_s16.check a_vmull_n_s16 b_vmull_n_s16 ) (vmull_n_s16 a_vmull_n_s16 b_vmull_n_s16 ))))
(display "vmull_n_s16" (current-error-port))
(define (vmull_n_s32.check  a b )
(define %6 (extract  31 0 b))
(define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %12 (+  e0.new  31))
  (define %13 (extract  %12 e0.new a))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 64)))
  (define %17.downcasted0 (bvmul  %14.downcasted0  %7.downcasted0))
  (define %18.downcasted0 (extract  63 0 %17.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_n_s32 (bitvector 64))
(define-symbolic b_vmull_n_s32 (bitvector 32))
(verify (assert (equal? (vmull_n_s32.check a_vmull_n_s32 b_vmull_n_s32 ) (vmull_n_s32 a_vmull_n_s32 b_vmull_n_s32 ))))
(display "vmull_n_s32" (current-error-port))
(define (vmull_n_u16.check  a b )
(define %6 (extract  15 0 b))
(define %7.downcasted0 (zero-extend  %6 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %12 (+  e0.new  15))
  (define %13 (extract  %12 e0.new a))
  (define %14.downcasted0 (zero-extend  %13 (bitvector 32)))
  (define %17.downcasted0 (bvmul  %14.downcasted0  %7.downcasted0))
  (define %18.downcasted0 (extract  31 0 %17.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_n_u16 (bitvector 64))
(define-symbolic b_vmull_n_u16 (bitvector 16))
(verify (assert (equal? (vmull_n_u16.check a_vmull_n_u16 b_vmull_n_u16 ) (vmull_n_u16 a_vmull_n_u16 b_vmull_n_u16 ))))
(display "vmull_n_u16" (current-error-port))
(define (vmull_n_u32.check  a b )
(define %6 (extract  31 0 b))
(define %7.downcasted0 (zero-extend  %6 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %12 (+  e0.new  31))
  (define %13 (extract  %12 e0.new a))
  (define %14.downcasted0 (zero-extend  %13 (bitvector 64)))
  (define %17.downcasted0 (bvmul  %14.downcasted0  %7.downcasted0))
  (define %18.downcasted0 (extract  63 0 %17.downcasted0))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_n_u32 (bitvector 64))
(define-symbolic b_vmull_n_u32 (bitvector 32))
(verify (assert (equal? (vmull_n_u32.check a_vmull_n_u32 b_vmull_n_u32 ) (vmull_n_u32 a_vmull_n_u32 b_vmull_n_u32 ))))
(display "vmull_n_u32" (current-error-port))
(define (vmull_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 32)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 32)))
  (define %24.downcasted0 (bvmul  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  31 0 %24.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_s16 (bitvector 64))
(define-symbolic b_vmull_s16 (bitvector 64))
(verify (assert (equal? (vmull_s16.check a_vmull_s16 b_vmull_s16 ) (vmull_s16 a_vmull_s16 b_vmull_s16 ))))
(display "vmull_s16" (current-error-port))
(define (vmull_s32.check  a b )
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
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 64)))
  (define %24.downcasted0 (bvmul  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  63 0 %24.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_s32 (bitvector 64))
(define-symbolic b_vmull_s32 (bitvector 64))
(verify (assert (equal? (vmull_s32.check a_vmull_s32 b_vmull_s32 ) (vmull_s32 a_vmull_s32 b_vmull_s32 ))))
(display "vmull_s32" (current-error-port))
(define (vmull_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 16)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 16)))
  (define %24.downcasted0 (bvmul  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  15 0 %24.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_s8 (bitvector 64))
(define-symbolic b_vmull_s8 (bitvector 64))
(verify (assert (equal? (vmull_s8.check a_vmull_s8 b_vmull_s8 ) (vmull_s8 a_vmull_s8 b_vmull_s8 ))))
(display "vmull_s8" (current-error-port))
(define (vmull_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 32)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 32)))
  (define %24.downcasted0 (bvmul  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  31 0 %24.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_u16 (bitvector 64))
(define-symbolic b_vmull_u16 (bitvector 64))
(verify (assert (equal? (vmull_u16.check a_vmull_u16 b_vmull_u16 ) (vmull_u16 a_vmull_u16 b_vmull_u16 ))))
(display "vmull_u16" (current-error-port))
(define (vmull_u32.check  a b )
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
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 64)))
  (define %24.downcasted0 (bvmul  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  63 0 %24.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_u32 (bitvector 64))
(define-symbolic b_vmull_u32 (bitvector 64))
(verify (assert (equal? (vmull_u32.check a_vmull_u32 b_vmull_u32 ) (vmull_u32 a_vmull_u32 b_vmull_u32 ))))
(display "vmull_u32" (current-error-port))
(define (vmull_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 16)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 16)))
  (define %24.downcasted0 (bvmul  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  15 0 %24.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmull_u8 (bitvector 64))
(define-symbolic b_vmull_u8 (bitvector 64))
(verify (assert (equal? (vmull_u8.check a_vmull_u8 b_vmull_u8 ) (vmull_u8 a_vmull_u8 b_vmull_u8 ))))
(display "vmull_u8" (current-error-port))
(define (vmulq_n_s16.check  a b )
(define %4 (extract  15 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %10 (+  e0.new  15))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmulq_n_s16 (bitvector 128))
(define-symbolic b_vmulq_n_s16 (bitvector 16))
(verify (assert (equal? (vmulq_n_s16.check a_vmulq_n_s16 b_vmulq_n_s16 ) (vmulq_n_s16 a_vmulq_n_s16 b_vmulq_n_s16 ))))
(display "vmulq_n_s16" (current-error-port))
(define (vmulq_n_s32.check  a b )
(define %4 (extract  31 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %10 (+  e0.new  31))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmulq_n_s32 (bitvector 128))
(define-symbolic b_vmulq_n_s32 (bitvector 32))
(verify (assert (equal? (vmulq_n_s32.check a_vmulq_n_s32 b_vmulq_n_s32 ) (vmulq_n_s32 a_vmulq_n_s32 b_vmulq_n_s32 ))))
(display "vmulq_n_s32" (current-error-port))
(define (vmulq_n_u16.check  a b )
(define %4 (extract  15 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %10 (+  e0.new  15))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmulq_n_u16 (bitvector 128))
(define-symbolic b_vmulq_n_u16 (bitvector 16))
(verify (assert (equal? (vmulq_n_u16.check a_vmulq_n_u16 b_vmulq_n_u16 ) (vmulq_n_u16 a_vmulq_n_u16 b_vmulq_n_u16 ))))
(display "vmulq_n_u16" (current-error-port))
(define (vmulq_n_u32.check  a b )
(define %4 (extract  31 0 b))
(define %5.downcasted0 (zero-extend  %4 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %10 (+  e0.new  31))
  (define %11 (extract  %10 e0.new a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %5.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmulq_n_u32 (bitvector 128))
(define-symbolic b_vmulq_n_u32 (bitvector 32))
(verify (assert (equal? (vmulq_n_u32.check a_vmulq_n_u32 b_vmulq_n_u32 ) (vmulq_n_u32 a_vmulq_n_u32 b_vmulq_n_u32 ))))
(display "vmulq_n_u32" (current-error-port))
(define (vmulq_s16.check  a b )
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
  (define %12.downcasted0 (zero-extend  %5 (bitvector 32)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmulq_s16 (bitvector 128))
(define-symbolic b_vmulq_s16 (bitvector 128))
(verify (assert (equal? (vmulq_s16.check a_vmulq_s16 b_vmulq_s16 ) (vmulq_s16 a_vmulq_s16 b_vmulq_s16 ))))
(display "vmulq_s16" (current-error-port))
(define (vmulq_s32.check  a b )
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
  (define %12.downcasted0 (zero-extend  %5 (bitvector 64)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmulq_s32 (bitvector 128))
(define-symbolic b_vmulq_s32 (bitvector 128))
(verify (assert (equal? (vmulq_s32.check a_vmulq_s32 b_vmulq_s32 ) (vmulq_s32 a_vmulq_s32 b_vmulq_s32 ))))
(display "vmulq_s32" (current-error-port))
(define (vmulq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 16)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  7 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmulq_s8 (bitvector 128))
(define-symbolic b_vmulq_s8 (bitvector 128))
(verify (assert (equal? (vmulq_s8.check a_vmulq_s8 b_vmulq_s8 ) (vmulq_s8 a_vmulq_s8 b_vmulq_s8 ))))
(display "vmulq_s8" (current-error-port))
(define (vmulq_u16.check  a b )
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
  (define %12.downcasted0 (zero-extend  %5 (bitvector 32)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  15 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmulq_u16 (bitvector 128))
(define-symbolic b_vmulq_u16 (bitvector 128))
(verify (assert (equal? (vmulq_u16.check a_vmulq_u16 b_vmulq_u16 ) (vmulq_u16 a_vmulq_u16 b_vmulq_u16 ))))
(display "vmulq_u16" (current-error-port))
(define (vmulq_u32.check  a b )
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
  (define %12.downcasted0 (zero-extend  %5 (bitvector 64)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  31 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmulq_u32 (bitvector 128))
(define-symbolic b_vmulq_u32 (bitvector 128))
(verify (assert (equal? (vmulq_u32.check a_vmulq_u32 b_vmulq_u32 ) (vmulq_u32 a_vmulq_u32 b_vmulq_u32 ))))
(display "vmulq_u32" (current-error-port))
(define (vmulq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %12.downcasted0 (zero-extend  %5 (bitvector 16)))
  (define %13.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %14.downcasted0 (bvmul  %12.downcasted0  %13.downcasted0))
  (define %15.downcasted0 (extract  7 0 %14.downcasted0))
  %15.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vmulq_u8 (bitvector 128))
(define-symbolic b_vmulq_u8 (bitvector 128))
(verify (assert (equal? (vmulq_u8.check a_vmulq_u8 b_vmulq_u8 ) (vmulq_u8 a_vmulq_u8 b_vmulq_u8 ))))
(display "vmulq_u8" (current-error-port))
(define (vmvn_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (bvnot  %5))
  %10
 )
 )
)
)
)
result)
(define-symbolic a_vmvn_s16 (bitvector 64))
(verify (assert (equal? (vmvn_s16.check a_vmvn_s16 ) (vmvn_s16 a_vmvn_s16 ))))
(display "vmvn_s16" (current-error-port))
(define (vmvn_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (bvnot  %5))
  %10
 )
 )
)
)
)
result)
(define-symbolic a_vmvn_s32 (bitvector 64))
(verify (assert (equal? (vmvn_s32.check a_vmvn_s32 ) (vmvn_s32 a_vmvn_s32 ))))
(display "vmvn_s32" (current-error-port))
(define (vmvn_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (bvnot  %5))
  %10
 )
 )
)
)
)
result)
(define-symbolic a_vmvn_s8 (bitvector 64))
(verify (assert (equal? (vmvn_s8.check a_vmvn_s8 ) (vmvn_s8 a_vmvn_s8 ))))
(display "vmvn_s8" (current-error-port))
(define (vmvn_u16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (bvnot  %5))
  %10
 )
 )
)
)
)
result)
(define-symbolic a_vmvn_u16 (bitvector 64))
(verify (assert (equal? (vmvn_u16.check a_vmvn_u16 ) (vmvn_u16 a_vmvn_u16 ))))
(display "vmvn_u16" (current-error-port))
(define (vmvn_u32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (bvnot  %5))
  %10
 )
 )
)
)
)
result)
(define-symbolic a_vmvn_u32 (bitvector 64))
(verify (assert (equal? (vmvn_u32.check a_vmvn_u32 ) (vmvn_u32 a_vmvn_u32 ))))
(display "vmvn_u32" (current-error-port))
(define (vmvn_u8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (bvnot  %5))
  %10
 )
 )
)
)
)
result)
(define-symbolic a_vmvn_u8 (bitvector 64))
(verify (assert (equal? (vmvn_u8.check a_vmvn_u8 ) (vmvn_u8 a_vmvn_u8 ))))
(display "vmvn_u8" (current-error-port))
(define (vmvnq_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (bvnot  %5))
  %10
 )
 )
)
)
)
result)
(define-symbolic a_vmvnq_s16 (bitvector 128))
(verify (assert (equal? (vmvnq_s16.check a_vmvnq_s16 ) (vmvnq_s16 a_vmvnq_s16 ))))
(display "vmvnq_s16" (current-error-port))
(define (vmvnq_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (bvnot  %5))
  %10
 )
 )
)
)
)
result)
(define-symbolic a_vmvnq_s32 (bitvector 128))
(verify (assert (equal? (vmvnq_s32.check a_vmvnq_s32 ) (vmvnq_s32 a_vmvnq_s32 ))))
(display "vmvnq_s32" (current-error-port))
(define (vmvnq_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (bvnot  %5))
  %10
 )
 )
)
)
)
result)
(define-symbolic a_vmvnq_s8 (bitvector 128))
(verify (assert (equal? (vmvnq_s8.check a_vmvnq_s8 ) (vmvnq_s8 a_vmvnq_s8 ))))
(display "vmvnq_s8" (current-error-port))
(define (vmvnq_u16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (bvnot  %5))
  %10
 )
 )
)
)
)
result)
(define-symbolic a_vmvnq_u16 (bitvector 128))
(verify (assert (equal? (vmvnq_u16.check a_vmvnq_u16 ) (vmvnq_u16 a_vmvnq_u16 ))))
(display "vmvnq_u16" (current-error-port))
(define (vmvnq_u32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (bvnot  %5))
  %10
 )
 )
)
)
)
result)
(define-symbolic a_vmvnq_u32 (bitvector 128))
(verify (assert (equal? (vmvnq_u32.check a_vmvnq_u32 ) (vmvnq_u32 a_vmvnq_u32 ))))
(display "vmvnq_u32" (current-error-port))
(define (vmvnq_u8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (bvnot  %5))
  %10
 )
 )
)
)
)
result)
(define-symbolic a_vmvnq_u8 (bitvector 128))
(verify (assert (equal? (vmvnq_u8.check a_vmvnq_u8 ) (vmvnq_u8 a_vmvnq_u8 ))))
(display "vmvnq_u8" (current-error-port))
(define (vneg_s16.check  a )
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
  (define %7.downcasted0 (bvneg  %6.downcasted0))
  (define %13.downcasted0 (extract  15 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vneg_s16 (bitvector 64))
(verify (assert (equal? (vneg_s16.check a_vneg_s16 ) (vneg_s16 a_vneg_s16 ))))
(display "vneg_s16" (current-error-port))
(define (vneg_s32.check  a )
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
  (define %7.downcasted0 (bvneg  %6.downcasted0))
  (define %13.downcasted0 (extract  31 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vneg_s32 (bitvector 64))
(verify (assert (equal? (vneg_s32.check a_vneg_s32 ) (vneg_s32 a_vneg_s32 ))))
(display "vneg_s32" (current-error-port))
(define (vneg_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 128)))
  (define %7.downcasted0 (bvneg  %6.downcasted0))
  (define %13.downcasted0 (extract  63 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vneg_s64 (bitvector 64))
(verify (assert (equal? (vneg_s64.check a_vneg_s64 ) (vneg_s64 a_vneg_s64 ))))
(display "vneg_s64" (current-error-port))
(define (vneg_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 16)))
  (define %7.downcasted0 (bvneg  %6.downcasted0))
  (define %13.downcasted0 (extract  7 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vneg_s8 (bitvector 64))
(verify (assert (equal? (vneg_s8.check a_vneg_s8 ) (vneg_s8 a_vneg_s8 ))))
(display "vneg_s8" (current-error-port))
(define (vnegd_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 128)))
  (define %7.downcasted0 (bvneg  %6.downcasted0))
  (define %13.downcasted0 (extract  63 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vnegd_s64 (bitvector 64))
(verify (assert (equal? (vnegd_s64.check a_vnegd_s64 ) (vnegd_s64 a_vnegd_s64 ))))
(display "vnegd_s64" (current-error-port))
(define (vnegq_s16.check  a )
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
  (define %7.downcasted0 (bvneg  %6.downcasted0))
  (define %13.downcasted0 (extract  15 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vnegq_s16 (bitvector 128))
(verify (assert (equal? (vnegq_s16.check a_vnegq_s16 ) (vnegq_s16 a_vnegq_s16 ))))
(display "vnegq_s16" (current-error-port))
(define (vnegq_s32.check  a )
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
  (define %7.downcasted0 (bvneg  %6.downcasted0))
  (define %13.downcasted0 (extract  31 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vnegq_s32 (bitvector 128))
(verify (assert (equal? (vnegq_s32.check a_vnegq_s32 ) (vnegq_s32 a_vnegq_s32 ))))
(display "vnegq_s32" (current-error-port))
(define (vnegq_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 128)))
  (define %7.downcasted0 (bvneg  %6.downcasted0))
  (define %13.downcasted0 (extract  63 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vnegq_s64 (bitvector 128))
(verify (assert (equal? (vnegq_s64.check a_vnegq_s64 ) (vnegq_s64 a_vnegq_s64 ))))
(display "vnegq_s64" (current-error-port))
(define (vnegq_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %6.downcasted0 (sign-extend  %5 (bitvector 16)))
  (define %7.downcasted0 (bvneg  %6.downcasted0))
  (define %13.downcasted0 (extract  7 0 %7.downcasted0))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vnegq_s8 (bitvector 128))
(verify (assert (equal? (vnegq_s8.check a_vnegq_s8 ) (vnegq_s8 a_vnegq_s8 ))))
(display "vnegq_s8" (current-error-port))
(define (vpadal_s16.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 16))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  15))
  (define %10 (extract  %9 %4.new0 b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.new0 (/  e0.new  8))
  (define %13 (+  %12.new0  1))
  (define %14 (*  %13  16))
  (define %19 (+  %14  15))
  (define %20 (extract  %19 %14 b))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 32)))
  (define %24.downcasted0 (bvadd  %11.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (extract  31 0 %24.downcasted0))
  (define %32 (+  %4.new0  31))
  (define %42 (extract  %32 %4.new0 a))
  (define %43 (bvadd  %42  %25.downcasted0))
  %43
 )
 )
)
)
)
result2)
(define-symbolic a_vpadal_s16 (bitvector 64))
(define-symbolic b_vpadal_s16 (bitvector 64))
(verify (assert (equal? (vpadal_s16.check a_vpadal_s16 b_vpadal_s16 ) (vpadal_s16 a_vpadal_s16 b_vpadal_s16 ))))
(display "vpadal_s16" (current-error-port))
(define (vpadal_s32.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  31))
  (define %10 (extract  %9 %4.new0 b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.new0 (/  e0.new  16))
  (define %13 (+  %12.new0  1))
  (define %14 (*  %13  32))
  (define %19 (+  %14  31))
  (define %20 (extract  %19 %14 b))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 64)))
  (define %24.downcasted0 (bvadd  %11.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (extract  63 0 %24.downcasted0))
  (define %32 (+  %4.new0  63))
  (define %42 (extract  %32 %4.new0 a))
  (define %43 (bvadd  %42  %25.downcasted0))
  %43
 )
 )
)
)
)
result2)
(define-symbolic a_vpadal_s32 (bitvector 64))
(define-symbolic b_vpadal_s32 (bitvector 64))
(verify (assert (equal? (vpadal_s32.check a_vpadal_s32 b_vpadal_s32 ) (vpadal_s32 a_vpadal_s32 b_vpadal_s32 ))))
(display "vpadal_s32" (current-error-port))
(define (vpadal_s8.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 8))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  7))
  (define %10 (extract  %9 %4.new0 b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %12.new0 (/  e0.new  4))
  (define %13 (+  %12.new0  1))
  (define %14 (*  %13  8))
  (define %19 (+  %14  7))
  (define %20 (extract  %19 %14 b))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 16)))
  (define %24.downcasted0 (bvadd  %11.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (extract  15 0 %24.downcasted0))
  (define %32 (+  %4.new0  15))
  (define %42 (extract  %32 %4.new0 a))
  (define %43 (bvadd  %42  %25.downcasted0))
  %43
 )
 )
)
)
)
result2)
(define-symbolic a_vpadal_s8 (bitvector 64))
(define-symbolic b_vpadal_s8 (bitvector 64))
(verify (assert (equal? (vpadal_s8.check a_vpadal_s8 b_vpadal_s8 ) (vpadal_s8 a_vpadal_s8 b_vpadal_s8 ))))
(display "vpadal_s8" (current-error-port))
(define (vpadal_u16.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 16))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  15))
  (define %10 (extract  %9 %4.new0 b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.new0 (/  e0.new  8))
  (define %13 (+  %12.new0  1))
  (define %14 (*  %13  16))
  (define %19 (+  %14  15))
  (define %20 (extract  %19 %14 b))
  (define %21.downcasted0 (zero-extend  %20 (bitvector 32)))
  (define %24.downcasted0 (bvadd  %11.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (extract  31 0 %24.downcasted0))
  (define %32 (+  %4.new0  31))
  (define %42 (extract  %32 %4.new0 a))
  (define %43 (bvadd  %42  %25.downcasted0))
  %43
 )
 )
)
)
)
result2)
(define-symbolic a_vpadal_u16 (bitvector 64))
(define-symbolic b_vpadal_u16 (bitvector 64))
(verify (assert (equal? (vpadal_u16.check a_vpadal_u16 b_vpadal_u16 ) (vpadal_u16 a_vpadal_u16 b_vpadal_u16 ))))
(display "vpadal_u16" (current-error-port))
(define (vpadal_u32.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  31))
  (define %10 (extract  %9 %4.new0 b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.new0 (/  e0.new  16))
  (define %13 (+  %12.new0  1))
  (define %14 (*  %13  32))
  (define %19 (+  %14  31))
  (define %20 (extract  %19 %14 b))
  (define %21.downcasted0 (zero-extend  %20 (bitvector 64)))
  (define %24.downcasted0 (bvadd  %11.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (extract  63 0 %24.downcasted0))
  (define %32 (+  %4.new0  63))
  (define %42 (extract  %32 %4.new0 a))
  (define %43 (bvadd  %42  %25.downcasted0))
  %43
 )
 )
)
)
)
result2)
(define-symbolic a_vpadal_u32 (bitvector 64))
(define-symbolic b_vpadal_u32 (bitvector 64))
(verify (assert (equal? (vpadal_u32.check a_vpadal_u32 b_vpadal_u32 ) (vpadal_u32 a_vpadal_u32 b_vpadal_u32 ))))
(display "vpadal_u32" (current-error-port))
(define (vpadal_u8.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 8))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  7))
  (define %10 (extract  %9 %4.new0 b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %12.new0 (/  e0.new  4))
  (define %13 (+  %12.new0  1))
  (define %14 (*  %13  8))
  (define %19 (+  %14  7))
  (define %20 (extract  %19 %14 b))
  (define %21.downcasted0 (zero-extend  %20 (bitvector 16)))
  (define %24.downcasted0 (bvadd  %11.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (extract  15 0 %24.downcasted0))
  (define %32 (+  %4.new0  15))
  (define %42 (extract  %32 %4.new0 a))
  (define %43 (bvadd  %42  %25.downcasted0))
  %43
 )
 )
)
)
)
result2)
(define-symbolic a_vpadal_u8 (bitvector 64))
(define-symbolic b_vpadal_u8 (bitvector 64))
(verify (assert (equal? (vpadal_u8.check a_vpadal_u8 b_vpadal_u8 ) (vpadal_u8 a_vpadal_u8 b_vpadal_u8 ))))
(display "vpadal_u8" (current-error-port))
(define (vpadalq_s16.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  15))
  (define %10 (extract  %9 %4.new0 b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
  (define %12.new0 (/  e0.new  8))
  (define %13 (+  %12.new0  1))
  (define %14 (*  %13  16))
  (define %19 (+  %14  15))
  (define %20 (extract  %19 %14 b))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 32)))
  (define %24.downcasted0 (bvadd  %11.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (extract  31 0 %24.downcasted0))
  (define %32 (+  %4.new0  31))
  (define %42 (extract  %32 %4.new0 a))
  (define %43 (bvadd  %42  %25.downcasted0))
  %43
 )
 )
)
)
)
result2)
(define-symbolic a_vpadalq_s16 (bitvector 128))
(define-symbolic b_vpadalq_s16 (bitvector 128))
(verify (assert (equal? (vpadalq_s16.check a_vpadalq_s16 b_vpadalq_s16 ) (vpadalq_s16 a_vpadalq_s16 b_vpadalq_s16 ))))
(display "vpadalq_s16" (current-error-port))
(define (vpadalq_s32.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  31))
  (define %10 (extract  %9 %4.new0 b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.new0 (/  e0.new  16))
  (define %13 (+  %12.new0  1))
  (define %14 (*  %13  32))
  (define %19 (+  %14  31))
  (define %20 (extract  %19 %14 b))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 64)))
  (define %24.downcasted0 (bvadd  %11.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (extract  63 0 %24.downcasted0))
  (define %32 (+  %4.new0  63))
  (define %42 (extract  %32 %4.new0 a))
  (define %43 (bvadd  %42  %25.downcasted0))
  %43
 )
 )
)
)
)
result2)
(define-symbolic a_vpadalq_s32 (bitvector 128))
(define-symbolic b_vpadalq_s32 (bitvector 128))
(verify (assert (equal? (vpadalq_s32.check a_vpadalq_s32 b_vpadalq_s32 ) (vpadalq_s32 a_vpadalq_s32 b_vpadalq_s32 ))))
(display "vpadalq_s32" (current-error-port))
(define (vpadalq_s8.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  7))
  (define %10 (extract  %9 %4.new0 b))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 16)))
  (define %12.new0 (/  e0.new  4))
  (define %13 (+  %12.new0  1))
  (define %14 (*  %13  8))
  (define %19 (+  %14  7))
  (define %20 (extract  %19 %14 b))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 16)))
  (define %24.downcasted0 (bvadd  %11.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (extract  15 0 %24.downcasted0))
  (define %32 (+  %4.new0  15))
  (define %42 (extract  %32 %4.new0 a))
  (define %43 (bvadd  %42  %25.downcasted0))
  %43
 )
 )
)
)
)
result2)
(define-symbolic a_vpadalq_s8 (bitvector 128))
(define-symbolic b_vpadalq_s8 (bitvector 128))
(verify (assert (equal? (vpadalq_s8.check a_vpadalq_s8 b_vpadalq_s8 ) (vpadalq_s8 a_vpadalq_s8 b_vpadalq_s8 ))))
(display "vpadalq_s8" (current-error-port))
(define (vpadalq_u16.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  15))
  (define %10 (extract  %9 %4.new0 b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 32)))
  (define %12.new0 (/  e0.new  8))
  (define %13 (+  %12.new0  1))
  (define %14 (*  %13  16))
  (define %19 (+  %14  15))
  (define %20 (extract  %19 %14 b))
  (define %21.downcasted0 (zero-extend  %20 (bitvector 32)))
  (define %24.downcasted0 (bvadd  %11.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (extract  31 0 %24.downcasted0))
  (define %32 (+  %4.new0  31))
  (define %42 (extract  %32 %4.new0 a))
  (define %43 (bvadd  %42  %25.downcasted0))
  %43
 )
 )
)
)
)
result2)
(define-symbolic a_vpadalq_u16 (bitvector 128))
(define-symbolic b_vpadalq_u16 (bitvector 128))
(verify (assert (equal? (vpadalq_u16.check a_vpadalq_u16 b_vpadalq_u16 ) (vpadalq_u16 a_vpadalq_u16 b_vpadalq_u16 ))))
(display "vpadalq_u16" (current-error-port))
(define (vpadalq_u32.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  31))
  (define %10 (extract  %9 %4.new0 b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.new0 (/  e0.new  16))
  (define %13 (+  %12.new0  1))
  (define %14 (*  %13  32))
  (define %19 (+  %14  31))
  (define %20 (extract  %19 %14 b))
  (define %21.downcasted0 (zero-extend  %20 (bitvector 64)))
  (define %24.downcasted0 (bvadd  %11.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (extract  63 0 %24.downcasted0))
  (define %32 (+  %4.new0  63))
  (define %42 (extract  %32 %4.new0 a))
  (define %43 (bvadd  %42  %25.downcasted0))
  %43
 )
 )
)
)
)
result2)
(define-symbolic a_vpadalq_u32 (bitvector 128))
(define-symbolic b_vpadalq_u32 (bitvector 128))
(verify (assert (equal? (vpadalq_u32.check a_vpadalq_u32 b_vpadalq_u32 ) (vpadalq_u32 a_vpadalq_u32 b_vpadalq_u32 ))))
(display "vpadalq_u32" (current-error-port))
(define (vpadalq_u8.check  a b )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  7))
  (define %10 (extract  %9 %4.new0 b))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 16)))
  (define %12.new0 (/  e0.new  4))
  (define %13 (+  %12.new0  1))
  (define %14 (*  %13  8))
  (define %19 (+  %14  7))
  (define %20 (extract  %19 %14 b))
  (define %21.downcasted0 (zero-extend  %20 (bitvector 16)))
  (define %24.downcasted0 (bvadd  %11.downcasted0  %21.downcasted0))
  (define %25.downcasted0 (extract  15 0 %24.downcasted0))
  (define %32 (+  %4.new0  15))
  (define %42 (extract  %32 %4.new0 a))
  (define %43 (bvadd  %42  %25.downcasted0))
  %43
 )
 )
)
)
)
result2)
(define-symbolic a_vpadalq_u8 (bitvector 128))
(define-symbolic b_vpadalq_u8 (bitvector 128))
(verify (assert (equal? (vpadalq_u8.check a_vpadalq_u8 b_vpadalq_u8 ) (vpadalq_u8 a_vpadalq_u8 b_vpadalq_u8 ))))
(display "vpadalq_u8" (current-error-port))
(define (vpadd_s16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 64 16))])
 (define result (bv #b0 16))
 (define %9.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 32 16))])
  (define iterator.0.new.div (/  iterator.0.new  16))
  (define %3.new1 (/  e0.new  8))
  (define %3.new0 (+  %3.new1  iterator.0.new.div))
  (define %4 (*  %3.new0  16))
  (define %8.new0 (+  %4  15))
  (define %9 (extract  %8.new0 %4 %1))
  %9
 )
))
 (define %22.clone.0.new1 (+  e0.new  15))
 (define %9.acc0 (bvadd %9.ext0.red result))
 %9.acc0
)
)
)
result)
(define-symbolic a_vpadd_s16 (bitvector 64))
(define-symbolic b_vpadd_s16 (bitvector 64))
(verify (assert (equal? (vpadd_s16.check a_vpadd_s16 b_vpadd_s16 ) (vpadd_s16 a_vpadd_s16 b_vpadd_s16 ))))
(display "vpadd_s16" (current-error-port))
(define (vpadd_s32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 64 32))])
 (define result (bv #b0 32))
 (define %9.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 64 32))])
  (define iterator.0.new.div (/  iterator.0.new  32))
  (define %3.new1 (/  e0.new  16))
  (define %3.new0 (+  %3.new1  iterator.0.new.div))
  (define %4 (*  %3.new0  32))
  (define %8.new0 (+  %4  31))
  (define %9 (extract  %8.new0 %4 %1))
  %9
 )
))
 (define %22.clone.0.new1 (+  e0.new  31))
 (define %9.acc0 (bvadd %9.ext0.red result))
 %9.acc0
)
)
)
result)
(define-symbolic a_vpadd_s32 (bitvector 64))
(define-symbolic b_vpadd_s32 (bitvector 64))
(verify (assert (equal? (vpadd_s32.check a_vpadd_s32 b_vpadd_s32 ) (vpadd_s32 a_vpadd_s32 b_vpadd_s32 ))))
(display "vpadd_s32" (current-error-port))
(define (vpadd_s8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 64 8))])
 (define result (bv #b0 8))
 (define %9.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 16 8))])
  (define iterator.0.new.div (/  iterator.0.new  8))
  (define %3.new1 (/  e0.new  4))
  (define %3.new0 (+  %3.new1  iterator.0.new.div))
  (define %4 (*  %3.new0  8))
  (define %8.new0 (+  %4  7))
  (define %9 (extract  %8.new0 %4 %1))
  %9
 )
))
 (define %22.clone.0.new1 (+  e0.new  7))
 (define %9.acc0 (bvadd %9.ext0.red result))
 %9.acc0
)
)
)
result)
(define-symbolic a_vpadd_s8 (bitvector 64))
(define-symbolic b_vpadd_s8 (bitvector 64))
(verify (assert (equal? (vpadd_s8.check a_vpadd_s8 b_vpadd_s8 ) (vpadd_s8 a_vpadd_s8 b_vpadd_s8 ))))
(display "vpadd_s8" (current-error-port))
(define (vpadd_u16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 64 16))])
 (define result (bv #b0 16))
 (define %9.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 32 16))])
  (define iterator.0.new.div (/  iterator.0.new  16))
  (define %3.new1 (/  e0.new  8))
  (define %3.new0 (+  %3.new1  iterator.0.new.div))
  (define %4 (*  %3.new0  16))
  (define %8.new0 (+  %4  15))
  (define %9 (extract  %8.new0 %4 %1))
  %9
 )
))
 (define %22.clone.0.new1 (+  e0.new  15))
 (define %9.acc0 (bvadd %9.ext0.red result))
 %9.acc0
)
)
)
result)
(define-symbolic a_vpadd_u16 (bitvector 64))
(define-symbolic b_vpadd_u16 (bitvector 64))
(verify (assert (equal? (vpadd_u16.check a_vpadd_u16 b_vpadd_u16 ) (vpadd_u16 a_vpadd_u16 b_vpadd_u16 ))))
(display "vpadd_u16" (current-error-port))
(define (vpadd_u32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 64 32))])
 (define result (bv #b0 32))
 (define %9.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 64 32))])
  (define iterator.0.new.div (/  iterator.0.new  32))
  (define %3.new1 (/  e0.new  16))
  (define %3.new0 (+  %3.new1  iterator.0.new.div))
  (define %4 (*  %3.new0  32))
  (define %8.new0 (+  %4  31))
  (define %9 (extract  %8.new0 %4 %1))
  %9
 )
))
 (define %22.clone.0.new1 (+  e0.new  31))
 (define %9.acc0 (bvadd %9.ext0.red result))
 %9.acc0
)
)
)
result)
(define-symbolic a_vpadd_u32 (bitvector 64))
(define-symbolic b_vpadd_u32 (bitvector 64))
(verify (assert (equal? (vpadd_u32.check a_vpadd_u32 b_vpadd_u32 ) (vpadd_u32 a_vpadd_u32 b_vpadd_u32 ))))
(display "vpadd_u32" (current-error-port))
(define (vpadd_u8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 64 8))])
 (define result (bv #b0 8))
 (define %9.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 16 8))])
  (define iterator.0.new.div (/  iterator.0.new  8))
  (define %3.new1 (/  e0.new  4))
  (define %3.new0 (+  %3.new1  iterator.0.new.div))
  (define %4 (*  %3.new0  8))
  (define %8.new0 (+  %4  7))
  (define %9 (extract  %8.new0 %4 %1))
  %9
 )
))
 (define %22.clone.0.new1 (+  e0.new  7))
 (define %9.acc0 (bvadd %9.ext0.red result))
 %9.acc0
)
)
)
result)
(define-symbolic a_vpadd_u8 (bitvector 64))
(define-symbolic b_vpadd_u8 (bitvector 64))
(verify (assert (equal? (vpadd_u8.check a_vpadd_u8 b_vpadd_u8 ) (vpadd_u8 a_vpadd_u8 b_vpadd_u8 ))))
(display "vpadd_u8" (current-error-port))
(define (vpaddl_s16.check  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 16))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  15))
  (define %11 (extract  %10 %5.new0 a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 32)))
  (define %13.new0 (/  e0.new  8))
  (define %14 (+  %13.new0  1))
  (define %15 (*  %14  16))
  (define %20 (+  %15  15))
  (define %21 (extract  %20 %15 a))
  (define %22.downcasted0 (sign-extend  %21 (bitvector 32)))
  (define %25.downcasted0 (bvadd  %12.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  31 0 %25.downcasted0))
  (define %44 (bvadd  (bv 0 32)  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vpaddl_s16 (bitvector 64))
(verify (assert (equal? (vpaddl_s16.check a_vpaddl_s16 ) (vpaddl_s16 a_vpaddl_s16 ))))
(display "vpaddl_s16" (current-error-port))
(define (vpaddl_s32.check  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  31))
  (define %11 (extract  %10 %5.new0 a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %13.new0 (/  e0.new  16))
  (define %14 (+  %13.new0  1))
  (define %15 (*  %14  32))
  (define %20 (+  %15  31))
  (define %21 (extract  %20 %15 a))
  (define %22.downcasted0 (sign-extend  %21 (bitvector 64)))
  (define %25.downcasted0 (bvadd  %12.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  63 0 %25.downcasted0))
  (define %44 (bvadd  (bv 0 64)  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vpaddl_s32 (bitvector 64))
(verify (assert (equal? (vpaddl_s32.check a_vpaddl_s32 ) (vpaddl_s32 a_vpaddl_s32 ))))
(display "vpaddl_s32" (current-error-port))
(define (vpaddl_s8.check  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 8))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  7))
  (define %11 (extract  %10 %5.new0 a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 16)))
  (define %13.new0 (/  e0.new  4))
  (define %14 (+  %13.new0  1))
  (define %15 (*  %14  8))
  (define %20 (+  %15  7))
  (define %21 (extract  %20 %15 a))
  (define %22.downcasted0 (sign-extend  %21 (bitvector 16)))
  (define %25.downcasted0 (bvadd  %12.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  15 0 %25.downcasted0))
  (define %44 (bvadd  (bv 0 16)  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vpaddl_s8 (bitvector 64))
(verify (assert (equal? (vpaddl_s8.check a_vpaddl_s8 ) (vpaddl_s8 a_vpaddl_s8 ))))
(display "vpaddl_s8" (current-error-port))
(define (vpaddl_u16.check  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 16))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  15))
  (define %11 (extract  %10 %5.new0 a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %13.new0 (/  e0.new  8))
  (define %14 (+  %13.new0  1))
  (define %15 (*  %14  16))
  (define %20 (+  %15  15))
  (define %21 (extract  %20 %15 a))
  (define %22.downcasted0 (zero-extend  %21 (bitvector 32)))
  (define %25.downcasted0 (bvadd  %12.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  31 0 %25.downcasted0))
  (define %44 (bvadd  (bv 0 32)  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vpaddl_u16 (bitvector 64))
(verify (assert (equal? (vpaddl_u16.check a_vpaddl_u16 ) (vpaddl_u16 a_vpaddl_u16 ))))
(display "vpaddl_u16" (current-error-port))
(define (vpaddl_u32.check  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  31))
  (define %11 (extract  %10 %5.new0 a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %13.new0 (/  e0.new  16))
  (define %14 (+  %13.new0  1))
  (define %15 (*  %14  32))
  (define %20 (+  %15  31))
  (define %21 (extract  %20 %15 a))
  (define %22.downcasted0 (zero-extend  %21 (bitvector 64)))
  (define %25.downcasted0 (bvadd  %12.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  63 0 %25.downcasted0))
  (define %44 (bvadd  (bv 0 64)  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vpaddl_u32 (bitvector 64))
(verify (assert (equal? (vpaddl_u32.check a_vpaddl_u32 ) (vpaddl_u32 a_vpaddl_u32 ))))
(display "vpaddl_u32" (current-error-port))
(define (vpaddl_u8.check  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 8))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  7))
  (define %11 (extract  %10 %5.new0 a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 16)))
  (define %13.new0 (/  e0.new  4))
  (define %14 (+  %13.new0  1))
  (define %15 (*  %14  8))
  (define %20 (+  %15  7))
  (define %21 (extract  %20 %15 a))
  (define %22.downcasted0 (zero-extend  %21 (bitvector 16)))
  (define %25.downcasted0 (bvadd  %12.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  15 0 %25.downcasted0))
  (define %44 (bvadd  (bv 0 16)  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vpaddl_u8 (bitvector 64))
(verify (assert (equal? (vpaddl_u8.check a_vpaddl_u8 ) (vpaddl_u8 a_vpaddl_u8 ))))
(display "vpaddl_u8" (current-error-port))
(define (vpaddlq_s16.check  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  15))
  (define %11 (extract  %10 %5.new0 a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 32)))
  (define %13.new0 (/  e0.new  8))
  (define %14 (+  %13.new0  1))
  (define %15 (*  %14  16))
  (define %20 (+  %15  15))
  (define %21 (extract  %20 %15 a))
  (define %22.downcasted0 (sign-extend  %21 (bitvector 32)))
  (define %25.downcasted0 (bvadd  %12.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  31 0 %25.downcasted0))
  (define %44 (bvadd  (bv 0 32)  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vpaddlq_s16 (bitvector 128))
(verify (assert (equal? (vpaddlq_s16.check a_vpaddlq_s16 ) (vpaddlq_s16 a_vpaddlq_s16 ))))
(display "vpaddlq_s16" (current-error-port))
(define (vpaddlq_s32.check  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  31))
  (define %11 (extract  %10 %5.new0 a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %13.new0 (/  e0.new  16))
  (define %14 (+  %13.new0  1))
  (define %15 (*  %14  32))
  (define %20 (+  %15  31))
  (define %21 (extract  %20 %15 a))
  (define %22.downcasted0 (sign-extend  %21 (bitvector 64)))
  (define %25.downcasted0 (bvadd  %12.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  63 0 %25.downcasted0))
  (define %44 (bvadd  (bv 0 64)  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vpaddlq_s32 (bitvector 128))
(verify (assert (equal? (vpaddlq_s32.check a_vpaddlq_s32 ) (vpaddlq_s32 a_vpaddlq_s32 ))))
(display "vpaddlq_s32" (current-error-port))
(define (vpaddlq_s8.check  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  7))
  (define %11 (extract  %10 %5.new0 a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 16)))
  (define %13.new0 (/  e0.new  4))
  (define %14 (+  %13.new0  1))
  (define %15 (*  %14  8))
  (define %20 (+  %15  7))
  (define %21 (extract  %20 %15 a))
  (define %22.downcasted0 (sign-extend  %21 (bitvector 16)))
  (define %25.downcasted0 (bvadd  %12.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  15 0 %25.downcasted0))
  (define %44 (bvadd  (bv 0 16)  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vpaddlq_s8 (bitvector 128))
(verify (assert (equal? (vpaddlq_s8.check a_vpaddlq_s8 ) (vpaddlq_s8 a_vpaddlq_s8 ))))
(display "vpaddlq_s8" (current-error-port))
(define (vpaddlq_u16.check  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  15))
  (define %11 (extract  %10 %5.new0 a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %13.new0 (/  e0.new  8))
  (define %14 (+  %13.new0  1))
  (define %15 (*  %14  16))
  (define %20 (+  %15  15))
  (define %21 (extract  %20 %15 a))
  (define %22.downcasted0 (zero-extend  %21 (bitvector 32)))
  (define %25.downcasted0 (bvadd  %12.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  31 0 %25.downcasted0))
  (define %44 (bvadd  (bv 0 32)  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vpaddlq_u16 (bitvector 128))
(verify (assert (equal? (vpaddlq_u16.check a_vpaddlq_u16 ) (vpaddlq_u16 a_vpaddlq_u16 ))))
(display "vpaddlq_u16" (current-error-port))
(define (vpaddlq_u32.check  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  31))
  (define %11 (extract  %10 %5.new0 a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %13.new0 (/  e0.new  16))
  (define %14 (+  %13.new0  1))
  (define %15 (*  %14  32))
  (define %20 (+  %15  31))
  (define %21 (extract  %20 %15 a))
  (define %22.downcasted0 (zero-extend  %21 (bitvector 64)))
  (define %25.downcasted0 (bvadd  %12.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  63 0 %25.downcasted0))
  (define %44 (bvadd  (bv 0 64)  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vpaddlq_u32 (bitvector 128))
(verify (assert (equal? (vpaddlq_u32.check a_vpaddlq_u32 ) (vpaddlq_u32 a_vpaddlq_u32 ))))
(display "vpaddlq_u32" (current-error-port))
(define (vpaddlq_u8.check  a )
(define result2
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  7))
  (define %11 (extract  %10 %5.new0 a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 16)))
  (define %13.new0 (/  e0.new  4))
  (define %14 (+  %13.new0  1))
  (define %15 (*  %14  8))
  (define %20 (+  %15  7))
  (define %21 (extract  %20 %15 a))
  (define %22.downcasted0 (zero-extend  %21 (bitvector 16)))
  (define %25.downcasted0 (bvadd  %12.downcasted0  %22.downcasted0))
  (define %26.downcasted0 (extract  15 0 %25.downcasted0))
  (define %44 (bvadd  (bv 0 16)  %26.downcasted0))
  %44
 )
 )
)
)
)
result2)
(define-symbolic a_vpaddlq_u8 (bitvector 128))
(verify (assert (equal? (vpaddlq_u8.check a_vpaddlq_u8 ) (vpaddlq_u8 a_vpaddlq_u8 ))))
(display "vpaddlq_u8" (current-error-port))
(define (vpaddq_s16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 128 16))])
 (define result (bv #b0 16))
 (define %9.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 32 16))])
  (define iterator.0.new.div (/  iterator.0.new  16))
  (define %3.new1 (/  e0.new  8))
  (define %3.new0 (+  %3.new1  iterator.0.new.div))
  (define %4 (*  %3.new0  16))
  (define %8.new0 (+  %4  15))
  (define %9 (extract  %8.new0 %4 %1))
  %9
 )
))
 (define %22.clone.0.new1 (+  e0.new  15))
 (define %9.acc0 (bvadd %9.ext0.red result))
 %9.acc0
)
)
)
result)
(define-symbolic a_vpaddq_s16 (bitvector 128))
(define-symbolic b_vpaddq_s16 (bitvector 128))
(verify (assert (equal? (vpaddq_s16.check a_vpaddq_s16 b_vpaddq_s16 ) (vpaddq_s16 a_vpaddq_s16 b_vpaddq_s16 ))))
(display "vpaddq_s16" (current-error-port))
(define (vpaddq_s32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 128 32))])
 (define result (bv #b0 32))
 (define %9.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 64 32))])
  (define iterator.0.new.div (/  iterator.0.new  32))
  (define %3.new1 (/  e0.new  16))
  (define %3.new0 (+  %3.new1  iterator.0.new.div))
  (define %4 (*  %3.new0  32))
  (define %8.new0 (+  %4  31))
  (define %9 (extract  %8.new0 %4 %1))
  %9
 )
))
 (define %22.clone.0.new1 (+  e0.new  31))
 (define %9.acc0 (bvadd %9.ext0.red result))
 %9.acc0
)
)
)
result)
(define-symbolic a_vpaddq_s32 (bitvector 128))
(define-symbolic b_vpaddq_s32 (bitvector 128))
(verify (assert (equal? (vpaddq_s32.check a_vpaddq_s32 b_vpaddq_s32 ) (vpaddq_s32 a_vpaddq_s32 b_vpaddq_s32 ))))
(display "vpaddq_s32" (current-error-port))
(define (vpaddq_s64.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 128 64))])
 (define result (bv #b0 64))
 (define %9.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 128 64))])
  (define iterator.0.new.div (/  iterator.0.new  64))
  (define %3.new1 (/  e0.new  32))
  (define %3.new0 (+  %3.new1  iterator.0.new.div))
  (define %4 (*  %3.new0  64))
  (define %8.new0 (+  %4  63))
  (define %9 (extract  %8.new0 %4 %1))
  %9
 )
))
 (define %22.clone.0.new1 (+  e0.new  63))
 (define %9.acc0 (bvadd %9.ext0.red result))
 %9.acc0
)
)
)
result)
(define-symbolic a_vpaddq_s64 (bitvector 128))
(define-symbolic b_vpaddq_s64 (bitvector 128))
(verify (assert (equal? (vpaddq_s64.check a_vpaddq_s64 b_vpaddq_s64 ) (vpaddq_s64 a_vpaddq_s64 b_vpaddq_s64 ))))
(display "vpaddq_s64" (current-error-port))
(define (vpaddq_s8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 128 8))])
 (define result (bv #b0 8))
 (define %9.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 16 8))])
  (define iterator.0.new.div (/  iterator.0.new  8))
  (define %3.new1 (/  e0.new  4))
  (define %3.new0 (+  %3.new1  iterator.0.new.div))
  (define %4 (*  %3.new0  8))
  (define %8.new0 (+  %4  7))
  (define %9 (extract  %8.new0 %4 %1))
  %9
 )
))
 (define %22.clone.0.new1 (+  e0.new  7))
 (define %9.acc0 (bvadd %9.ext0.red result))
 %9.acc0
)
)
)
result)
(define-symbolic a_vpaddq_s8 (bitvector 128))
(define-symbolic b_vpaddq_s8 (bitvector 128))
(verify (assert (equal? (vpaddq_s8.check a_vpaddq_s8 b_vpaddq_s8 ) (vpaddq_s8 a_vpaddq_s8 b_vpaddq_s8 ))))
(display "vpaddq_s8" (current-error-port))
(define (vpaddq_u16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 128 16))])
 (define result (bv #b0 16))
 (define %9.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 32 16))])
  (define iterator.0.new.div (/  iterator.0.new  16))
  (define %3.new1 (/  e0.new  8))
  (define %3.new0 (+  %3.new1  iterator.0.new.div))
  (define %4 (*  %3.new0  16))
  (define %8.new0 (+  %4  15))
  (define %9 (extract  %8.new0 %4 %1))
  %9
 )
))
 (define %22.clone.0.new1 (+  e0.new  15))
 (define %9.acc0 (bvadd %9.ext0.red result))
 %9.acc0
)
)
)
result)
(define-symbolic a_vpaddq_u16 (bitvector 128))
(define-symbolic b_vpaddq_u16 (bitvector 128))
(verify (assert (equal? (vpaddq_u16.check a_vpaddq_u16 b_vpaddq_u16 ) (vpaddq_u16 a_vpaddq_u16 b_vpaddq_u16 ))))
(display "vpaddq_u16" (current-error-port))
(define (vpaddq_u32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 128 32))])
 (define result (bv #b0 32))
 (define %9.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 64 32))])
  (define iterator.0.new.div (/  iterator.0.new  32))
  (define %3.new1 (/  e0.new  16))
  (define %3.new0 (+  %3.new1  iterator.0.new.div))
  (define %4 (*  %3.new0  32))
  (define %8.new0 (+  %4  31))
  (define %9 (extract  %8.new0 %4 %1))
  %9
 )
))
 (define %22.clone.0.new1 (+  e0.new  31))
 (define %9.acc0 (bvadd %9.ext0.red result))
 %9.acc0
)
)
)
result)
(define-symbolic a_vpaddq_u32 (bitvector 128))
(define-symbolic b_vpaddq_u32 (bitvector 128))
(verify (assert (equal? (vpaddq_u32.check a_vpaddq_u32 b_vpaddq_u32 ) (vpaddq_u32 a_vpaddq_u32 b_vpaddq_u32 ))))
(display "vpaddq_u32" (current-error-port))
(define (vpaddq_u64.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 128 64))])
 (define result (bv #b0 64))
 (define %9.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 128 64))])
  (define iterator.0.new.div (/  iterator.0.new  64))
  (define %3.new1 (/  e0.new  32))
  (define %3.new0 (+  %3.new1  iterator.0.new.div))
  (define %4 (*  %3.new0  64))
  (define %8.new0 (+  %4  63))
  (define %9 (extract  %8.new0 %4 %1))
  %9
 )
))
 (define %22.clone.0.new1 (+  e0.new  63))
 (define %9.acc0 (bvadd %9.ext0.red result))
 %9.acc0
)
)
)
result)
(define-symbolic a_vpaddq_u64 (bitvector 128))
(define-symbolic b_vpaddq_u64 (bitvector 128))
(verify (assert (equal? (vpaddq_u64.check a_vpaddq_u64 b_vpaddq_u64 ) (vpaddq_u64 a_vpaddq_u64 b_vpaddq_u64 ))))
(display "vpaddq_u64" (current-error-port))
(define (vpaddq_u8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([e0.new (reverse (range 0 128 8))])
 (define result (bv #b0 8))
 (define %9.ext0.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range 0 16 8))])
  (define iterator.0.new.div (/  iterator.0.new  8))
  (define %3.new1 (/  e0.new  4))
  (define %3.new0 (+  %3.new1  iterator.0.new.div))
  (define %4 (*  %3.new0  8))
  (define %8.new0 (+  %4  7))
  (define %9 (extract  %8.new0 %4 %1))
  %9
 )
))
 (define %22.clone.0.new1 (+  e0.new  7))
 (define %9.acc0 (bvadd %9.ext0.red result))
 %9.acc0
)
)
)
result)
(define-symbolic a_vpaddq_u8 (bitvector 128))
(define-symbolic b_vpaddq_u8 (bitvector 128))
(verify (assert (equal? (vpaddq_u8.check a_vpaddq_u8 b_vpaddq_u8 ) (vpaddq_u8 a_vpaddq_u8 b_vpaddq_u8 ))))
(display "vpaddq_u8" (current-error-port))
(define (vpmax_s16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  15))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  8))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  16))
  (define %18 (+  %13  15))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvsmax  %9  %19))
  (define %27.downcasted0 (extract  15 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmax_s16 (bitvector 64))
(define-symbolic b_vpmax_s16 (bitvector 64))
(verify (assert (equal? (vpmax_s16.check a_vpmax_s16 b_vpmax_s16 ) (vpmax_s16 a_vpmax_s16 b_vpmax_s16 ))))
(display "vpmax_s16" (current-error-port))
(define (vpmax_s32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  31))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  16))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  32))
  (define %18 (+  %13  31))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvsmax  %9  %19))
  (define %27.downcasted0 (extract  31 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmax_s32 (bitvector 64))
(define-symbolic b_vpmax_s32 (bitvector 64))
(verify (assert (equal? (vpmax_s32.check a_vpmax_s32 b_vpmax_s32 ) (vpmax_s32 a_vpmax_s32 b_vpmax_s32 ))))
(display "vpmax_s32" (current-error-port))
(define (vpmax_s8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  7))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  4))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  8))
  (define %18 (+  %13  7))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvsmax  %9  %19))
  (define %27.downcasted0 (extract  7 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmax_s8 (bitvector 64))
(define-symbolic b_vpmax_s8 (bitvector 64))
(verify (assert (equal? (vpmax_s8.check a_vpmax_s8 b_vpmax_s8 ) (vpmax_s8 a_vpmax_s8 b_vpmax_s8 ))))
(display "vpmax_s8" (current-error-port))
(define (vpmax_u16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  15))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  8))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  16))
  (define %18 (+  %13  15))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvumax  %9  %19))
  (define %27.downcasted0 (extract  15 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmax_u16 (bitvector 64))
(define-symbolic b_vpmax_u16 (bitvector 64))
(verify (assert (equal? (vpmax_u16.check a_vpmax_u16 b_vpmax_u16 ) (vpmax_u16 a_vpmax_u16 b_vpmax_u16 ))))
(display "vpmax_u16" (current-error-port))
(define (vpmax_u32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  31))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  16))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  32))
  (define %18 (+  %13  31))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvumax  %9  %19))
  (define %27.downcasted0 (extract  31 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmax_u32 (bitvector 64))
(define-symbolic b_vpmax_u32 (bitvector 64))
(verify (assert (equal? (vpmax_u32.check a_vpmax_u32 b_vpmax_u32 ) (vpmax_u32 a_vpmax_u32 b_vpmax_u32 ))))
(display "vpmax_u32" (current-error-port))
(define (vpmax_u8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  7))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  4))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  8))
  (define %18 (+  %13  7))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvumax  %9  %19))
  (define %27.downcasted0 (extract  7 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmax_u8 (bitvector 64))
(define-symbolic b_vpmax_u8 (bitvector 64))
(verify (assert (equal? (vpmax_u8.check a_vpmax_u8 b_vpmax_u8 ) (vpmax_u8 a_vpmax_u8 b_vpmax_u8 ))))
(display "vpmax_u8" (current-error-port))
(define (vpmaxq_s16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  15))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  8))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  16))
  (define %18 (+  %13  15))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvsmax  %9  %19))
  (define %27.downcasted0 (extract  15 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmaxq_s16 (bitvector 128))
(define-symbolic b_vpmaxq_s16 (bitvector 128))
(verify (assert (equal? (vpmaxq_s16.check a_vpmaxq_s16 b_vpmaxq_s16 ) (vpmaxq_s16 a_vpmaxq_s16 b_vpmaxq_s16 ))))
(display "vpmaxq_s16" (current-error-port))
(define (vpmaxq_s32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  31))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  16))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  32))
  (define %18 (+  %13  31))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvsmax  %9  %19))
  (define %27.downcasted0 (extract  31 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmaxq_s32 (bitvector 128))
(define-symbolic b_vpmaxq_s32 (bitvector 128))
(verify (assert (equal? (vpmaxq_s32.check a_vpmaxq_s32 b_vpmaxq_s32 ) (vpmaxq_s32 a_vpmaxq_s32 b_vpmaxq_s32 ))))
(display "vpmaxq_s32" (current-error-port))
(define (vpmaxq_s8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  7))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  4))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  8))
  (define %18 (+  %13  7))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvsmax  %9  %19))
  (define %27.downcasted0 (extract  7 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmaxq_s8 (bitvector 128))
(define-symbolic b_vpmaxq_s8 (bitvector 128))
(verify (assert (equal? (vpmaxq_s8.check a_vpmaxq_s8 b_vpmaxq_s8 ) (vpmaxq_s8 a_vpmaxq_s8 b_vpmaxq_s8 ))))
(display "vpmaxq_s8" (current-error-port))
(define (vpmaxq_u16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  15))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  8))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  16))
  (define %18 (+  %13  15))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvumax  %9  %19))
  (define %27.downcasted0 (extract  15 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmaxq_u16 (bitvector 128))
(define-symbolic b_vpmaxq_u16 (bitvector 128))
(verify (assert (equal? (vpmaxq_u16.check a_vpmaxq_u16 b_vpmaxq_u16 ) (vpmaxq_u16 a_vpmaxq_u16 b_vpmaxq_u16 ))))
(display "vpmaxq_u16" (current-error-port))
(define (vpmaxq_u32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  31))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  16))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  32))
  (define %18 (+  %13  31))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvumax  %9  %19))
  (define %27.downcasted0 (extract  31 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmaxq_u32 (bitvector 128))
(define-symbolic b_vpmaxq_u32 (bitvector 128))
(verify (assert (equal? (vpmaxq_u32.check a_vpmaxq_u32 b_vpmaxq_u32 ) (vpmaxq_u32 a_vpmaxq_u32 b_vpmaxq_u32 ))))
(display "vpmaxq_u32" (current-error-port))
(define (vpmaxq_u8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  7))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  4))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  8))
  (define %18 (+  %13  7))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvumax  %9  %19))
  (define %27.downcasted0 (extract  7 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmaxq_u8 (bitvector 128))
(define-symbolic b_vpmaxq_u8 (bitvector 128))
(verify (assert (equal? (vpmaxq_u8.check a_vpmaxq_u8 b_vpmaxq_u8 ) (vpmaxq_u8 a_vpmaxq_u8 b_vpmaxq_u8 ))))
(display "vpmaxq_u8" (current-error-port))
(define (vpmin_s16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  15))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  8))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  16))
  (define %18 (+  %13  15))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvsmin  %9  %19))
  (define %27.downcasted0 (extract  15 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmin_s16 (bitvector 64))
(define-symbolic b_vpmin_s16 (bitvector 64))
(verify (assert (equal? (vpmin_s16.check a_vpmin_s16 b_vpmin_s16 ) (vpmin_s16 a_vpmin_s16 b_vpmin_s16 ))))
(display "vpmin_s16" (current-error-port))
(define (vpmin_s32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  31))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  16))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  32))
  (define %18 (+  %13  31))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvsmin  %9  %19))
  (define %27.downcasted0 (extract  31 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmin_s32 (bitvector 64))
(define-symbolic b_vpmin_s32 (bitvector 64))
(verify (assert (equal? (vpmin_s32.check a_vpmin_s32 b_vpmin_s32 ) (vpmin_s32 a_vpmin_s32 b_vpmin_s32 ))))
(display "vpmin_s32" (current-error-port))
(define (vpmin_s8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  7))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  4))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  8))
  (define %18 (+  %13  7))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvsmin  %9  %19))
  (define %27.downcasted0 (extract  7 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmin_s8 (bitvector 64))
(define-symbolic b_vpmin_s8 (bitvector 64))
(verify (assert (equal? (vpmin_s8.check a_vpmin_s8 b_vpmin_s8 ) (vpmin_s8 a_vpmin_s8 b_vpmin_s8 ))))
(display "vpmin_s8" (current-error-port))
(define (vpmin_u16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  15))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  8))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  16))
  (define %18 (+  %13  15))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvumin  %9  %19))
  (define %27.downcasted0 (extract  15 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmin_u16 (bitvector 64))
(define-symbolic b_vpmin_u16 (bitvector 64))
(verify (assert (equal? (vpmin_u16.check a_vpmin_u16 b_vpmin_u16 ) (vpmin_u16 a_vpmin_u16 b_vpmin_u16 ))))
(display "vpmin_u16" (current-error-port))
(define (vpmin_u32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  31))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  16))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  32))
  (define %18 (+  %13  31))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvumin  %9  %19))
  (define %27.downcasted0 (extract  31 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmin_u32 (bitvector 64))
(define-symbolic b_vpmin_u32 (bitvector 64))
(verify (assert (equal? (vpmin_u32.check a_vpmin_u32 b_vpmin_u32 ) (vpmin_u32 a_vpmin_u32 b_vpmin_u32 ))))
(display "vpmin_u32" (current-error-port))
(define (vpmin_u8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  7))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  4))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  8))
  (define %18 (+  %13  7))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvumin  %9  %19))
  (define %27.downcasted0 (extract  7 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpmin_u8 (bitvector 64))
(define-symbolic b_vpmin_u8 (bitvector 64))
(verify (assert (equal? (vpmin_u8.check a_vpmin_u8 b_vpmin_u8 ) (vpmin_u8 a_vpmin_u8 b_vpmin_u8 ))))
(display "vpmin_u8" (current-error-port))
(define (vpminq_s16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  15))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  8))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  16))
  (define %18 (+  %13  15))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvsmin  %9  %19))
  (define %27.downcasted0 (extract  15 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpminq_s16 (bitvector 128))
(define-symbolic b_vpminq_s16 (bitvector 128))
(verify (assert (equal? (vpminq_s16.check a_vpminq_s16 b_vpminq_s16 ) (vpminq_s16 a_vpminq_s16 b_vpminq_s16 ))))
(display "vpminq_s16" (current-error-port))
(define (vpminq_s32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  31))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  16))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  32))
  (define %18 (+  %13  31))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvsmin  %9  %19))
  (define %27.downcasted0 (extract  31 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpminq_s32 (bitvector 128))
(define-symbolic b_vpminq_s32 (bitvector 128))
(verify (assert (equal? (vpminq_s32.check a_vpminq_s32 b_vpminq_s32 ) (vpminq_s32 a_vpminq_s32 b_vpminq_s32 ))))
(display "vpminq_s32" (current-error-port))
(define (vpminq_s8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  7))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  4))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  8))
  (define %18 (+  %13  7))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvsmin  %9  %19))
  (define %27.downcasted0 (extract  7 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpminq_s8 (bitvector 128))
(define-symbolic b_vpminq_s8 (bitvector 128))
(verify (assert (equal? (vpminq_s8.check a_vpminq_s8 b_vpminq_s8 ) (vpminq_s8 a_vpminq_s8 b_vpminq_s8 ))))
(display "vpminq_s8" (current-error-port))
(define (vpminq_u16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  15))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  8))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  16))
  (define %18 (+  %13  15))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvumin  %9  %19))
  (define %27.downcasted0 (extract  15 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpminq_u16 (bitvector 128))
(define-symbolic b_vpminq_u16 (bitvector 128))
(verify (assert (equal? (vpminq_u16.check a_vpminq_u16 b_vpminq_u16 ) (vpminq_u16 a_vpminq_u16 b_vpminq_u16 ))))
(display "vpminq_u16" (current-error-port))
(define (vpminq_u32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  31))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  16))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  32))
  (define %18 (+  %13  31))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvumin  %9  %19))
  (define %27.downcasted0 (extract  31 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpminq_u32 (bitvector 128))
(define-symbolic b_vpminq_u32 (bitvector 128))
(verify (assert (equal? (vpminq_u32.check a_vpminq_u32 b_vpminq_u32 ) (vpminq_u32 a_vpminq_u32 b_vpminq_u32 ))))
(display "vpminq_u32" (current-error-port))
(define (vpminq_u8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4.new0 (*  e0.new  2))
  (define %8 (+  %4.new0  7))
  (define %9 (extract  %8 %4.new0 %1))
  (define %11.new0 (/  e0.new  4))
  (define %12 (+  %11.new0  1))
  (define %13 (*  %12  8))
  (define %18 (+  %13  7))
  (define %19 (extract  %18 %13 %1))
  (define %21.downcasted0 (bvumin  %9  %19))
  (define %27.downcasted0 (extract  7 0 %21.downcasted0))
  %27.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vpminq_u8 (bitvector 128))
(define-symbolic b_vpminq_u8 (bitvector 128))
(verify (assert (equal? (vpminq_u8.check a_vpminq_u8 b_vpminq_u8 ) (vpminq_u8 a_vpminq_u8 b_vpminq_u8 ))))
(display "vpminq_u8" (current-error-port))
(define (vqabs_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %5)) (bitvector 16)))
  (define %12.downcasted0 (bvssat %7.downcasted0 16 16 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqabs_s16 (bitvector 64))
(verify (assert (equal? (vqabs_s16.check a_vqabs_s16 ) (vqabs_s16 a_vqabs_s16 ))))
(display "vqabs_s16" (current-error-port))
(define (vqabs_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %5)) (bitvector 32)))
  (define %12.downcasted0 (bvssat %7.downcasted0 32 32 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqabs_s32 (bitvector 64))
(verify (assert (equal? (vqabs_s32.check a_vqabs_s32 ) (vqabs_s32 a_vqabs_s32 ))))
(display "vqabs_s32" (current-error-port))
(define (vqabs_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %5)) (bitvector 64)))
  (define %12.downcasted0 (bvssat %7.downcasted0 64 64 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqabs_s64 (bitvector 64))
(verify (assert (equal? (vqabs_s64.check a_vqabs_s64 ) (vqabs_s64 a_vqabs_s64 ))))
(display "vqabs_s64" (current-error-port))
(define (vqabs_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %5)) (bitvector 8)))
  (define %12.downcasted0 (bvssat %7.downcasted0 8 8 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqabs_s8 (bitvector 64))
(verify (assert (equal? (vqabs_s8.check a_vqabs_s8 ) (vqabs_s8 a_vqabs_s8 ))))
(display "vqabs_s8" (current-error-port))
(define (vqabsb_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %5)) (bitvector 8)))
  (define %12.downcasted0 (bvssat %7.downcasted0 8 8 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqabsb_s8 (bitvector 8))
(verify (assert (equal? (vqabsb_s8.check a_vqabsb_s8 ) (vqabsb_s8 a_vqabsb_s8 ))))
(display "vqabsb_s8" (current-error-port))
(define (vqabsd_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %5)) (bitvector 64)))
  (define %12.downcasted0 (bvssat %7.downcasted0 64 64 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqabsd_s64 (bitvector 64))
(verify (assert (equal? (vqabsd_s64.check a_vqabsd_s64 ) (vqabsd_s64 a_vqabsd_s64 ))))
(display "vqabsd_s64" (current-error-port))
(define (vqabsh_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %5)) (bitvector 16)))
  (define %12.downcasted0 (bvssat %7.downcasted0 16 16 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqabsh_s16 (bitvector 16))
(verify (assert (equal? (vqabsh_s16.check a_vqabsh_s16 ) (vqabsh_s16 a_vqabsh_s16 ))))
(display "vqabsh_s16" (current-error-port))
(define (vqabsq_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %5)) (bitvector 16)))
  (define %12.downcasted0 (bvssat %7.downcasted0 16 16 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqabsq_s16 (bitvector 128))
(verify (assert (equal? (vqabsq_s16.check a_vqabsq_s16 ) (vqabsq_s16 a_vqabsq_s16 ))))
(display "vqabsq_s16" (current-error-port))
(define (vqabsq_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %5)) (bitvector 32)))
  (define %12.downcasted0 (bvssat %7.downcasted0 32 32 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqabsq_s32 (bitvector 128))
(verify (assert (equal? (vqabsq_s32.check a_vqabsq_s32 ) (vqabsq_s32 a_vqabsq_s32 ))))
(display "vqabsq_s32" (current-error-port))
(define (vqabsq_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %5)) (bitvector 64)))
  (define %12.downcasted0 (bvssat %7.downcasted0 64 64 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqabsq_s64 (bitvector 128))
(verify (assert (equal? (vqabsq_s64.check a_vqabsq_s64 ) (vqabsq_s64 a_vqabsq_s64 ))))
(display "vqabsq_s64" (current-error-port))
(define (vqabsq_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %5)) (bitvector 8)))
  (define %12.downcasted0 (bvssat %7.downcasted0 8 8 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqabsq_s8 (bitvector 128))
(verify (assert (equal? (vqabsq_s8.check a_vqabsq_s8 ) (vqabsq_s8 a_vqabsq_s8 ))))
(display "vqabsq_s8" (current-error-port))
(define (vqabss_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (integer->bitvector (abs (bitvector->integer %5)) (bitvector 32)))
  (define %12.downcasted0 (bvssat %7.downcasted0 32 32 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqabss_s32 (bitvector 32))
(verify (assert (equal? (vqabss_s32.check a_vqabss_s32 ) (vqabss_s32 a_vqabss_s32 ))))
(display "vqabss_s32" (current-error-port))
(define (vqadd_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnsw  %5  %11 16))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqadd_s16 (bitvector 64))
(define-symbolic b_vqadd_s16 (bitvector 64))
(verify (assert (equal? (vqadd_s16.check a_vqadd_s16 b_vqadd_s16 ) (vqadd_s16 a_vqadd_s16 b_vqadd_s16 ))))
(display "vqadd_s16" (current-error-port))
(define (vqadd_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnsw  %5  %11 32))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqadd_s32 (bitvector 64))
(define-symbolic b_vqadd_s32 (bitvector 64))
(verify (assert (equal? (vqadd_s32.check a_vqadd_s32 b_vqadd_s32 ) (vqadd_s32 a_vqadd_s32 b_vqadd_s32 ))))
(display "vqadd_s32" (current-error-port))
(define (vqadd_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnsw  %5  %11 64))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqadd_s64 (bitvector 64))
(define-symbolic b_vqadd_s64 (bitvector 64))
(verify (assert (equal? (vqadd_s64.check a_vqadd_s64 b_vqadd_s64 ) (vqadd_s64 a_vqadd_s64 b_vqadd_s64 ))))
(display "vqadd_s64" (current-error-port))
(define (vqadd_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnsw  %5  %11 8))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqadd_s8 (bitvector 64))
(define-symbolic b_vqadd_s8 (bitvector 64))
(verify (assert (equal? (vqadd_s8.check a_vqadd_s8 b_vqadd_s8 ) (vqadd_s8 a_vqadd_s8 b_vqadd_s8 ))))
(display "vqadd_s8" (current-error-port))
(define (vqadd_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnuw  %5  %11 16))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqadd_u16 (bitvector 64))
(define-symbolic b_vqadd_u16 (bitvector 64))
(verify (assert (equal? (vqadd_u16.check a_vqadd_u16 b_vqadd_u16 ) (vqadd_u16 a_vqadd_u16 b_vqadd_u16 ))))
(display "vqadd_u16" (current-error-port))
(define (vqadd_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnuw  %5  %11 32))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqadd_u32 (bitvector 64))
(define-symbolic b_vqadd_u32 (bitvector 64))
(verify (assert (equal? (vqadd_u32.check a_vqadd_u32 b_vqadd_u32 ) (vqadd_u32 a_vqadd_u32 b_vqadd_u32 ))))
(display "vqadd_u32" (current-error-port))
(define (vqadd_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnuw  %5  %11 64))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqadd_u64 (bitvector 64))
(define-symbolic b_vqadd_u64 (bitvector 64))
(verify (assert (equal? (vqadd_u64.check a_vqadd_u64 b_vqadd_u64 ) (vqadd_u64 a_vqadd_u64 b_vqadd_u64 ))))
(display "vqadd_u64" (current-error-port))
(define (vqadd_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnuw  %5  %11 8))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqadd_u8 (bitvector 64))
(define-symbolic b_vqadd_u8 (bitvector 64))
(verify (assert (equal? (vqadd_u8.check a_vqadd_u8 b_vqadd_u8 ) (vqadd_u8 a_vqadd_u8 b_vqadd_u8 ))))
(display "vqadd_u8" (current-error-port))
(define (vqaddb_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnsw  %5  %11 8))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqaddb_s8 (bitvector 8))
(define-symbolic b_vqaddb_s8 (bitvector 8))
(verify (assert (equal? (vqaddb_s8.check a_vqaddb_s8 b_vqaddb_s8 ) (vqaddb_s8 a_vqaddb_s8 b_vqaddb_s8 ))))
(display "vqaddb_s8" (current-error-port))
(define (vqaddb_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnuw  %5  %11 8))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqaddb_u8 (bitvector 8))
(define-symbolic b_vqaddb_u8 (bitvector 8))
(verify (assert (equal? (vqaddb_u8.check a_vqaddb_u8 b_vqaddb_u8 ) (vqaddb_u8 a_vqaddb_u8 b_vqaddb_u8 ))))
(display "vqaddb_u8" (current-error-port))
(define (vqaddd_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnsw  %5  %11 64))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqaddd_s64 (bitvector 64))
(define-symbolic b_vqaddd_s64 (bitvector 64))
(verify (assert (equal? (vqaddd_s64.check a_vqaddd_s64 b_vqaddd_s64 ) (vqaddd_s64 a_vqaddd_s64 b_vqaddd_s64 ))))
(display "vqaddd_s64" (current-error-port))
(define (vqaddd_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnuw  %5  %11 64))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqaddd_u64 (bitvector 64))
(define-symbolic b_vqaddd_u64 (bitvector 64))
(verify (assert (equal? (vqaddd_u64.check a_vqaddd_u64 b_vqaddd_u64 ) (vqaddd_u64 a_vqaddd_u64 b_vqaddd_u64 ))))
(display "vqaddd_u64" (current-error-port))
(define (vqaddh_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnsw  %5  %11 16))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqaddh_s16 (bitvector 16))
(define-symbolic b_vqaddh_s16 (bitvector 16))
(verify (assert (equal? (vqaddh_s16.check a_vqaddh_s16 b_vqaddh_s16 ) (vqaddh_s16 a_vqaddh_s16 b_vqaddh_s16 ))))
(display "vqaddh_s16" (current-error-port))
(define (vqaddh_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnuw  %5  %11 16))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqaddh_u16 (bitvector 16))
(define-symbolic b_vqaddh_u16 (bitvector 16))
(verify (assert (equal? (vqaddh_u16.check a_vqaddh_u16 b_vqaddh_u16 ) (vqaddh_u16 a_vqaddh_u16 b_vqaddh_u16 ))))
(display "vqaddh_u16" (current-error-port))
(define (vqaddq_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnsw  %5  %11 16))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqaddq_s16 (bitvector 128))
(define-symbolic b_vqaddq_s16 (bitvector 128))
(verify (assert (equal? (vqaddq_s16.check a_vqaddq_s16 b_vqaddq_s16 ) (vqaddq_s16 a_vqaddq_s16 b_vqaddq_s16 ))))
(display "vqaddq_s16" (current-error-port))
(define (vqaddq_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnsw  %5  %11 32))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqaddq_s32 (bitvector 128))
(define-symbolic b_vqaddq_s32 (bitvector 128))
(verify (assert (equal? (vqaddq_s32.check a_vqaddq_s32 b_vqaddq_s32 ) (vqaddq_s32 a_vqaddq_s32 b_vqaddq_s32 ))))
(display "vqaddq_s32" (current-error-port))
(define (vqaddq_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnsw  %5  %11 64))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqaddq_s64 (bitvector 128))
(define-symbolic b_vqaddq_s64 (bitvector 128))
(verify (assert (equal? (vqaddq_s64.check a_vqaddq_s64 b_vqaddq_s64 ) (vqaddq_s64 a_vqaddq_s64 b_vqaddq_s64 ))))
(display "vqaddq_s64" (current-error-port))
(define (vqaddq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnsw  %5  %11 8))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqaddq_s8 (bitvector 128))
(define-symbolic b_vqaddq_s8 (bitvector 128))
(verify (assert (equal? (vqaddq_s8.check a_vqaddq_s8 b_vqaddq_s8 ) (vqaddq_s8 a_vqaddq_s8 b_vqaddq_s8 ))))
(display "vqaddq_s8" (current-error-port))
(define (vqaddq_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnuw  %5  %11 16))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqaddq_u16 (bitvector 128))
(define-symbolic b_vqaddq_u16 (bitvector 128))
(verify (assert (equal? (vqaddq_u16.check a_vqaddq_u16 b_vqaddq_u16 ) (vqaddq_u16 a_vqaddq_u16 b_vqaddq_u16 ))))
(display "vqaddq_u16" (current-error-port))
(define (vqaddq_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnuw  %5  %11 32))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqaddq_u32 (bitvector 128))
(define-symbolic b_vqaddq_u32 (bitvector 128))
(verify (assert (equal? (vqaddq_u32.check a_vqaddq_u32 b_vqaddq_u32 ) (vqaddq_u32 a_vqaddq_u32 b_vqaddq_u32 ))))
(display "vqaddq_u32" (current-error-port))
(define (vqaddq_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnuw  %5  %11 64))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqaddq_u64 (bitvector 128))
(define-symbolic b_vqaddq_u64 (bitvector 128))
(verify (assert (equal? (vqaddq_u64.check a_vqaddq_u64 b_vqaddq_u64 ) (vqaddq_u64 a_vqaddq_u64 b_vqaddq_u64 ))))
(display "vqaddq_u64" (current-error-port))
(define (vqaddq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnuw  %5  %11 8))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqaddq_u8 (bitvector 128))
(define-symbolic b_vqaddq_u8 (bitvector 128))
(verify (assert (equal? (vqaddq_u8.check a_vqaddq_u8 b_vqaddq_u8 ) (vqaddq_u8 a_vqaddq_u8 b_vqaddq_u8 ))))
(display "vqaddq_u8" (current-error-port))
(define (vqadds_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnsw  %5  %11 32))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqadds_s32 (bitvector 32))
(define-symbolic b_vqadds_s32 (bitvector 32))
(verify (assert (equal? (vqadds_s32.check a_vqadds_s32 b_vqadds_s32 ) (vqadds_s32 a_vqadds_s32 b_vqadds_s32 ))))
(display "vqadds_s32" (current-error-port))
(define (vqadds_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvaddnuw  %5  %11 32))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqadds_u32 (bitvector 32))
(define-symbolic b_vqadds_u32 (bitvector 32))
(verify (assert (equal? (vqadds_u32.check a_vqadds_u32 b_vqadds_u32 ) (vqadds_u32 a_vqadds_u32 b_vqadds_u32 ))))
(display "vqadds_u32" (current-error-port))
(define (vqdmlal_high_n_s16.check  a b c )
(define %2 (extract  127 64 b))
(define %10 (extract  15 0 c))
(define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %13.new0 (/  e0.new  2))
  (define %16 (+  %13.new0  15))
  (define %17 (extract  %16 %13.new0 %2))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 32)))
  (define %19.downcasted0 (bvmul  (bv 2 32)  %18.downcasted0))
  (define %20.downcasted0 (bvmulnsw  %19.downcasted0  %11.downcasted0 32))
  (define %29 (+  e0.new  31))
  (define %31 (extract  %29 e0.new a))
  (define %34.downcasted0 (bvaddnsw  %31  %20.downcasted0 32))
  %34.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlal_high_n_s16 (bitvector 128))
(define-symbolic b_vqdmlal_high_n_s16 (bitvector 128))
(define-symbolic c_vqdmlal_high_n_s16 (bitvector 16))
(verify (assert (equal? (vqdmlal_high_n_s16.check a_vqdmlal_high_n_s16 b_vqdmlal_high_n_s16 c_vqdmlal_high_n_s16 ) (vqdmlal_high_n_s16 a_vqdmlal_high_n_s16 b_vqdmlal_high_n_s16 c_vqdmlal_high_n_s16 ))))
(display "vqdmlal_high_n_s16" (current-error-port))
(define (vqdmlal_high_n_s32.check  a b c )
(define %2 (extract  127 64 b))
(define %10 (extract  31 0 c))
(define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %13.new0 (/  e0.new  2))
  (define %16 (+  %13.new0  31))
  (define %17 (extract  %16 %13.new0 %2))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 64)))
  (define %19.downcasted0 (bvmul  (bv 2 64)  %18.downcasted0))
  (define %20.downcasted0 (bvmulnsw  %19.downcasted0  %11.downcasted0 64))
  (define %29 (+  e0.new  63))
  (define %31 (extract  %29 e0.new a))
  (define %34.downcasted0 (bvaddnsw  %31  %20.downcasted0 64))
  %34.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlal_high_n_s32 (bitvector 128))
(define-symbolic b_vqdmlal_high_n_s32 (bitvector 128))
(define-symbolic c_vqdmlal_high_n_s32 (bitvector 32))
(verify (assert (equal? (vqdmlal_high_n_s32.check a_vqdmlal_high_n_s32 b_vqdmlal_high_n_s32 c_vqdmlal_high_n_s32 ) (vqdmlal_high_n_s32 a_vqdmlal_high_n_s32 b_vqdmlal_high_n_s32 c_vqdmlal_high_n_s32 ))))
(display "vqdmlal_high_n_s32" (current-error-port))
(define (vqdmlal_high_s16.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %10.new0 (/  e0.new  2))
  (define %13 (+  %10.new0  15))
  (define %14 (extract  %13 %10.new0 %2))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 32)))
  (define %20 (extract  %13 %10.new0 %5))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 32)))
  (define %22.downcasted0 (bvmul  (bv 2 32)  %15.downcasted0))
  (define %23.downcasted0 (bvmulnsw  %22.downcasted0  %21.downcasted0 32))
  (define %32 (+  e0.new  31))
  (define %34 (extract  %32 e0.new a))
  (define %37.downcasted0 (bvaddnsw  %34  %23.downcasted0 32))
  %37.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlal_high_s16 (bitvector 128))
(define-symbolic b_vqdmlal_high_s16 (bitvector 128))
(define-symbolic c_vqdmlal_high_s16 (bitvector 128))
(verify (assert (equal? (vqdmlal_high_s16.check a_vqdmlal_high_s16 b_vqdmlal_high_s16 c_vqdmlal_high_s16 ) (vqdmlal_high_s16 a_vqdmlal_high_s16 b_vqdmlal_high_s16 c_vqdmlal_high_s16 ))))
(display "vqdmlal_high_s16" (current-error-port))
(define (vqdmlal_high_s32.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %10.new0 (/  e0.new  2))
  (define %13 (+  %10.new0  31))
  (define %14 (extract  %13 %10.new0 %2))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %20 (extract  %13 %10.new0 %5))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 64)))
  (define %22.downcasted0 (bvmul  (bv 2 64)  %15.downcasted0))
  (define %23.downcasted0 (bvmulnsw  %22.downcasted0  %21.downcasted0 64))
  (define %32 (+  e0.new  63))
  (define %34 (extract  %32 e0.new a))
  (define %37.downcasted0 (bvaddnsw  %34  %23.downcasted0 64))
  %37.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlal_high_s32 (bitvector 128))
(define-symbolic b_vqdmlal_high_s32 (bitvector 128))
(define-symbolic c_vqdmlal_high_s32 (bitvector 128))
(verify (assert (equal? (vqdmlal_high_s32.check a_vqdmlal_high_s32 b_vqdmlal_high_s32 c_vqdmlal_high_s32 ) (vqdmlal_high_s32 a_vqdmlal_high_s32 b_vqdmlal_high_s32 c_vqdmlal_high_s32 ))))
(display "vqdmlal_high_s32" (current-error-port))
(define (vqdmlal_n_s16.check  a b c )
(define %7 (extract  15 0 c))
(define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %13 (+  e0.new  15))
  (define %14 (extract  %13 e0.new b))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 32)))
  (define %16.downcasted0 (bvmul  (bv 2 32)  %15.downcasted0))
  (define %17.downcasted0 (bvmulnsw  %16.downcasted0  %8.downcasted0 32))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  31))
  (define %28 (extract  %26 %21.new0 a))
  (define %31.downcasted0 (bvaddnsw  %28  %17.downcasted0 32))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlal_n_s16 (bitvector 128))
(define-symbolic b_vqdmlal_n_s16 (bitvector 64))
(define-symbolic c_vqdmlal_n_s16 (bitvector 16))
(verify (assert (equal? (vqdmlal_n_s16.check a_vqdmlal_n_s16 b_vqdmlal_n_s16 c_vqdmlal_n_s16 ) (vqdmlal_n_s16 a_vqdmlal_n_s16 b_vqdmlal_n_s16 c_vqdmlal_n_s16 ))))
(display "vqdmlal_n_s16" (current-error-port))
(define (vqdmlal_n_s32.check  a b c )
(define %7 (extract  31 0 c))
(define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %13 (+  e0.new  31))
  (define %14 (extract  %13 e0.new b))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvmul  (bv 2 64)  %15.downcasted0))
  (define %17.downcasted0 (bvmulnsw  %16.downcasted0  %8.downcasted0 64))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  63))
  (define %28 (extract  %26 %21.new0 a))
  (define %31.downcasted0 (bvaddnsw  %28  %17.downcasted0 64))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlal_n_s32 (bitvector 128))
(define-symbolic b_vqdmlal_n_s32 (bitvector 64))
(define-symbolic c_vqdmlal_n_s32 (bitvector 32))
(verify (assert (equal? (vqdmlal_n_s32.check a_vqdmlal_n_s32 b_vqdmlal_n_s32 c_vqdmlal_n_s32 ) (vqdmlal_n_s32 a_vqdmlal_n_s32 b_vqdmlal_n_s32 c_vqdmlal_n_s32 ))))
(display "vqdmlal_n_s32" (current-error-port))
(define (vqdmlal_s16.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 32)))
  (define %14 (extract  %7 e0.new c))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 32)))
  (define %16.downcasted0 (bvmul  (bv 2 32)  %9.downcasted0))
  (define %17.downcasted0 (bvmulnsw  %16.downcasted0  %15.downcasted0 32))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  31))
  (define %28 (extract  %26 %21.new0 a))
  (define %31.downcasted0 (bvaddnsw  %28  %17.downcasted0 32))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlal_s16 (bitvector 128))
(define-symbolic b_vqdmlal_s16 (bitvector 64))
(define-symbolic c_vqdmlal_s16 (bitvector 64))
(verify (assert (equal? (vqdmlal_s16.check a_vqdmlal_s16 b_vqdmlal_s16 c_vqdmlal_s16 ) (vqdmlal_s16 a_vqdmlal_s16 b_vqdmlal_s16 c_vqdmlal_s16 ))))
(display "vqdmlal_s16" (current-error-port))
(define (vqdmlal_s32.check  a b c )
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
  (define %14 (extract  %7 e0.new c))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvmul  (bv 2 64)  %9.downcasted0))
  (define %17.downcasted0 (bvmulnsw  %16.downcasted0  %15.downcasted0 64))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  63))
  (define %28 (extract  %26 %21.new0 a))
  (define %31.downcasted0 (bvaddnsw  %28  %17.downcasted0 64))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlal_s32 (bitvector 128))
(define-symbolic b_vqdmlal_s32 (bitvector 64))
(define-symbolic c_vqdmlal_s32 (bitvector 64))
(verify (assert (equal? (vqdmlal_s32.check a_vqdmlal_s32 b_vqdmlal_s32 c_vqdmlal_s32 ) (vqdmlal_s32 a_vqdmlal_s32 b_vqdmlal_s32 c_vqdmlal_s32 ))))
(display "vqdmlal_s32" (current-error-port))
(define (vqdmlalh_s16.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 32)))
  (define %14 (extract  %7 e0.new c))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 32)))
  (define %16.downcasted0 (bvmul  (bv 2 32)  %9.downcasted0))
  (define %17.downcasted0 (bvmulnsw  %16.downcasted0  %15.downcasted0 32))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  31))
  (define %28 (extract  %26 %21.new0 a))
  (define %31.downcasted0 (bvaddnsw  %28  %17.downcasted0 32))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlalh_s16 (bitvector 32))
(define-symbolic b_vqdmlalh_s16 (bitvector 16))
(define-symbolic c_vqdmlalh_s16 (bitvector 16))
(verify (assert (equal? (vqdmlalh_s16.check a_vqdmlalh_s16 b_vqdmlalh_s16 c_vqdmlalh_s16 ) (vqdmlalh_s16 a_vqdmlalh_s16 b_vqdmlalh_s16 c_vqdmlalh_s16 ))))
(display "vqdmlalh_s16" (current-error-port))
(define (vqdmlals_s32.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %14 (extract  %7 e0.new c))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvmul  (bv 2 64)  %9.downcasted0))
  (define %17.downcasted0 (bvmulnsw  %16.downcasted0  %15.downcasted0 64))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  63))
  (define %28 (extract  %26 %21.new0 a))
  (define %31.downcasted0 (bvaddnsw  %28  %17.downcasted0 64))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlals_s32 (bitvector 64))
(define-symbolic b_vqdmlals_s32 (bitvector 32))
(define-symbolic c_vqdmlals_s32 (bitvector 32))
(verify (assert (equal? (vqdmlals_s32.check a_vqdmlals_s32 b_vqdmlals_s32 c_vqdmlals_s32 ) (vqdmlals_s32 a_vqdmlals_s32 b_vqdmlals_s32 c_vqdmlals_s32 ))))
(display "vqdmlals_s32" (current-error-port))
(define (vqdmlsl_high_n_s16.check  a b c )
(define %2 (extract  127 64 b))
(define %10 (extract  15 0 c))
(define %11.downcasted0 (sign-extend  %10 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %13.new0 (/  e0.new  2))
  (define %16 (+  %13.new0  15))
  (define %17 (extract  %16 %13.new0 %2))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 32)))
  (define %19.downcasted0 (bvmul  (bv 2 32)  %18.downcasted0))
  (define %20.downcasted0 (bvmulnsw  %19.downcasted0  %11.downcasted0 32))
  (define %29 (+  e0.new  31))
  (define %31 (extract  %29 e0.new a))
  (define %34.downcasted0 (bvsubnsw  %31  %20.downcasted0 32))
  %34.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlsl_high_n_s16 (bitvector 128))
(define-symbolic b_vqdmlsl_high_n_s16 (bitvector 128))
(define-symbolic c_vqdmlsl_high_n_s16 (bitvector 16))
(verify (assert (equal? (vqdmlsl_high_n_s16.check a_vqdmlsl_high_n_s16 b_vqdmlsl_high_n_s16 c_vqdmlsl_high_n_s16 ) (vqdmlsl_high_n_s16 a_vqdmlsl_high_n_s16 b_vqdmlsl_high_n_s16 c_vqdmlsl_high_n_s16 ))))
(display "vqdmlsl_high_n_s16" (current-error-port))
(define (vqdmlsl_high_n_s32.check  a b c )
(define %2 (extract  127 64 b))
(define %10 (extract  31 0 c))
(define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %13.new0 (/  e0.new  2))
  (define %16 (+  %13.new0  31))
  (define %17 (extract  %16 %13.new0 %2))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 64)))
  (define %19.downcasted0 (bvmul  (bv 2 64)  %18.downcasted0))
  (define %20.downcasted0 (bvmulnsw  %19.downcasted0  %11.downcasted0 64))
  (define %29 (+  e0.new  63))
  (define %31 (extract  %29 e0.new a))
  (define %34.downcasted0 (bvsubnsw  %31  %20.downcasted0 64))
  %34.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlsl_high_n_s32 (bitvector 128))
(define-symbolic b_vqdmlsl_high_n_s32 (bitvector 128))
(define-symbolic c_vqdmlsl_high_n_s32 (bitvector 32))
(verify (assert (equal? (vqdmlsl_high_n_s32.check a_vqdmlsl_high_n_s32 b_vqdmlsl_high_n_s32 c_vqdmlsl_high_n_s32 ) (vqdmlsl_high_n_s32 a_vqdmlsl_high_n_s32 b_vqdmlsl_high_n_s32 c_vqdmlsl_high_n_s32 ))))
(display "vqdmlsl_high_n_s32" (current-error-port))
(define (vqdmlsl_high_s16.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %10.new0 (/  e0.new  2))
  (define %13 (+  %10.new0  15))
  (define %14 (extract  %13 %10.new0 %2))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 32)))
  (define %20 (extract  %13 %10.new0 %5))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 32)))
  (define %22.downcasted0 (bvmul  (bv 2 32)  %15.downcasted0))
  (define %23.downcasted0 (bvmulnsw  %22.downcasted0  %21.downcasted0 32))
  (define %32 (+  e0.new  31))
  (define %34 (extract  %32 e0.new a))
  (define %37.downcasted0 (bvsubnsw  %34  %23.downcasted0 32))
  %37.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlsl_high_s16 (bitvector 128))
(define-symbolic b_vqdmlsl_high_s16 (bitvector 128))
(define-symbolic c_vqdmlsl_high_s16 (bitvector 128))
(verify (assert (equal? (vqdmlsl_high_s16.check a_vqdmlsl_high_s16 b_vqdmlsl_high_s16 c_vqdmlsl_high_s16 ) (vqdmlsl_high_s16 a_vqdmlsl_high_s16 b_vqdmlsl_high_s16 c_vqdmlsl_high_s16 ))))
(display "vqdmlsl_high_s16" (current-error-port))
(define (vqdmlsl_high_s32.check  a b c )
(define %2 (extract  127 64 b))
(define %5 (extract  127 64 c))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %10.new0 (/  e0.new  2))
  (define %13 (+  %10.new0  31))
  (define %14 (extract  %13 %10.new0 %2))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %20 (extract  %13 %10.new0 %5))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 64)))
  (define %22.downcasted0 (bvmul  (bv 2 64)  %15.downcasted0))
  (define %23.downcasted0 (bvmulnsw  %22.downcasted0  %21.downcasted0 64))
  (define %32 (+  e0.new  63))
  (define %34 (extract  %32 e0.new a))
  (define %37.downcasted0 (bvsubnsw  %34  %23.downcasted0 64))
  %37.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlsl_high_s32 (bitvector 128))
(define-symbolic b_vqdmlsl_high_s32 (bitvector 128))
(define-symbolic c_vqdmlsl_high_s32 (bitvector 128))
(verify (assert (equal? (vqdmlsl_high_s32.check a_vqdmlsl_high_s32 b_vqdmlsl_high_s32 c_vqdmlsl_high_s32 ) (vqdmlsl_high_s32 a_vqdmlsl_high_s32 b_vqdmlsl_high_s32 c_vqdmlsl_high_s32 ))))
(display "vqdmlsl_high_s32" (current-error-port))
(define (vqdmlsl_n_s16.check  a b c )
(define %7 (extract  15 0 c))
(define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %13 (+  e0.new  15))
  (define %14 (extract  %13 e0.new b))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 32)))
  (define %16.downcasted0 (bvmul  (bv 2 32)  %15.downcasted0))
  (define %17.downcasted0 (bvmulnsw  %16.downcasted0  %8.downcasted0 32))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  31))
  (define %28 (extract  %26 %21.new0 a))
  (define %31.downcasted0 (bvsubnsw  %28  %17.downcasted0 32))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlsl_n_s16 (bitvector 128))
(define-symbolic b_vqdmlsl_n_s16 (bitvector 64))
(define-symbolic c_vqdmlsl_n_s16 (bitvector 16))
(verify (assert (equal? (vqdmlsl_n_s16.check a_vqdmlsl_n_s16 b_vqdmlsl_n_s16 c_vqdmlsl_n_s16 ) (vqdmlsl_n_s16 a_vqdmlsl_n_s16 b_vqdmlsl_n_s16 c_vqdmlsl_n_s16 ))))
(display "vqdmlsl_n_s16" (current-error-port))
(define (vqdmlsl_n_s32.check  a b c )
(define %7 (extract  31 0 c))
(define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %13 (+  e0.new  31))
  (define %14 (extract  %13 e0.new b))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvmul  (bv 2 64)  %15.downcasted0))
  (define %17.downcasted0 (bvmulnsw  %16.downcasted0  %8.downcasted0 64))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  63))
  (define %28 (extract  %26 %21.new0 a))
  (define %31.downcasted0 (bvsubnsw  %28  %17.downcasted0 64))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlsl_n_s32 (bitvector 128))
(define-symbolic b_vqdmlsl_n_s32 (bitvector 64))
(define-symbolic c_vqdmlsl_n_s32 (bitvector 32))
(verify (assert (equal? (vqdmlsl_n_s32.check a_vqdmlsl_n_s32 b_vqdmlsl_n_s32 c_vqdmlsl_n_s32 ) (vqdmlsl_n_s32 a_vqdmlsl_n_s32 b_vqdmlsl_n_s32 c_vqdmlsl_n_s32 ))))
(display "vqdmlsl_n_s32" (current-error-port))
(define (vqdmlsl_s16.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 32)))
  (define %14 (extract  %7 e0.new c))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 32)))
  (define %16.downcasted0 (bvmul  (bv 2 32)  %9.downcasted0))
  (define %17.downcasted0 (bvmulnsw  %16.downcasted0  %15.downcasted0 32))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  31))
  (define %28 (extract  %26 %21.new0 a))
  (define %31.downcasted0 (bvsubnsw  %28  %17.downcasted0 32))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlsl_s16 (bitvector 128))
(define-symbolic b_vqdmlsl_s16 (bitvector 64))
(define-symbolic c_vqdmlsl_s16 (bitvector 64))
(verify (assert (equal? (vqdmlsl_s16.check a_vqdmlsl_s16 b_vqdmlsl_s16 c_vqdmlsl_s16 ) (vqdmlsl_s16 a_vqdmlsl_s16 b_vqdmlsl_s16 c_vqdmlsl_s16 ))))
(display "vqdmlsl_s16" (current-error-port))
(define (vqdmlsl_s32.check  a b c )
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
  (define %14 (extract  %7 e0.new c))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvmul  (bv 2 64)  %9.downcasted0))
  (define %17.downcasted0 (bvmulnsw  %16.downcasted0  %15.downcasted0 64))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  63))
  (define %28 (extract  %26 %21.new0 a))
  (define %31.downcasted0 (bvsubnsw  %28  %17.downcasted0 64))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlsl_s32 (bitvector 128))
(define-symbolic b_vqdmlsl_s32 (bitvector 64))
(define-symbolic c_vqdmlsl_s32 (bitvector 64))
(verify (assert (equal? (vqdmlsl_s32.check a_vqdmlsl_s32 b_vqdmlsl_s32 c_vqdmlsl_s32 ) (vqdmlsl_s32 a_vqdmlsl_s32 b_vqdmlsl_s32 c_vqdmlsl_s32 ))))
(display "vqdmlsl_s32" (current-error-port))
(define (vqdmlslh_s16.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 32)))
  (define %14 (extract  %7 e0.new c))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 32)))
  (define %16.downcasted0 (bvmul  (bv 2 32)  %9.downcasted0))
  (define %17.downcasted0 (bvmulnsw  %16.downcasted0  %15.downcasted0 32))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  31))
  (define %28 (extract  %26 %21.new0 a))
  (define %31.downcasted0 (bvsubnsw  %28  %17.downcasted0 32))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlslh_s16 (bitvector 32))
(define-symbolic b_vqdmlslh_s16 (bitvector 16))
(define-symbolic c_vqdmlslh_s16 (bitvector 16))
(verify (assert (equal? (vqdmlslh_s16.check a_vqdmlslh_s16 b_vqdmlslh_s16 c_vqdmlslh_s16 ) (vqdmlslh_s16 a_vqdmlslh_s16 b_vqdmlslh_s16 c_vqdmlslh_s16 ))))
(display "vqdmlslh_s16" (current-error-port))
(define (vqdmlsls_s32.check  a b c )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new b))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 64)))
  (define %14 (extract  %7 e0.new c))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvmul  (bv 2 64)  %9.downcasted0))
  (define %17.downcasted0 (bvmulnsw  %16.downcasted0  %15.downcasted0 64))
  (define %21.new0 (*  e0.new  2))
  (define %26 (+  %21.new0  63))
  (define %28 (extract  %26 %21.new0 a))
  (define %31.downcasted0 (bvsubnsw  %28  %17.downcasted0 64))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmlsls_s32 (bitvector 64))
(define-symbolic b_vqdmlsls_s32 (bitvector 32))
(define-symbolic c_vqdmlsls_s32 (bitvector 32))
(verify (assert (equal? (vqdmlsls_s32.check a_vqdmlsls_s32 b_vqdmlsls_s32 c_vqdmlsls_s32 ) (vqdmlsls_s32 a_vqdmlsls_s32 b_vqdmlsls_s32 c_vqdmlsls_s32 ))))
(display "vqdmlsls_s32" (current-error-port))
(define (vqdmulh_n_s16.check  a b )
(define %4 (extract  15 0 b))
(define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
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
  (define %13.downcasted0 (bvmul  (bv 2 64)  %12.downcasted0))
  (define %14.downcasted0 (bvmul  %13.downcasted0  %5.downcasted0))
  (define %20.downcasted0 (bvashr  %14.downcasted0  (bv 16 64)))
  (define %21.downcasted0 (bvssat %20.downcasted0 64 16 ))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmulh_n_s16 (bitvector 64))
(define-symbolic b_vqdmulh_n_s16 (bitvector 16))
(verify (assert (equal? (vqdmulh_n_s16.check a_vqdmulh_n_s16 b_vqdmulh_n_s16 ) (vqdmulh_n_s16 a_vqdmulh_n_s16 b_vqdmulh_n_s16 ))))
(display "vqdmulh_n_s16" (current-error-port))
(define (vqdmulh_n_s32.check  a b )
(define %4 (extract  31 0 b))
(define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
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
  (define %13.downcasted0 (bvmul  (bv 2 128)  %12.downcasted0))
  (define %14.downcasted0 (bvmul  %13.downcasted0  %5.downcasted0))
  (define %20.downcasted0 (bvashr  %14.downcasted0  (bv 32 128)))
  (define %21.downcasted0 (bvssat %20.downcasted0 128 32 ))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmulh_n_s32 (bitvector 64))
(define-symbolic b_vqdmulh_n_s32 (bitvector 32))
(verify (assert (equal? (vqdmulh_n_s32.check a_vqdmulh_n_s32 b_vqdmulh_n_s32 ) (vqdmulh_n_s32 a_vqdmulh_n_s32 b_vqdmulh_n_s32 ))))
(display "vqdmulh_n_s32" (current-error-port))
(define (vqdmulh_s16.check  a b )
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
  (define %13.downcasted0 (bvmul  (bv 2 64)  %6.downcasted0))
  (define %14.downcasted0 (bvmul  %13.downcasted0  %12.downcasted0))
  (define %20.downcasted0 (bvashr  %14.downcasted0  (bv 16 64)))
  (define %21.downcasted0 (bvssat %20.downcasted0 64 16 ))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmulh_s16 (bitvector 64))
(define-symbolic b_vqdmulh_s16 (bitvector 64))
(verify (assert (equal? (vqdmulh_s16.check a_vqdmulh_s16 b_vqdmulh_s16 ) (vqdmulh_s16 a_vqdmulh_s16 b_vqdmulh_s16 ))))
(display "vqdmulh_s16" (current-error-port))
(define (vqdmulh_s32.check  a b )
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
  (define %13.downcasted0 (bvmul  (bv 2 128)  %6.downcasted0))
  (define %14.downcasted0 (bvmul  %13.downcasted0  %12.downcasted0))
  (define %20.downcasted0 (bvashr  %14.downcasted0  (bv 32 128)))
  (define %21.downcasted0 (bvssat %20.downcasted0 128 32 ))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmulh_s32 (bitvector 64))
(define-symbolic b_vqdmulh_s32 (bitvector 64))
(verify (assert (equal? (vqdmulh_s32.check a_vqdmulh_s32 b_vqdmulh_s32 ) (vqdmulh_s32 a_vqdmulh_s32 b_vqdmulh_s32 ))))
(display "vqdmulh_s32" (current-error-port))
(define (vqdmulhh_s16.check  a b )
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
  (define %13.downcasted0 (bvmul  (bv 2 64)  %6.downcasted0))
  (define %14.downcasted0 (bvmul  %13.downcasted0  %12.downcasted0))
  (define %20.downcasted0 (bvashr  %14.downcasted0  (bv 16 64)))
  (define %21.downcasted0 (bvssat %20.downcasted0 64 16 ))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmulhh_s16 (bitvector 16))
(define-symbolic b_vqdmulhh_s16 (bitvector 16))
(verify (assert (equal? (vqdmulhh_s16.check a_vqdmulhh_s16 b_vqdmulhh_s16 ) (vqdmulhh_s16 a_vqdmulhh_s16 b_vqdmulhh_s16 ))))
(display "vqdmulhh_s16" (current-error-port))
(define (vqdmulhq_n_s16.check  a b )
(define %4 (extract  15 0 b))
(define %5.downcasted0 (sign-extend  %4 (bitvector 64)))
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
  (define %13.downcasted0 (bvmul  (bv 2 64)  %12.downcasted0))
  (define %14.downcasted0 (bvmul  %13.downcasted0  %5.downcasted0))
  (define %20.downcasted0 (bvashr  %14.downcasted0  (bv 16 64)))
  (define %21.downcasted0 (bvssat %20.downcasted0 64 16 ))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmulhq_n_s16 (bitvector 128))
(define-symbolic b_vqdmulhq_n_s16 (bitvector 16))
(verify (assert (equal? (vqdmulhq_n_s16.check a_vqdmulhq_n_s16 b_vqdmulhq_n_s16 ) (vqdmulhq_n_s16 a_vqdmulhq_n_s16 b_vqdmulhq_n_s16 ))))
(display "vqdmulhq_n_s16" (current-error-port))
(define (vqdmulhq_n_s32.check  a b )
(define %4 (extract  31 0 b))
(define %5.downcasted0 (sign-extend  %4 (bitvector 128)))
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
  (define %13.downcasted0 (bvmul  (bv 2 128)  %12.downcasted0))
  (define %14.downcasted0 (bvmul  %13.downcasted0  %5.downcasted0))
  (define %20.downcasted0 (bvashr  %14.downcasted0  (bv 32 128)))
  (define %21.downcasted0 (bvssat %20.downcasted0 128 32 ))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmulhq_n_s32 (bitvector 128))
(define-symbolic b_vqdmulhq_n_s32 (bitvector 32))
(verify (assert (equal? (vqdmulhq_n_s32.check a_vqdmulhq_n_s32 b_vqdmulhq_n_s32 ) (vqdmulhq_n_s32 a_vqdmulhq_n_s32 b_vqdmulhq_n_s32 ))))
(display "vqdmulhq_n_s32" (current-error-port))
(define (vqdmulhq_s16.check  a b )
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
  (define %13.downcasted0 (bvmul  (bv 2 64)  %6.downcasted0))
  (define %14.downcasted0 (bvmul  %13.downcasted0  %12.downcasted0))
  (define %20.downcasted0 (bvashr  %14.downcasted0  (bv 16 64)))
  (define %21.downcasted0 (bvssat %20.downcasted0 64 16 ))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmulhq_s16 (bitvector 128))
(define-symbolic b_vqdmulhq_s16 (bitvector 128))
(verify (assert (equal? (vqdmulhq_s16.check a_vqdmulhq_s16 b_vqdmulhq_s16 ) (vqdmulhq_s16 a_vqdmulhq_s16 b_vqdmulhq_s16 ))))
(display "vqdmulhq_s16" (current-error-port))
(define (vqdmulhq_s32.check  a b )
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
  (define %13.downcasted0 (bvmul  (bv 2 128)  %6.downcasted0))
  (define %14.downcasted0 (bvmul  %13.downcasted0  %12.downcasted0))
  (define %20.downcasted0 (bvashr  %14.downcasted0  (bv 32 128)))
  (define %21.downcasted0 (bvssat %20.downcasted0 128 32 ))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmulhq_s32 (bitvector 128))
(define-symbolic b_vqdmulhq_s32 (bitvector 128))
(verify (assert (equal? (vqdmulhq_s32.check a_vqdmulhq_s32 b_vqdmulhq_s32 ) (vqdmulhq_s32 a_vqdmulhq_s32 b_vqdmulhq_s32 ))))
(display "vqdmulhq_s32" (current-error-port))
(define (vqdmulhs_s32.check  a b )
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
  (define %13.downcasted0 (bvmul  (bv 2 128)  %6.downcasted0))
  (define %14.downcasted0 (bvmul  %13.downcasted0  %12.downcasted0))
  (define %20.downcasted0 (bvashr  %14.downcasted0  (bv 32 128)))
  (define %21.downcasted0 (bvssat %20.downcasted0 128 32 ))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmulhs_s32 (bitvector 32))
(define-symbolic b_vqdmulhs_s32 (bitvector 32))
(verify (assert (equal? (vqdmulhs_s32.check a_vqdmulhs_s32 b_vqdmulhs_s32 ) (vqdmulhs_s32 a_vqdmulhs_s32 b_vqdmulhs_s32 ))))
(display "vqdmulhs_s32" (current-error-port))
(define (vqdmull_high_n_s16.check  a b )
(define %2 (extract  127 64 a))
(define %9 (extract  15 0 b))
(define %10.downcasted0 (sign-extend  %9 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %12.new0 (/  e0.new  2))
  (define %15 (+  %12.new0  15))
  (define %16 (extract  %15 %12.new0 %2))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 32)))
  (define %18.downcasted0 (bvmul  (bv 2 32)  %17.downcasted0))
  (define %19.downcasted0 (bvmulnsw  %18.downcasted0  %10.downcasted0 32))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmull_high_n_s16 (bitvector 128))
(define-symbolic b_vqdmull_high_n_s16 (bitvector 16))
(verify (assert (equal? (vqdmull_high_n_s16.check a_vqdmull_high_n_s16 b_vqdmull_high_n_s16 ) (vqdmull_high_n_s16 a_vqdmull_high_n_s16 b_vqdmull_high_n_s16 ))))
(display "vqdmull_high_n_s16" (current-error-port))
(define (vqdmull_high_n_s32.check  a b )
(define %2 (extract  127 64 a))
(define %9 (extract  31 0 b))
(define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %12.new0 (/  e0.new  2))
  (define %15 (+  %12.new0  31))
  (define %16 (extract  %15 %12.new0 %2))
  (define %17.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %18.downcasted0 (bvmul  (bv 2 64)  %17.downcasted0))
  (define %19.downcasted0 (bvmulnsw  %18.downcasted0  %10.downcasted0 64))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmull_high_n_s32 (bitvector 128))
(define-symbolic b_vqdmull_high_n_s32 (bitvector 32))
(verify (assert (equal? (vqdmull_high_n_s32.check a_vqdmull_high_n_s32 b_vqdmull_high_n_s32 ) (vqdmull_high_n_s32 a_vqdmull_high_n_s32 b_vqdmull_high_n_s32 ))))
(display "vqdmull_high_n_s32" (current-error-port))
(define (vqdmull_high_s16.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
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
  (define %19 (extract  %12 %9.new0 %5))
  (define %20.downcasted0 (sign-extend  %19 (bitvector 32)))
  (define %21.downcasted0 (bvmul  (bv 2 32)  %14.downcasted0))
  (define %22.downcasted0 (bvmulnsw  %21.downcasted0  %20.downcasted0 32))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmull_high_s16 (bitvector 128))
(define-symbolic b_vqdmull_high_s16 (bitvector 128))
(verify (assert (equal? (vqdmull_high_s16.check a_vqdmull_high_s16 b_vqdmull_high_s16 ) (vqdmull_high_s16 a_vqdmull_high_s16 b_vqdmull_high_s16 ))))
(display "vqdmull_high_s16" (current-error-port))
(define (vqdmull_high_s32.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
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
  (define %19 (extract  %12 %9.new0 %5))
  (define %20.downcasted0 (sign-extend  %19 (bitvector 64)))
  (define %21.downcasted0 (bvmul  (bv 2 64)  %14.downcasted0))
  (define %22.downcasted0 (bvmulnsw  %21.downcasted0  %20.downcasted0 64))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmull_high_s32 (bitvector 128))
(define-symbolic b_vqdmull_high_s32 (bitvector 128))
(verify (assert (equal? (vqdmull_high_s32.check a_vqdmull_high_s32 b_vqdmull_high_s32 ) (vqdmull_high_s32 a_vqdmull_high_s32 b_vqdmull_high_s32 ))))
(display "vqdmull_high_s32" (current-error-port))
(define (vqdmull_n_s16.check  a b )
(define %6 (extract  15 0 b))
(define %7.downcasted0 (sign-extend  %6 (bitvector 32)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %12 (+  e0.new  15))
  (define %13 (extract  %12 e0.new a))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 32)))
  (define %15.downcasted0 (bvmul  (bv 2 32)  %14.downcasted0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %7.downcasted0 32))
  %16.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmull_n_s16 (bitvector 64))
(define-symbolic b_vqdmull_n_s16 (bitvector 16))
(verify (assert (equal? (vqdmull_n_s16.check a_vqdmull_n_s16 b_vqdmull_n_s16 ) (vqdmull_n_s16 a_vqdmull_n_s16 b_vqdmull_n_s16 ))))
(display "vqdmull_n_s16" (current-error-port))
(define (vqdmull_n_s32.check  a b )
(define %6 (extract  31 0 b))
(define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %12 (+  e0.new  31))
  (define %13 (extract  %12 e0.new a))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvmul  (bv 2 64)  %14.downcasted0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %7.downcasted0 64))
  %16.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmull_n_s32 (bitvector 64))
(define-symbolic b_vqdmull_n_s32 (bitvector 32))
(verify (assert (equal? (vqdmull_n_s32.check a_vqdmull_n_s32 b_vqdmull_n_s32 ) (vqdmull_n_s32 a_vqdmull_n_s32 b_vqdmull_n_s32 ))))
(display "vqdmull_n_s32" (current-error-port))
(define (vqdmull_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
  (define %13 (extract  %6 e0.new b))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 32)))
  (define %15.downcasted0 (bvmul  (bv 2 32)  %8.downcasted0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %14.downcasted0 32))
  %16.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmull_s16 (bitvector 64))
(define-symbolic b_vqdmull_s16 (bitvector 64))
(verify (assert (equal? (vqdmull_s16.check a_vqdmull_s16 b_vqdmull_s16 ) (vqdmull_s16 a_vqdmull_s16 b_vqdmull_s16 ))))
(display "vqdmull_s16" (current-error-port))
(define (vqdmull_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %13 (extract  %6 e0.new b))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvmul  (bv 2 64)  %8.downcasted0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %14.downcasted0 64))
  %16.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmull_s32 (bitvector 64))
(define-symbolic b_vqdmull_s32 (bitvector 64))
(verify (assert (equal? (vqdmull_s32.check a_vqdmull_s32 b_vqdmull_s32 ) (vqdmull_s32 a_vqdmull_s32 b_vqdmull_s32 ))))
(display "vqdmull_s32" (current-error-port))
(define (vqdmullh_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
  (define %13 (extract  %6 e0.new b))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 32)))
  (define %15.downcasted0 (bvmul  (bv 2 32)  %8.downcasted0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %14.downcasted0 32))
  %16.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmullh_s16 (bitvector 16))
(define-symbolic b_vqdmullh_s16 (bitvector 16))
(verify (assert (equal? (vqdmullh_s16.check a_vqdmullh_s16 b_vqdmullh_s16 ) (vqdmullh_s16 a_vqdmullh_s16 b_vqdmullh_s16 ))))
(display "vqdmullh_s16" (current-error-port))
(define (vqdmulls_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %13 (extract  %6 e0.new b))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvmul  (bv 2 64)  %8.downcasted0))
  (define %16.downcasted0 (bvmulnsw  %15.downcasted0  %14.downcasted0 64))
  %16.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqdmulls_s32 (bitvector 32))
(define-symbolic b_vqdmulls_s32 (bitvector 32))
(verify (assert (equal? (vqdmulls_s32.check a_vqdmulls_s32 b_vqdmulls_s32 ) (vqdmulls_s32 a_vqdmulls_s32 b_vqdmulls_s32 ))))
(display "vqdmulls_s32" (current-error-port))
(define (vqmovn_high_s16.check  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %9 (+  e0.new  15))
  (define %11 (extract  %9 e0.new a))
  (define %17.downcasted0 (bvssat %11 16 8 ))
  %17.downcasted0
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define-symbolic r_vqmovn_high_s16 (bitvector 64))
(define-symbolic a_vqmovn_high_s16 (bitvector 128))
(verify (assert (equal? (vqmovn_high_s16.check r_vqmovn_high_s16 a_vqmovn_high_s16 ) (vqmovn_high_s16 r_vqmovn_high_s16 a_vqmovn_high_s16 ))))
(display "vqmovn_high_s16" (current-error-port))
(define (vqmovn_high_s32.check  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9 (+  e0.new  31))
  (define %11 (extract  %9 e0.new a))
  (define %17.downcasted0 (bvssat %11 32 16 ))
  %17.downcasted0
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define-symbolic r_vqmovn_high_s32 (bitvector 64))
(define-symbolic a_vqmovn_high_s32 (bitvector 128))
(verify (assert (equal? (vqmovn_high_s32.check r_vqmovn_high_s32 a_vqmovn_high_s32 ) (vqmovn_high_s32 r_vqmovn_high_s32 a_vqmovn_high_s32 ))))
(display "vqmovn_high_s32" (current-error-port))
(define (vqmovn_high_s64.check  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %9 (+  e0.new  63))
  (define %11 (extract  %9 e0.new a))
  (define %17.downcasted0 (bvssat %11 64 32 ))
  %17.downcasted0
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define-symbolic r_vqmovn_high_s64 (bitvector 64))
(define-symbolic a_vqmovn_high_s64 (bitvector 128))
(verify (assert (equal? (vqmovn_high_s64.check r_vqmovn_high_s64 a_vqmovn_high_s64 ) (vqmovn_high_s64 r_vqmovn_high_s64 a_vqmovn_high_s64 ))))
(display "vqmovn_high_s64" (current-error-port))
(define (vqmovn_high_u16.check  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %9 (+  e0.new  15))
  (define %11 (extract  %9 e0.new a))
  (define %17.downcasted0 (bvusat %11 16 8 ))
  %17.downcasted0
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define-symbolic r_vqmovn_high_u16 (bitvector 64))
(define-symbolic a_vqmovn_high_u16 (bitvector 128))
(verify (assert (equal? (vqmovn_high_u16.check r_vqmovn_high_u16 a_vqmovn_high_u16 ) (vqmovn_high_u16 r_vqmovn_high_u16 a_vqmovn_high_u16 ))))
(display "vqmovn_high_u16" (current-error-port))
(define (vqmovn_high_u32.check  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9 (+  e0.new  31))
  (define %11 (extract  %9 e0.new a))
  (define %17.downcasted0 (bvusat %11 32 16 ))
  %17.downcasted0
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define-symbolic r_vqmovn_high_u32 (bitvector 64))
(define-symbolic a_vqmovn_high_u32 (bitvector 128))
(verify (assert (equal? (vqmovn_high_u32.check r_vqmovn_high_u32 a_vqmovn_high_u32 ) (vqmovn_high_u32 r_vqmovn_high_u32 a_vqmovn_high_u32 ))))
(display "vqmovn_high_u32" (current-error-port))
(define (vqmovn_high_u64.check  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %9 (+  e0.new  63))
  (define %11 (extract  %9 e0.new a))
  (define %17.downcasted0 (bvusat %11 64 32 ))
  %17.downcasted0
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define-symbolic r_vqmovn_high_u64 (bitvector 64))
(define-symbolic a_vqmovn_high_u64 (bitvector 128))
(verify (assert (equal? (vqmovn_high_u64.check r_vqmovn_high_u64 a_vqmovn_high_u64 ) (vqmovn_high_u64 r_vqmovn_high_u64 a_vqmovn_high_u64 ))))
(display "vqmovn_high_u64" (current-error-port))
(define (vqmovn_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  15))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvssat %11 16 8 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovn_s16 (bitvector 128))
(verify (assert (equal? (vqmovn_s16.check a_vqmovn_s16 ) (vqmovn_s16 a_vqmovn_s16 ))))
(display "vqmovn_s16" (current-error-port))
(define (vqmovn_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  31))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvssat %11 32 16 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovn_s32 (bitvector 128))
(verify (assert (equal? (vqmovn_s32.check a_vqmovn_s32 ) (vqmovn_s32 a_vqmovn_s32 ))))
(display "vqmovn_s32" (current-error-port))
(define (vqmovn_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  63))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvssat %11 64 32 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovn_s64 (bitvector 128))
(verify (assert (equal? (vqmovn_s64.check a_vqmovn_s64 ) (vqmovn_s64 a_vqmovn_s64 ))))
(display "vqmovn_s64" (current-error-port))
(define (vqmovn_u16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  15))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvusat %11 16 8 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovn_u16 (bitvector 128))
(verify (assert (equal? (vqmovn_u16.check a_vqmovn_u16 ) (vqmovn_u16 a_vqmovn_u16 ))))
(display "vqmovn_u16" (current-error-port))
(define (vqmovn_u32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  31))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvusat %11 32 16 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovn_u32 (bitvector 128))
(verify (assert (equal? (vqmovn_u32.check a_vqmovn_u32 ) (vqmovn_u32 a_vqmovn_u32 ))))
(display "vqmovn_u32" (current-error-port))
(define (vqmovn_u64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  63))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvusat %11 64 32 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovn_u64 (bitvector 128))
(verify (assert (equal? (vqmovn_u64.check a_vqmovn_u64 ) (vqmovn_u64 a_vqmovn_u64 ))))
(display "vqmovn_u64" (current-error-port))
(define (vqmovnd_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  63))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvssat %11 64 32 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovnd_s64 (bitvector 64))
(verify (assert (equal? (vqmovnd_s64.check a_vqmovnd_s64 ) (vqmovnd_s64 a_vqmovnd_s64 ))))
(display "vqmovnd_s64" (current-error-port))
(define (vqmovnd_u64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  63))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvusat %11 64 32 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovnd_u64 (bitvector 64))
(verify (assert (equal? (vqmovnd_u64.check a_vqmovnd_u64 ) (vqmovnd_u64 a_vqmovnd_u64 ))))
(display "vqmovnd_u64" (current-error-port))
(define (vqmovnh_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  15))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvssat %11 16 8 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovnh_s16 (bitvector 16))
(verify (assert (equal? (vqmovnh_s16.check a_vqmovnh_s16 ) (vqmovnh_s16 a_vqmovnh_s16 ))))
(display "vqmovnh_s16" (current-error-port))
(define (vqmovnh_u16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  15))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvusat %11 16 8 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovnh_u16 (bitvector 16))
(verify (assert (equal? (vqmovnh_u16.check a_vqmovnh_u16 ) (vqmovnh_u16 a_vqmovnh_u16 ))))
(display "vqmovnh_u16" (current-error-port))
(define (vqmovns_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  31))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvssat %11 32 16 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovns_s32 (bitvector 32))
(verify (assert (equal? (vqmovns_s32.check a_vqmovns_s32 ) (vqmovns_s32 a_vqmovns_s32 ))))
(display "vqmovns_s32" (current-error-port))
(define (vqmovns_u32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  31))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvusat %11 32 16 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovns_u32 (bitvector 32))
(verify (assert (equal? (vqmovns_u32.check a_vqmovns_u32 ) (vqmovns_u32 a_vqmovns_u32 ))))
(display "vqmovns_u32" (current-error-port))
(define (vqmovun_high_s16.check  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %9 (+  e0.new  15))
  (define %11 (extract  %9 e0.new a))
  (define %17.downcasted0 (bvusat %11 16 8 ))
  %17.downcasted0
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define-symbolic r_vqmovun_high_s16 (bitvector 64))
(define-symbolic a_vqmovun_high_s16 (bitvector 128))
(verify (assert (equal? (vqmovun_high_s16.check r_vqmovun_high_s16 a_vqmovun_high_s16 ) (vqmovun_high_s16 r_vqmovun_high_s16 a_vqmovun_high_s16 ))))
(display "vqmovun_high_s16" (current-error-port))
(define (vqmovun_high_s32.check  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9 (+  e0.new  31))
  (define %11 (extract  %9 e0.new a))
  (define %17.downcasted0 (bvusat %11 32 16 ))
  %17.downcasted0
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define-symbolic r_vqmovun_high_s32 (bitvector 64))
(define-symbolic a_vqmovun_high_s32 (bitvector 128))
(verify (assert (equal? (vqmovun_high_s32.check r_vqmovun_high_s32 a_vqmovun_high_s32 ) (vqmovun_high_s32 r_vqmovun_high_s32 a_vqmovun_high_s32 ))))
(display "vqmovun_high_s32" (current-error-port))
(define (vqmovun_high_s64.check  r a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %9 (+  e0.new  63))
  (define %11 (extract  %9 e0.new a))
  (define %17.downcasted0 (bvusat %11 64 32 ))
  %17.downcasted0
 )
 )
)
)
)
(define %18 (concat result r))
%18)
(define-symbolic r_vqmovun_high_s64 (bitvector 64))
(define-symbolic a_vqmovun_high_s64 (bitvector 128))
(verify (assert (equal? (vqmovun_high_s64.check r_vqmovun_high_s64 a_vqmovun_high_s64 ) (vqmovun_high_s64 r_vqmovun_high_s64 a_vqmovun_high_s64 ))))
(display "vqmovun_high_s64" (current-error-port))
(define (vqmovun_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  15))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvusat %11 16 8 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovun_s16 (bitvector 128))
(verify (assert (equal? (vqmovun_s16.check a_vqmovun_s16 ) (vqmovun_s16 a_vqmovun_s16 ))))
(display "vqmovun_s16" (current-error-port))
(define (vqmovun_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  31))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvusat %11 32 16 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovun_s32 (bitvector 128))
(verify (assert (equal? (vqmovun_s32.check a_vqmovun_s32 ) (vqmovun_s32 a_vqmovun_s32 ))))
(display "vqmovun_s32" (current-error-port))
(define (vqmovun_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  63))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvusat %11 64 32 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovun_s64 (bitvector 128))
(verify (assert (equal? (vqmovun_s64.check a_vqmovun_s64 ) (vqmovun_s64 a_vqmovun_s64 ))))
(display "vqmovun_s64" (current-error-port))
(define (vqmovund_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  63))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvusat %11 64 32 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovund_s64 (bitvector 64))
(verify (assert (equal? (vqmovund_s64.check a_vqmovund_s64 ) (vqmovund_s64 a_vqmovund_s64 ))))
(display "vqmovund_s64" (current-error-port))
(define (vqmovunh_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  15))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvusat %11 16 8 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovunh_s16 (bitvector 16))
(verify (assert (equal? (vqmovunh_s16.check a_vqmovunh_s16 ) (vqmovunh_s16 a_vqmovunh_s16 ))))
(display "vqmovunh_s16" (current-error-port))
(define (vqmovuns_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  31))
  (define %11 (extract  %9 %4.new0 a))
  (define %17.downcasted0 (bvusat %11 32 16 ))
  %17.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqmovuns_s32 (bitvector 32))
(verify (assert (equal? (vqmovuns_s32.check a_vqmovuns_s32 ) (vqmovuns_s32 a_vqmovuns_s32 ))))
(display "vqmovuns_s32" (current-error-port))
(define (vqneg_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvneg  %5))
  (define %12.downcasted0 (bvssat %7.downcasted0 16 16 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqneg_s16 (bitvector 64))
(verify (assert (equal? (vqneg_s16.check a_vqneg_s16 ) (vqneg_s16 a_vqneg_s16 ))))
(display "vqneg_s16" (current-error-port))
(define (vqneg_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvneg  %5))
  (define %12.downcasted0 (bvssat %7.downcasted0 32 32 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqneg_s32 (bitvector 64))
(verify (assert (equal? (vqneg_s32.check a_vqneg_s32 ) (vqneg_s32 a_vqneg_s32 ))))
(display "vqneg_s32" (current-error-port))
(define (vqneg_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvneg  %5))
  (define %12.downcasted0 (bvssat %7.downcasted0 64 64 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqneg_s64 (bitvector 64))
(verify (assert (equal? (vqneg_s64.check a_vqneg_s64 ) (vqneg_s64 a_vqneg_s64 ))))
(display "vqneg_s64" (current-error-port))
(define (vqneg_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvneg  %5))
  (define %12.downcasted0 (bvssat %7.downcasted0 8 8 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqneg_s8 (bitvector 64))
(verify (assert (equal? (vqneg_s8.check a_vqneg_s8 ) (vqneg_s8 a_vqneg_s8 ))))
(display "vqneg_s8" (current-error-port))
(define (vqnegb_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvneg  %5))
  (define %12.downcasted0 (bvssat %7.downcasted0 8 8 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqnegb_s8 (bitvector 8))
(verify (assert (equal? (vqnegb_s8.check a_vqnegb_s8 ) (vqnegb_s8 a_vqnegb_s8 ))))
(display "vqnegb_s8" (current-error-port))
(define (vqnegd_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvneg  %5))
  (define %12.downcasted0 (bvssat %7.downcasted0 64 64 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqnegd_s64 (bitvector 64))
(verify (assert (equal? (vqnegd_s64.check a_vqnegd_s64 ) (vqnegd_s64 a_vqnegd_s64 ))))
(display "vqnegd_s64" (current-error-port))
(define (vqnegh_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvneg  %5))
  (define %12.downcasted0 (bvssat %7.downcasted0 16 16 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqnegh_s16 (bitvector 16))
(verify (assert (equal? (vqnegh_s16.check a_vqnegh_s16 ) (vqnegh_s16 a_vqnegh_s16 ))))
(display "vqnegh_s16" (current-error-port))
(define (vqnegq_s16.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvneg  %5))
  (define %12.downcasted0 (bvssat %7.downcasted0 16 16 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqnegq_s16 (bitvector 128))
(verify (assert (equal? (vqnegq_s16.check a_vqnegq_s16 ) (vqnegq_s16 a_vqnegq_s16 ))))
(display "vqnegq_s16" (current-error-port))
(define (vqnegq_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvneg  %5))
  (define %12.downcasted0 (bvssat %7.downcasted0 32 32 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqnegq_s32 (bitvector 128))
(verify (assert (equal? (vqnegq_s32.check a_vqnegq_s32 ) (vqnegq_s32 a_vqnegq_s32 ))))
(display "vqnegq_s32" (current-error-port))
(define (vqnegq_s64.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvneg  %5))
  (define %12.downcasted0 (bvssat %7.downcasted0 64 64 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqnegq_s64 (bitvector 128))
(verify (assert (equal? (vqnegq_s64.check a_vqnegq_s64 ) (vqnegq_s64 a_vqnegq_s64 ))))
(display "vqnegq_s64" (current-error-port))
(define (vqnegq_s8.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvneg  %5))
  (define %12.downcasted0 (bvssat %7.downcasted0 8 8 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqnegq_s8 (bitvector 128))
(verify (assert (equal? (vqnegq_s8.check a_vqnegq_s8 ) (vqnegq_s8 a_vqnegq_s8 ))))
(display "vqnegq_s8" (current-error-port))
(define (vqnegs_s32.check  a )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %7.downcasted0 (bvneg  %5))
  (define %12.downcasted0 (bvssat %7.downcasted0 32 32 ))
  %12.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqnegs_s32 (bitvector 32))
(verify (assert (equal? (vqnegs_s32.check a_vqnegs_s32 ) (vqnegs_s32 a_vqnegs_s32 ))))
(display "vqnegs_s32" (current-error-port))
(define (vqrdmulh_n_s16.check  a b )
(define %6 (extract  15 0 b))
(define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %12 (+  e0.new  15))
  (define %13 (extract  %12 e0.new a))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvmul  (bv 2 64)  %14.downcasted0))
  (define %16.downcasted0 (bvmul  %15.downcasted0  %7.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 32768 64)))
  (define %22.downcasted0 (bvashr  %17.downcasted0  (bv 16 64)))
  (define %23.downcasted0 (bvssat %22.downcasted0 64 16 ))
  %23.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrdmulh_n_s16 (bitvector 64))
(define-symbolic b_vqrdmulh_n_s16 (bitvector 16))
(verify (assert (equal? (vqrdmulh_n_s16.check a_vqrdmulh_n_s16 b_vqrdmulh_n_s16 ) (vqrdmulh_n_s16 a_vqrdmulh_n_s16 b_vqrdmulh_n_s16 ))))
(display "vqrdmulh_n_s16" (current-error-port))
(define (vqrdmulh_n_s32.check  a b )
(define %6 (extract  31 0 b))
(define %7.downcasted0 (sign-extend  %6 (bitvector 128)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %12 (+  e0.new  31))
  (define %13 (extract  %12 e0.new a))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 128)))
  (define %15.downcasted0 (bvmul  (bv 2 128)  %14.downcasted0))
  (define %16.downcasted0 (bvmul  %15.downcasted0  %7.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 2147483648 128)))
  (define %22.downcasted0 (bvashr  %17.downcasted0  (bv 32 128)))
  (define %23.downcasted0 (bvssat %22.downcasted0 128 32 ))
  %23.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrdmulh_n_s32 (bitvector 64))
(define-symbolic b_vqrdmulh_n_s32 (bitvector 32))
(verify (assert (equal? (vqrdmulh_n_s32.check a_vqrdmulh_n_s32 b_vqrdmulh_n_s32 ) (vqrdmulh_n_s32 a_vqrdmulh_n_s32 b_vqrdmulh_n_s32 ))))
(display "vqrdmulh_n_s32" (current-error-port))
(define (vqrdmulh_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %13 (extract  %6 e0.new b))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvmul  (bv 2 64)  %8.downcasted0))
  (define %16.downcasted0 (bvmul  %15.downcasted0  %14.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 32768 64)))
  (define %22.downcasted0 (bvashr  %17.downcasted0  (bv 16 64)))
  (define %23.downcasted0 (bvssat %22.downcasted0 64 16 ))
  %23.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrdmulh_s16 (bitvector 64))
(define-symbolic b_vqrdmulh_s16 (bitvector 64))
(verify (assert (equal? (vqrdmulh_s16.check a_vqrdmulh_s16 b_vqrdmulh_s16 ) (vqrdmulh_s16 a_vqrdmulh_s16 b_vqrdmulh_s16 ))))
(display "vqrdmulh_s16" (current-error-port))
(define (vqrdmulh_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 128)))
  (define %13 (extract  %6 e0.new b))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 128)))
  (define %15.downcasted0 (bvmul  (bv 2 128)  %8.downcasted0))
  (define %16.downcasted0 (bvmul  %15.downcasted0  %14.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 2147483648 128)))
  (define %22.downcasted0 (bvashr  %17.downcasted0  (bv 32 128)))
  (define %23.downcasted0 (bvssat %22.downcasted0 128 32 ))
  %23.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrdmulh_s32 (bitvector 64))
(define-symbolic b_vqrdmulh_s32 (bitvector 64))
(verify (assert (equal? (vqrdmulh_s32.check a_vqrdmulh_s32 b_vqrdmulh_s32 ) (vqrdmulh_s32 a_vqrdmulh_s32 b_vqrdmulh_s32 ))))
(display "vqrdmulh_s32" (current-error-port))
(define (vqrdmulhh_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %13 (extract  %6 e0.new b))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvmul  (bv 2 64)  %8.downcasted0))
  (define %16.downcasted0 (bvmul  %15.downcasted0  %14.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 32768 64)))
  (define %22.downcasted0 (bvashr  %17.downcasted0  (bv 16 64)))
  (define %23.downcasted0 (bvssat %22.downcasted0 64 16 ))
  %23.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrdmulhh_s16 (bitvector 16))
(define-symbolic b_vqrdmulhh_s16 (bitvector 16))
(verify (assert (equal? (vqrdmulhh_s16.check a_vqrdmulhh_s16 b_vqrdmulhh_s16 ) (vqrdmulhh_s16 a_vqrdmulhh_s16 b_vqrdmulhh_s16 ))))
(display "vqrdmulhh_s16" (current-error-port))
(define (vqrdmulhq_n_s16.check  a b )
(define %6 (extract  15 0 b))
(define %7.downcasted0 (sign-extend  %6 (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %12 (+  e0.new  15))
  (define %13 (extract  %12 e0.new a))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvmul  (bv 2 64)  %14.downcasted0))
  (define %16.downcasted0 (bvmul  %15.downcasted0  %7.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 32768 64)))
  (define %22.downcasted0 (bvashr  %17.downcasted0  (bv 16 64)))
  (define %23.downcasted0 (bvssat %22.downcasted0 64 16 ))
  %23.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrdmulhq_n_s16 (bitvector 128))
(define-symbolic b_vqrdmulhq_n_s16 (bitvector 16))
(verify (assert (equal? (vqrdmulhq_n_s16.check a_vqrdmulhq_n_s16 b_vqrdmulhq_n_s16 ) (vqrdmulhq_n_s16 a_vqrdmulhq_n_s16 b_vqrdmulhq_n_s16 ))))
(display "vqrdmulhq_n_s16" (current-error-port))
(define (vqrdmulhq_n_s32.check  a b )
(define %6 (extract  31 0 b))
(define %7.downcasted0 (sign-extend  %6 (bitvector 128)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %12 (+  e0.new  31))
  (define %13 (extract  %12 e0.new a))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 128)))
  (define %15.downcasted0 (bvmul  (bv 2 128)  %14.downcasted0))
  (define %16.downcasted0 (bvmul  %15.downcasted0  %7.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 2147483648 128)))
  (define %22.downcasted0 (bvashr  %17.downcasted0  (bv 32 128)))
  (define %23.downcasted0 (bvssat %22.downcasted0 128 32 ))
  %23.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrdmulhq_n_s32 (bitvector 128))
(define-symbolic b_vqrdmulhq_n_s32 (bitvector 32))
(verify (assert (equal? (vqrdmulhq_n_s32.check a_vqrdmulhq_n_s32 b_vqrdmulhq_n_s32 ) (vqrdmulhq_n_s32 a_vqrdmulhq_n_s32 b_vqrdmulhq_n_s32 ))))
(display "vqrdmulhq_n_s32" (current-error-port))
(define (vqrdmulhq_s16.check  a b )
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
  (define %13 (extract  %6 e0.new b))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 64)))
  (define %15.downcasted0 (bvmul  (bv 2 64)  %8.downcasted0))
  (define %16.downcasted0 (bvmul  %15.downcasted0  %14.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 32768 64)))
  (define %22.downcasted0 (bvashr  %17.downcasted0  (bv 16 64)))
  (define %23.downcasted0 (bvssat %22.downcasted0 64 16 ))
  %23.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrdmulhq_s16 (bitvector 128))
(define-symbolic b_vqrdmulhq_s16 (bitvector 128))
(verify (assert (equal? (vqrdmulhq_s16.check a_vqrdmulhq_s16 b_vqrdmulhq_s16 ) (vqrdmulhq_s16 a_vqrdmulhq_s16 b_vqrdmulhq_s16 ))))
(display "vqrdmulhq_s16" (current-error-port))
(define (vqrdmulhq_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 128)))
  (define %13 (extract  %6 e0.new b))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 128)))
  (define %15.downcasted0 (bvmul  (bv 2 128)  %8.downcasted0))
  (define %16.downcasted0 (bvmul  %15.downcasted0  %14.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 2147483648 128)))
  (define %22.downcasted0 (bvashr  %17.downcasted0  (bv 32 128)))
  (define %23.downcasted0 (bvssat %22.downcasted0 128 32 ))
  %23.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrdmulhq_s32 (bitvector 128))
(define-symbolic b_vqrdmulhq_s32 (bitvector 128))
(verify (assert (equal? (vqrdmulhq_s32.check a_vqrdmulhq_s32 b_vqrdmulhq_s32 ) (vqrdmulhq_s32 a_vqrdmulhq_s32 b_vqrdmulhq_s32 ))))
(display "vqrdmulhq_s32" (current-error-port))
(define (vqrdmulhs_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 128)))
  (define %13 (extract  %6 e0.new b))
  (define %14.downcasted0 (sign-extend  %13 (bitvector 128)))
  (define %15.downcasted0 (bvmul  (bv 2 128)  %8.downcasted0))
  (define %16.downcasted0 (bvmul  %15.downcasted0  %14.downcasted0))
  (define %17.downcasted0 (bvadd  %16.downcasted0  (bv 2147483648 128)))
  (define %22.downcasted0 (bvashr  %17.downcasted0  (bv 32 128)))
  (define %23.downcasted0 (bvssat %22.downcasted0 128 32 ))
  %23.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrdmulhs_s32 (bitvector 32))
(define-symbolic b_vqrdmulhs_s32 (bitvector 32))
(verify (assert (equal? (vqrdmulhs_s32.check a_vqrdmulhs_s32 b_vqrdmulhs_s32 ) (vqrdmulhs_s32 a_vqrdmulhs_s32 b_vqrdmulhs_s32 ))))
(display "vqrdmulhs_s32" (current-error-port))
(define (vqrshl_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (sign-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvssat %23.downcasted0 128 16 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshl_s16 (bitvector 64))
(define-symbolic b_vqrshl_s16 (bitvector 64))
(verify (assert (equal? (vqrshl_s16.check a_vqrshl_s16 b_vqrshl_s16 ) (vqrshl_s16 a_vqrshl_s16 b_vqrshl_s16 ))))
(display "vqrshl_s16" (current-error-port))
(define (vqrshl_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (sign-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvssat %23.downcasted0 128 32 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshl_s32 (bitvector 64))
(define-symbolic b_vqrshl_s32 (bitvector 64))
(verify (assert (equal? (vqrshl_s32.check a_vqrshl_s32 b_vqrshl_s32 ) (vqrshl_s32 a_vqrshl_s32 b_vqrshl_s32 ))))
(display "vqrshl_s32" (current-error-port))
(define (vqrshl_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (sign-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvssat %23.downcasted0 128 64 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshl_s64 (bitvector 64))
(define-symbolic b_vqrshl_s64 (bitvector 64))
(verify (assert (equal? (vqrshl_s64.check a_vqrshl_s64 b_vqrshl_s64 ) (vqrshl_s64 a_vqrshl_s64 b_vqrshl_s64 ))))
(display "vqrshl_s64" (current-error-port))
(define (vqrshl_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (sign-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvssat %23.downcasted0 128 8 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshl_s8 (bitvector 64))
(define-symbolic b_vqrshl_s8 (bitvector 64))
(verify (assert (equal? (vqrshl_s8.check a_vqrshl_s8 b_vqrshl_s8 ) (vqrshl_s8 a_vqrshl_s8 b_vqrshl_s8 ))))
(display "vqrshl_s8" (current-error-port))
(define (vqrshl_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (zero-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvusat %23.downcasted0 128 16 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshl_u16 (bitvector 64))
(define-symbolic b_vqrshl_u16 (bitvector 64))
(verify (assert (equal? (vqrshl_u16.check a_vqrshl_u16 b_vqrshl_u16 ) (vqrshl_u16 a_vqrshl_u16 b_vqrshl_u16 ))))
(display "vqrshl_u16" (current-error-port))
(define (vqrshl_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (zero-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvusat %23.downcasted0 128 32 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshl_u32 (bitvector 64))
(define-symbolic b_vqrshl_u32 (bitvector 64))
(verify (assert (equal? (vqrshl_u32.check a_vqrshl_u32 b_vqrshl_u32 ) (vqrshl_u32 a_vqrshl_u32 b_vqrshl_u32 ))))
(display "vqrshl_u32" (current-error-port))
(define (vqrshl_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (zero-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvusat %23.downcasted0 128 64 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshl_u64 (bitvector 64))
(define-symbolic b_vqrshl_u64 (bitvector 64))
(verify (assert (equal? (vqrshl_u64.check a_vqrshl_u64 b_vqrshl_u64 ) (vqrshl_u64 a_vqrshl_u64 b_vqrshl_u64 ))))
(display "vqrshl_u64" (current-error-port))
(define (vqrshl_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (zero-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvusat %23.downcasted0 128 8 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshl_u8 (bitvector 64))
(define-symbolic b_vqrshl_u8 (bitvector 64))
(verify (assert (equal? (vqrshl_u8.check a_vqrshl_u8 b_vqrshl_u8 ) (vqrshl_u8 a_vqrshl_u8 b_vqrshl_u8 ))))
(display "vqrshl_u8" (current-error-port))
(define (vqrshlb_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (sign-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvssat %23.downcasted0 128 8 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshlb_s8 (bitvector 8))
(define-symbolic b_vqrshlb_s8 (bitvector 8))
(verify (assert (equal? (vqrshlb_s8.check a_vqrshlb_s8 b_vqrshlb_s8 ) (vqrshlb_s8 a_vqrshlb_s8 b_vqrshlb_s8 ))))
(display "vqrshlb_s8" (current-error-port))
(define (vqrshlb_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (zero-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvusat %23.downcasted0 128 8 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshlb_u8 (bitvector 8))
(define-symbolic b_vqrshlb_u8 (bitvector 8))
(verify (assert (equal? (vqrshlb_u8.check a_vqrshlb_u8 b_vqrshlb_u8 ) (vqrshlb_u8 a_vqrshlb_u8 b_vqrshlb_u8 ))))
(display "vqrshlb_u8" (current-error-port))
(define (vqrshld_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (sign-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvssat %23.downcasted0 128 64 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshld_s64 (bitvector 64))
(define-symbolic b_vqrshld_s64 (bitvector 64))
(verify (assert (equal? (vqrshld_s64.check a_vqrshld_s64 b_vqrshld_s64 ) (vqrshld_s64 a_vqrshld_s64 b_vqrshld_s64 ))))
(display "vqrshld_s64" (current-error-port))
(define (vqrshld_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (zero-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvusat %23.downcasted0 128 64 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshld_u64 (bitvector 64))
(define-symbolic b_vqrshld_u64 (bitvector 64))
(verify (assert (equal? (vqrshld_u64.check a_vqrshld_u64 b_vqrshld_u64 ) (vqrshld_u64 a_vqrshld_u64 b_vqrshld_u64 ))))
(display "vqrshld_u64" (current-error-port))
(define (vqrshlh_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (sign-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvssat %23.downcasted0 128 16 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshlh_s16 (bitvector 16))
(define-symbolic b_vqrshlh_s16 (bitvector 16))
(verify (assert (equal? (vqrshlh_s16.check a_vqrshlh_s16 b_vqrshlh_s16 ) (vqrshlh_s16 a_vqrshlh_s16 b_vqrshlh_s16 ))))
(display "vqrshlh_s16" (current-error-port))
(define (vqrshlh_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (zero-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvusat %23.downcasted0 128 16 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshlh_u16 (bitvector 16))
(define-symbolic b_vqrshlh_u16 (bitvector 16))
(verify (assert (equal? (vqrshlh_u16.check a_vqrshlh_u16 b_vqrshlh_u16 ) (vqrshlh_u16 a_vqrshlh_u16 b_vqrshlh_u16 ))))
(display "vqrshlh_u16" (current-error-port))
(define (vqrshlq_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (sign-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvssat %23.downcasted0 128 16 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshlq_s16 (bitvector 128))
(define-symbolic b_vqrshlq_s16 (bitvector 128))
(verify (assert (equal? (vqrshlq_s16.check a_vqrshlq_s16 b_vqrshlq_s16 ) (vqrshlq_s16 a_vqrshlq_s16 b_vqrshlq_s16 ))))
(display "vqrshlq_s16" (current-error-port))
(define (vqrshlq_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (sign-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvssat %23.downcasted0 128 32 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshlq_s32 (bitvector 128))
(define-symbolic b_vqrshlq_s32 (bitvector 128))
(verify (assert (equal? (vqrshlq_s32.check a_vqrshlq_s32 b_vqrshlq_s32 ) (vqrshlq_s32 a_vqrshlq_s32 b_vqrshlq_s32 ))))
(display "vqrshlq_s32" (current-error-port))
(define (vqrshlq_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (sign-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvssat %23.downcasted0 128 64 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshlq_s64 (bitvector 128))
(define-symbolic b_vqrshlq_s64 (bitvector 128))
(verify (assert (equal? (vqrshlq_s64.check a_vqrshlq_s64 b_vqrshlq_s64 ) (vqrshlq_s64 a_vqrshlq_s64 b_vqrshlq_s64 ))))
(display "vqrshlq_s64" (current-error-port))
(define (vqrshlq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (sign-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvssat %23.downcasted0 128 8 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshlq_s8 (bitvector 128))
(define-symbolic b_vqrshlq_s8 (bitvector 128))
(verify (assert (equal? (vqrshlq_s8.check a_vqrshlq_s8 b_vqrshlq_s8 ) (vqrshlq_s8 a_vqrshlq_s8 b_vqrshlq_s8 ))))
(display "vqrshlq_s8" (current-error-port))
(define (vqrshlq_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (zero-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvusat %23.downcasted0 128 16 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshlq_u16 (bitvector 128))
(define-symbolic b_vqrshlq_u16 (bitvector 128))
(verify (assert (equal? (vqrshlq_u16.check a_vqrshlq_u16 b_vqrshlq_u16 ) (vqrshlq_u16 a_vqrshlq_u16 b_vqrshlq_u16 ))))
(display "vqrshlq_u16" (current-error-port))
(define (vqrshlq_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (zero-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvusat %23.downcasted0 128 32 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshlq_u32 (bitvector 128))
(define-symbolic b_vqrshlq_u32 (bitvector 128))
(verify (assert (equal? (vqrshlq_u32.check a_vqrshlq_u32 b_vqrshlq_u32 ) (vqrshlq_u32 a_vqrshlq_u32 b_vqrshlq_u32 ))))
(display "vqrshlq_u32" (current-error-port))
(define (vqrshlq_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (zero-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvusat %23.downcasted0 128 64 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshlq_u64 (bitvector 128))
(define-symbolic b_vqrshlq_u64 (bitvector 128))
(verify (assert (equal? (vqrshlq_u64.check a_vqrshlq_u64 b_vqrshlq_u64 ) (vqrshlq_u64 a_vqrshlq_u64 b_vqrshlq_u64 ))))
(display "vqrshlq_u64" (current-error-port))
(define (vqrshlq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (zero-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvusat %23.downcasted0 128 8 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshlq_u8 (bitvector 128))
(define-symbolic b_vqrshlq_u8 (bitvector 128))
(verify (assert (equal? (vqrshlq_u8.check a_vqrshlq_u8 b_vqrshlq_u8 ) (vqrshlq_u8 a_vqrshlq_u8 b_vqrshlq_u8 ))))
(display "vqrshlq_u8" (current-error-port))
(define (vqrshls_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (sign-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvssat %23.downcasted0 128 32 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshls_s32 (bitvector 32))
(define-symbolic b_vqrshls_s32 (bitvector 32))
(verify (assert (equal? (vqrshls_s32.check a_vqrshls_s32 b_vqrshls_s32 ) (vqrshls_s32 a_vqrshls_s32 b_vqrshls_s32 ))))
(display "vqrshls_s32" (current-error-port))
(define (vqrshls_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %12.downcasted0 (bvneg  %11.downcasted0))
  (define %13.downcasted0 (bvsub  %12.downcasted0  (bv 1 128)))
  (define %14.downcasted0 (bvshl  (bv 1 128)  %13.downcasted0))
  (define %19 (extract  %8 e0.new a))
  (define %21.downcasted0 (zero-extend  %19 (bitvector 128)))
  (define %22.downcasted0 (bvadd  %21.downcasted0  %14.downcasted0))
  (define %23.downcasted0 (bvshl  %22.downcasted0  %11.downcasted0))
  (define %28.downcasted0 (bvusat %23.downcasted0 128 32 ))
  %28.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshls_u32 (bitvector 32))
(define-symbolic b_vqrshls_u32 (bitvector 32))
(verify (assert (equal? (vqrshls_u32.check a_vqrshls_u32 b_vqrshls_u32 ) (vqrshls_u32 a_vqrshls_u32 b_vqrshls_u32 ))))
(display "vqrshls_u32" (current-error-port))
(define (vqrshrn_high_n_s16.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %12 (+  e0.new  15))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvssat %17.downcasted0 64 8 ))
  %22.downcasted0
 )
 )
)
)
)
(define %23 (concat result r))
%23)
(define-symbolic r_vqrshrn_high_n_s16 (bitvector 64))
(define-symbolic a_vqrshrn_high_n_s16 (bitvector 128))
(define-symbolic n_vqrshrn_high_n_s16 (bitvector 32))
(verify (assert (equal? (vqrshrn_high_n_s16.check r_vqrshrn_high_n_s16 a_vqrshrn_high_n_s16 n_vqrshrn_high_n_s16 ) (vqrshrn_high_n_s16 r_vqrshrn_high_n_s16 a_vqrshrn_high_n_s16 n_vqrshrn_high_n_s16 ))))
(display "vqrshrn_high_n_s16" (current-error-port))
(define (vqrshrn_high_n_s32.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %12 (+  e0.new  31))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvssat %17.downcasted0 64 16 ))
  %22.downcasted0
 )
 )
)
)
)
(define %23 (concat result r))
%23)
(define-symbolic r_vqrshrn_high_n_s32 (bitvector 64))
(define-symbolic a_vqrshrn_high_n_s32 (bitvector 128))
(define-symbolic n_vqrshrn_high_n_s32 (bitvector 32))
(verify (assert (equal? (vqrshrn_high_n_s32.check r_vqrshrn_high_n_s32 a_vqrshrn_high_n_s32 n_vqrshrn_high_n_s32 ) (vqrshrn_high_n_s32 r_vqrshrn_high_n_s32 a_vqrshrn_high_n_s32 n_vqrshrn_high_n_s32 ))))
(display "vqrshrn_high_n_s32" (current-error-port))
(define (vqrshrn_high_n_s64.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %4.downcasted0 (bvshl  (bv 1 128)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %12 (+  e0.new  63))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvssat %17.downcasted0 128 32 ))
  %22.downcasted0
 )
 )
)
)
)
(define %23 (concat result r))
%23)
(define-symbolic r_vqrshrn_high_n_s64 (bitvector 64))
(define-symbolic a_vqrshrn_high_n_s64 (bitvector 128))
(define-symbolic n_vqrshrn_high_n_s64 (bitvector 32))
(verify (assert (equal? (vqrshrn_high_n_s64.check r_vqrshrn_high_n_s64 a_vqrshrn_high_n_s64 n_vqrshrn_high_n_s64 ) (vqrshrn_high_n_s64 r_vqrshrn_high_n_s64 a_vqrshrn_high_n_s64 n_vqrshrn_high_n_s64 ))))
(display "vqrshrn_high_n_s64" (current-error-port))
(define (vqrshrn_high_n_u16.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %12 (+  e0.new  15))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 64 8 ))
  %22.downcasted0
 )
 )
)
)
)
(define %23 (concat result r))
%23)
(define-symbolic r_vqrshrn_high_n_u16 (bitvector 64))
(define-symbolic a_vqrshrn_high_n_u16 (bitvector 128))
(define-symbolic n_vqrshrn_high_n_u16 (bitvector 32))
(verify (assert (equal? (vqrshrn_high_n_u16.check r_vqrshrn_high_n_u16 a_vqrshrn_high_n_u16 n_vqrshrn_high_n_u16 ) (vqrshrn_high_n_u16 r_vqrshrn_high_n_u16 a_vqrshrn_high_n_u16 n_vqrshrn_high_n_u16 ))))
(display "vqrshrn_high_n_u16" (current-error-port))
(define (vqrshrn_high_n_u32.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %12 (+  e0.new  31))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 64 16 ))
  %22.downcasted0
 )
 )
)
)
)
(define %23 (concat result r))
%23)
(define-symbolic r_vqrshrn_high_n_u32 (bitvector 64))
(define-symbolic a_vqrshrn_high_n_u32 (bitvector 128))
(define-symbolic n_vqrshrn_high_n_u32 (bitvector 32))
(verify (assert (equal? (vqrshrn_high_n_u32.check r_vqrshrn_high_n_u32 a_vqrshrn_high_n_u32 n_vqrshrn_high_n_u32 ) (vqrshrn_high_n_u32 r_vqrshrn_high_n_u32 a_vqrshrn_high_n_u32 n_vqrshrn_high_n_u32 ))))
(display "vqrshrn_high_n_u32" (current-error-port))
(define (vqrshrn_high_n_u64.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %4.downcasted0 (bvshl  (bv 1 128)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %12 (+  e0.new  63))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 128 32 ))
  %22.downcasted0
 )
 )
)
)
)
(define %23 (concat result r))
%23)
(define-symbolic r_vqrshrn_high_n_u64 (bitvector 64))
(define-symbolic a_vqrshrn_high_n_u64 (bitvector 128))
(define-symbolic n_vqrshrn_high_n_u64 (bitvector 32))
(verify (assert (equal? (vqrshrn_high_n_u64.check r_vqrshrn_high_n_u64 a_vqrshrn_high_n_u64 n_vqrshrn_high_n_u64 ) (vqrshrn_high_n_u64 r_vqrshrn_high_n_u64 a_vqrshrn_high_n_u64 n_vqrshrn_high_n_u64 ))))
(display "vqrshrn_high_n_u64" (current-error-port))
(define (vqrshrn_n_s16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  15))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvssat %17.downcasted0 64 8 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshrn_n_s16 (bitvector 128))
(define-symbolic n_vqrshrn_n_s16 (bitvector 32))
(verify (assert (equal? (vqrshrn_n_s16.check a_vqrshrn_n_s16 n_vqrshrn_n_s16 ) (vqrshrn_n_s16 a_vqrshrn_n_s16 n_vqrshrn_n_s16 ))))
(display "vqrshrn_n_s16" (current-error-port))
(define (vqrshrn_n_s32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  31))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvssat %17.downcasted0 64 16 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshrn_n_s32 (bitvector 128))
(define-symbolic n_vqrshrn_n_s32 (bitvector 32))
(verify (assert (equal? (vqrshrn_n_s32.check a_vqrshrn_n_s32 n_vqrshrn_n_s32 ) (vqrshrn_n_s32 a_vqrshrn_n_s32 n_vqrshrn_n_s32 ))))
(display "vqrshrn_n_s32" (current-error-port))
(define (vqrshrn_n_s64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %4.downcasted0 (bvshl  (bv 1 128)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  63))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvssat %17.downcasted0 128 32 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshrn_n_s64 (bitvector 128))
(define-symbolic n_vqrshrn_n_s64 (bitvector 32))
(verify (assert (equal? (vqrshrn_n_s64.check a_vqrshrn_n_s64 n_vqrshrn_n_s64 ) (vqrshrn_n_s64 a_vqrshrn_n_s64 n_vqrshrn_n_s64 ))))
(display "vqrshrn_n_s64" (current-error-port))
(define (vqrshrn_n_u16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  15))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 64 8 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshrn_n_u16 (bitvector 128))
(define-symbolic n_vqrshrn_n_u16 (bitvector 32))
(verify (assert (equal? (vqrshrn_n_u16.check a_vqrshrn_n_u16 n_vqrshrn_n_u16 ) (vqrshrn_n_u16 a_vqrshrn_n_u16 n_vqrshrn_n_u16 ))))
(display "vqrshrn_n_u16" (current-error-port))
(define (vqrshrn_n_u32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  31))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 64 16 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshrn_n_u32 (bitvector 128))
(define-symbolic n_vqrshrn_n_u32 (bitvector 32))
(verify (assert (equal? (vqrshrn_n_u32.check a_vqrshrn_n_u32 n_vqrshrn_n_u32 ) (vqrshrn_n_u32 a_vqrshrn_n_u32 n_vqrshrn_n_u32 ))))
(display "vqrshrn_n_u32" (current-error-port))
(define (vqrshrn_n_u64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %4.downcasted0 (bvshl  (bv 1 128)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  63))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 128 32 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshrn_n_u64 (bitvector 128))
(define-symbolic n_vqrshrn_n_u64 (bitvector 32))
(verify (assert (equal? (vqrshrn_n_u64.check a_vqrshrn_n_u64 n_vqrshrn_n_u64 ) (vqrshrn_n_u64 a_vqrshrn_n_u64 n_vqrshrn_n_u64 ))))
(display "vqrshrn_n_u64" (current-error-port))
(define (vqrshrnd_n_s64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %4.downcasted0 (bvshl  (bv 1 128)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  63))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvssat %17.downcasted0 128 32 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshrnd_n_s64 (bitvector 64))
(define-symbolic n_vqrshrnd_n_s64 (bitvector 32))
(verify (assert (equal? (vqrshrnd_n_s64.check a_vqrshrnd_n_s64 n_vqrshrnd_n_s64 ) (vqrshrnd_n_s64 a_vqrshrnd_n_s64 n_vqrshrnd_n_s64 ))))
(display "vqrshrnd_n_s64" (current-error-port))
(define (vqrshrnd_n_u64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %4.downcasted0 (bvshl  (bv 1 128)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  63))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 128 32 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshrnd_n_u64 (bitvector 64))
(define-symbolic n_vqrshrnd_n_u64 (bitvector 32))
(verify (assert (equal? (vqrshrnd_n_u64.check a_vqrshrnd_n_u64 n_vqrshrnd_n_u64 ) (vqrshrnd_n_u64 a_vqrshrnd_n_u64 n_vqrshrnd_n_u64 ))))
(display "vqrshrnd_n_u64" (current-error-port))
(define (vqrshrnh_n_s16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  15))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvssat %17.downcasted0 64 8 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshrnh_n_s16 (bitvector 16))
(define-symbolic n_vqrshrnh_n_s16 (bitvector 32))
(verify (assert (equal? (vqrshrnh_n_s16.check a_vqrshrnh_n_s16 n_vqrshrnh_n_s16 ) (vqrshrnh_n_s16 a_vqrshrnh_n_s16 n_vqrshrnh_n_s16 ))))
(display "vqrshrnh_n_s16" (current-error-port))
(define (vqrshrnh_n_u16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  15))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 64 8 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshrnh_n_u16 (bitvector 16))
(define-symbolic n_vqrshrnh_n_u16 (bitvector 32))
(verify (assert (equal? (vqrshrnh_n_u16.check a_vqrshrnh_n_u16 n_vqrshrnh_n_u16 ) (vqrshrnh_n_u16 a_vqrshrnh_n_u16 n_vqrshrnh_n_u16 ))))
(display "vqrshrnh_n_u16" (current-error-port))
(define (vqrshrns_n_s32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  31))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvssat %17.downcasted0 64 16 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshrns_n_s32 (bitvector 32))
(define-symbolic n_vqrshrns_n_s32 (bitvector 32))
(verify (assert (equal? (vqrshrns_n_s32.check a_vqrshrns_n_s32 n_vqrshrns_n_s32 ) (vqrshrns_n_s32 a_vqrshrns_n_s32 n_vqrshrns_n_s32 ))))
(display "vqrshrns_n_s32" (current-error-port))
(define (vqrshrns_n_u32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  31))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 64 16 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshrns_n_u32 (bitvector 32))
(define-symbolic n_vqrshrns_n_u32 (bitvector 32))
(verify (assert (equal? (vqrshrns_n_u32.check a_vqrshrns_n_u32 n_vqrshrns_n_u32 ) (vqrshrns_n_u32 a_vqrshrns_n_u32 n_vqrshrns_n_u32 ))))
(display "vqrshrns_n_u32" (current-error-port))
(define (vqrshrun_high_n_s16.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %12 (+  e0.new  15))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 64 8 ))
  %22.downcasted0
 )
 )
)
)
)
(define %23 (concat result r))
%23)
(define-symbolic r_vqrshrun_high_n_s16 (bitvector 64))
(define-symbolic a_vqrshrun_high_n_s16 (bitvector 128))
(define-symbolic n_vqrshrun_high_n_s16 (bitvector 32))
(verify (assert (equal? (vqrshrun_high_n_s16.check r_vqrshrun_high_n_s16 a_vqrshrun_high_n_s16 n_vqrshrun_high_n_s16 ) (vqrshrun_high_n_s16 r_vqrshrun_high_n_s16 a_vqrshrun_high_n_s16 n_vqrshrun_high_n_s16 ))))
(display "vqrshrun_high_n_s16" (current-error-port))
(define (vqrshrun_high_n_s32.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %12 (+  e0.new  31))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 64 16 ))
  %22.downcasted0
 )
 )
)
)
)
(define %23 (concat result r))
%23)
(define-symbolic r_vqrshrun_high_n_s32 (bitvector 64))
(define-symbolic a_vqrshrun_high_n_s32 (bitvector 128))
(define-symbolic n_vqrshrun_high_n_s32 (bitvector 32))
(verify (assert (equal? (vqrshrun_high_n_s32.check r_vqrshrun_high_n_s32 a_vqrshrun_high_n_s32 n_vqrshrun_high_n_s32 ) (vqrshrun_high_n_s32 r_vqrshrun_high_n_s32 a_vqrshrun_high_n_s32 n_vqrshrun_high_n_s32 ))))
(display "vqrshrun_high_n_s32" (current-error-port))
(define (vqrshrun_high_n_s64.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %4.downcasted0 (bvshl  (bv 1 128)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %12 (+  e0.new  63))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 128 32 ))
  %22.downcasted0
 )
 )
)
)
)
(define %23 (concat result r))
%23)
(define-symbolic r_vqrshrun_high_n_s64 (bitvector 64))
(define-symbolic a_vqrshrun_high_n_s64 (bitvector 128))
(define-symbolic n_vqrshrun_high_n_s64 (bitvector 32))
(verify (assert (equal? (vqrshrun_high_n_s64.check r_vqrshrun_high_n_s64 a_vqrshrun_high_n_s64 n_vqrshrun_high_n_s64 ) (vqrshrun_high_n_s64 r_vqrshrun_high_n_s64 a_vqrshrun_high_n_s64 n_vqrshrun_high_n_s64 ))))
(display "vqrshrun_high_n_s64" (current-error-port))
(define (vqrshrun_n_s16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  15))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 64 8 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshrun_n_s16 (bitvector 128))
(define-symbolic n_vqrshrun_n_s16 (bitvector 32))
(verify (assert (equal? (vqrshrun_n_s16.check a_vqrshrun_n_s16 n_vqrshrun_n_s16 ) (vqrshrun_n_s16 a_vqrshrun_n_s16 n_vqrshrun_n_s16 ))))
(display "vqrshrun_n_s16" (current-error-port))
(define (vqrshrun_n_s32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  31))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 64 16 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshrun_n_s32 (bitvector 128))
(define-symbolic n_vqrshrun_n_s32 (bitvector 32))
(verify (assert (equal? (vqrshrun_n_s32.check a_vqrshrun_n_s32 n_vqrshrun_n_s32 ) (vqrshrun_n_s32 a_vqrshrun_n_s32 n_vqrshrun_n_s32 ))))
(display "vqrshrun_n_s32" (current-error-port))
(define (vqrshrun_n_s64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %4.downcasted0 (bvshl  (bv 1 128)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  63))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 128 32 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshrun_n_s64 (bitvector 128))
(define-symbolic n_vqrshrun_n_s64 (bitvector 32))
(verify (assert (equal? (vqrshrun_n_s64.check a_vqrshrun_n_s64 n_vqrshrun_n_s64 ) (vqrshrun_n_s64 a_vqrshrun_n_s64 n_vqrshrun_n_s64 ))))
(display "vqrshrun_n_s64" (current-error-port))
(define (vqrshrund_n_s64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %4.downcasted0 (bvshl  (bv 1 128)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  63))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 128 32 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshrund_n_s64 (bitvector 64))
(define-symbolic n_vqrshrund_n_s64 (bitvector 32))
(verify (assert (equal? (vqrshrund_n_s64.check a_vqrshrund_n_s64 n_vqrshrund_n_s64 ) (vqrshrund_n_s64 a_vqrshrund_n_s64 n_vqrshrund_n_s64 ))))
(display "vqrshrund_n_s64" (current-error-port))
(define (vqrshrunh_n_s16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  15))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 64 8 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshrunh_n_s16 (bitvector 16))
(define-symbolic n_vqrshrunh_n_s16 (bitvector 32))
(verify (assert (equal? (vqrshrunh_n_s16.check a_vqrshrunh_n_s16 n_vqrshrunh_n_s16 ) (vqrshrunh_n_s16 a_vqrshrunh_n_s16 n_vqrshrunh_n_s16 ))))
(display "vqrshrunh_n_s16" (current-error-port))
(define (vqrshruns_n_s32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  31))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvashr  %16.downcasted0  %1.downcasted0))
  (define %22.downcasted0 (bvusat %17.downcasted0 64 16 ))
  %22.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqrshruns_n_s32 (bitvector 32))
(define-symbolic n_vqrshruns_n_s32 (bitvector 32))
(verify (assert (equal? (vqrshruns_n_s32.check a_vqrshruns_n_s32 n_vqrshruns_n_s32 ) (vqrshruns_n_s32 a_vqrshruns_n_s32 n_vqrshruns_n_s32 ))))
(display "vqrshruns_n_s32" (current-error-port))
(define (vqshl_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvssat %20.downcasted0 64 16 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshl_s16 (bitvector 64))
(define-symbolic b_vqshl_s16 (bitvector 64))
(verify (assert (equal? (vqshl_s16.check a_vqshl_s16 b_vqshl_s16 ) (vqshl_s16 a_vqshl_s16 b_vqshl_s16 ))))
(display "vqshl_s16" (current-error-port))
(define (vqshl_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvssat %20.downcasted0 64 32 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshl_s32 (bitvector 64))
(define-symbolic b_vqshl_s32 (bitvector 64))
(verify (assert (equal? (vqshl_s32.check a_vqshl_s32 b_vqshl_s32 ) (vqshl_s32 a_vqshl_s32 b_vqshl_s32 ))))
(display "vqshl_s32" (current-error-port))
(define (vqshl_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (sign-extend  %16 (bitvector 128)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvssat %20.downcasted0 128 64 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshl_s64 (bitvector 64))
(define-symbolic b_vqshl_s64 (bitvector 64))
(verify (assert (equal? (vqshl_s64.check a_vqshl_s64 b_vqshl_s64 ) (vqshl_s64 a_vqshl_s64 b_vqshl_s64 ))))
(display "vqshl_s64" (current-error-port))
(define (vqshl_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvssat %20.downcasted0 64 8 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshl_s8 (bitvector 64))
(define-symbolic b_vqshl_s8 (bitvector 64))
(verify (assert (equal? (vqshl_s8.check a_vqshl_s8 b_vqshl_s8 ) (vqshl_s8 a_vqshl_s8 b_vqshl_s8 ))))
(display "vqshl_s8" (current-error-port))
(define (vqshl_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvusat %20.downcasted0 64 16 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshl_u16 (bitvector 64))
(define-symbolic b_vqshl_u16 (bitvector 64))
(verify (assert (equal? (vqshl_u16.check a_vqshl_u16 b_vqshl_u16 ) (vqshl_u16 a_vqshl_u16 b_vqshl_u16 ))))
(display "vqshl_u16" (current-error-port))
(define (vqshl_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvusat %20.downcasted0 64 32 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshl_u32 (bitvector 64))
(define-symbolic b_vqshl_u32 (bitvector 64))
(verify (assert (equal? (vqshl_u32.check a_vqshl_u32 b_vqshl_u32 ) (vqshl_u32 a_vqshl_u32 b_vqshl_u32 ))))
(display "vqshl_u32" (current-error-port))
(define (vqshl_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (zero-extend  %16 (bitvector 128)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvusat %20.downcasted0 128 64 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshl_u64 (bitvector 64))
(define-symbolic b_vqshl_u64 (bitvector 64))
(verify (assert (equal? (vqshl_u64.check a_vqshl_u64 b_vqshl_u64 ) (vqshl_u64 a_vqshl_u64 b_vqshl_u64 ))))
(display "vqshl_u64" (current-error-port))
(define (vqshl_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvusat %20.downcasted0 64 8 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshl_u8 (bitvector 64))
(define-symbolic b_vqshl_u8 (bitvector 64))
(verify (assert (equal? (vqshl_u8.check a_vqshl_u8 b_vqshl_u8 ) (vqshl_u8 a_vqshl_u8 b_vqshl_u8 ))))
(display "vqshl_u8" (current-error-port))
(define (vqshlb_n_s8.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %6 (+  e0.new  7))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvssat %9.downcasted0 64 8 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlb_n_s8 (bitvector 8))
(define-symbolic n_vqshlb_n_s8 (bitvector 32))
(verify (assert (equal? (vqshlb_n_s8.check a_vqshlb_n_s8 n_vqshlb_n_s8 ) (vqshlb_n_s8 a_vqshlb_n_s8 n_vqshlb_n_s8 ))))
(display "vqshlb_n_s8" (current-error-port))
(define (vqshlb_n_u8.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %6 (+  e0.new  7))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvusat %9.downcasted0 64 8 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlb_n_u8 (bitvector 8))
(define-symbolic n_vqshlb_n_u8 (bitvector 32))
(verify (assert (equal? (vqshlb_n_u8.check a_vqshlb_n_u8 n_vqshlb_n_u8 ) (vqshlb_n_u8 a_vqshlb_n_u8 n_vqshlb_n_u8 ))))
(display "vqshlb_n_u8" (current-error-port))
(define (vqshlb_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvssat %20.downcasted0 64 8 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlb_s8 (bitvector 8))
(define-symbolic b_vqshlb_s8 (bitvector 8))
(verify (assert (equal? (vqshlb_s8.check a_vqshlb_s8 b_vqshlb_s8 ) (vqshlb_s8 a_vqshlb_s8 b_vqshlb_s8 ))))
(display "vqshlb_s8" (current-error-port))
(define (vqshlb_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvusat %20.downcasted0 64 8 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlb_u8 (bitvector 8))
(define-symbolic b_vqshlb_u8 (bitvector 8))
(verify (assert (equal? (vqshlb_u8.check a_vqshlb_u8 b_vqshlb_u8 ) (vqshlb_u8 a_vqshlb_u8 b_vqshlb_u8 ))))
(display "vqshlb_u8" (current-error-port))
(define (vqshld_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (sign-extend  %16 (bitvector 128)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvssat %20.downcasted0 128 64 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshld_s64 (bitvector 64))
(define-symbolic b_vqshld_s64 (bitvector 64))
(verify (assert (equal? (vqshld_s64.check a_vqshld_s64 b_vqshld_s64 ) (vqshld_s64 a_vqshld_s64 b_vqshld_s64 ))))
(display "vqshld_s64" (current-error-port))
(define (vqshld_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (zero-extend  %16 (bitvector 128)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvusat %20.downcasted0 128 64 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshld_u64 (bitvector 64))
(define-symbolic b_vqshld_u64 (bitvector 64))
(verify (assert (equal? (vqshld_u64.check a_vqshld_u64 b_vqshld_u64 ) (vqshld_u64 a_vqshld_u64 b_vqshld_u64 ))))
(display "vqshld_u64" (current-error-port))
(define (vqshlh_n_s16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvssat %9.downcasted0 64 16 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlh_n_s16 (bitvector 16))
(define-symbolic n_vqshlh_n_s16 (bitvector 32))
(verify (assert (equal? (vqshlh_n_s16.check a_vqshlh_n_s16 n_vqshlh_n_s16 ) (vqshlh_n_s16 a_vqshlh_n_s16 n_vqshlh_n_s16 ))))
(display "vqshlh_n_s16" (current-error-port))
(define (vqshlh_n_u16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvusat %9.downcasted0 64 16 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlh_n_u16 (bitvector 16))
(define-symbolic n_vqshlh_n_u16 (bitvector 32))
(verify (assert (equal? (vqshlh_n_u16.check a_vqshlh_n_u16 n_vqshlh_n_u16 ) (vqshlh_n_u16 a_vqshlh_n_u16 n_vqshlh_n_u16 ))))
(display "vqshlh_n_u16" (current-error-port))
(define (vqshlh_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvssat %20.downcasted0 64 16 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlh_s16 (bitvector 16))
(define-symbolic b_vqshlh_s16 (bitvector 16))
(verify (assert (equal? (vqshlh_s16.check a_vqshlh_s16 b_vqshlh_s16 ) (vqshlh_s16 a_vqshlh_s16 b_vqshlh_s16 ))))
(display "vqshlh_s16" (current-error-port))
(define (vqshlh_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvusat %20.downcasted0 64 16 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlh_u16 (bitvector 16))
(define-symbolic b_vqshlh_u16 (bitvector 16))
(verify (assert (equal? (vqshlh_u16.check a_vqshlh_u16 b_vqshlh_u16 ) (vqshlh_u16 a_vqshlh_u16 b_vqshlh_u16 ))))
(display "vqshlh_u16" (current-error-port))
(define (vqshlq_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvssat %20.downcasted0 64 16 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlq_s16 (bitvector 128))
(define-symbolic b_vqshlq_s16 (bitvector 128))
(verify (assert (equal? (vqshlq_s16.check a_vqshlq_s16 b_vqshlq_s16 ) (vqshlq_s16 a_vqshlq_s16 b_vqshlq_s16 ))))
(display "vqshlq_s16" (current-error-port))
(define (vqshlq_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvssat %20.downcasted0 64 32 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlq_s32 (bitvector 128))
(define-symbolic b_vqshlq_s32 (bitvector 128))
(verify (assert (equal? (vqshlq_s32.check a_vqshlq_s32 b_vqshlq_s32 ) (vqshlq_s32 a_vqshlq_s32 b_vqshlq_s32 ))))
(display "vqshlq_s32" (current-error-port))
(define (vqshlq_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (sign-extend  %16 (bitvector 128)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvssat %20.downcasted0 128 64 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlq_s64 (bitvector 128))
(define-symbolic b_vqshlq_s64 (bitvector 128))
(verify (assert (equal? (vqshlq_s64.check a_vqshlq_s64 b_vqshlq_s64 ) (vqshlq_s64 a_vqshlq_s64 b_vqshlq_s64 ))))
(display "vqshlq_s64" (current-error-port))
(define (vqshlq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvssat %20.downcasted0 64 8 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlq_s8 (bitvector 128))
(define-symbolic b_vqshlq_s8 (bitvector 128))
(verify (assert (equal? (vqshlq_s8.check a_vqshlq_s8 b_vqshlq_s8 ) (vqshlq_s8 a_vqshlq_s8 b_vqshlq_s8 ))))
(display "vqshlq_s8" (current-error-port))
(define (vqshlq_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvusat %20.downcasted0 64 16 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlq_u16 (bitvector 128))
(define-symbolic b_vqshlq_u16 (bitvector 128))
(verify (assert (equal? (vqshlq_u16.check a_vqshlq_u16 b_vqshlq_u16 ) (vqshlq_u16 a_vqshlq_u16 b_vqshlq_u16 ))))
(display "vqshlq_u16" (current-error-port))
(define (vqshlq_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvusat %20.downcasted0 64 32 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlq_u32 (bitvector 128))
(define-symbolic b_vqshlq_u32 (bitvector 128))
(verify (assert (equal? (vqshlq_u32.check a_vqshlq_u32 b_vqshlq_u32 ) (vqshlq_u32 a_vqshlq_u32 b_vqshlq_u32 ))))
(display "vqshlq_u32" (current-error-port))
(define (vqshlq_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (zero-extend  %16 (bitvector 128)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvusat %20.downcasted0 128 64 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlq_u64 (bitvector 128))
(define-symbolic b_vqshlq_u64 (bitvector 128))
(verify (assert (equal? (vqshlq_u64.check a_vqshlq_u64 b_vqshlq_u64 ) (vqshlq_u64 a_vqshlq_u64 b_vqshlq_u64 ))))
(display "vqshlq_u64" (current-error-port))
(define (vqshlq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvusat %20.downcasted0 64 8 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlq_u8 (bitvector 128))
(define-symbolic b_vqshlq_u8 (bitvector 128))
(verify (assert (equal? (vqshlq_u8.check a_vqshlq_u8 b_vqshlq_u8 ) (vqshlq_u8 a_vqshlq_u8 b_vqshlq_u8 ))))
(display "vqshlq_u8" (current-error-port))
(define (vqshls_n_s32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvssat %9.downcasted0 64 32 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshls_n_s32 (bitvector 32))
(define-symbolic n_vqshls_n_s32 (bitvector 32))
(verify (assert (equal? (vqshls_n_s32.check a_vqshls_n_s32 n_vqshls_n_s32 ) (vqshls_n_s32 a_vqshls_n_s32 n_vqshls_n_s32 ))))
(display "vqshls_n_s32" (current-error-port))
(define (vqshls_n_u32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 64)))
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvusat %9.downcasted0 64 32 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshls_n_u32 (bitvector 32))
(define-symbolic n_vqshls_n_u32 (bitvector 32))
(verify (assert (equal? (vqshls_n_u32.check a_vqshls_n_u32 n_vqshls_n_u32 ) (vqshls_n_u32 a_vqshls_n_u32 n_vqshls_n_u32 ))))
(display "vqshls_n_u32" (current-error-port))
(define (vqshls_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (sign-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvssat %20.downcasted0 64 32 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshls_s32 (bitvector 32))
(define-symbolic b_vqshls_s32 (bitvector 32))
(verify (assert (equal? (vqshls_s32.check a_vqshls_s32 b_vqshls_s32 ) (vqshls_s32 a_vqshls_s32 b_vqshls_s32 ))))
(display "vqshls_s32" (current-error-port))
(define (vqshls_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18.downcasted0 (zero-extend  %16 (bitvector 64)))
  (define %20.downcasted0 (bvshl  %18.downcasted0  %11.downcasted0))
  (define %25.downcasted0 (bvusat %20.downcasted0 64 32 ))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshls_u32 (bitvector 32))
(define-symbolic b_vqshls_u32 (bitvector 32))
(verify (assert (equal? (vqshls_u32.check a_vqshls_u32 b_vqshls_u32 ) (vqshls_u32 a_vqshls_u32 b_vqshls_u32 ))))
(display "vqshls_u32" (current-error-port))
(define (vqshlu_n_s16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvusat %9.downcasted0 64 16 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlu_n_s16 (bitvector 64))
(define-symbolic n_vqshlu_n_s16 (bitvector 32))
(verify (assert (equal? (vqshlu_n_s16.check a_vqshlu_n_s16 n_vqshlu_n_s16 ) (vqshlu_n_s16 a_vqshlu_n_s16 n_vqshlu_n_s16 ))))
(display "vqshlu_n_s16" (current-error-port))
(define (vqshlu_n_s32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvusat %9.downcasted0 64 32 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlu_n_s32 (bitvector 64))
(define-symbolic n_vqshlu_n_s32 (bitvector 32))
(verify (assert (equal? (vqshlu_n_s32.check a_vqshlu_n_s32 n_vqshlu_n_s32 ) (vqshlu_n_s32 a_vqshlu_n_s32 n_vqshlu_n_s32 ))))
(display "vqshlu_n_s32" (current-error-port))
(define (vqshlu_n_s64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 128)))
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvusat %9.downcasted0 128 64 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlu_n_s64 (bitvector 64))
(define-symbolic n_vqshlu_n_s64 (bitvector 32))
(verify (assert (equal? (vqshlu_n_s64.check a_vqshlu_n_s64 n_vqshlu_n_s64 ) (vqshlu_n_s64 a_vqshlu_n_s64 n_vqshlu_n_s64 ))))
(display "vqshlu_n_s64" (current-error-port))
(define (vqshlu_n_s8.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %6 (+  e0.new  7))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvusat %9.downcasted0 64 8 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlu_n_s8 (bitvector 64))
(define-symbolic n_vqshlu_n_s8 (bitvector 32))
(verify (assert (equal? (vqshlu_n_s8.check a_vqshlu_n_s8 n_vqshlu_n_s8 ) (vqshlu_n_s8 a_vqshlu_n_s8 n_vqshlu_n_s8 ))))
(display "vqshlu_n_s8" (current-error-port))
(define (vqshlub_n_s8.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %6 (+  e0.new  7))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvusat %9.downcasted0 64 8 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlub_n_s8 (bitvector 8))
(define-symbolic n_vqshlub_n_s8 (bitvector 32))
(verify (assert (equal? (vqshlub_n_s8.check a_vqshlub_n_s8 n_vqshlub_n_s8 ) (vqshlub_n_s8 a_vqshlub_n_s8 n_vqshlub_n_s8 ))))
(display "vqshlub_n_s8" (current-error-port))
(define (vqshlud_n_s64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 128)))
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvusat %9.downcasted0 128 64 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlud_n_s64 (bitvector 64))
(define-symbolic n_vqshlud_n_s64 (bitvector 32))
(verify (assert (equal? (vqshlud_n_s64.check a_vqshlud_n_s64 n_vqshlud_n_s64 ) (vqshlud_n_s64 a_vqshlud_n_s64 n_vqshlud_n_s64 ))))
(display "vqshlud_n_s64" (current-error-port))
(define (vqshluh_n_s16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvusat %9.downcasted0 64 16 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshluh_n_s16 (bitvector 16))
(define-symbolic n_vqshluh_n_s16 (bitvector 32))
(verify (assert (equal? (vqshluh_n_s16.check a_vqshluh_n_s16 n_vqshluh_n_s16 ) (vqshluh_n_s16 a_vqshluh_n_s16 n_vqshluh_n_s16 ))))
(display "vqshluh_n_s16" (current-error-port))
(define (vqshluq_n_s16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
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
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvusat %9.downcasted0 64 16 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshluq_n_s16 (bitvector 128))
(define-symbolic n_vqshluq_n_s16 (bitvector 32))
(verify (assert (equal? (vqshluq_n_s16.check a_vqshluq_n_s16 n_vqshluq_n_s16 ) (vqshluq_n_s16 a_vqshluq_n_s16 n_vqshluq_n_s16 ))))
(display "vqshluq_n_s16" (current-error-port))
(define (vqshluq_n_s32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
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
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvusat %9.downcasted0 64 32 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshluq_n_s32 (bitvector 128))
(define-symbolic n_vqshluq_n_s32 (bitvector 32))
(verify (assert (equal? (vqshluq_n_s32.check a_vqshluq_n_s32 n_vqshluq_n_s32 ) (vqshluq_n_s32 a_vqshluq_n_s32 n_vqshluq_n_s32 ))))
(display "vqshluq_n_s32" (current-error-port))
(define (vqshluq_n_s64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
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
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvusat %9.downcasted0 128 64 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshluq_n_s64 (bitvector 128))
(define-symbolic n_vqshluq_n_s64 (bitvector 32))
(verify (assert (equal? (vqshluq_n_s64.check a_vqshluq_n_s64 n_vqshluq_n_s64 ) (vqshluq_n_s64 a_vqshluq_n_s64 n_vqshluq_n_s64 ))))
(display "vqshluq_n_s64" (current-error-port))
(define (vqshluq_n_s8.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %6 (+  e0.new  7))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvusat %9.downcasted0 64 8 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshluq_n_s8 (bitvector 128))
(define-symbolic n_vqshluq_n_s8 (bitvector 32))
(verify (assert (equal? (vqshluq_n_s8.check a_vqshluq_n_s8 n_vqshluq_n_s8 ) (vqshluq_n_s8 a_vqshluq_n_s8 n_vqshluq_n_s8 ))))
(display "vqshluq_n_s8" (current-error-port))
(define (vqshlus_n_s32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new a))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 64)))
  (define %9.downcasted0 (bvshl  %8.downcasted0  %1.downcasted0))
  (define %14.downcasted0 (bvusat %9.downcasted0 64 32 ))
  %14.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshlus_n_s32 (bitvector 32))
(define-symbolic n_vqshlus_n_s32 (bitvector 32))
(verify (assert (equal? (vqshlus_n_s32.check a_vqshlus_n_s32 n_vqshlus_n_s32 ) (vqshlus_n_s32 a_vqshlus_n_s32 n_vqshlus_n_s32 ))))
(display "vqshlus_n_s32" (current-error-port))
(define (vqshrn_high_n_s16.check  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %10 (+  e0.new  15))
  (define %12 (extract  %10 e0.new a))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 32)))
  (define %15.downcasted0 (bvashr  %13.downcasted0  n))
  (define %20.downcasted0 (bvssat %15.downcasted0 32 8 ))
  %20.downcasted0
 )
 )
)
)
)
(define %21 (concat result r))
%21)
(define-symbolic r_vqshrn_high_n_s16 (bitvector 64))
(define-symbolic a_vqshrn_high_n_s16 (bitvector 128))
(define-symbolic n_vqshrn_high_n_s16 (bitvector 32))
(verify (assert (equal? (vqshrn_high_n_s16.check r_vqshrn_high_n_s16 a_vqshrn_high_n_s16 n_vqshrn_high_n_s16 ) (vqshrn_high_n_s16 r_vqshrn_high_n_s16 a_vqshrn_high_n_s16 n_vqshrn_high_n_s16 ))))
(display "vqshrn_high_n_s16" (current-error-port))
(define (vqshrn_high_n_s32.check  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %10 (+  e0.new  31))
  (define %12 (extract  %10 e0.new a))
  (define %15.downcasted0 (bvashr  %12  n))
  (define %20.downcasted0 (bvssat %15.downcasted0 32 16 ))
  %20.downcasted0
 )
 )
)
)
)
(define %21 (concat result r))
%21)
(define-symbolic r_vqshrn_high_n_s32 (bitvector 64))
(define-symbolic a_vqshrn_high_n_s32 (bitvector 128))
(define-symbolic n_vqshrn_high_n_s32 (bitvector 32))
(verify (assert (equal? (vqshrn_high_n_s32.check r_vqshrn_high_n_s32 a_vqshrn_high_n_s32 n_vqshrn_high_n_s32 ) (vqshrn_high_n_s32 r_vqshrn_high_n_s32 a_vqshrn_high_n_s32 n_vqshrn_high_n_s32 ))))
(display "vqshrn_high_n_s32" (current-error-port))
(define (vqshrn_high_n_s64.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %10 (+  e0.new  63))
  (define %12 (extract  %10 e0.new a))
  (define %15.downcasted0 (bvashr  %12  %1.downcasted0))
  (define %20.downcasted0 (bvssat %15.downcasted0 64 32 ))
  %20.downcasted0
 )
 )
)
)
)
(define %21 (concat result r))
%21)
(define-symbolic r_vqshrn_high_n_s64 (bitvector 64))
(define-symbolic a_vqshrn_high_n_s64 (bitvector 128))
(define-symbolic n_vqshrn_high_n_s64 (bitvector 32))
(verify (assert (equal? (vqshrn_high_n_s64.check r_vqshrn_high_n_s64 a_vqshrn_high_n_s64 n_vqshrn_high_n_s64 ) (vqshrn_high_n_s64 r_vqshrn_high_n_s64 a_vqshrn_high_n_s64 n_vqshrn_high_n_s64 ))))
(display "vqshrn_high_n_s64" (current-error-port))
(define (vqshrn_high_n_u16.check  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %10 (+  e0.new  15))
  (define %12 (extract  %10 e0.new a))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 32)))
  (define %15.downcasted0 (bvlshr  %13.downcasted0  n))
  (define %20.downcasted0 (bvusat %15.downcasted0 32 8 ))
  %20.downcasted0
 )
 )
)
)
)
(define %21 (concat result r))
%21)
(define-symbolic r_vqshrn_high_n_u16 (bitvector 64))
(define-symbolic a_vqshrn_high_n_u16 (bitvector 128))
(define-symbolic n_vqshrn_high_n_u16 (bitvector 32))
(verify (assert (equal? (vqshrn_high_n_u16.check r_vqshrn_high_n_u16 a_vqshrn_high_n_u16 n_vqshrn_high_n_u16 ) (vqshrn_high_n_u16 r_vqshrn_high_n_u16 a_vqshrn_high_n_u16 n_vqshrn_high_n_u16 ))))
(display "vqshrn_high_n_u16" (current-error-port))
(define (vqshrn_high_n_u32.check  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %10 (+  e0.new  31))
  (define %12 (extract  %10 e0.new a))
  (define %15.downcasted0 (bvlshr  %12  n))
  (define %20.downcasted0 (bvusat %15.downcasted0 32 16 ))
  %20.downcasted0
 )
 )
)
)
)
(define %21 (concat result r))
%21)
(define-symbolic r_vqshrn_high_n_u32 (bitvector 64))
(define-symbolic a_vqshrn_high_n_u32 (bitvector 128))
(define-symbolic n_vqshrn_high_n_u32 (bitvector 32))
(verify (assert (equal? (vqshrn_high_n_u32.check r_vqshrn_high_n_u32 a_vqshrn_high_n_u32 n_vqshrn_high_n_u32 ) (vqshrn_high_n_u32 r_vqshrn_high_n_u32 a_vqshrn_high_n_u32 n_vqshrn_high_n_u32 ))))
(display "vqshrn_high_n_u32" (current-error-port))
(define (vqshrn_high_n_u64.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %10 (+  e0.new  63))
  (define %12 (extract  %10 e0.new a))
  (define %15.downcasted0 (bvlshr  %12  %1.downcasted0))
  (define %20.downcasted0 (bvusat %15.downcasted0 64 32 ))
  %20.downcasted0
 )
 )
)
)
)
(define %21 (concat result r))
%21)
(define-symbolic r_vqshrn_high_n_u64 (bitvector 64))
(define-symbolic a_vqshrn_high_n_u64 (bitvector 128))
(define-symbolic n_vqshrn_high_n_u64 (bitvector 32))
(verify (assert (equal? (vqshrn_high_n_u64.check r_vqshrn_high_n_u64 a_vqshrn_high_n_u64 n_vqshrn_high_n_u64 ) (vqshrn_high_n_u64 r_vqshrn_high_n_u64 a_vqshrn_high_n_u64 n_vqshrn_high_n_u64 ))))
(display "vqshrn_high_n_u64" (current-error-port))
(define (vqshrn_n_s16.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  15))
  (define %12 (extract  %10 %5.new0 a))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 32)))
  (define %15.downcasted0 (bvashr  %13.downcasted0  n))
  (define %20.downcasted0 (bvssat %15.downcasted0 32 8 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshrn_n_s16 (bitvector 128))
(define-symbolic n_vqshrn_n_s16 (bitvector 32))
(verify (assert (equal? (vqshrn_n_s16.check a_vqshrn_n_s16 n_vqshrn_n_s16 ) (vqshrn_n_s16 a_vqshrn_n_s16 n_vqshrn_n_s16 ))))
(display "vqshrn_n_s16" (current-error-port))
(define (vqshrn_n_s32.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  31))
  (define %12 (extract  %10 %5.new0 a))
  (define %15.downcasted0 (bvashr  %12  n))
  (define %20.downcasted0 (bvssat %15.downcasted0 32 16 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshrn_n_s32 (bitvector 128))
(define-symbolic n_vqshrn_n_s32 (bitvector 32))
(verify (assert (equal? (vqshrn_n_s32.check a_vqshrn_n_s32 n_vqshrn_n_s32 ) (vqshrn_n_s32 a_vqshrn_n_s32 n_vqshrn_n_s32 ))))
(display "vqshrn_n_s32" (current-error-port))
(define (vqshrn_n_s64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  63))
  (define %12 (extract  %10 %5.new0 a))
  (define %15.downcasted0 (bvashr  %12  %1.downcasted0))
  (define %20.downcasted0 (bvssat %15.downcasted0 64 32 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshrn_n_s64 (bitvector 128))
(define-symbolic n_vqshrn_n_s64 (bitvector 32))
(verify (assert (equal? (vqshrn_n_s64.check a_vqshrn_n_s64 n_vqshrn_n_s64 ) (vqshrn_n_s64 a_vqshrn_n_s64 n_vqshrn_n_s64 ))))
(display "vqshrn_n_s64" (current-error-port))
(define (vqshrn_n_u16.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  15))
  (define %12 (extract  %10 %5.new0 a))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 32)))
  (define %15.downcasted0 (bvlshr  %13.downcasted0  n))
  (define %20.downcasted0 (bvusat %15.downcasted0 32 8 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshrn_n_u16 (bitvector 128))
(define-symbolic n_vqshrn_n_u16 (bitvector 32))
(verify (assert (equal? (vqshrn_n_u16.check a_vqshrn_n_u16 n_vqshrn_n_u16 ) (vqshrn_n_u16 a_vqshrn_n_u16 n_vqshrn_n_u16 ))))
(display "vqshrn_n_u16" (current-error-port))
(define (vqshrn_n_u32.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  31))
  (define %12 (extract  %10 %5.new0 a))
  (define %15.downcasted0 (bvlshr  %12  n))
  (define %20.downcasted0 (bvusat %15.downcasted0 32 16 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshrn_n_u32 (bitvector 128))
(define-symbolic n_vqshrn_n_u32 (bitvector 32))
(verify (assert (equal? (vqshrn_n_u32.check a_vqshrn_n_u32 n_vqshrn_n_u32 ) (vqshrn_n_u32 a_vqshrn_n_u32 n_vqshrn_n_u32 ))))
(display "vqshrn_n_u32" (current-error-port))
(define (vqshrn_n_u64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  63))
  (define %12 (extract  %10 %5.new0 a))
  (define %15.downcasted0 (bvlshr  %12  %1.downcasted0))
  (define %20.downcasted0 (bvusat %15.downcasted0 64 32 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshrn_n_u64 (bitvector 128))
(define-symbolic n_vqshrn_n_u64 (bitvector 32))
(verify (assert (equal? (vqshrn_n_u64.check a_vqshrn_n_u64 n_vqshrn_n_u64 ) (vqshrn_n_u64 a_vqshrn_n_u64 n_vqshrn_n_u64 ))))
(display "vqshrn_n_u64" (current-error-port))
(define (vqshrnd_n_s64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  63))
  (define %12 (extract  %10 %5.new0 a))
  (define %15.downcasted0 (bvashr  %12  %1.downcasted0))
  (define %20.downcasted0 (bvssat %15.downcasted0 64 32 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshrnd_n_s64 (bitvector 64))
(define-symbolic n_vqshrnd_n_s64 (bitvector 32))
(verify (assert (equal? (vqshrnd_n_s64.check a_vqshrnd_n_s64 n_vqshrnd_n_s64 ) (vqshrnd_n_s64 a_vqshrnd_n_s64 n_vqshrnd_n_s64 ))))
(display "vqshrnd_n_s64" (current-error-port))
(define (vqshrnd_n_u64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  63))
  (define %12 (extract  %10 %5.new0 a))
  (define %15.downcasted0 (bvlshr  %12  %1.downcasted0))
  (define %20.downcasted0 (bvusat %15.downcasted0 64 32 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshrnd_n_u64 (bitvector 64))
(define-symbolic n_vqshrnd_n_u64 (bitvector 32))
(verify (assert (equal? (vqshrnd_n_u64.check a_vqshrnd_n_u64 n_vqshrnd_n_u64 ) (vqshrnd_n_u64 a_vqshrnd_n_u64 n_vqshrnd_n_u64 ))))
(display "vqshrnd_n_u64" (current-error-port))
(define (vqshrnh_n_s16.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  15))
  (define %12 (extract  %10 %5.new0 a))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 32)))
  (define %15.downcasted0 (bvashr  %13.downcasted0  n))
  (define %20.downcasted0 (bvssat %15.downcasted0 32 8 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshrnh_n_s16 (bitvector 16))
(define-symbolic n_vqshrnh_n_s16 (bitvector 32))
(verify (assert (equal? (vqshrnh_n_s16.check a_vqshrnh_n_s16 n_vqshrnh_n_s16 ) (vqshrnh_n_s16 a_vqshrnh_n_s16 n_vqshrnh_n_s16 ))))
(display "vqshrnh_n_s16" (current-error-port))
(define (vqshrnh_n_u16.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  15))
  (define %12 (extract  %10 %5.new0 a))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 32)))
  (define %15.downcasted0 (bvlshr  %13.downcasted0  n))
  (define %20.downcasted0 (bvusat %15.downcasted0 32 8 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshrnh_n_u16 (bitvector 16))
(define-symbolic n_vqshrnh_n_u16 (bitvector 32))
(verify (assert (equal? (vqshrnh_n_u16.check a_vqshrnh_n_u16 n_vqshrnh_n_u16 ) (vqshrnh_n_u16 a_vqshrnh_n_u16 n_vqshrnh_n_u16 ))))
(display "vqshrnh_n_u16" (current-error-port))
(define (vqshrns_n_s32.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  31))
  (define %12 (extract  %10 %5.new0 a))
  (define %15.downcasted0 (bvashr  %12  n))
  (define %20.downcasted0 (bvssat %15.downcasted0 32 16 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshrns_n_s32 (bitvector 32))
(define-symbolic n_vqshrns_n_s32 (bitvector 32))
(verify (assert (equal? (vqshrns_n_s32.check a_vqshrns_n_s32 n_vqshrns_n_s32 ) (vqshrns_n_s32 a_vqshrns_n_s32 n_vqshrns_n_s32 ))))
(display "vqshrns_n_s32" (current-error-port))
(define (vqshrns_n_u32.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  31))
  (define %12 (extract  %10 %5.new0 a))
  (define %15.downcasted0 (bvlshr  %12  n))
  (define %20.downcasted0 (bvusat %15.downcasted0 32 16 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshrns_n_u32 (bitvector 32))
(define-symbolic n_vqshrns_n_u32 (bitvector 32))
(verify (assert (equal? (vqshrns_n_u32.check a_vqshrns_n_u32 n_vqshrns_n_u32 ) (vqshrns_n_u32 a_vqshrns_n_u32 n_vqshrns_n_u32 ))))
(display "vqshrns_n_u32" (current-error-port))
(define (vqshrun_high_n_s16.check  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %10 (+  e0.new  15))
  (define %12 (extract  %10 e0.new a))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 32)))
  (define %15.downcasted0 (bvashr  %13.downcasted0  n))
  (define %20.downcasted0 (bvusat %15.downcasted0 32 8 ))
  %20.downcasted0
 )
 )
)
)
)
(define %21 (concat result r))
%21)
(define-symbolic r_vqshrun_high_n_s16 (bitvector 64))
(define-symbolic a_vqshrun_high_n_s16 (bitvector 128))
(define-symbolic n_vqshrun_high_n_s16 (bitvector 32))
(verify (assert (equal? (vqshrun_high_n_s16.check r_vqshrun_high_n_s16 a_vqshrun_high_n_s16 n_vqshrun_high_n_s16 ) (vqshrun_high_n_s16 r_vqshrun_high_n_s16 a_vqshrun_high_n_s16 n_vqshrun_high_n_s16 ))))
(display "vqshrun_high_n_s16" (current-error-port))
(define (vqshrun_high_n_s32.check  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %10 (+  e0.new  31))
  (define %12 (extract  %10 e0.new a))
  (define %15.downcasted0 (bvashr  %12  n))
  (define %20.downcasted0 (bvusat %15.downcasted0 32 16 ))
  %20.downcasted0
 )
 )
)
)
)
(define %21 (concat result r))
%21)
(define-symbolic r_vqshrun_high_n_s32 (bitvector 64))
(define-symbolic a_vqshrun_high_n_s32 (bitvector 128))
(define-symbolic n_vqshrun_high_n_s32 (bitvector 32))
(verify (assert (equal? (vqshrun_high_n_s32.check r_vqshrun_high_n_s32 a_vqshrun_high_n_s32 n_vqshrun_high_n_s32 ) (vqshrun_high_n_s32 r_vqshrun_high_n_s32 a_vqshrun_high_n_s32 n_vqshrun_high_n_s32 ))))
(display "vqshrun_high_n_s32" (current-error-port))
(define (vqshrun_high_n_s64.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %10 (+  e0.new  63))
  (define %12 (extract  %10 e0.new a))
  (define %15.downcasted0 (bvashr  %12  %1.downcasted0))
  (define %20.downcasted0 (bvusat %15.downcasted0 64 32 ))
  %20.downcasted0
 )
 )
)
)
)
(define %21 (concat result r))
%21)
(define-symbolic r_vqshrun_high_n_s64 (bitvector 64))
(define-symbolic a_vqshrun_high_n_s64 (bitvector 128))
(define-symbolic n_vqshrun_high_n_s64 (bitvector 32))
(verify (assert (equal? (vqshrun_high_n_s64.check r_vqshrun_high_n_s64 a_vqshrun_high_n_s64 n_vqshrun_high_n_s64 ) (vqshrun_high_n_s64 r_vqshrun_high_n_s64 a_vqshrun_high_n_s64 n_vqshrun_high_n_s64 ))))
(display "vqshrun_high_n_s64" (current-error-port))
(define (vqshrun_n_s16.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  15))
  (define %12 (extract  %10 %5.new0 a))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 32)))
  (define %15.downcasted0 (bvashr  %13.downcasted0  n))
  (define %20.downcasted0 (bvusat %15.downcasted0 32 8 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshrun_n_s16 (bitvector 128))
(define-symbolic n_vqshrun_n_s16 (bitvector 32))
(verify (assert (equal? (vqshrun_n_s16.check a_vqshrun_n_s16 n_vqshrun_n_s16 ) (vqshrun_n_s16 a_vqshrun_n_s16 n_vqshrun_n_s16 ))))
(display "vqshrun_n_s16" (current-error-port))
(define (vqshrun_n_s32.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  31))
  (define %12 (extract  %10 %5.new0 a))
  (define %15.downcasted0 (bvashr  %12  n))
  (define %20.downcasted0 (bvusat %15.downcasted0 32 16 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshrun_n_s32 (bitvector 128))
(define-symbolic n_vqshrun_n_s32 (bitvector 32))
(verify (assert (equal? (vqshrun_n_s32.check a_vqshrun_n_s32 n_vqshrun_n_s32 ) (vqshrun_n_s32 a_vqshrun_n_s32 n_vqshrun_n_s32 ))))
(display "vqshrun_n_s32" (current-error-port))
(define (vqshrun_n_s64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  63))
  (define %12 (extract  %10 %5.new0 a))
  (define %15.downcasted0 (bvashr  %12  %1.downcasted0))
  (define %20.downcasted0 (bvusat %15.downcasted0 64 32 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshrun_n_s64 (bitvector 128))
(define-symbolic n_vqshrun_n_s64 (bitvector 32))
(verify (assert (equal? (vqshrun_n_s64.check a_vqshrun_n_s64 n_vqshrun_n_s64 ) (vqshrun_n_s64 a_vqshrun_n_s64 n_vqshrun_n_s64 ))))
(display "vqshrun_n_s64" (current-error-port))
(define (vqshrund_n_s64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  63))
  (define %12 (extract  %10 %5.new0 a))
  (define %15.downcasted0 (bvashr  %12  %1.downcasted0))
  (define %20.downcasted0 (bvusat %15.downcasted0 64 32 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshrund_n_s64 (bitvector 64))
(define-symbolic n_vqshrund_n_s64 (bitvector 32))
(verify (assert (equal? (vqshrund_n_s64.check a_vqshrund_n_s64 n_vqshrund_n_s64 ) (vqshrund_n_s64 a_vqshrund_n_s64 n_vqshrund_n_s64 ))))
(display "vqshrund_n_s64" (current-error-port))
(define (vqshrunh_n_s16.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  15))
  (define %12 (extract  %10 %5.new0 a))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 32)))
  (define %15.downcasted0 (bvashr  %13.downcasted0  n))
  (define %20.downcasted0 (bvusat %15.downcasted0 32 8 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshrunh_n_s16 (bitvector 16))
(define-symbolic n_vqshrunh_n_s16 (bitvector 32))
(verify (assert (equal? (vqshrunh_n_s16.check a_vqshrunh_n_s16 n_vqshrunh_n_s16 ) (vqshrunh_n_s16 a_vqshrunh_n_s16 n_vqshrunh_n_s16 ))))
(display "vqshrunh_n_s16" (current-error-port))
(define (vqshruns_n_s32.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  31))
  (define %12 (extract  %10 %5.new0 a))
  (define %15.downcasted0 (bvashr  %12  n))
  (define %20.downcasted0 (bvusat %15.downcasted0 32 16 ))
  %20.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqshruns_n_s32 (bitvector 32))
(define-symbolic n_vqshruns_n_s32 (bitvector 32))
(verify (assert (equal? (vqshruns_n_s32.check a_vqshruns_n_s32 n_vqshruns_n_s32 ) (vqshruns_n_s32 a_vqshruns_n_s32 n_vqshruns_n_s32 ))))
(display "vqshruns_n_s32" (current-error-port))
(define (vqsub_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnsw  %5  %11 16))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsub_s16 (bitvector 64))
(define-symbolic b_vqsub_s16 (bitvector 64))
(verify (assert (equal? (vqsub_s16.check a_vqsub_s16 b_vqsub_s16 ) (vqsub_s16 a_vqsub_s16 b_vqsub_s16 ))))
(display "vqsub_s16" (current-error-port))
(define (vqsub_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnsw  %5  %11 32))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsub_s32 (bitvector 64))
(define-symbolic b_vqsub_s32 (bitvector 64))
(verify (assert (equal? (vqsub_s32.check a_vqsub_s32 b_vqsub_s32 ) (vqsub_s32 a_vqsub_s32 b_vqsub_s32 ))))
(display "vqsub_s32" (current-error-port))
(define (vqsub_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnsw  %5  %11 64))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsub_s64 (bitvector 64))
(define-symbolic b_vqsub_s64 (bitvector 64))
(verify (assert (equal? (vqsub_s64.check a_vqsub_s64 b_vqsub_s64 ) (vqsub_s64 a_vqsub_s64 b_vqsub_s64 ))))
(display "vqsub_s64" (current-error-port))
(define (vqsub_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnsw  %5  %11 8))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsub_s8 (bitvector 64))
(define-symbolic b_vqsub_s8 (bitvector 64))
(verify (assert (equal? (vqsub_s8.check a_vqsub_s8 b_vqsub_s8 ) (vqsub_s8 a_vqsub_s8 b_vqsub_s8 ))))
(display "vqsub_s8" (current-error-port))
(define (vqsub_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnuw  %5  %11 16))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsub_u16 (bitvector 64))
(define-symbolic b_vqsub_u16 (bitvector 64))
(verify (assert (equal? (vqsub_u16.check a_vqsub_u16 b_vqsub_u16 ) (vqsub_u16 a_vqsub_u16 b_vqsub_u16 ))))
(display "vqsub_u16" (current-error-port))
(define (vqsub_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnuw  %5  %11 32))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsub_u32 (bitvector 64))
(define-symbolic b_vqsub_u32 (bitvector 64))
(verify (assert (equal? (vqsub_u32.check a_vqsub_u32 b_vqsub_u32 ) (vqsub_u32 a_vqsub_u32 b_vqsub_u32 ))))
(display "vqsub_u32" (current-error-port))
(define (vqsub_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnuw  %5  %11 64))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsub_u64 (bitvector 64))
(define-symbolic b_vqsub_u64 (bitvector 64))
(verify (assert (equal? (vqsub_u64.check a_vqsub_u64 b_vqsub_u64 ) (vqsub_u64 a_vqsub_u64 b_vqsub_u64 ))))
(display "vqsub_u64" (current-error-port))
(define (vqsub_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnuw  %5  %11 8))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsub_u8 (bitvector 64))
(define-symbolic b_vqsub_u8 (bitvector 64))
(verify (assert (equal? (vqsub_u8.check a_vqsub_u8 b_vqsub_u8 ) (vqsub_u8 a_vqsub_u8 b_vqsub_u8 ))))
(display "vqsub_u8" (current-error-port))
(define (vqsubb_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnsw  %5  %11 8))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsubb_s8 (bitvector 8))
(define-symbolic b_vqsubb_s8 (bitvector 8))
(verify (assert (equal? (vqsubb_s8.check a_vqsubb_s8 b_vqsubb_s8 ) (vqsubb_s8 a_vqsubb_s8 b_vqsubb_s8 ))))
(display "vqsubb_s8" (current-error-port))
(define (vqsubb_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnuw  %5  %11 8))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsubb_u8 (bitvector 8))
(define-symbolic b_vqsubb_u8 (bitvector 8))
(verify (assert (equal? (vqsubb_u8.check a_vqsubb_u8 b_vqsubb_u8 ) (vqsubb_u8 a_vqsubb_u8 b_vqsubb_u8 ))))
(display "vqsubb_u8" (current-error-port))
(define (vqsubd_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnsw  %5  %11 64))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsubd_s64 (bitvector 64))
(define-symbolic b_vqsubd_s64 (bitvector 64))
(verify (assert (equal? (vqsubd_s64.check a_vqsubd_s64 b_vqsubd_s64 ) (vqsubd_s64 a_vqsubd_s64 b_vqsubd_s64 ))))
(display "vqsubd_s64" (current-error-port))
(define (vqsubd_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnuw  %5  %11 64))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsubd_u64 (bitvector 64))
(define-symbolic b_vqsubd_u64 (bitvector 64))
(verify (assert (equal? (vqsubd_u64.check a_vqsubd_u64 b_vqsubd_u64 ) (vqsubd_u64 a_vqsubd_u64 b_vqsubd_u64 ))))
(display "vqsubd_u64" (current-error-port))
(define (vqsubh_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnsw  %5  %11 16))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsubh_s16 (bitvector 16))
(define-symbolic b_vqsubh_s16 (bitvector 16))
(verify (assert (equal? (vqsubh_s16.check a_vqsubh_s16 b_vqsubh_s16 ) (vqsubh_s16 a_vqsubh_s16 b_vqsubh_s16 ))))
(display "vqsubh_s16" (current-error-port))
(define (vqsubh_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnuw  %5  %11 16))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsubh_u16 (bitvector 16))
(define-symbolic b_vqsubh_u16 (bitvector 16))
(verify (assert (equal? (vqsubh_u16.check a_vqsubh_u16 b_vqsubh_u16 ) (vqsubh_u16 a_vqsubh_u16 b_vqsubh_u16 ))))
(display "vqsubh_u16" (current-error-port))
(define (vqsubq_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnsw  %5  %11 16))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsubq_s16 (bitvector 128))
(define-symbolic b_vqsubq_s16 (bitvector 128))
(verify (assert (equal? (vqsubq_s16.check a_vqsubq_s16 b_vqsubq_s16 ) (vqsubq_s16 a_vqsubq_s16 b_vqsubq_s16 ))))
(display "vqsubq_s16" (current-error-port))
(define (vqsubq_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnsw  %5  %11 32))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsubq_s32 (bitvector 128))
(define-symbolic b_vqsubq_s32 (bitvector 128))
(verify (assert (equal? (vqsubq_s32.check a_vqsubq_s32 b_vqsubq_s32 ) (vqsubq_s32 a_vqsubq_s32 b_vqsubq_s32 ))))
(display "vqsubq_s32" (current-error-port))
(define (vqsubq_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnsw  %5  %11 64))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsubq_s64 (bitvector 128))
(define-symbolic b_vqsubq_s64 (bitvector 128))
(verify (assert (equal? (vqsubq_s64.check a_vqsubq_s64 b_vqsubq_s64 ) (vqsubq_s64 a_vqsubq_s64 b_vqsubq_s64 ))))
(display "vqsubq_s64" (current-error-port))
(define (vqsubq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnsw  %5  %11 8))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsubq_s8 (bitvector 128))
(define-symbolic b_vqsubq_s8 (bitvector 128))
(verify (assert (equal? (vqsubq_s8.check a_vqsubq_s8 b_vqsubq_s8 ) (vqsubq_s8 a_vqsubq_s8 b_vqsubq_s8 ))))
(display "vqsubq_s8" (current-error-port))
(define (vqsubq_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnuw  %5  %11 16))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsubq_u16 (bitvector 128))
(define-symbolic b_vqsubq_u16 (bitvector 128))
(verify (assert (equal? (vqsubq_u16.check a_vqsubq_u16 b_vqsubq_u16 ) (vqsubq_u16 a_vqsubq_u16 b_vqsubq_u16 ))))
(display "vqsubq_u16" (current-error-port))
(define (vqsubq_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnuw  %5  %11 32))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsubq_u32 (bitvector 128))
(define-symbolic b_vqsubq_u32 (bitvector 128))
(verify (assert (equal? (vqsubq_u32.check a_vqsubq_u32 b_vqsubq_u32 ) (vqsubq_u32 a_vqsubq_u32 b_vqsubq_u32 ))))
(display "vqsubq_u32" (current-error-port))
(define (vqsubq_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnuw  %5  %11 64))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsubq_u64 (bitvector 128))
(define-symbolic b_vqsubq_u64 (bitvector 128))
(verify (assert (equal? (vqsubq_u64.check a_vqsubq_u64 b_vqsubq_u64 ) (vqsubq_u64 a_vqsubq_u64 b_vqsubq_u64 ))))
(display "vqsubq_u64" (current-error-port))
(define (vqsubq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnuw  %5  %11 8))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsubq_u8 (bitvector 128))
(define-symbolic b_vqsubq_u8 (bitvector 128))
(verify (assert (equal? (vqsubq_u8.check a_vqsubq_u8 b_vqsubq_u8 ) (vqsubq_u8 a_vqsubq_u8 b_vqsubq_u8 ))))
(display "vqsubq_u8" (current-error-port))
(define (vqsubs_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnsw  %5  %11 32))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsubs_s32 (bitvector 32))
(define-symbolic b_vqsubs_s32 (bitvector 32))
(verify (assert (equal? (vqsubs_s32.check a_vqsubs_s32 b_vqsubs_s32 ) (vqsubs_s32 a_vqsubs_s32 b_vqsubs_s32 ))))
(display "vqsubs_s32" (current-error-port))
(define (vqsubs_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %11 (extract  %4 e0.new b))
  (define %13.downcasted0 (bvsubnuw  %5  %11 32))
  %13.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vqsubs_u32 (bitvector 32))
(define-symbolic b_vqsubs_u32 (bitvector 32))
(verify (assert (equal? (vqsubs_u32.check a_vqsubs_u32 b_vqsubs_u32 ) (vqsubs_u32 a_vqsubs_u32 b_vqsubs_u32 ))))
(display "vqsubs_u32" (current-error-port))
(define (vraddhn_high_s16.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %14 (+  e0.new  15))
  (define %16 (extract  %14 e0.new a))
  (define %25 (extract  %14 e0.new b))
  (define %26 (bvadd  %16  %25))
  (define %27 (bvadd  %26  (bv 128 16)))
  (define %34 (extract  15 8 %27))
  %34
 )
 )
)
)
)
(define %35 (concat result r))
%35)
(define-symbolic r_vraddhn_high_s16 (bitvector 64))
(define-symbolic a_vraddhn_high_s16 (bitvector 128))
(define-symbolic b_vraddhn_high_s16 (bitvector 128))
(verify (assert (equal? (vraddhn_high_s16.check r_vraddhn_high_s16 a_vraddhn_high_s16 b_vraddhn_high_s16 ) (vraddhn_high_s16 r_vraddhn_high_s16 a_vraddhn_high_s16 b_vraddhn_high_s16 ))))
(display "vraddhn_high_s16" (current-error-port))
(define (vraddhn_high_s32.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %14 (+  e0.new  31))
  (define %16 (extract  %14 e0.new a))
  (define %25 (extract  %14 e0.new b))
  (define %26 (bvadd  %16  %25))
  (define %27 (bvadd  %26  (bv 32768 32)))
  (define %34 (extract  31 16 %27))
  %34
 )
 )
)
)
)
(define %35 (concat result r))
%35)
(define-symbolic r_vraddhn_high_s32 (bitvector 64))
(define-symbolic a_vraddhn_high_s32 (bitvector 128))
(define-symbolic b_vraddhn_high_s32 (bitvector 128))
(verify (assert (equal? (vraddhn_high_s32.check r_vraddhn_high_s32 a_vraddhn_high_s32 b_vraddhn_high_s32 ) (vraddhn_high_s32 r_vraddhn_high_s32 a_vraddhn_high_s32 b_vraddhn_high_s32 ))))
(display "vraddhn_high_s32" (current-error-port))
(define (vraddhn_high_s64.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %14 (+  e0.new  63))
  (define %16 (extract  %14 e0.new a))
  (define %25 (extract  %14 e0.new b))
  (define %26 (bvadd  %16  %25))
  (define %27 (bvadd  %26  (bv 2147483648 64)))
  (define %34 (extract  63 32 %27))
  %34
 )
 )
)
)
)
(define %35 (concat result r))
%35)
(define-symbolic r_vraddhn_high_s64 (bitvector 64))
(define-symbolic a_vraddhn_high_s64 (bitvector 128))
(define-symbolic b_vraddhn_high_s64 (bitvector 128))
(verify (assert (equal? (vraddhn_high_s64.check r_vraddhn_high_s64 a_vraddhn_high_s64 b_vraddhn_high_s64 ) (vraddhn_high_s64 r_vraddhn_high_s64 a_vraddhn_high_s64 b_vraddhn_high_s64 ))))
(display "vraddhn_high_s64" (current-error-port))
(define (vraddhn_high_u16.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %14 (+  e0.new  15))
  (define %16 (extract  %14 e0.new a))
  (define %25 (extract  %14 e0.new b))
  (define %26 (bvadd  %16  %25))
  (define %27 (bvadd  %26  (bv 128 16)))
  (define %34 (extract  15 8 %27))
  %34
 )
 )
)
)
)
(define %35 (concat result r))
%35)
(define-symbolic r_vraddhn_high_u16 (bitvector 64))
(define-symbolic a_vraddhn_high_u16 (bitvector 128))
(define-symbolic b_vraddhn_high_u16 (bitvector 128))
(verify (assert (equal? (vraddhn_high_u16.check r_vraddhn_high_u16 a_vraddhn_high_u16 b_vraddhn_high_u16 ) (vraddhn_high_u16 r_vraddhn_high_u16 a_vraddhn_high_u16 b_vraddhn_high_u16 ))))
(display "vraddhn_high_u16" (current-error-port))
(define (vraddhn_high_u32.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %14 (+  e0.new  31))
  (define %16 (extract  %14 e0.new a))
  (define %25 (extract  %14 e0.new b))
  (define %26 (bvadd  %16  %25))
  (define %27 (bvadd  %26  (bv 32768 32)))
  (define %34 (extract  31 16 %27))
  %34
 )
 )
)
)
)
(define %35 (concat result r))
%35)
(define-symbolic r_vraddhn_high_u32 (bitvector 64))
(define-symbolic a_vraddhn_high_u32 (bitvector 128))
(define-symbolic b_vraddhn_high_u32 (bitvector 128))
(verify (assert (equal? (vraddhn_high_u32.check r_vraddhn_high_u32 a_vraddhn_high_u32 b_vraddhn_high_u32 ) (vraddhn_high_u32 r_vraddhn_high_u32 a_vraddhn_high_u32 b_vraddhn_high_u32 ))))
(display "vraddhn_high_u32" (current-error-port))
(define (vraddhn_high_u64.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %14 (+  e0.new  63))
  (define %16 (extract  %14 e0.new a))
  (define %25 (extract  %14 e0.new b))
  (define %26 (bvadd  %16  %25))
  (define %27 (bvadd  %26  (bv 2147483648 64)))
  (define %34 (extract  63 32 %27))
  %34
 )
 )
)
)
)
(define %35 (concat result r))
%35)
(define-symbolic r_vraddhn_high_u64 (bitvector 64))
(define-symbolic a_vraddhn_high_u64 (bitvector 128))
(define-symbolic b_vraddhn_high_u64 (bitvector 128))
(verify (assert (equal? (vraddhn_high_u64.check r_vraddhn_high_u64 a_vraddhn_high_u64 b_vraddhn_high_u64 ) (vraddhn_high_u64 r_vraddhn_high_u64 a_vraddhn_high_u64 b_vraddhn_high_u64 ))))
(display "vraddhn_high_u64" (current-error-port))
(define (vraddhn_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  15))
  (define %16 (extract  %14 %9.new0 a))
  (define %25 (extract  %14 %9.new0 b))
  (define %26 (bvadd  %16  %25))
  (define %27 (bvadd  %26  (bv 128 16)))
  (define %34 (extract  15 8 %27))
  %34
 )
 )
)
)
)
result)
(define-symbolic a_vraddhn_s16 (bitvector 128))
(define-symbolic b_vraddhn_s16 (bitvector 128))
(verify (assert (equal? (vraddhn_s16.check a_vraddhn_s16 b_vraddhn_s16 ) (vraddhn_s16 a_vraddhn_s16 b_vraddhn_s16 ))))
(display "vraddhn_s16" (current-error-port))
(define (vraddhn_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  31))
  (define %16 (extract  %14 %9.new0 a))
  (define %25 (extract  %14 %9.new0 b))
  (define %26 (bvadd  %16  %25))
  (define %27 (bvadd  %26  (bv 32768 32)))
  (define %34 (extract  31 16 %27))
  %34
 )
 )
)
)
)
result)
(define-symbolic a_vraddhn_s32 (bitvector 128))
(define-symbolic b_vraddhn_s32 (bitvector 128))
(verify (assert (equal? (vraddhn_s32.check a_vraddhn_s32 b_vraddhn_s32 ) (vraddhn_s32 a_vraddhn_s32 b_vraddhn_s32 ))))
(display "vraddhn_s32" (current-error-port))
(define (vraddhn_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  63))
  (define %16 (extract  %14 %9.new0 a))
  (define %25 (extract  %14 %9.new0 b))
  (define %26 (bvadd  %16  %25))
  (define %27 (bvadd  %26  (bv 2147483648 64)))
  (define %34 (extract  63 32 %27))
  %34
 )
 )
)
)
)
result)
(define-symbolic a_vraddhn_s64 (bitvector 128))
(define-symbolic b_vraddhn_s64 (bitvector 128))
(verify (assert (equal? (vraddhn_s64.check a_vraddhn_s64 b_vraddhn_s64 ) (vraddhn_s64 a_vraddhn_s64 b_vraddhn_s64 ))))
(display "vraddhn_s64" (current-error-port))
(define (vraddhn_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  15))
  (define %16 (extract  %14 %9.new0 a))
  (define %25 (extract  %14 %9.new0 b))
  (define %26 (bvadd  %16  %25))
  (define %27 (bvadd  %26  (bv 128 16)))
  (define %34 (extract  15 8 %27))
  %34
 )
 )
)
)
)
result)
(define-symbolic a_vraddhn_u16 (bitvector 128))
(define-symbolic b_vraddhn_u16 (bitvector 128))
(verify (assert (equal? (vraddhn_u16.check a_vraddhn_u16 b_vraddhn_u16 ) (vraddhn_u16 a_vraddhn_u16 b_vraddhn_u16 ))))
(display "vraddhn_u16" (current-error-port))
(define (vraddhn_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  31))
  (define %16 (extract  %14 %9.new0 a))
  (define %25 (extract  %14 %9.new0 b))
  (define %26 (bvadd  %16  %25))
  (define %27 (bvadd  %26  (bv 32768 32)))
  (define %34 (extract  31 16 %27))
  %34
 )
 )
)
)
)
result)
(define-symbolic a_vraddhn_u32 (bitvector 128))
(define-symbolic b_vraddhn_u32 (bitvector 128))
(verify (assert (equal? (vraddhn_u32.check a_vraddhn_u32 b_vraddhn_u32 ) (vraddhn_u32 a_vraddhn_u32 b_vraddhn_u32 ))))
(display "vraddhn_u32" (current-error-port))
(define (vraddhn_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  63))
  (define %16 (extract  %14 %9.new0 a))
  (define %25 (extract  %14 %9.new0 b))
  (define %26 (bvadd  %16  %25))
  (define %27 (bvadd  %26  (bv 2147483648 64)))
  (define %34 (extract  63 32 %27))
  %34
 )
 )
)
)
)
result)
(define-symbolic a_vraddhn_u64 (bitvector 128))
(define-symbolic b_vraddhn_u64 (bitvector 128))
(verify (assert (equal? (vraddhn_u64.check a_vraddhn_u64 b_vraddhn_u64 ) (vraddhn_u64 a_vraddhn_u64 b_vraddhn_u64 ))))
(display "vraddhn_u64" (current-error-port))
(define (vrhadd_s16.check  a b )
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
  (define %17.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (bvadd  %17.downcasted0  (bv 1 32)))
  (define %19.downcasted0 (extract  16 1 %18.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrhadd_s16 (bitvector 64))
(define-symbolic b_vrhadd_s16 (bitvector 64))
(verify (assert (equal? (vrhadd_s16.check a_vrhadd_s16 b_vrhadd_s16 ) (vrhadd_s16 a_vrhadd_s16 b_vrhadd_s16 ))))
(display "vrhadd_s16" (current-error-port))
(define (vrhadd_s32.check  a b )
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
  (define %17.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (bvadd  %17.downcasted0  (bv 1 64)))
  (define %19.downcasted0 (extract  32 1 %18.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrhadd_s32 (bitvector 64))
(define-symbolic b_vrhadd_s32 (bitvector 64))
(verify (assert (equal? (vrhadd_s32.check a_vrhadd_s32 b_vrhadd_s32 ) (vrhadd_s32 a_vrhadd_s32 b_vrhadd_s32 ))))
(display "vrhadd_s32" (current-error-port))
(define (vrhadd_s8.check  a b )
(define result
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
  (define %17.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (bvadd  %17.downcasted0  (bv 1 16)))
  (define %19.downcasted0 (extract  8 1 %18.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrhadd_s8 (bitvector 64))
(define-symbolic b_vrhadd_s8 (bitvector 64))
(verify (assert (equal? (vrhadd_s8.check a_vrhadd_s8 b_vrhadd_s8 ) (vrhadd_s8 a_vrhadd_s8 b_vrhadd_s8 ))))
(display "vrhadd_s8" (current-error-port))
(define (vrhadd_u16.check  a b )
(define result
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
  (define %17.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (bvadd  %17.downcasted0  (bv 1 32)))
  (define %19.downcasted0 (extract  16 1 %18.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrhadd_u16 (bitvector 64))
(define-symbolic b_vrhadd_u16 (bitvector 64))
(verify (assert (equal? (vrhadd_u16.check a_vrhadd_u16 b_vrhadd_u16 ) (vrhadd_u16 a_vrhadd_u16 b_vrhadd_u16 ))))
(display "vrhadd_u16" (current-error-port))
(define (vrhadd_u32.check  a b )
(define result
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
  (define %17.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (bvadd  %17.downcasted0  (bv 1 64)))
  (define %19.downcasted0 (extract  32 1 %18.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrhadd_u32 (bitvector 64))
(define-symbolic b_vrhadd_u32 (bitvector 64))
(verify (assert (equal? (vrhadd_u32.check a_vrhadd_u32 b_vrhadd_u32 ) (vrhadd_u32 a_vrhadd_u32 b_vrhadd_u32 ))))
(display "vrhadd_u32" (current-error-port))
(define (vrhadd_u8.check  a b )
(define result
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
  (define %17.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (bvadd  %17.downcasted0  (bv 1 16)))
  (define %19.downcasted0 (extract  8 1 %18.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrhadd_u8 (bitvector 64))
(define-symbolic b_vrhadd_u8 (bitvector 64))
(verify (assert (equal? (vrhadd_u8.check a_vrhadd_u8 b_vrhadd_u8 ) (vrhadd_u8 a_vrhadd_u8 b_vrhadd_u8 ))))
(display "vrhadd_u8" (current-error-port))
(define (vrhaddq_s16.check  a b )
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
  (define %17.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (bvadd  %17.downcasted0  (bv 1 32)))
  (define %19.downcasted0 (extract  16 1 %18.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrhaddq_s16 (bitvector 128))
(define-symbolic b_vrhaddq_s16 (bitvector 128))
(verify (assert (equal? (vrhaddq_s16.check a_vrhaddq_s16 b_vrhaddq_s16 ) (vrhaddq_s16 a_vrhaddq_s16 b_vrhaddq_s16 ))))
(display "vrhaddq_s16" (current-error-port))
(define (vrhaddq_s32.check  a b )
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
  (define %17.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (bvadd  %17.downcasted0  (bv 1 64)))
  (define %19.downcasted0 (extract  32 1 %18.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrhaddq_s32 (bitvector 128))
(define-symbolic b_vrhaddq_s32 (bitvector 128))
(verify (assert (equal? (vrhaddq_s32.check a_vrhaddq_s32 b_vrhaddq_s32 ) (vrhaddq_s32 a_vrhaddq_s32 b_vrhaddq_s32 ))))
(display "vrhaddq_s32" (current-error-port))
(define (vrhaddq_s8.check  a b )
(define result
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
  (define %17.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (bvadd  %17.downcasted0  (bv 1 16)))
  (define %19.downcasted0 (extract  8 1 %18.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrhaddq_s8 (bitvector 128))
(define-symbolic b_vrhaddq_s8 (bitvector 128))
(verify (assert (equal? (vrhaddq_s8.check a_vrhaddq_s8 b_vrhaddq_s8 ) (vrhaddq_s8 a_vrhaddq_s8 b_vrhaddq_s8 ))))
(display "vrhaddq_s8" (current-error-port))
(define (vrhaddq_u16.check  a b )
(define result
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
  (define %17.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (bvadd  %17.downcasted0  (bv 1 32)))
  (define %19.downcasted0 (extract  16 1 %18.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrhaddq_u16 (bitvector 128))
(define-symbolic b_vrhaddq_u16 (bitvector 128))
(verify (assert (equal? (vrhaddq_u16.check a_vrhaddq_u16 b_vrhaddq_u16 ) (vrhaddq_u16 a_vrhaddq_u16 b_vrhaddq_u16 ))))
(display "vrhaddq_u16" (current-error-port))
(define (vrhaddq_u32.check  a b )
(define result
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
  (define %17.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (bvadd  %17.downcasted0  (bv 1 64)))
  (define %19.downcasted0 (extract  32 1 %18.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrhaddq_u32 (bitvector 128))
(define-symbolic b_vrhaddq_u32 (bitvector 128))
(verify (assert (equal? (vrhaddq_u32.check a_vrhaddq_u32 b_vrhaddq_u32 ) (vrhaddq_u32 a_vrhaddq_u32 b_vrhaddq_u32 ))))
(display "vrhaddq_u32" (current-error-port))
(define (vrhaddq_u8.check  a b )
(define result
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
  (define %17.downcasted0 (bvadd  %6.downcasted0  %12.downcasted0))
  (define %18.downcasted0 (bvadd  %17.downcasted0  (bv 1 16)))
  (define %19.downcasted0 (extract  8 1 %18.downcasted0))
  %19.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrhaddq_u8 (bitvector 128))
(define-symbolic b_vrhaddq_u8 (bitvector 128))
(verify (assert (equal? (vrhaddq_u8.check a_vrhaddq_u8 b_vrhaddq_u8 ) (vrhaddq_u8 a_vrhaddq_u8 b_vrhaddq_u8 ))))
(display "vrhaddq_u8" (current-error-port))
(define (vrshl_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 32)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 32)))
  (define %14 (bvshl  (bv 1 32)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (sign-extend  %19 (bitvector 32)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  15 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshl_s16 (bitvector 64))
(define-symbolic b_vrshl_s16 (bitvector 64))
(verify (assert (equal? (vrshl_s16.check a_vrshl_s16 b_vrshl_s16 ) (vrshl_s16 a_vrshl_s16 b_vrshl_s16 ))))
(display "vrshl_s16" (current-error-port))
(define (vrshl_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 64)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 64)))
  (define %14 (bvshl  (bv 1 64)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (sign-extend  %19 (bitvector 64)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  31 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshl_s32 (bitvector 64))
(define-symbolic b_vrshl_s32 (bitvector 64))
(verify (assert (equal? (vrshl_s32.check a_vrshl_s32 b_vrshl_s32 ) (vrshl_s32 a_vrshl_s32 b_vrshl_s32 ))))
(display "vrshl_s32" (current-error-port))
(define (vrshl_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 128)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 128)))
  (define %14 (bvshl  (bv 1 128)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (sign-extend  %19 (bitvector 128)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  63 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshl_s64 (bitvector 64))
(define-symbolic b_vrshl_s64 (bitvector 64))
(verify (assert (equal? (vrshl_s64.check a_vrshl_s64 b_vrshl_s64 ) (vrshl_s64 a_vrshl_s64 b_vrshl_s64 ))))
(display "vrshl_s64" (current-error-port))
(define (vrshl_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 16)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 16)))
  (define %14 (bvshl  (bv 1 16)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (sign-extend  %19 (bitvector 16)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  7 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshl_s8 (bitvector 64))
(define-symbolic b_vrshl_s8 (bitvector 64))
(verify (assert (equal? (vrshl_s8.check a_vrshl_s8 b_vrshl_s8 ) (vrshl_s8 a_vrshl_s8 b_vrshl_s8 ))))
(display "vrshl_s8" (current-error-port))
(define (vrshl_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 32)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 32)))
  (define %14 (bvshl  (bv 1 32)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (zero-extend  %19 (bitvector 32)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  15 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshl_u16 (bitvector 64))
(define-symbolic b_vrshl_u16 (bitvector 64))
(verify (assert (equal? (vrshl_u16.check a_vrshl_u16 b_vrshl_u16 ) (vrshl_u16 a_vrshl_u16 b_vrshl_u16 ))))
(display "vrshl_u16" (current-error-port))
(define (vrshl_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 64)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 64)))
  (define %14 (bvshl  (bv 1 64)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (zero-extend  %19 (bitvector 64)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  31 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshl_u32 (bitvector 64))
(define-symbolic b_vrshl_u32 (bitvector 64))
(verify (assert (equal? (vrshl_u32.check a_vrshl_u32 b_vrshl_u32 ) (vrshl_u32 a_vrshl_u32 b_vrshl_u32 ))))
(display "vrshl_u32" (current-error-port))
(define (vrshl_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 128)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 128)))
  (define %14 (bvshl  (bv 1 128)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (zero-extend  %19 (bitvector 128)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  63 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshl_u64 (bitvector 64))
(define-symbolic b_vrshl_u64 (bitvector 64))
(verify (assert (equal? (vrshl_u64.check a_vrshl_u64 b_vrshl_u64 ) (vrshl_u64 a_vrshl_u64 b_vrshl_u64 ))))
(display "vrshl_u64" (current-error-port))
(define (vrshl_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 16)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 16)))
  (define %14 (bvshl  (bv 1 16)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (zero-extend  %19 (bitvector 16)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  7 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshl_u8 (bitvector 64))
(define-symbolic b_vrshl_u8 (bitvector 64))
(verify (assert (equal? (vrshl_u8.check a_vrshl_u8 b_vrshl_u8 ) (vrshl_u8 a_vrshl_u8 b_vrshl_u8 ))))
(display "vrshl_u8" (current-error-port))
(define (vrshld_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 128)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 128)))
  (define %14 (bvshl  (bv 1 128)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (sign-extend  %19 (bitvector 128)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  63 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshld_s64 (bitvector 64))
(define-symbolic b_vrshld_s64 (bitvector 64))
(verify (assert (equal? (vrshld_s64.check a_vrshld_s64 b_vrshld_s64 ) (vrshld_s64 a_vrshld_s64 b_vrshld_s64 ))))
(display "vrshld_s64" (current-error-port))
(define (vrshld_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 128)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 128)))
  (define %14 (bvshl  (bv 1 128)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (zero-extend  %19 (bitvector 128)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  63 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshld_u64 (bitvector 64))
(define-symbolic b_vrshld_u64 (bitvector 64))
(verify (assert (equal? (vrshld_u64.check a_vrshld_u64 b_vrshld_u64 ) (vrshld_u64 a_vrshld_u64 b_vrshld_u64 ))))
(display "vrshld_u64" (current-error-port))
(define (vrshlq_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 32)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 32)))
  (define %14 (bvshl  (bv 1 32)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (sign-extend  %19 (bitvector 32)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  15 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshlq_s16 (bitvector 128))
(define-symbolic b_vrshlq_s16 (bitvector 128))
(verify (assert (equal? (vrshlq_s16.check a_vrshlq_s16 b_vrshlq_s16 ) (vrshlq_s16 a_vrshlq_s16 b_vrshlq_s16 ))))
(display "vrshlq_s16" (current-error-port))
(define (vrshlq_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 64)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 64)))
  (define %14 (bvshl  (bv 1 64)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (sign-extend  %19 (bitvector 64)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  31 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshlq_s32 (bitvector 128))
(define-symbolic b_vrshlq_s32 (bitvector 128))
(verify (assert (equal? (vrshlq_s32.check a_vrshlq_s32 b_vrshlq_s32 ) (vrshlq_s32 a_vrshlq_s32 b_vrshlq_s32 ))))
(display "vrshlq_s32" (current-error-port))
(define (vrshlq_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 128)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 128)))
  (define %14 (bvshl  (bv 1 128)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (sign-extend  %19 (bitvector 128)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  63 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshlq_s64 (bitvector 128))
(define-symbolic b_vrshlq_s64 (bitvector 128))
(verify (assert (equal? (vrshlq_s64.check a_vrshlq_s64 b_vrshlq_s64 ) (vrshlq_s64 a_vrshlq_s64 b_vrshlq_s64 ))))
(display "vrshlq_s64" (current-error-port))
(define (vrshlq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 16)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 16)))
  (define %14 (bvshl  (bv 1 16)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (sign-extend  %19 (bitvector 16)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  7 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshlq_s8 (bitvector 128))
(define-symbolic b_vrshlq_s8 (bitvector 128))
(verify (assert (equal? (vrshlq_s8.check a_vrshlq_s8 b_vrshlq_s8 ) (vrshlq_s8 a_vrshlq_s8 b_vrshlq_s8 ))))
(display "vrshlq_s8" (current-error-port))
(define (vrshlq_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 32)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 32)))
  (define %14 (bvshl  (bv 1 32)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (zero-extend  %19 (bitvector 32)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  15 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshlq_u16 (bitvector 128))
(define-symbolic b_vrshlq_u16 (bitvector 128))
(verify (assert (equal? (vrshlq_u16.check a_vrshlq_u16 b_vrshlq_u16 ) (vrshlq_u16 a_vrshlq_u16 b_vrshlq_u16 ))))
(display "vrshlq_u16" (current-error-port))
(define (vrshlq_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 64)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 64)))
  (define %14 (bvshl  (bv 1 64)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (zero-extend  %19 (bitvector 64)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  31 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshlq_u32 (bitvector 128))
(define-symbolic b_vrshlq_u32 (bitvector 128))
(verify (assert (equal? (vrshlq_u32.check a_vrshlq_u32 b_vrshlq_u32 ) (vrshlq_u32 a_vrshlq_u32 b_vrshlq_u32 ))))
(display "vrshlq_u32" (current-error-port))
(define (vrshlq_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 128)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 128)))
  (define %14 (bvshl  (bv 1 128)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (zero-extend  %19 (bitvector 128)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  63 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshlq_u64 (bitvector 128))
(define-symbolic b_vrshlq_u64 (bitvector 128))
(verify (assert (equal? (vrshlq_u64.check a_vrshlq_u64 b_vrshlq_u64 ) (vrshlq_u64 a_vrshlq_u64 b_vrshlq_u64 ))))
(display "vrshlq_u64" (current-error-port))
(define (vrshlq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 16)))
  (define %12 (bvneg  %11))
  (define %13 (bvsub  %12  (bv 1 16)))
  (define %14 (bvshl  (bv 1 16)  %13))
  (define %19 (extract  %8 e0.new a))
  (define %21 (zero-extend  %19 (bitvector 16)))
  (define %22 (bvadd  %21  %14))
  (define %23 (bvshl  %22  %11))
  (define %29 (extract  7 0 %23))
  %29
 )
 )
)
)
)
result)
(define-symbolic a_vrshlq_u8 (bitvector 128))
(define-symbolic b_vrshlq_u8 (bitvector 128))
(verify (assert (equal? (vrshlq_u8.check a_vrshlq_u8 b_vrshlq_u8 ) (vrshlq_u8 a_vrshlq_u8 b_vrshlq_u8 ))))
(display "vrshlq_u8" (current-error-port))
(define (vrshr_n_s16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvashr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  15 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 16)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshr_n_s16 (bitvector 64))
(define-symbolic n_vrshr_n_s16 (bitvector 32))
(verify (assert (equal? (vrshr_n_s16.check a_vrshr_n_s16 n_vrshr_n_s16 ) (vrshr_n_s16 a_vrshr_n_s16 n_vrshr_n_s16 ))))
(display "vrshr_n_s16" (current-error-port))
(define (vrshr_n_s32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
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
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvashr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  31 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 32)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshr_n_s32 (bitvector 64))
(define-symbolic n_vrshr_n_s32 (bitvector 32))
(verify (assert (equal? (vrshr_n_s32.check a_vrshr_n_s32 n_vrshr_n_s32 ) (vrshr_n_s32 a_vrshr_n_s32 n_vrshr_n_s32 ))))
(display "vrshr_n_s32" (current-error-port))
(define (vrshr_n_s64.check  a n )
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
  (define %9 (+  e0.new  63))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 128)))
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvashr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  63 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 64)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshr_n_s64 (bitvector 64))
(define-symbolic n_vrshr_n_s64 (bitvector 32))
(verify (assert (equal? (vrshr_n_s64.check a_vrshr_n_s64 n_vrshr_n_s64 ) (vrshr_n_s64 a_vrshr_n_s64 n_vrshr_n_s64 ))))
(display "vrshr_n_s64" (current-error-port))
(define (vrshr_n_s8.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %9 (+  e0.new  7))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvashr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  7 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 8)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshr_n_s8 (bitvector 64))
(define-symbolic n_vrshr_n_s8 (bitvector 32))
(verify (assert (equal? (vrshr_n_s8.check a_vrshr_n_s8 n_vrshr_n_s8 ) (vrshr_n_s8 a_vrshr_n_s8 n_vrshr_n_s8 ))))
(display "vrshr_n_s8" (current-error-port))
(define (vrshr_n_u16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvlshr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  15 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 16)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshr_n_u16 (bitvector 64))
(define-symbolic n_vrshr_n_u16 (bitvector 32))
(verify (assert (equal? (vrshr_n_u16.check a_vrshr_n_u16 n_vrshr_n_u16 ) (vrshr_n_u16 a_vrshr_n_u16 n_vrshr_n_u16 ))))
(display "vrshr_n_u16" (current-error-port))
(define (vrshr_n_u32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
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
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvlshr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  31 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 32)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshr_n_u32 (bitvector 64))
(define-symbolic n_vrshr_n_u32 (bitvector 32))
(verify (assert (equal? (vrshr_n_u32.check a_vrshr_n_u32 n_vrshr_n_u32 ) (vrshr_n_u32 a_vrshr_n_u32 n_vrshr_n_u32 ))))
(display "vrshr_n_u32" (current-error-port))
(define (vrshr_n_u64.check  a n )
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
  (define %9 (+  e0.new  63))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 128)))
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvlshr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  63 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 64)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshr_n_u64 (bitvector 64))
(define-symbolic n_vrshr_n_u64 (bitvector 32))
(verify (assert (equal? (vrshr_n_u64.check a_vrshr_n_u64 n_vrshr_n_u64 ) (vrshr_n_u64 a_vrshr_n_u64 n_vrshr_n_u64 ))))
(display "vrshr_n_u64" (current-error-port))
(define (vrshr_n_u8.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %9 (+  e0.new  7))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvlshr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  7 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 8)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshr_n_u8 (bitvector 64))
(define-symbolic n_vrshr_n_u8 (bitvector 32))
(verify (assert (equal? (vrshr_n_u8.check a_vrshr_n_u8 n_vrshr_n_u8 ) (vrshr_n_u8 a_vrshr_n_u8 n_vrshr_n_u8 ))))
(display "vrshr_n_u8" (current-error-port))
(define (vrshrd_n_s64.check  a n )
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
  (define %9 (+  e0.new  63))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 128)))
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvashr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  63 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 64)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshrd_n_s64 (bitvector 64))
(define-symbolic n_vrshrd_n_s64 (bitvector 32))
(verify (assert (equal? (vrshrd_n_s64.check a_vrshrd_n_s64 n_vrshrd_n_s64 ) (vrshrd_n_s64 a_vrshrd_n_s64 n_vrshrd_n_s64 ))))
(display "vrshrd_n_s64" (current-error-port))
(define (vrshrd_n_u64.check  a n )
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
  (define %9 (+  e0.new  63))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 128)))
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvlshr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  63 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 64)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshrd_n_u64 (bitvector 64))
(define-symbolic n_vrshrd_n_u64 (bitvector 32))
(verify (assert (equal? (vrshrd_n_u64.check a_vrshrd_n_u64 n_vrshrd_n_u64 ) (vrshrd_n_u64 a_vrshrd_n_u64 n_vrshrd_n_u64 ))))
(display "vrshrd_n_u64" (current-error-port))
(define (vrshrn_high_n_s16.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %12 (+  e0.new  15))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %23.downcasted0 (extract  7 0 %17.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
(define %24 (concat result r))
%24)
(define-symbolic r_vrshrn_high_n_s16 (bitvector 64))
(define-symbolic a_vrshrn_high_n_s16 (bitvector 128))
(define-symbolic n_vrshrn_high_n_s16 (bitvector 32))
(verify (assert (equal? (vrshrn_high_n_s16.check r_vrshrn_high_n_s16 a_vrshrn_high_n_s16 n_vrshrn_high_n_s16 ) (vrshrn_high_n_s16 r_vrshrn_high_n_s16 a_vrshrn_high_n_s16 n_vrshrn_high_n_s16 ))))
(display "vrshrn_high_n_s16" (current-error-port))
(define (vrshrn_high_n_s32.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %12 (+  e0.new  31))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %23.downcasted0 (extract  15 0 %17.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
(define %24 (concat result r))
%24)
(define-symbolic r_vrshrn_high_n_s32 (bitvector 64))
(define-symbolic a_vrshrn_high_n_s32 (bitvector 128))
(define-symbolic n_vrshrn_high_n_s32 (bitvector 32))
(verify (assert (equal? (vrshrn_high_n_s32.check r_vrshrn_high_n_s32 a_vrshrn_high_n_s32 n_vrshrn_high_n_s32 ) (vrshrn_high_n_s32 r_vrshrn_high_n_s32 a_vrshrn_high_n_s32 n_vrshrn_high_n_s32 ))))
(display "vrshrn_high_n_s32" (current-error-port))
(define (vrshrn_high_n_s64.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %4.downcasted0 (bvshl  (bv 1 128)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %12 (+  e0.new  63))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %23.downcasted0 (extract  31 0 %17.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
(define %24 (concat result r))
%24)
(define-symbolic r_vrshrn_high_n_s64 (bitvector 64))
(define-symbolic a_vrshrn_high_n_s64 (bitvector 128))
(define-symbolic n_vrshrn_high_n_s64 (bitvector 32))
(verify (assert (equal? (vrshrn_high_n_s64.check r_vrshrn_high_n_s64 a_vrshrn_high_n_s64 n_vrshrn_high_n_s64 ) (vrshrn_high_n_s64 r_vrshrn_high_n_s64 a_vrshrn_high_n_s64 n_vrshrn_high_n_s64 ))))
(display "vrshrn_high_n_s64" (current-error-port))
(define (vrshrn_high_n_u16.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %12 (+  e0.new  15))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %23.downcasted0 (extract  7 0 %17.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
(define %24 (concat result r))
%24)
(define-symbolic r_vrshrn_high_n_u16 (bitvector 64))
(define-symbolic a_vrshrn_high_n_u16 (bitvector 128))
(define-symbolic n_vrshrn_high_n_u16 (bitvector 32))
(verify (assert (equal? (vrshrn_high_n_u16.check r_vrshrn_high_n_u16 a_vrshrn_high_n_u16 n_vrshrn_high_n_u16 ) (vrshrn_high_n_u16 r_vrshrn_high_n_u16 a_vrshrn_high_n_u16 n_vrshrn_high_n_u16 ))))
(display "vrshrn_high_n_u16" (current-error-port))
(define (vrshrn_high_n_u32.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %12 (+  e0.new  31))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %23.downcasted0 (extract  15 0 %17.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
(define %24 (concat result r))
%24)
(define-symbolic r_vrshrn_high_n_u32 (bitvector 64))
(define-symbolic a_vrshrn_high_n_u32 (bitvector 128))
(define-symbolic n_vrshrn_high_n_u32 (bitvector 32))
(verify (assert (equal? (vrshrn_high_n_u32.check r_vrshrn_high_n_u32 a_vrshrn_high_n_u32 n_vrshrn_high_n_u32 ) (vrshrn_high_n_u32 r_vrshrn_high_n_u32 a_vrshrn_high_n_u32 n_vrshrn_high_n_u32 ))))
(display "vrshrn_high_n_u32" (current-error-port))
(define (vrshrn_high_n_u64.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %4.downcasted0 (bvshl  (bv 1 128)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %12 (+  e0.new  63))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %23.downcasted0 (extract  31 0 %17.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
(define %24 (concat result r))
%24)
(define-symbolic r_vrshrn_high_n_u64 (bitvector 64))
(define-symbolic a_vrshrn_high_n_u64 (bitvector 128))
(define-symbolic n_vrshrn_high_n_u64 (bitvector 32))
(verify (assert (equal? (vrshrn_high_n_u64.check r_vrshrn_high_n_u64 a_vrshrn_high_n_u64 n_vrshrn_high_n_u64 ) (vrshrn_high_n_u64 r_vrshrn_high_n_u64 a_vrshrn_high_n_u64 n_vrshrn_high_n_u64 ))))
(display "vrshrn_high_n_u64" (current-error-port))
(define (vrshrn_n_s16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  15))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %23.downcasted0 (extract  7 0 %17.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrshrn_n_s16 (bitvector 128))
(define-symbolic n_vrshrn_n_s16 (bitvector 32))
(verify (assert (equal? (vrshrn_n_s16.check a_vrshrn_n_s16 n_vrshrn_n_s16 ) (vrshrn_n_s16 a_vrshrn_n_s16 n_vrshrn_n_s16 ))))
(display "vrshrn_n_s16" (current-error-port))
(define (vrshrn_n_s32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  31))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %23.downcasted0 (extract  15 0 %17.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrshrn_n_s32 (bitvector 128))
(define-symbolic n_vrshrn_n_s32 (bitvector 32))
(verify (assert (equal? (vrshrn_n_s32.check a_vrshrn_n_s32 n_vrshrn_n_s32 ) (vrshrn_n_s32 a_vrshrn_n_s32 n_vrshrn_n_s32 ))))
(display "vrshrn_n_s32" (current-error-port))
(define (vrshrn_n_s64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %4.downcasted0 (bvshl  (bv 1 128)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  63))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %23.downcasted0 (extract  31 0 %17.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrshrn_n_s64 (bitvector 128))
(define-symbolic n_vrshrn_n_s64 (bitvector 32))
(verify (assert (equal? (vrshrn_n_s64.check a_vrshrn_n_s64 n_vrshrn_n_s64 ) (vrshrn_n_s64 a_vrshrn_n_s64 n_vrshrn_n_s64 ))))
(display "vrshrn_n_s64" (current-error-port))
(define (vrshrn_n_u16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  15))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %23.downcasted0 (extract  7 0 %17.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrshrn_n_u16 (bitvector 128))
(define-symbolic n_vrshrn_n_u16 (bitvector 32))
(verify (assert (equal? (vrshrn_n_u16.check a_vrshrn_n_u16 n_vrshrn_n_u16 ) (vrshrn_n_u16 a_vrshrn_n_u16 n_vrshrn_n_u16 ))))
(display "vrshrn_n_u16" (current-error-port))
(define (vrshrn_n_u32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %4.downcasted0 (bvshl  (bv 1 64)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  31))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %23.downcasted0 (extract  15 0 %17.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrshrn_n_u32 (bitvector 128))
(define-symbolic n_vrshrn_n_u32 (bitvector 32))
(verify (assert (equal? (vrshrn_n_u32.check a_vrshrn_n_u32 n_vrshrn_n_u32 ) (vrshrn_n_u32 a_vrshrn_n_u32 n_vrshrn_n_u32 ))))
(display "vrshrn_n_u32" (current-error-port))
(define (vrshrn_n_u64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 128)))
(define %3.downcasted0 (bvsub  %1.downcasted0  (bv 1 128)))
(define %4.downcasted0 (bvshl  (bv 1 128)  %3.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  63))
  (define %14 (extract  %12 %7.new0 a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 128)))
  (define %16.downcasted0 (bvadd  %15.downcasted0  %4.downcasted0))
  (define %17.downcasted0 (bvlshr  %16.downcasted0  %1.downcasted0))
  (define %23.downcasted0 (extract  31 0 %17.downcasted0))
  %23.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vrshrn_n_u64 (bitvector 128))
(define-symbolic n_vrshrn_n_u64 (bitvector 32))
(verify (assert (equal? (vrshrn_n_u64.check a_vrshrn_n_u64 n_vrshrn_n_u64 ) (vrshrn_n_u64 a_vrshrn_n_u64 n_vrshrn_n_u64 ))))
(display "vrshrn_n_u64" (current-error-port))
(define (vrshrq_n_s16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvashr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  15 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 16)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshrq_n_s16 (bitvector 128))
(define-symbolic n_vrshrq_n_s16 (bitvector 32))
(verify (assert (equal? (vrshrq_n_s16.check a_vrshrq_n_s16 n_vrshrq_n_s16 ) (vrshrq_n_s16 a_vrshrq_n_s16 n_vrshrq_n_s16 ))))
(display "vrshrq_n_s16" (current-error-port))
(define (vrshrq_n_s32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9 (+  e0.new  31))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvashr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  31 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 32)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshrq_n_s32 (bitvector 128))
(define-symbolic n_vrshrq_n_s32 (bitvector 32))
(verify (assert (equal? (vrshrq_n_s32.check a_vrshrq_n_s32 n_vrshrq_n_s32 ) (vrshrq_n_s32 a_vrshrq_n_s32 n_vrshrq_n_s32 ))))
(display "vrshrq_n_s32" (current-error-port))
(define (vrshrq_n_s64.check  a n )
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
  (define %9 (+  e0.new  63))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 128)))
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvashr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  63 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 64)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshrq_n_s64 (bitvector 128))
(define-symbolic n_vrshrq_n_s64 (bitvector 32))
(verify (assert (equal? (vrshrq_n_s64.check a_vrshrq_n_s64 n_vrshrq_n_s64 ) (vrshrq_n_s64 a_vrshrq_n_s64 n_vrshrq_n_s64 ))))
(display "vrshrq_n_s64" (current-error-port))
(define (vrshrq_n_s8.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %9 (+  e0.new  7))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (sign-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvashr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  7 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 8)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshrq_n_s8 (bitvector 128))
(define-symbolic n_vrshrq_n_s8 (bitvector 32))
(verify (assert (equal? (vrshrq_n_s8.check a_vrshrq_n_s8 n_vrshrq_n_s8 ) (vrshrq_n_s8 a_vrshrq_n_s8 n_vrshrq_n_s8 ))))
(display "vrshrq_n_s8" (current-error-port))
(define (vrshrq_n_u16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %9 (+  e0.new  15))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvlshr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  15 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 16)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshrq_n_u16 (bitvector 128))
(define-symbolic n_vrshrq_n_u16 (bitvector 32))
(verify (assert (equal? (vrshrq_n_u16.check a_vrshrq_n_u16 n_vrshrq_n_u16 ) (vrshrq_n_u16 a_vrshrq_n_u16 n_vrshrq_n_u16 ))))
(display "vrshrq_n_u16" (current-error-port))
(define (vrshrq_n_u32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
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
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvlshr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  31 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 32)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshrq_n_u32 (bitvector 128))
(define-symbolic n_vrshrq_n_u32 (bitvector 32))
(verify (assert (equal? (vrshrq_n_u32.check a_vrshrq_n_u32 n_vrshrq_n_u32 ) (vrshrq_n_u32 a_vrshrq_n_u32 n_vrshrq_n_u32 ))))
(display "vrshrq_n_u32" (current-error-port))
(define (vrshrq_n_u64.check  a n )
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
  (define %9 (+  e0.new  63))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 128)))
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvlshr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  63 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 64)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshrq_n_u64 (bitvector 128))
(define-symbolic n_vrshrq_n_u64 (bitvector 32))
(verify (assert (equal? (vrshrq_n_u64.check a_vrshrq_n_u64 n_vrshrq_n_u64 ) (vrshrq_n_u64 a_vrshrq_n_u64 n_vrshrq_n_u64 ))))
(display "vrshrq_n_u64" (current-error-port))
(define (vrshrq_n_u8.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %9 (+  e0.new  7))
  (define %10 (extract  %9 e0.new a))
  (define %11.downcasted0 (zero-extend  %10 (bitvector 64)))
  (define %12.downcasted0 (bvadd  %11.downcasted0  %3.downcasted0))
  (define %13.downcasted0 (bvlshr  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  7 0 %13.downcasted0))
  (define %25 (bvadd  (bv 0 8)  %24.downcasted0))
  %25
 )
 )
)
)
)
result)
(define-symbolic a_vrshrq_n_u8 (bitvector 128))
(define-symbolic n_vrshrq_n_u8 (bitvector 32))
(verify (assert (equal? (vrshrq_n_u8.check a_vrshrq_n_u8 n_vrshrq_n_u8 ) (vrshrq_n_u8 a_vrshrq_n_u8 n_vrshrq_n_u8 ))))
(display "vrshrq_n_u8" (current-error-port))
(define (vrsra_n_s16.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  15 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsra_n_s16 (bitvector 64))
(define-symbolic b_vrsra_n_s16 (bitvector 64))
(define-symbolic n_vrsra_n_s16 (bitvector 32))
(verify (assert (equal? (vrsra_n_s16.check a_vrsra_n_s16 b_vrsra_n_s16 n_vrsra_n_s16 ) (vrsra_n_s16 a_vrsra_n_s16 b_vrsra_n_s16 n_vrsra_n_s16 ))))
(display "vrsra_n_s16" (current-error-port))
(define (vrsra_n_s32.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  31 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsra_n_s32 (bitvector 64))
(define-symbolic b_vrsra_n_s32 (bitvector 64))
(define-symbolic n_vrsra_n_s32 (bitvector 32))
(verify (assert (equal? (vrsra_n_s32.check a_vrsra_n_s32 b_vrsra_n_s32 n_vrsra_n_s32 ) (vrsra_n_s32 a_vrsra_n_s32 b_vrsra_n_s32 n_vrsra_n_s32 ))))
(display "vrsra_n_s32" (current-error-port))
(define (vrsra_n_s64.check  a b n )
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
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  63 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsra_n_s64 (bitvector 64))
(define-symbolic b_vrsra_n_s64 (bitvector 64))
(define-symbolic n_vrsra_n_s64 (bitvector 32))
(verify (assert (equal? (vrsra_n_s64.check a_vrsra_n_s64 b_vrsra_n_s64 n_vrsra_n_s64 ) (vrsra_n_s64 a_vrsra_n_s64 b_vrsra_n_s64 n_vrsra_n_s64 ))))
(display "vrsra_n_s64" (current-error-port))
(define (vrsra_n_s8.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  7 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsra_n_s8 (bitvector 64))
(define-symbolic b_vrsra_n_s8 (bitvector 64))
(define-symbolic n_vrsra_n_s8 (bitvector 32))
(verify (assert (equal? (vrsra_n_s8.check a_vrsra_n_s8 b_vrsra_n_s8 n_vrsra_n_s8 ) (vrsra_n_s8 a_vrsra_n_s8 b_vrsra_n_s8 n_vrsra_n_s8 ))))
(display "vrsra_n_s8" (current-error-port))
(define (vrsra_n_u16.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  15 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsra_n_u16 (bitvector 64))
(define-symbolic b_vrsra_n_u16 (bitvector 64))
(define-symbolic n_vrsra_n_u16 (bitvector 32))
(verify (assert (equal? (vrsra_n_u16.check a_vrsra_n_u16 b_vrsra_n_u16 n_vrsra_n_u16 ) (vrsra_n_u16 a_vrsra_n_u16 b_vrsra_n_u16 n_vrsra_n_u16 ))))
(display "vrsra_n_u16" (current-error-port))
(define (vrsra_n_u32.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  31 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsra_n_u32 (bitvector 64))
(define-symbolic b_vrsra_n_u32 (bitvector 64))
(define-symbolic n_vrsra_n_u32 (bitvector 32))
(verify (assert (equal? (vrsra_n_u32.check a_vrsra_n_u32 b_vrsra_n_u32 n_vrsra_n_u32 ) (vrsra_n_u32 a_vrsra_n_u32 b_vrsra_n_u32 n_vrsra_n_u32 ))))
(display "vrsra_n_u32" (current-error-port))
(define (vrsra_n_u64.check  a b n )
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
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 128)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  63 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsra_n_u64 (bitvector 64))
(define-symbolic b_vrsra_n_u64 (bitvector 64))
(define-symbolic n_vrsra_n_u64 (bitvector 32))
(verify (assert (equal? (vrsra_n_u64.check a_vrsra_n_u64 b_vrsra_n_u64 n_vrsra_n_u64 ) (vrsra_n_u64 a_vrsra_n_u64 b_vrsra_n_u64 n_vrsra_n_u64 ))))
(display "vrsra_n_u64" (current-error-port))
(define (vrsra_n_u8.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  7 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsra_n_u8 (bitvector 64))
(define-symbolic b_vrsra_n_u8 (bitvector 64))
(define-symbolic n_vrsra_n_u8 (bitvector 32))
(verify (assert (equal? (vrsra_n_u8.check a_vrsra_n_u8 b_vrsra_n_u8 n_vrsra_n_u8 ) (vrsra_n_u8 a_vrsra_n_u8 b_vrsra_n_u8 n_vrsra_n_u8 ))))
(display "vrsra_n_u8" (current-error-port))
(define (vrsrad_n_s64.check  a b n )
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
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  63 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsrad_n_s64 (bitvector 64))
(define-symbolic b_vrsrad_n_s64 (bitvector 64))
(define-symbolic n_vrsrad_n_s64 (bitvector 32))
(verify (assert (equal? (vrsrad_n_s64.check a_vrsrad_n_s64 b_vrsrad_n_s64 n_vrsrad_n_s64 ) (vrsrad_n_s64 a_vrsrad_n_s64 b_vrsrad_n_s64 n_vrsrad_n_s64 ))))
(display "vrsrad_n_s64" (current-error-port))
(define (vrsrad_n_u64.check  a b n )
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
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 128)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  63 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsrad_n_u64 (bitvector 64))
(define-symbolic b_vrsrad_n_u64 (bitvector 64))
(define-symbolic n_vrsrad_n_u64 (bitvector 32))
(verify (assert (equal? (vrsrad_n_u64.check a_vrsrad_n_u64 b_vrsrad_n_u64 n_vrsrad_n_u64 ) (vrsrad_n_u64 a_vrsrad_n_u64 b_vrsrad_n_u64 n_vrsrad_n_u64 ))))
(display "vrsrad_n_u64" (current-error-port))
(define (vrsraq_n_s16.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  15 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsraq_n_s16 (bitvector 128))
(define-symbolic b_vrsraq_n_s16 (bitvector 128))
(define-symbolic n_vrsraq_n_s16 (bitvector 32))
(verify (assert (equal? (vrsraq_n_s16.check a_vrsraq_n_s16 b_vrsraq_n_s16 n_vrsraq_n_s16 ) (vrsraq_n_s16 a_vrsraq_n_s16 b_vrsraq_n_s16 n_vrsraq_n_s16 ))))
(display "vrsraq_n_s16" (current-error-port))
(define (vrsraq_n_s32.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  31 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsraq_n_s32 (bitvector 128))
(define-symbolic b_vrsraq_n_s32 (bitvector 128))
(define-symbolic n_vrsraq_n_s32 (bitvector 32))
(verify (assert (equal? (vrsraq_n_s32.check a_vrsraq_n_s32 b_vrsraq_n_s32 n_vrsraq_n_s32 ) (vrsraq_n_s32 a_vrsraq_n_s32 b_vrsraq_n_s32 n_vrsraq_n_s32 ))))
(display "vrsraq_n_s32" (current-error-port))
(define (vrsraq_n_s64.check  a b n )
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
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 128)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  63 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsraq_n_s64 (bitvector 128))
(define-symbolic b_vrsraq_n_s64 (bitvector 128))
(define-symbolic n_vrsraq_n_s64 (bitvector 32))
(verify (assert (equal? (vrsraq_n_s64.check a_vrsraq_n_s64 b_vrsraq_n_s64 n_vrsraq_n_s64 ) (vrsraq_n_s64 a_vrsraq_n_s64 b_vrsraq_n_s64 n_vrsraq_n_s64 ))))
(display "vrsraq_n_s64" (current-error-port))
(define (vrsraq_n_s8.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (sign-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvashr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  7 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsraq_n_s8 (bitvector 128))
(define-symbolic b_vrsraq_n_s8 (bitvector 128))
(define-symbolic n_vrsraq_n_s8 (bitvector 32))
(verify (assert (equal? (vrsraq_n_s8.check a_vrsraq_n_s8 b_vrsraq_n_s8 n_vrsraq_n_s8 ) (vrsraq_n_s8 a_vrsraq_n_s8 b_vrsraq_n_s8 n_vrsraq_n_s8 ))))
(display "vrsraq_n_s8" (current-error-port))
(define (vrsraq_n_u16.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  15 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsraq_n_u16 (bitvector 128))
(define-symbolic b_vrsraq_n_u16 (bitvector 128))
(define-symbolic n_vrsraq_n_u16 (bitvector 32))
(verify (assert (equal? (vrsraq_n_u16.check a_vrsraq_n_u16 b_vrsraq_n_u16 n_vrsraq_n_u16 ) (vrsraq_n_u16 a_vrsraq_n_u16 b_vrsraq_n_u16 n_vrsraq_n_u16 ))))
(display "vrsraq_n_u16" (current-error-port))
(define (vrsraq_n_u32.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  31 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsraq_n_u32 (bitvector 128))
(define-symbolic b_vrsraq_n_u32 (bitvector 128))
(define-symbolic n_vrsraq_n_u32 (bitvector 32))
(verify (assert (equal? (vrsraq_n_u32.check a_vrsraq_n_u32 b_vrsraq_n_u32 n_vrsraq_n_u32 ) (vrsraq_n_u32 a_vrsraq_n_u32 b_vrsraq_n_u32 n_vrsraq_n_u32 ))))
(display "vrsraq_n_u32" (current-error-port))
(define (vrsraq_n_u64.check  a b n )
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
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 128)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  63 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsraq_n_u64 (bitvector 128))
(define-symbolic b_vrsraq_n_u64 (bitvector 128))
(define-symbolic n_vrsraq_n_u64 (bitvector 32))
(verify (assert (equal? (vrsraq_n_u64.check a_vrsraq_n_u64 b_vrsraq_n_u64 n_vrsraq_n_u64 ) (vrsraq_n_u64 a_vrsraq_n_u64 b_vrsraq_n_u64 n_vrsraq_n_u64 ))))
(display "vrsraq_n_u64" (current-error-port))
(define (vrsraq_n_u8.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %2.downcasted0 (bvsub  %1.downcasted0  (bv 1 64)))
(define %3.downcasted0 (bvshl  (bv 1 64)  %2.downcasted0))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %10.downcasted0 (zero-extend  %9 (bitvector 64)))
  (define %11.downcasted0 (bvadd  %10.downcasted0  %3.downcasted0))
  (define %12.downcasted0 (bvlshr  %11.downcasted0  %1.downcasted0))
  (define %21 (extract  %8 e0.new a))
  (define %23.downcasted0 (extract  7 0 %12.downcasted0))
  (define %24 (bvadd  %21  %23.downcasted0))
  %24
 )
 )
)
)
)
result)
(define-symbolic a_vrsraq_n_u8 (bitvector 128))
(define-symbolic b_vrsraq_n_u8 (bitvector 128))
(define-symbolic n_vrsraq_n_u8 (bitvector 32))
(verify (assert (equal? (vrsraq_n_u8.check a_vrsraq_n_u8 b_vrsraq_n_u8 n_vrsraq_n_u8 ) (vrsraq_n_u8 a_vrsraq_n_u8 b_vrsraq_n_u8 n_vrsraq_n_u8 ))))
(display "vrsraq_n_u8" (current-error-port))
(define (vrsubhn_high_s16.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %14 (+  e0.new  15))
  (define %16 (extract  %14 e0.new a))
  (define %25 (extract  %14 e0.new b))
  (define %26 (bvsub  %16  %25))
  (define %27 (bvadd  %26  (bv 128 16)))
  (define %34 (extract  15 8 %27))
  %34
 )
 )
)
)
)
(define %35 (concat result r))
%35)
(define-symbolic r_vrsubhn_high_s16 (bitvector 64))
(define-symbolic a_vrsubhn_high_s16 (bitvector 128))
(define-symbolic b_vrsubhn_high_s16 (bitvector 128))
(verify (assert (equal? (vrsubhn_high_s16.check r_vrsubhn_high_s16 a_vrsubhn_high_s16 b_vrsubhn_high_s16 ) (vrsubhn_high_s16 r_vrsubhn_high_s16 a_vrsubhn_high_s16 b_vrsubhn_high_s16 ))))
(display "vrsubhn_high_s16" (current-error-port))
(define (vrsubhn_high_s32.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %14 (+  e0.new  31))
  (define %16 (extract  %14 e0.new a))
  (define %25 (extract  %14 e0.new b))
  (define %26 (bvsub  %16  %25))
  (define %27 (bvadd  %26  (bv 32768 32)))
  (define %34 (extract  31 16 %27))
  %34
 )
 )
)
)
)
(define %35 (concat result r))
%35)
(define-symbolic r_vrsubhn_high_s32 (bitvector 64))
(define-symbolic a_vrsubhn_high_s32 (bitvector 128))
(define-symbolic b_vrsubhn_high_s32 (bitvector 128))
(verify (assert (equal? (vrsubhn_high_s32.check r_vrsubhn_high_s32 a_vrsubhn_high_s32 b_vrsubhn_high_s32 ) (vrsubhn_high_s32 r_vrsubhn_high_s32 a_vrsubhn_high_s32 b_vrsubhn_high_s32 ))))
(display "vrsubhn_high_s32" (current-error-port))
(define (vrsubhn_high_s64.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %14 (+  e0.new  63))
  (define %16 (extract  %14 e0.new a))
  (define %25 (extract  %14 e0.new b))
  (define %26 (bvsub  %16  %25))
  (define %27 (bvadd  %26  (bv 2147483648 64)))
  (define %34 (extract  63 32 %27))
  %34
 )
 )
)
)
)
(define %35 (concat result r))
%35)
(define-symbolic r_vrsubhn_high_s64 (bitvector 64))
(define-symbolic a_vrsubhn_high_s64 (bitvector 128))
(define-symbolic b_vrsubhn_high_s64 (bitvector 128))
(verify (assert (equal? (vrsubhn_high_s64.check r_vrsubhn_high_s64 a_vrsubhn_high_s64 b_vrsubhn_high_s64 ) (vrsubhn_high_s64 r_vrsubhn_high_s64 a_vrsubhn_high_s64 b_vrsubhn_high_s64 ))))
(display "vrsubhn_high_s64" (current-error-port))
(define (vrsubhn_high_u16.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %14 (+  e0.new  15))
  (define %16 (extract  %14 e0.new a))
  (define %25 (extract  %14 e0.new b))
  (define %26 (bvsub  %16  %25))
  (define %27 (bvadd  %26  (bv 128 16)))
  (define %34 (extract  15 8 %27))
  %34
 )
 )
)
)
)
(define %35 (concat result r))
%35)
(define-symbolic r_vrsubhn_high_u16 (bitvector 64))
(define-symbolic a_vrsubhn_high_u16 (bitvector 128))
(define-symbolic b_vrsubhn_high_u16 (bitvector 128))
(verify (assert (equal? (vrsubhn_high_u16.check r_vrsubhn_high_u16 a_vrsubhn_high_u16 b_vrsubhn_high_u16 ) (vrsubhn_high_u16 r_vrsubhn_high_u16 a_vrsubhn_high_u16 b_vrsubhn_high_u16 ))))
(display "vrsubhn_high_u16" (current-error-port))
(define (vrsubhn_high_u32.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %14 (+  e0.new  31))
  (define %16 (extract  %14 e0.new a))
  (define %25 (extract  %14 e0.new b))
  (define %26 (bvsub  %16  %25))
  (define %27 (bvadd  %26  (bv 32768 32)))
  (define %34 (extract  31 16 %27))
  %34
 )
 )
)
)
)
(define %35 (concat result r))
%35)
(define-symbolic r_vrsubhn_high_u32 (bitvector 64))
(define-symbolic a_vrsubhn_high_u32 (bitvector 128))
(define-symbolic b_vrsubhn_high_u32 (bitvector 128))
(verify (assert (equal? (vrsubhn_high_u32.check r_vrsubhn_high_u32 a_vrsubhn_high_u32 b_vrsubhn_high_u32 ) (vrsubhn_high_u32 r_vrsubhn_high_u32 a_vrsubhn_high_u32 b_vrsubhn_high_u32 ))))
(display "vrsubhn_high_u32" (current-error-port))
(define (vrsubhn_high_u64.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %14 (+  e0.new  63))
  (define %16 (extract  %14 e0.new a))
  (define %25 (extract  %14 e0.new b))
  (define %26 (bvsub  %16  %25))
  (define %27 (bvadd  %26  (bv 2147483648 64)))
  (define %34 (extract  63 32 %27))
  %34
 )
 )
)
)
)
(define %35 (concat result r))
%35)
(define-symbolic r_vrsubhn_high_u64 (bitvector 64))
(define-symbolic a_vrsubhn_high_u64 (bitvector 128))
(define-symbolic b_vrsubhn_high_u64 (bitvector 128))
(verify (assert (equal? (vrsubhn_high_u64.check r_vrsubhn_high_u64 a_vrsubhn_high_u64 b_vrsubhn_high_u64 ) (vrsubhn_high_u64 r_vrsubhn_high_u64 a_vrsubhn_high_u64 b_vrsubhn_high_u64 ))))
(display "vrsubhn_high_u64" (current-error-port))
(define (vrsubhn_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  15))
  (define %16 (extract  %14 %9.new0 a))
  (define %25 (extract  %14 %9.new0 b))
  (define %26 (bvsub  %16  %25))
  (define %27 (bvadd  %26  (bv 128 16)))
  (define %34 (extract  15 8 %27))
  %34
 )
 )
)
)
)
result)
(define-symbolic a_vrsubhn_s16 (bitvector 128))
(define-symbolic b_vrsubhn_s16 (bitvector 128))
(verify (assert (equal? (vrsubhn_s16.check a_vrsubhn_s16 b_vrsubhn_s16 ) (vrsubhn_s16 a_vrsubhn_s16 b_vrsubhn_s16 ))))
(display "vrsubhn_s16" (current-error-port))
(define (vrsubhn_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  31))
  (define %16 (extract  %14 %9.new0 a))
  (define %25 (extract  %14 %9.new0 b))
  (define %26 (bvsub  %16  %25))
  (define %27 (bvadd  %26  (bv 32768 32)))
  (define %34 (extract  31 16 %27))
  %34
 )
 )
)
)
)
result)
(define-symbolic a_vrsubhn_s32 (bitvector 128))
(define-symbolic b_vrsubhn_s32 (bitvector 128))
(verify (assert (equal? (vrsubhn_s32.check a_vrsubhn_s32 b_vrsubhn_s32 ) (vrsubhn_s32 a_vrsubhn_s32 b_vrsubhn_s32 ))))
(display "vrsubhn_s32" (current-error-port))
(define (vrsubhn_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  63))
  (define %16 (extract  %14 %9.new0 a))
  (define %25 (extract  %14 %9.new0 b))
  (define %26 (bvsub  %16  %25))
  (define %27 (bvadd  %26  (bv 2147483648 64)))
  (define %34 (extract  63 32 %27))
  %34
 )
 )
)
)
)
result)
(define-symbolic a_vrsubhn_s64 (bitvector 128))
(define-symbolic b_vrsubhn_s64 (bitvector 128))
(verify (assert (equal? (vrsubhn_s64.check a_vrsubhn_s64 b_vrsubhn_s64 ) (vrsubhn_s64 a_vrsubhn_s64 b_vrsubhn_s64 ))))
(display "vrsubhn_s64" (current-error-port))
(define (vrsubhn_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  15))
  (define %16 (extract  %14 %9.new0 a))
  (define %25 (extract  %14 %9.new0 b))
  (define %26 (bvsub  %16  %25))
  (define %27 (bvadd  %26  (bv 128 16)))
  (define %34 (extract  15 8 %27))
  %34
 )
 )
)
)
)
result)
(define-symbolic a_vrsubhn_u16 (bitvector 128))
(define-symbolic b_vrsubhn_u16 (bitvector 128))
(verify (assert (equal? (vrsubhn_u16.check a_vrsubhn_u16 b_vrsubhn_u16 ) (vrsubhn_u16 a_vrsubhn_u16 b_vrsubhn_u16 ))))
(display "vrsubhn_u16" (current-error-port))
(define (vrsubhn_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  31))
  (define %16 (extract  %14 %9.new0 a))
  (define %25 (extract  %14 %9.new0 b))
  (define %26 (bvsub  %16  %25))
  (define %27 (bvadd  %26  (bv 32768 32)))
  (define %34 (extract  31 16 %27))
  %34
 )
 )
)
)
)
result)
(define-symbolic a_vrsubhn_u32 (bitvector 128))
(define-symbolic b_vrsubhn_u32 (bitvector 128))
(verify (assert (equal? (vrsubhn_u32.check a_vrsubhn_u32 b_vrsubhn_u32 ) (vrsubhn_u32 a_vrsubhn_u32 b_vrsubhn_u32 ))))
(display "vrsubhn_u32" (current-error-port))
(define (vrsubhn_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  63))
  (define %16 (extract  %14 %9.new0 a))
  (define %25 (extract  %14 %9.new0 b))
  (define %26 (bvsub  %16  %25))
  (define %27 (bvadd  %26  (bv 2147483648 64)))
  (define %34 (extract  63 32 %27))
  %34
 )
 )
)
)
)
result)
(define-symbolic a_vrsubhn_u64 (bitvector 128))
(define-symbolic b_vrsubhn_u64 (bitvector 128))
(verify (assert (equal? (vrsubhn_u64.check a_vrsubhn_u64 b_vrsubhn_u64 ) (vrsubhn_u64 a_vrsubhn_u64 b_vrsubhn_u64 ))))
(display "vrsubhn_u64" (current-error-port))
(define (vshl_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 32)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (sign-extend  %16 (bitvector 32)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  15 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshl_s16 (bitvector 64))
(define-symbolic b_vshl_s16 (bitvector 64))
(verify (assert (equal? (vshl_s16.check a_vshl_s16 b_vshl_s16 ) (vshl_s16 a_vshl_s16 b_vshl_s16 ))))
(display "vshl_s16" (current-error-port))
(define (vshl_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (sign-extend  %16 (bitvector 64)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  31 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshl_s32 (bitvector 64))
(define-symbolic b_vshl_s32 (bitvector 64))
(verify (assert (equal? (vshl_s32.check a_vshl_s32 b_vshl_s32 ) (vshl_s32 a_vshl_s32 b_vshl_s32 ))))
(display "vshl_s32" (current-error-port))
(define (vshl_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 128)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (sign-extend  %16 (bitvector 128)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  63 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshl_s64 (bitvector 64))
(define-symbolic b_vshl_s64 (bitvector 64))
(verify (assert (equal? (vshl_s64.check a_vshl_s64 b_vshl_s64 ) (vshl_s64 a_vshl_s64 b_vshl_s64 ))))
(display "vshl_s64" (current-error-port))
(define (vshl_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 16)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (sign-extend  %16 (bitvector 16)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  7 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshl_s8 (bitvector 64))
(define-symbolic b_vshl_s8 (bitvector 64))
(verify (assert (equal? (vshl_s8.check a_vshl_s8 b_vshl_s8 ) (vshl_s8 a_vshl_s8 b_vshl_s8 ))))
(display "vshl_s8" (current-error-port))
(define (vshl_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 32)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (zero-extend  %16 (bitvector 32)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  15 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshl_u16 (bitvector 64))
(define-symbolic b_vshl_u16 (bitvector 64))
(verify (assert (equal? (vshl_u16.check a_vshl_u16 b_vshl_u16 ) (vshl_u16 a_vshl_u16 b_vshl_u16 ))))
(display "vshl_u16" (current-error-port))
(define (vshl_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (zero-extend  %16 (bitvector 64)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  31 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshl_u32 (bitvector 64))
(define-symbolic b_vshl_u32 (bitvector 64))
(verify (assert (equal? (vshl_u32.check a_vshl_u32 b_vshl_u32 ) (vshl_u32 a_vshl_u32 b_vshl_u32 ))))
(display "vshl_u32" (current-error-port))
(define (vshl_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 128)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (zero-extend  %16 (bitvector 128)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  63 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshl_u64 (bitvector 64))
(define-symbolic b_vshl_u64 (bitvector 64))
(verify (assert (equal? (vshl_u64.check a_vshl_u64 b_vshl_u64 ) (vshl_u64 a_vshl_u64 b_vshl_u64 ))))
(display "vshl_u64" (current-error-port))
(define (vshl_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 16)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (zero-extend  %16 (bitvector 16)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  7 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshl_u8 (bitvector 64))
(define-symbolic b_vshl_u8 (bitvector 64))
(verify (assert (equal? (vshl_u8.check a_vshl_u8 b_vshl_u8 ) (vshl_u8 a_vshl_u8 b_vshl_u8 ))))
(display "vshl_u8" (current-error-port))
(define (vshld_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 128)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (sign-extend  %16 (bitvector 128)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  63 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshld_s64 (bitvector 64))
(define-symbolic b_vshld_s64 (bitvector 64))
(verify (assert (equal? (vshld_s64.check a_vshld_s64 b_vshld_s64 ) (vshld_s64 a_vshld_s64 b_vshld_s64 ))))
(display "vshld_s64" (current-error-port))
(define (vshld_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 128)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (zero-extend  %16 (bitvector 128)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  63 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshld_u64 (bitvector 64))
(define-symbolic b_vshld_u64 (bitvector 64))
(verify (assert (equal? (vshld_u64.check a_vshld_u64 b_vshld_u64 ) (vshld_u64 a_vshld_u64 b_vshld_u64 ))))
(display "vshld_u64" (current-error-port))
(define (vshll_high_n_s16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %4 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %7.new0 (/  e0.new  2))
  (define %10 (+  %7.new0  15))
  (define %11 (extract  %10 %7.new0 %4))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvshl  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  31 0 %13.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshll_high_n_s16 (bitvector 128))
(define-symbolic n_vshll_high_n_s16 (bitvector 32))
(verify (assert (equal? (vshll_high_n_s16.check a_vshll_high_n_s16 n_vshll_high_n_s16 ) (vshll_high_n_s16 a_vshll_high_n_s16 n_vshll_high_n_s16 ))))
(display "vshll_high_n_s16" (current-error-port))
(define (vshll_high_n_s32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %4 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %7.new0 (/  e0.new  2))
  (define %10 (+  %7.new0  31))
  (define %11 (extract  %10 %7.new0 %4))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvshl  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  63 0 %13.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshll_high_n_s32 (bitvector 128))
(define-symbolic n_vshll_high_n_s32 (bitvector 32))
(verify (assert (equal? (vshll_high_n_s32.check a_vshll_high_n_s32 n_vshll_high_n_s32 ) (vshll_high_n_s32 a_vshll_high_n_s32 n_vshll_high_n_s32 ))))
(display "vshll_high_n_s32" (current-error-port))
(define (vshll_high_n_s8.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %4 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %7.new0 (/  e0.new  2))
  (define %10 (+  %7.new0  7))
  (define %11 (extract  %10 %7.new0 %4))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvshl  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  15 0 %13.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshll_high_n_s8 (bitvector 128))
(define-symbolic n_vshll_high_n_s8 (bitvector 32))
(verify (assert (equal? (vshll_high_n_s8.check a_vshll_high_n_s8 n_vshll_high_n_s8 ) (vshll_high_n_s8 a_vshll_high_n_s8 n_vshll_high_n_s8 ))))
(display "vshll_high_n_s8" (current-error-port))
(define (vshll_high_n_u16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %4 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %7.new0 (/  e0.new  2))
  (define %10 (+  %7.new0  15))
  (define %11 (extract  %10 %7.new0 %4))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvshl  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  31 0 %13.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshll_high_n_u16 (bitvector 128))
(define-symbolic n_vshll_high_n_u16 (bitvector 32))
(verify (assert (equal? (vshll_high_n_u16.check a_vshll_high_n_u16 n_vshll_high_n_u16 ) (vshll_high_n_u16 a_vshll_high_n_u16 n_vshll_high_n_u16 ))))
(display "vshll_high_n_u16" (current-error-port))
(define (vshll_high_n_u32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %4 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %7.new0 (/  e0.new  2))
  (define %10 (+  %7.new0  31))
  (define %11 (extract  %10 %7.new0 %4))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvshl  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  63 0 %13.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshll_high_n_u32 (bitvector 128))
(define-symbolic n_vshll_high_n_u32 (bitvector 32))
(verify (assert (equal? (vshll_high_n_u32.check a_vshll_high_n_u32 n_vshll_high_n_u32 ) (vshll_high_n_u32 a_vshll_high_n_u32 n_vshll_high_n_u32 ))))
(display "vshll_high_n_u32" (current-error-port))
(define (vshll_high_n_u8.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define %4 (extract  127 64 a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %7.new0 (/  e0.new  2))
  (define %10 (+  %7.new0  7))
  (define %11 (extract  %10 %7.new0 %4))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %13.downcasted0 (bvshl  %12.downcasted0  %1.downcasted0))
  (define %24.downcasted0 (extract  15 0 %13.downcasted0))
  %24.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshll_high_n_u8 (bitvector 128))
(define-symbolic n_vshll_high_n_u8 (bitvector 32))
(verify (assert (equal? (vshll_high_n_u8.check a_vshll_high_n_u8 n_vshll_high_n_u8 ) (vshll_high_n_u8 a_vshll_high_n_u8 n_vshll_high_n_u8 ))))
(display "vshll_high_n_u8" (current-error-port))
(define (vshll_n_s16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
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
  (define %10.downcasted0 (bvshl  %9.downcasted0  %1.downcasted0))
  (define %21.downcasted0 (extract  31 0 %10.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshll_n_s16 (bitvector 64))
(define-symbolic n_vshll_n_s16 (bitvector 32))
(verify (assert (equal? (vshll_n_s16.check a_vshll_n_s16 n_vshll_n_s16 ) (vshll_n_s16 a_vshll_n_s16 n_vshll_n_s16 ))))
(display "vshll_n_s16" (current-error-port))
(define (vshll_n_s32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
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
  (define %10.downcasted0 (bvshl  %9.downcasted0  %1.downcasted0))
  (define %21.downcasted0 (extract  63 0 %10.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshll_n_s32 (bitvector 64))
(define-symbolic n_vshll_n_s32 (bitvector 32))
(verify (assert (equal? (vshll_n_s32.check a_vshll_n_s32 n_vshll_n_s32 ) (vshll_n_s32 a_vshll_n_s32 n_vshll_n_s32 ))))
(display "vshll_n_s32" (current-error-port))
(define (vshll_n_s8.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
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
  (define %10.downcasted0 (bvshl  %9.downcasted0  %1.downcasted0))
  (define %21.downcasted0 (extract  15 0 %10.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshll_n_s8 (bitvector 64))
(define-symbolic n_vshll_n_s8 (bitvector 32))
(verify (assert (equal? (vshll_n_s8.check a_vshll_n_s8 n_vshll_n_s8 ) (vshll_n_s8 a_vshll_n_s8 n_vshll_n_s8 ))))
(display "vshll_n_s8" (current-error-port))
(define (vshll_n_u16.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
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
  (define %10.downcasted0 (bvshl  %9.downcasted0  %1.downcasted0))
  (define %21.downcasted0 (extract  31 0 %10.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshll_n_u16 (bitvector 64))
(define-symbolic n_vshll_n_u16 (bitvector 32))
(verify (assert (equal? (vshll_n_u16.check a_vshll_n_u16 n_vshll_n_u16 ) (vshll_n_u16 a_vshll_n_u16 n_vshll_n_u16 ))))
(display "vshll_n_u16" (current-error-port))
(define (vshll_n_u32.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
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
  (define %10.downcasted0 (bvshl  %9.downcasted0  %1.downcasted0))
  (define %21.downcasted0 (extract  63 0 %10.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshll_n_u32 (bitvector 64))
(define-symbolic n_vshll_n_u32 (bitvector 32))
(verify (assert (equal? (vshll_n_u32.check a_vshll_n_u32 n_vshll_n_u32 ) (vshll_n_u32 a_vshll_n_u32 n_vshll_n_u32 ))))
(display "vshll_n_u32" (current-error-port))
(define (vshll_n_u8.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
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
  (define %10.downcasted0 (bvshl  %9.downcasted0  %1.downcasted0))
  (define %21.downcasted0 (extract  15 0 %10.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshll_n_u8 (bitvector 64))
(define-symbolic n_vshll_n_u8 (bitvector 32))
(verify (assert (equal? (vshll_n_u8.check a_vshll_n_u8 n_vshll_n_u8 ) (vshll_n_u8 a_vshll_n_u8 n_vshll_n_u8 ))))
(display "vshll_n_u8" (current-error-port))
(define (vshlq_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 32)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (sign-extend  %16 (bitvector 32)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  15 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshlq_s16 (bitvector 128))
(define-symbolic b_vshlq_s16 (bitvector 128))
(verify (assert (equal? (vshlq_s16.check a_vshlq_s16 b_vshlq_s16 ) (vshlq_s16 a_vshlq_s16 b_vshlq_s16 ))))
(display "vshlq_s16" (current-error-port))
(define (vshlq_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (sign-extend  %16 (bitvector 64)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  31 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshlq_s32 (bitvector 128))
(define-symbolic b_vshlq_s32 (bitvector 128))
(verify (assert (equal? (vshlq_s32.check a_vshlq_s32 b_vshlq_s32 ) (vshlq_s32 a_vshlq_s32 b_vshlq_s32 ))))
(display "vshlq_s32" (current-error-port))
(define (vshlq_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 128)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (sign-extend  %16 (bitvector 128)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  63 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshlq_s64 (bitvector 128))
(define-symbolic b_vshlq_s64 (bitvector 128))
(verify (assert (equal? (vshlq_s64.check a_vshlq_s64 b_vshlq_s64 ) (vshlq_s64 a_vshlq_s64 b_vshlq_s64 ))))
(display "vshlq_s64" (current-error-port))
(define (vshlq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 16)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (sign-extend  %16 (bitvector 16)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  7 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshlq_s8 (bitvector 128))
(define-symbolic b_vshlq_s8 (bitvector 128))
(verify (assert (equal? (vshlq_s8.check a_vshlq_s8 b_vshlq_s8 ) (vshlq_s8 a_vshlq_s8 b_vshlq_s8 ))))
(display "vshlq_s8" (current-error-port))
(define (vshlq_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8 (+  e0.new  15))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 32)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (zero-extend  %16 (bitvector 32)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  15 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshlq_u16 (bitvector 128))
(define-symbolic b_vshlq_u16 (bitvector 128))
(verify (assert (equal? (vshlq_u16.check a_vshlq_u16 b_vshlq_u16 ) (vshlq_u16 a_vshlq_u16 b_vshlq_u16 ))))
(display "vshlq_u16" (current-error-port))
(define (vshlq_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8 (+  e0.new  31))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 64)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (zero-extend  %16 (bitvector 64)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  31 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshlq_u32 (bitvector 128))
(define-symbolic b_vshlq_u32 (bitvector 128))
(verify (assert (equal? (vshlq_u32.check a_vshlq_u32 b_vshlq_u32 ) (vshlq_u32 a_vshlq_u32 b_vshlq_u32 ))))
(display "vshlq_u32" (current-error-port))
(define (vshlq_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %8 (+  e0.new  63))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 128)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (zero-extend  %16 (bitvector 128)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  63 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshlq_u64 (bitvector 128))
(define-symbolic b_vshlq_u64 (bitvector 128))
(verify (assert (equal? (vshlq_u64.check a_vshlq_u64 b_vshlq_u64 ) (vshlq_u64 a_vshlq_u64 b_vshlq_u64 ))))
(display "vshlq_u64" (current-error-port))
(define (vshlq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %8 (+  e0.new  7))
  (define %9 (extract  %8 e0.new b))
  (define %11 (sign-extend  %9 (bitvector 16)))
  (define %16 (extract  %8 e0.new a))
  (define %18 (zero-extend  %16 (bitvector 16)))
  (define %20 (bvshl  %18  %11))
  (define %26 (extract  7 0 %20))
  %26
 )
 )
)
)
)
result)
(define-symbolic a_vshlq_u8 (bitvector 128))
(define-symbolic b_vshlq_u8 (bitvector 128))
(verify (assert (equal? (vshlq_u8.check a_vshlq_u8 b_vshlq_u8 ) (vshlq_u8 a_vshlq_u8 b_vshlq_u8 ))))
(display "vshlq_u8" (current-error-port))
(define (vshr_n_s16.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 32)))
  (define %11.downcasted0 (bvashr  %9.downcasted0  n))
  (define %22.downcasted0 (extract  15 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 16)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshr_n_s16 (bitvector 64))
(define-symbolic n_vshr_n_s16 (bitvector 32))
(verify (assert (equal? (vshr_n_s16.check a_vshr_n_s16 n_vshr_n_s16 ) (vshr_n_s16 a_vshr_n_s16 n_vshr_n_s16 ))))
(display "vshr_n_s16" (current-error-port))
(define (vshr_n_s32.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new a))
  (define %11.downcasted0 (bvashr  %8  n))
  (define %22.downcasted0 (extract  31 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 32)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshr_n_s32 (bitvector 64))
(define-symbolic n_vshr_n_s32 (bitvector 32))
(verify (assert (equal? (vshr_n_s32.check a_vshr_n_s32 n_vshr_n_s32 ) (vshr_n_s32 a_vshr_n_s32 n_vshr_n_s32 ))))
(display "vshr_n_s32" (current-error-port))
(define (vshr_n_s64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new a))
  (define %11.downcasted0 (bvashr  %8  %1.downcasted0))
  (define %22.downcasted0 (extract  63 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 64)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshr_n_s64 (bitvector 64))
(define-symbolic n_vshr_n_s64 (bitvector 32))
(verify (assert (equal? (vshr_n_s64.check a_vshr_n_s64 n_vshr_n_s64 ) (vshr_n_s64 a_vshr_n_s64 n_vshr_n_s64 ))))
(display "vshr_n_s64" (current-error-port))
(define (vshr_n_s8.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7 (+  e0.new  7))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 32)))
  (define %11.downcasted0 (bvashr  %9.downcasted0  n))
  (define %22.downcasted0 (extract  7 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 8)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshr_n_s8 (bitvector 64))
(define-symbolic n_vshr_n_s8 (bitvector 32))
(verify (assert (equal? (vshr_n_s8.check a_vshr_n_s8 n_vshr_n_s8 ) (vshr_n_s8 a_vshr_n_s8 n_vshr_n_s8 ))))
(display "vshr_n_s8" (current-error-port))
(define (vshr_n_u16.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 32)))
  (define %11.downcasted0 (bvlshr  %9.downcasted0  n))
  (define %22.downcasted0 (extract  15 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 16)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshr_n_u16 (bitvector 64))
(define-symbolic n_vshr_n_u16 (bitvector 32))
(verify (assert (equal? (vshr_n_u16.check a_vshr_n_u16 n_vshr_n_u16 ) (vshr_n_u16 a_vshr_n_u16 n_vshr_n_u16 ))))
(display "vshr_n_u16" (current-error-port))
(define (vshr_n_u32.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new a))
  (define %11.downcasted0 (bvlshr  %8  n))
  (define %22.downcasted0 (extract  31 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 32)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshr_n_u32 (bitvector 64))
(define-symbolic n_vshr_n_u32 (bitvector 32))
(verify (assert (equal? (vshr_n_u32.check a_vshr_n_u32 n_vshr_n_u32 ) (vshr_n_u32 a_vshr_n_u32 n_vshr_n_u32 ))))
(display "vshr_n_u32" (current-error-port))
(define (vshr_n_u64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new a))
  (define %11.downcasted0 (bvlshr  %8  %1.downcasted0))
  (define %22.downcasted0 (extract  63 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 64)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshr_n_u64 (bitvector 64))
(define-symbolic n_vshr_n_u64 (bitvector 32))
(verify (assert (equal? (vshr_n_u64.check a_vshr_n_u64 n_vshr_n_u64 ) (vshr_n_u64 a_vshr_n_u64 n_vshr_n_u64 ))))
(display "vshr_n_u64" (current-error-port))
(define (vshr_n_u8.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7 (+  e0.new  7))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 32)))
  (define %11.downcasted0 (bvlshr  %9.downcasted0  n))
  (define %22.downcasted0 (extract  7 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 8)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshr_n_u8 (bitvector 64))
(define-symbolic n_vshr_n_u8 (bitvector 32))
(verify (assert (equal? (vshr_n_u8.check a_vshr_n_u8 n_vshr_n_u8 ) (vshr_n_u8 a_vshr_n_u8 n_vshr_n_u8 ))))
(display "vshr_n_u8" (current-error-port))
(define (vshrd_n_s64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new a))
  (define %11.downcasted0 (bvashr  %8  %1.downcasted0))
  (define %22.downcasted0 (extract  63 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 64)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshrd_n_s64 (bitvector 64))
(define-symbolic n_vshrd_n_s64 (bitvector 32))
(verify (assert (equal? (vshrd_n_s64.check a_vshrd_n_s64 n_vshrd_n_s64 ) (vshrd_n_s64 a_vshrd_n_s64 n_vshrd_n_s64 ))))
(display "vshrd_n_s64" (current-error-port))
(define (vshrd_n_u64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new a))
  (define %11.downcasted0 (bvlshr  %8  %1.downcasted0))
  (define %22.downcasted0 (extract  63 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 64)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshrd_n_u64 (bitvector 64))
(define-symbolic n_vshrd_n_u64 (bitvector 32))
(verify (assert (equal? (vshrd_n_u64.check a_vshrd_n_u64 n_vshrd_n_u64 ) (vshrd_n_u64 a_vshrd_n_u64 n_vshrd_n_u64 ))))
(display "vshrd_n_u64" (current-error-port))
(define (vshrn_high_n_s16.check  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %10 (+  e0.new  15))
  (define %12 (extract  %10 e0.new a))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 32)))
  (define %15.downcasted0 (bvlshr  %13.downcasted0  n))
  (define %21.downcasted0 (extract  7 0 %15.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
(define %22 (concat result r))
%22)
(define-symbolic r_vshrn_high_n_s16 (bitvector 64))
(define-symbolic a_vshrn_high_n_s16 (bitvector 128))
(define-symbolic n_vshrn_high_n_s16 (bitvector 32))
(verify (assert (equal? (vshrn_high_n_s16.check r_vshrn_high_n_s16 a_vshrn_high_n_s16 n_vshrn_high_n_s16 ) (vshrn_high_n_s16 r_vshrn_high_n_s16 a_vshrn_high_n_s16 n_vshrn_high_n_s16 ))))
(display "vshrn_high_n_s16" (current-error-port))
(define (vshrn_high_n_s32.check  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %10 (+  e0.new  31))
  (define %12 (extract  %10 e0.new a))
  (define %15.downcasted0 (bvlshr  %12  n))
  (define %21.downcasted0 (extract  15 0 %15.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
(define %22 (concat result r))
%22)
(define-symbolic r_vshrn_high_n_s32 (bitvector 64))
(define-symbolic a_vshrn_high_n_s32 (bitvector 128))
(define-symbolic n_vshrn_high_n_s32 (bitvector 32))
(verify (assert (equal? (vshrn_high_n_s32.check r_vshrn_high_n_s32 a_vshrn_high_n_s32 n_vshrn_high_n_s32 ) (vshrn_high_n_s32 r_vshrn_high_n_s32 a_vshrn_high_n_s32 n_vshrn_high_n_s32 ))))
(display "vshrn_high_n_s32" (current-error-port))
(define (vshrn_high_n_s64.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %10 (+  e0.new  63))
  (define %12 (extract  %10 e0.new a))
  (define %15.downcasted0 (bvlshr  %12  %1.downcasted0))
  (define %21.downcasted0 (extract  31 0 %15.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
(define %22 (concat result r))
%22)
(define-symbolic r_vshrn_high_n_s64 (bitvector 64))
(define-symbolic a_vshrn_high_n_s64 (bitvector 128))
(define-symbolic n_vshrn_high_n_s64 (bitvector 32))
(verify (assert (equal? (vshrn_high_n_s64.check r_vshrn_high_n_s64 a_vshrn_high_n_s64 n_vshrn_high_n_s64 ) (vshrn_high_n_s64 r_vshrn_high_n_s64 a_vshrn_high_n_s64 n_vshrn_high_n_s64 ))))
(display "vshrn_high_n_s64" (current-error-port))
(define (vshrn_high_n_u16.check  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %10 (+  e0.new  15))
  (define %12 (extract  %10 e0.new a))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 32)))
  (define %15.downcasted0 (bvlshr  %13.downcasted0  n))
  (define %21.downcasted0 (extract  7 0 %15.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
(define %22 (concat result r))
%22)
(define-symbolic r_vshrn_high_n_u16 (bitvector 64))
(define-symbolic a_vshrn_high_n_u16 (bitvector 128))
(define-symbolic n_vshrn_high_n_u16 (bitvector 32))
(verify (assert (equal? (vshrn_high_n_u16.check r_vshrn_high_n_u16 a_vshrn_high_n_u16 n_vshrn_high_n_u16 ) (vshrn_high_n_u16 r_vshrn_high_n_u16 a_vshrn_high_n_u16 n_vshrn_high_n_u16 ))))
(display "vshrn_high_n_u16" (current-error-port))
(define (vshrn_high_n_u32.check  r a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %10 (+  e0.new  31))
  (define %12 (extract  %10 e0.new a))
  (define %15.downcasted0 (bvlshr  %12  n))
  (define %21.downcasted0 (extract  15 0 %15.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
(define %22 (concat result r))
%22)
(define-symbolic r_vshrn_high_n_u32 (bitvector 64))
(define-symbolic a_vshrn_high_n_u32 (bitvector 128))
(define-symbolic n_vshrn_high_n_u32 (bitvector 32))
(verify (assert (equal? (vshrn_high_n_u32.check r_vshrn_high_n_u32 a_vshrn_high_n_u32 n_vshrn_high_n_u32 ) (vshrn_high_n_u32 r_vshrn_high_n_u32 a_vshrn_high_n_u32 n_vshrn_high_n_u32 ))))
(display "vshrn_high_n_u32" (current-error-port))
(define (vshrn_high_n_u64.check  r a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %10 (+  e0.new  63))
  (define %12 (extract  %10 e0.new a))
  (define %15.downcasted0 (bvlshr  %12  %1.downcasted0))
  (define %21.downcasted0 (extract  31 0 %15.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
(define %22 (concat result r))
%22)
(define-symbolic r_vshrn_high_n_u64 (bitvector 64))
(define-symbolic a_vshrn_high_n_u64 (bitvector 128))
(define-symbolic n_vshrn_high_n_u64 (bitvector 32))
(verify (assert (equal? (vshrn_high_n_u64.check r_vshrn_high_n_u64 a_vshrn_high_n_u64 n_vshrn_high_n_u64 ) (vshrn_high_n_u64 r_vshrn_high_n_u64 a_vshrn_high_n_u64 n_vshrn_high_n_u64 ))))
(display "vshrn_high_n_u64" (current-error-port))
(define (vshrn_n_s16.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  15))
  (define %12 (extract  %10 %5.new0 a))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 32)))
  (define %15.downcasted0 (bvlshr  %13.downcasted0  n))
  (define %21.downcasted0 (extract  7 0 %15.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshrn_n_s16 (bitvector 128))
(define-symbolic n_vshrn_n_s16 (bitvector 32))
(verify (assert (equal? (vshrn_n_s16.check a_vshrn_n_s16 n_vshrn_n_s16 ) (vshrn_n_s16 a_vshrn_n_s16 n_vshrn_n_s16 ))))
(display "vshrn_n_s16" (current-error-port))
(define (vshrn_n_s32.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  31))
  (define %12 (extract  %10 %5.new0 a))
  (define %15.downcasted0 (bvlshr  %12  n))
  (define %21.downcasted0 (extract  15 0 %15.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshrn_n_s32 (bitvector 128))
(define-symbolic n_vshrn_n_s32 (bitvector 32))
(verify (assert (equal? (vshrn_n_s32.check a_vshrn_n_s32 n_vshrn_n_s32 ) (vshrn_n_s32 a_vshrn_n_s32 n_vshrn_n_s32 ))))
(display "vshrn_n_s32" (current-error-port))
(define (vshrn_n_s64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  63))
  (define %12 (extract  %10 %5.new0 a))
  (define %15.downcasted0 (bvlshr  %12  %1.downcasted0))
  (define %21.downcasted0 (extract  31 0 %15.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshrn_n_s64 (bitvector 128))
(define-symbolic n_vshrn_n_s64 (bitvector 32))
(verify (assert (equal? (vshrn_n_s64.check a_vshrn_n_s64 n_vshrn_n_s64 ) (vshrn_n_s64 a_vshrn_n_s64 n_vshrn_n_s64 ))))
(display "vshrn_n_s64" (current-error-port))
(define (vshrn_n_u16.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  15))
  (define %12 (extract  %10 %5.new0 a))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 32)))
  (define %15.downcasted0 (bvlshr  %13.downcasted0  n))
  (define %21.downcasted0 (extract  7 0 %15.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshrn_n_u16 (bitvector 128))
(define-symbolic n_vshrn_n_u16 (bitvector 32))
(verify (assert (equal? (vshrn_n_u16.check a_vshrn_n_u16 n_vshrn_n_u16 ) (vshrn_n_u16 a_vshrn_n_u16 n_vshrn_n_u16 ))))
(display "vshrn_n_u16" (current-error-port))
(define (vshrn_n_u32.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  31))
  (define %12 (extract  %10 %5.new0 a))
  (define %15.downcasted0 (bvlshr  %12  n))
  (define %21.downcasted0 (extract  15 0 %15.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshrn_n_u32 (bitvector 128))
(define-symbolic n_vshrn_n_u32 (bitvector 32))
(verify (assert (equal? (vshrn_n_u32.check a_vshrn_n_u32 n_vshrn_n_u32 ) (vshrn_n_u32 a_vshrn_n_u32 n_vshrn_n_u32 ))))
(display "vshrn_n_u32" (current-error-port))
(define (vshrn_n_u64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %5.new0 (*  e0.new  2))
  (define %10 (+  %5.new0  63))
  (define %12 (extract  %10 %5.new0 a))
  (define %15.downcasted0 (bvlshr  %12  %1.downcasted0))
  (define %21.downcasted0 (extract  31 0 %15.downcasted0))
  %21.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vshrn_n_u64 (bitvector 128))
(define-symbolic n_vshrn_n_u64 (bitvector 32))
(verify (assert (equal? (vshrn_n_u64.check a_vshrn_n_u64 n_vshrn_n_u64 ) (vshrn_n_u64 a_vshrn_n_u64 n_vshrn_n_u64 ))))
(display "vshrn_n_u64" (current-error-port))
(define (vshrq_n_s16.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 32)))
  (define %11.downcasted0 (bvashr  %9.downcasted0  n))
  (define %22.downcasted0 (extract  15 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 16)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshrq_n_s16 (bitvector 128))
(define-symbolic n_vshrq_n_s16 (bitvector 32))
(verify (assert (equal? (vshrq_n_s16.check a_vshrq_n_s16 n_vshrq_n_s16 ) (vshrq_n_s16 a_vshrq_n_s16 n_vshrq_n_s16 ))))
(display "vshrq_n_s16" (current-error-port))
(define (vshrq_n_s32.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new a))
  (define %11.downcasted0 (bvashr  %8  n))
  (define %22.downcasted0 (extract  31 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 32)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshrq_n_s32 (bitvector 128))
(define-symbolic n_vshrq_n_s32 (bitvector 32))
(verify (assert (equal? (vshrq_n_s32.check a_vshrq_n_s32 n_vshrq_n_s32 ) (vshrq_n_s32 a_vshrq_n_s32 n_vshrq_n_s32 ))))
(display "vshrq_n_s32" (current-error-port))
(define (vshrq_n_s64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new a))
  (define %11.downcasted0 (bvashr  %8  %1.downcasted0))
  (define %22.downcasted0 (extract  63 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 64)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshrq_n_s64 (bitvector 128))
(define-symbolic n_vshrq_n_s64 (bitvector 32))
(verify (assert (equal? (vshrq_n_s64.check a_vshrq_n_s64 n_vshrq_n_s64 ) (vshrq_n_s64 a_vshrq_n_s64 n_vshrq_n_s64 ))))
(display "vshrq_n_s64" (current-error-port))
(define (vshrq_n_s8.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %7 (+  e0.new  7))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (sign-extend  %8 (bitvector 32)))
  (define %11.downcasted0 (bvashr  %9.downcasted0  n))
  (define %22.downcasted0 (extract  7 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 8)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshrq_n_s8 (bitvector 128))
(define-symbolic n_vshrq_n_s8 (bitvector 32))
(verify (assert (equal? (vshrq_n_s8.check a_vshrq_n_s8 n_vshrq_n_s8 ) (vshrq_n_s8 a_vshrq_n_s8 n_vshrq_n_s8 ))))
(display "vshrq_n_s8" (current-error-port))
(define (vshrq_n_u16.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %7 (+  e0.new  15))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 32)))
  (define %11.downcasted0 (bvlshr  %9.downcasted0  n))
  (define %22.downcasted0 (extract  15 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 16)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshrq_n_u16 (bitvector 128))
(define-symbolic n_vshrq_n_u16 (bitvector 32))
(verify (assert (equal? (vshrq_n_u16.check a_vshrq_n_u16 n_vshrq_n_u16 ) (vshrq_n_u16 a_vshrq_n_u16 n_vshrq_n_u16 ))))
(display "vshrq_n_u16" (current-error-port))
(define (vshrq_n_u32.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %7 (+  e0.new  31))
  (define %8 (extract  %7 e0.new a))
  (define %11.downcasted0 (bvlshr  %8  n))
  (define %22.downcasted0 (extract  31 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 32)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshrq_n_u32 (bitvector 128))
(define-symbolic n_vshrq_n_u32 (bitvector 32))
(verify (assert (equal? (vshrq_n_u32.check a_vshrq_n_u32 n_vshrq_n_u32 ) (vshrq_n_u32 a_vshrq_n_u32 n_vshrq_n_u32 ))))
(display "vshrq_n_u32" (current-error-port))
(define (vshrq_n_u64.check  a n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %7 (+  e0.new  63))
  (define %8 (extract  %7 e0.new a))
  (define %11.downcasted0 (bvlshr  %8  %1.downcasted0))
  (define %22.downcasted0 (extract  63 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 64)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshrq_n_u64 (bitvector 128))
(define-symbolic n_vshrq_n_u64 (bitvector 32))
(verify (assert (equal? (vshrq_n_u64.check a_vshrq_n_u64 n_vshrq_n_u64 ) (vshrq_n_u64 a_vshrq_n_u64 n_vshrq_n_u64 ))))
(display "vshrq_n_u64" (current-error-port))
(define (vshrq_n_u8.check  a n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %7 (+  e0.new  7))
  (define %8 (extract  %7 e0.new a))
  (define %9.downcasted0 (zero-extend  %8 (bitvector 32)))
  (define %11.downcasted0 (bvlshr  %9.downcasted0  n))
  (define %22.downcasted0 (extract  7 0 %11.downcasted0))
  (define %23 (bvadd  (bv 0 8)  %22.downcasted0))
  %23
 )
 )
)
)
)
result)
(define-symbolic a_vshrq_n_u8 (bitvector 128))
(define-symbolic n_vshrq_n_u8 (bitvector 32))
(verify (assert (equal? (vshrq_n_u8.check a_vshrq_n_u8 n_vshrq_n_u8 ) (vshrq_n_u8 a_vshrq_n_u8 n_vshrq_n_u8 ))))
(display "vshrq_n_u8" (current-error-port))
(define (vsqadd_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnuw  %5  %12 16))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsqadd_u16 (bitvector 64))
(define-symbolic b_vsqadd_u16 (bitvector 64))
(verify (assert (equal? (vsqadd_u16.check a_vsqadd_u16 b_vsqadd_u16 ) (vsqadd_u16 a_vsqadd_u16 b_vsqadd_u16 ))))
(display "vsqadd_u16" (current-error-port))
(define (vsqadd_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnuw  %5  %12 32))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsqadd_u32 (bitvector 64))
(define-symbolic b_vsqadd_u32 (bitvector 64))
(verify (assert (equal? (vsqadd_u32.check a_vsqadd_u32 b_vsqadd_u32 ) (vsqadd_u32 a_vsqadd_u32 b_vsqadd_u32 ))))
(display "vsqadd_u32" (current-error-port))
(define (vsqadd_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnuw  %5  %12 64))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsqadd_u64 (bitvector 64))
(define-symbolic b_vsqadd_u64 (bitvector 64))
(verify (assert (equal? (vsqadd_u64.check a_vsqadd_u64 b_vsqadd_u64 ) (vsqadd_u64 a_vsqadd_u64 b_vsqadd_u64 ))))
(display "vsqadd_u64" (current-error-port))
(define (vsqadd_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnuw  %5  %12 8))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsqadd_u8 (bitvector 64))
(define-symbolic b_vsqadd_u8 (bitvector 64))
(verify (assert (equal? (vsqadd_u8.check a_vsqadd_u8 b_vsqadd_u8 ) (vsqadd_u8 a_vsqadd_u8 b_vsqadd_u8 ))))
(display "vsqadd_u8" (current-error-port))
(define (vsqaddb_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnuw  %5  %12 8))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsqaddb_u8 (bitvector 8))
(define-symbolic b_vsqaddb_u8 (bitvector 8))
(verify (assert (equal? (vsqaddb_u8.check a_vsqaddb_u8 b_vsqaddb_u8 ) (vsqaddb_u8 a_vsqaddb_u8 b_vsqaddb_u8 ))))
(display "vsqaddb_u8" (current-error-port))
(define (vsqaddd_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnuw  %5  %12 64))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsqaddd_u64 (bitvector 64))
(define-symbolic b_vsqaddd_u64 (bitvector 64))
(verify (assert (equal? (vsqaddd_u64.check a_vsqaddd_u64 b_vsqaddd_u64 ) (vsqaddd_u64 a_vsqaddd_u64 b_vsqaddd_u64 ))))
(display "vsqaddd_u64" (current-error-port))
(define (vsqaddh_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnuw  %5  %12 16))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsqaddh_u16 (bitvector 16))
(define-symbolic b_vsqaddh_u16 (bitvector 16))
(verify (assert (equal? (vsqaddh_u16.check a_vsqaddh_u16 b_vsqaddh_u16 ) (vsqaddh_u16 a_vsqaddh_u16 b_vsqaddh_u16 ))))
(display "vsqaddh_u16" (current-error-port))
(define (vsqaddq_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnuw  %5  %12 16))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsqaddq_u16 (bitvector 128))
(define-symbolic b_vsqaddq_u16 (bitvector 128))
(verify (assert (equal? (vsqaddq_u16.check a_vsqaddq_u16 b_vsqaddq_u16 ) (vsqaddq_u16 a_vsqaddq_u16 b_vsqaddq_u16 ))))
(display "vsqaddq_u16" (current-error-port))
(define (vsqaddq_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnuw  %5  %12 32))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsqaddq_u32 (bitvector 128))
(define-symbolic b_vsqaddq_u32 (bitvector 128))
(verify (assert (equal? (vsqaddq_u32.check a_vsqaddq_u32 b_vsqaddq_u32 ) (vsqaddq_u32 a_vsqaddq_u32 b_vsqaddq_u32 ))))
(display "vsqaddq_u32" (current-error-port))
(define (vsqaddq_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnuw  %5  %12 64))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsqaddq_u64 (bitvector 128))
(define-symbolic b_vsqaddq_u64 (bitvector 128))
(verify (assert (equal? (vsqaddq_u64.check a_vsqaddq_u64 b_vsqaddq_u64 ) (vsqaddq_u64 a_vsqaddq_u64 b_vsqaddq_u64 ))))
(display "vsqaddq_u64" (current-error-port))
(define (vsqaddq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnuw  %5  %12 8))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsqaddq_u8 (bitvector 128))
(define-symbolic b_vsqaddq_u8 (bitvector 128))
(verify (assert (equal? (vsqaddq_u8.check a_vsqaddq_u8 b_vsqaddq_u8 ) (vsqaddq_u8 a_vsqaddq_u8 b_vsqaddq_u8 ))))
(display "vsqaddq_u8" (current-error-port))
(define (vsqadds_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnuw  %5  %12 32))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsqadds_u32 (bitvector 32))
(define-symbolic b_vsqadds_u32 (bitvector 32))
(verify (assert (equal? (vsqadds_u32.check a_vsqadds_u32 b_vsqadds_u32 ) (vsqadds_u32 a_vsqadds_u32 b_vsqadds_u32 ))))
(display "vsqadds_u32" (current-error-port))
(define (vsra_n_s16.check  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  15 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsra_n_s16 (bitvector 64))
(define-symbolic b_vsra_n_s16 (bitvector 64))
(define-symbolic n_vsra_n_s16 (bitvector 32))
(verify (assert (equal? (vsra_n_s16.check a_vsra_n_s16 b_vsra_n_s16 n_vsra_n_s16 ) (vsra_n_s16 a_vsra_n_s16 b_vsra_n_s16 n_vsra_n_s16 ))))
(display "vsra_n_s16" (current-error-port))
(define (vsra_n_s32.check  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvashr  %7  n))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  31 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsra_n_s32 (bitvector 64))
(define-symbolic b_vsra_n_s32 (bitvector 64))
(define-symbolic n_vsra_n_s32 (bitvector 32))
(verify (assert (equal? (vsra_n_s32.check a_vsra_n_s32 b_vsra_n_s32 n_vsra_n_s32 ) (vsra_n_s32 a_vsra_n_s32 b_vsra_n_s32 n_vsra_n_s32 ))))
(display "vsra_n_s32" (current-error-port))
(define (vsra_n_s64.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvashr  %7  %1.downcasted0))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  63 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsra_n_s64 (bitvector 64))
(define-symbolic b_vsra_n_s64 (bitvector 64))
(define-symbolic n_vsra_n_s64 (bitvector 32))
(verify (assert (equal? (vsra_n_s64.check a_vsra_n_s64 b_vsra_n_s64 n_vsra_n_s64 ) (vsra_n_s64 a_vsra_n_s64 b_vsra_n_s64 n_vsra_n_s64 ))))
(display "vsra_n_s64" (current-error-port))
(define (vsra_n_s8.check  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %6 (+  e0.new  7))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  7 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsra_n_s8 (bitvector 64))
(define-symbolic b_vsra_n_s8 (bitvector 64))
(define-symbolic n_vsra_n_s8 (bitvector 32))
(verify (assert (equal? (vsra_n_s8.check a_vsra_n_s8 b_vsra_n_s8 n_vsra_n_s8 ) (vsra_n_s8 a_vsra_n_s8 b_vsra_n_s8 n_vsra_n_s8 ))))
(display "vsra_n_s8" (current-error-port))
(define (vsra_n_u16.check  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 32)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  15 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsra_n_u16 (bitvector 64))
(define-symbolic b_vsra_n_u16 (bitvector 64))
(define-symbolic n_vsra_n_u16 (bitvector 32))
(verify (assert (equal? (vsra_n_u16.check a_vsra_n_u16 b_vsra_n_u16 n_vsra_n_u16 ) (vsra_n_u16 a_vsra_n_u16 b_vsra_n_u16 n_vsra_n_u16 ))))
(display "vsra_n_u16" (current-error-port))
(define (vsra_n_u32.check  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvlshr  %7  n))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  31 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsra_n_u32 (bitvector 64))
(define-symbolic b_vsra_n_u32 (bitvector 64))
(define-symbolic n_vsra_n_u32 (bitvector 32))
(verify (assert (equal? (vsra_n_u32.check a_vsra_n_u32 b_vsra_n_u32 n_vsra_n_u32 ) (vsra_n_u32 a_vsra_n_u32 b_vsra_n_u32 n_vsra_n_u32 ))))
(display "vsra_n_u32" (current-error-port))
(define (vsra_n_u64.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvlshr  %7  %1.downcasted0))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  63 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsra_n_u64 (bitvector 64))
(define-symbolic b_vsra_n_u64 (bitvector 64))
(define-symbolic n_vsra_n_u64 (bitvector 32))
(verify (assert (equal? (vsra_n_u64.check a_vsra_n_u64 b_vsra_n_u64 n_vsra_n_u64 ) (vsra_n_u64 a_vsra_n_u64 b_vsra_n_u64 n_vsra_n_u64 ))))
(display "vsra_n_u64" (current-error-port))
(define (vsra_n_u8.check  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %6 (+  e0.new  7))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 32)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  7 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsra_n_u8 (bitvector 64))
(define-symbolic b_vsra_n_u8 (bitvector 64))
(define-symbolic n_vsra_n_u8 (bitvector 32))
(verify (assert (equal? (vsra_n_u8.check a_vsra_n_u8 b_vsra_n_u8 n_vsra_n_u8 ) (vsra_n_u8 a_vsra_n_u8 b_vsra_n_u8 n_vsra_n_u8 ))))
(display "vsra_n_u8" (current-error-port))
(define (vsrad_n_s64.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvashr  %7  %1.downcasted0))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  63 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsrad_n_s64 (bitvector 64))
(define-symbolic b_vsrad_n_s64 (bitvector 64))
(define-symbolic n_vsrad_n_s64 (bitvector 32))
(verify (assert (equal? (vsrad_n_s64.check a_vsrad_n_s64 b_vsrad_n_s64 n_vsrad_n_s64 ) (vsrad_n_s64 a_vsrad_n_s64 b_vsrad_n_s64 n_vsrad_n_s64 ))))
(display "vsrad_n_s64" (current-error-port))
(define (vsrad_n_u64.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvlshr  %7  %1.downcasted0))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  63 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsrad_n_u64 (bitvector 64))
(define-symbolic b_vsrad_n_u64 (bitvector 64))
(define-symbolic n_vsrad_n_u64 (bitvector 32))
(verify (assert (equal? (vsrad_n_u64.check a_vsrad_n_u64 b_vsrad_n_u64 n_vsrad_n_u64 ) (vsrad_n_u64 a_vsrad_n_u64 b_vsrad_n_u64 n_vsrad_n_u64 ))))
(display "vsrad_n_u64" (current-error-port))
(define (vsraq_n_s16.check  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  15 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsraq_n_s16 (bitvector 128))
(define-symbolic b_vsraq_n_s16 (bitvector 128))
(define-symbolic n_vsraq_n_s16 (bitvector 32))
(verify (assert (equal? (vsraq_n_s16.check a_vsraq_n_s16 b_vsraq_n_s16 n_vsraq_n_s16 ) (vsraq_n_s16 a_vsraq_n_s16 b_vsraq_n_s16 n_vsraq_n_s16 ))))
(display "vsraq_n_s16" (current-error-port))
(define (vsraq_n_s32.check  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvashr  %7  n))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  31 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsraq_n_s32 (bitvector 128))
(define-symbolic b_vsraq_n_s32 (bitvector 128))
(define-symbolic n_vsraq_n_s32 (bitvector 32))
(verify (assert (equal? (vsraq_n_s32.check a_vsraq_n_s32 b_vsraq_n_s32 n_vsraq_n_s32 ) (vsraq_n_s32 a_vsraq_n_s32 b_vsraq_n_s32 n_vsraq_n_s32 ))))
(display "vsraq_n_s32" (current-error-port))
(define (vsraq_n_s64.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvashr  %7  %1.downcasted0))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  63 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsraq_n_s64 (bitvector 128))
(define-symbolic b_vsraq_n_s64 (bitvector 128))
(define-symbolic n_vsraq_n_s64 (bitvector 32))
(verify (assert (equal? (vsraq_n_s64.check a_vsraq_n_s64 b_vsraq_n_s64 n_vsraq_n_s64 ) (vsraq_n_s64 a_vsraq_n_s64 b_vsraq_n_s64 n_vsraq_n_s64 ))))
(display "vsraq_n_s64" (current-error-port))
(define (vsraq_n_s8.check  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %6 (+  e0.new  7))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (sign-extend  %7 (bitvector 32)))
  (define %10.downcasted0 (bvashr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  7 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsraq_n_s8 (bitvector 128))
(define-symbolic b_vsraq_n_s8 (bitvector 128))
(define-symbolic n_vsraq_n_s8 (bitvector 32))
(verify (assert (equal? (vsraq_n_s8.check a_vsraq_n_s8 b_vsraq_n_s8 n_vsraq_n_s8 ) (vsraq_n_s8 a_vsraq_n_s8 b_vsraq_n_s8 n_vsraq_n_s8 ))))
(display "vsraq_n_s8" (current-error-port))
(define (vsraq_n_u16.check  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %6 (+  e0.new  15))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 32)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  15 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsraq_n_u16 (bitvector 128))
(define-symbolic b_vsraq_n_u16 (bitvector 128))
(define-symbolic n_vsraq_n_u16 (bitvector 32))
(verify (assert (equal? (vsraq_n_u16.check a_vsraq_n_u16 b_vsraq_n_u16 n_vsraq_n_u16 ) (vsraq_n_u16 a_vsraq_n_u16 b_vsraq_n_u16 n_vsraq_n_u16 ))))
(display "vsraq_n_u16" (current-error-port))
(define (vsraq_n_u32.check  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %6 (+  e0.new  31))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvlshr  %7  n))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  31 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsraq_n_u32 (bitvector 128))
(define-symbolic b_vsraq_n_u32 (bitvector 128))
(define-symbolic n_vsraq_n_u32 (bitvector 32))
(verify (assert (equal? (vsraq_n_u32.check a_vsraq_n_u32 b_vsraq_n_u32 n_vsraq_n_u32 ) (vsraq_n_u32 a_vsraq_n_u32 b_vsraq_n_u32 n_vsraq_n_u32 ))))
(display "vsraq_n_u32" (current-error-port))
(define (vsraq_n_u64.check  a b n )
(define %1.downcasted0 (zero-extend  n (bitvector 64)))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %6 (+  e0.new  63))
  (define %7 (extract  %6 e0.new b))
  (define %10.downcasted0 (bvlshr  %7  %1.downcasted0))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  63 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsraq_n_u64 (bitvector 128))
(define-symbolic b_vsraq_n_u64 (bitvector 128))
(define-symbolic n_vsraq_n_u64 (bitvector 32))
(verify (assert (equal? (vsraq_n_u64.check a_vsraq_n_u64 b_vsraq_n_u64 n_vsraq_n_u64 ) (vsraq_n_u64 a_vsraq_n_u64 b_vsraq_n_u64 n_vsraq_n_u64 ))))
(display "vsraq_n_u64" (current-error-port))
(define (vsraq_n_u8.check  a b n )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %6 (+  e0.new  7))
  (define %7 (extract  %6 e0.new b))
  (define %8.downcasted0 (zero-extend  %7 (bitvector 32)))
  (define %10.downcasted0 (bvlshr  %8.downcasted0  n))
  (define %19 (extract  %6 e0.new a))
  (define %21.downcasted0 (extract  7 0 %10.downcasted0))
  (define %22 (bvadd  %19  %21.downcasted0))
  %22
 )
 )
)
)
)
result)
(define-symbolic a_vsraq_n_u8 (bitvector 128))
(define-symbolic b_vsraq_n_u8 (bitvector 128))
(define-symbolic n_vsraq_n_u8 (bitvector 32))
(verify (assert (equal? (vsraq_n_u8.check a_vsraq_n_u8 b_vsraq_n_u8 n_vsraq_n_u8 ) (vsraq_n_u8 a_vsraq_n_u8 b_vsraq_n_u8 n_vsraq_n_u8 ))))
(display "vsraq_n_u8" (current-error-port))
(define (vsub_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsub_s16 (bitvector 64))
(define-symbolic b_vsub_s16 (bitvector 64))
(verify (assert (equal? (vsub_s16.check a_vsub_s16 b_vsub_s16 ) (vsub_s16 a_vsub_s16 b_vsub_s16 ))))
(display "vsub_s16" (current-error-port))
(define (vsub_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsub_s32 (bitvector 64))
(define-symbolic b_vsub_s32 (bitvector 64))
(verify (assert (equal? (vsub_s32.check a_vsub_s32 b_vsub_s32 ) (vsub_s32 a_vsub_s32 b_vsub_s32 ))))
(display "vsub_s32" (current-error-port))
(define (vsub_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsub_s64 (bitvector 64))
(define-symbolic b_vsub_s64 (bitvector 64))
(verify (assert (equal? (vsub_s64.check a_vsub_s64 b_vsub_s64 ) (vsub_s64 a_vsub_s64 b_vsub_s64 ))))
(display "vsub_s64" (current-error-port))
(define (vsub_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsub_s8 (bitvector 64))
(define-symbolic b_vsub_s8 (bitvector 64))
(verify (assert (equal? (vsub_s8.check a_vsub_s8 b_vsub_s8 ) (vsub_s8 a_vsub_s8 b_vsub_s8 ))))
(display "vsub_s8" (current-error-port))
(define (vsub_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsub_u16 (bitvector 64))
(define-symbolic b_vsub_u16 (bitvector 64))
(verify (assert (equal? (vsub_u16.check a_vsub_u16 b_vsub_u16 ) (vsub_u16 a_vsub_u16 b_vsub_u16 ))))
(display "vsub_u16" (current-error-port))
(define (vsub_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsub_u32 (bitvector 64))
(define-symbolic b_vsub_u32 (bitvector 64))
(verify (assert (equal? (vsub_u32.check a_vsub_u32 b_vsub_u32 ) (vsub_u32 a_vsub_u32 b_vsub_u32 ))))
(display "vsub_u32" (current-error-port))
(define (vsub_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsub_u64 (bitvector 64))
(define-symbolic b_vsub_u64 (bitvector 64))
(verify (assert (equal? (vsub_u64.check a_vsub_u64 b_vsub_u64 ) (vsub_u64 a_vsub_u64 b_vsub_u64 ))))
(display "vsub_u64" (current-error-port))
(define (vsub_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsub_u8 (bitvector 64))
(define-symbolic b_vsub_u8 (bitvector 64))
(verify (assert (equal? (vsub_u8.check a_vsub_u8 b_vsub_u8 ) (vsub_u8 a_vsub_u8 b_vsub_u8 ))))
(display "vsub_u8" (current-error-port))
(define (vsubd_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsubd_s64 (bitvector 64))
(define-symbolic b_vsubd_s64 (bitvector 64))
(verify (assert (equal? (vsubd_s64.check a_vsubd_s64 b_vsubd_s64 ) (vsubd_s64 a_vsubd_s64 b_vsubd_s64 ))))
(display "vsubd_s64" (current-error-port))
(define (vsubd_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsubd_u64 (bitvector 64))
(define-symbolic b_vsubd_u64 (bitvector 64))
(verify (assert (equal? (vsubd_u64.check a_vsubd_u64 b_vsubd_u64 ) (vsubd_u64 a_vsubd_u64 b_vsubd_u64 ))))
(display "vsubd_u64" (current-error-port))
(define (vsubhn_high_s16.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %12 (+  e0.new  15))
  (define %14 (extract  %12 e0.new a))
  (define %23 (extract  %12 e0.new b))
  (define %24 (bvsub  %14  %23))
  (define %32 (extract  15 8 %24))
  %32
 )
 )
)
)
)
(define %33 (concat result r))
%33)
(define-symbolic r_vsubhn_high_s16 (bitvector 64))
(define-symbolic a_vsubhn_high_s16 (bitvector 128))
(define-symbolic b_vsubhn_high_s16 (bitvector 128))
(verify (assert (equal? (vsubhn_high_s16.check r_vsubhn_high_s16 a_vsubhn_high_s16 b_vsubhn_high_s16 ) (vsubhn_high_s16 r_vsubhn_high_s16 a_vsubhn_high_s16 b_vsubhn_high_s16 ))))
(display "vsubhn_high_s16" (current-error-port))
(define (vsubhn_high_s32.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %12 (+  e0.new  31))
  (define %14 (extract  %12 e0.new a))
  (define %23 (extract  %12 e0.new b))
  (define %24 (bvsub  %14  %23))
  (define %32 (extract  31 16 %24))
  %32
 )
 )
)
)
)
(define %33 (concat result r))
%33)
(define-symbolic r_vsubhn_high_s32 (bitvector 64))
(define-symbolic a_vsubhn_high_s32 (bitvector 128))
(define-symbolic b_vsubhn_high_s32 (bitvector 128))
(verify (assert (equal? (vsubhn_high_s32.check r_vsubhn_high_s32 a_vsubhn_high_s32 b_vsubhn_high_s32 ) (vsubhn_high_s32 r_vsubhn_high_s32 a_vsubhn_high_s32 b_vsubhn_high_s32 ))))
(display "vsubhn_high_s32" (current-error-port))
(define (vsubhn_high_s64.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %12 (+  e0.new  63))
  (define %14 (extract  %12 e0.new a))
  (define %23 (extract  %12 e0.new b))
  (define %24 (bvsub  %14  %23))
  (define %32 (extract  63 32 %24))
  %32
 )
 )
)
)
)
(define %33 (concat result r))
%33)
(define-symbolic r_vsubhn_high_s64 (bitvector 64))
(define-symbolic a_vsubhn_high_s64 (bitvector 128))
(define-symbolic b_vsubhn_high_s64 (bitvector 128))
(verify (assert (equal? (vsubhn_high_s64.check r_vsubhn_high_s64 a_vsubhn_high_s64 b_vsubhn_high_s64 ) (vsubhn_high_s64 r_vsubhn_high_s64 a_vsubhn_high_s64 b_vsubhn_high_s64 ))))
(display "vsubhn_high_s64" (current-error-port))
(define (vsubhn_high_u16.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %12 (+  e0.new  15))
  (define %14 (extract  %12 e0.new a))
  (define %23 (extract  %12 e0.new b))
  (define %24 (bvsub  %14  %23))
  (define %32 (extract  15 8 %24))
  %32
 )
 )
)
)
)
(define %33 (concat result r))
%33)
(define-symbolic r_vsubhn_high_u16 (bitvector 64))
(define-symbolic a_vsubhn_high_u16 (bitvector 128))
(define-symbolic b_vsubhn_high_u16 (bitvector 128))
(verify (assert (equal? (vsubhn_high_u16.check r_vsubhn_high_u16 a_vsubhn_high_u16 b_vsubhn_high_u16 ) (vsubhn_high_u16 r_vsubhn_high_u16 a_vsubhn_high_u16 b_vsubhn_high_u16 ))))
(display "vsubhn_high_u16" (current-error-port))
(define (vsubhn_high_u32.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %12 (+  e0.new  31))
  (define %14 (extract  %12 e0.new a))
  (define %23 (extract  %12 e0.new b))
  (define %24 (bvsub  %14  %23))
  (define %32 (extract  31 16 %24))
  %32
 )
 )
)
)
)
(define %33 (concat result r))
%33)
(define-symbolic r_vsubhn_high_u32 (bitvector 64))
(define-symbolic a_vsubhn_high_u32 (bitvector 128))
(define-symbolic b_vsubhn_high_u32 (bitvector 128))
(verify (assert (equal? (vsubhn_high_u32.check r_vsubhn_high_u32 a_vsubhn_high_u32 b_vsubhn_high_u32 ) (vsubhn_high_u32 r_vsubhn_high_u32 a_vsubhn_high_u32 b_vsubhn_high_u32 ))))
(display "vsubhn_high_u32" (current-error-port))
(define (vsubhn_high_u64.check  r a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %12 (+  e0.new  63))
  (define %14 (extract  %12 e0.new a))
  (define %23 (extract  %12 e0.new b))
  (define %24 (bvsub  %14  %23))
  (define %32 (extract  63 32 %24))
  %32
 )
 )
)
)
)
(define %33 (concat result r))
%33)
(define-symbolic r_vsubhn_high_u64 (bitvector 64))
(define-symbolic a_vsubhn_high_u64 (bitvector 128))
(define-symbolic b_vsubhn_high_u64 (bitvector 128))
(verify (assert (equal? (vsubhn_high_u64.check r_vsubhn_high_u64 a_vsubhn_high_u64 b_vsubhn_high_u64 ) (vsubhn_high_u64 r_vsubhn_high_u64 a_vsubhn_high_u64 b_vsubhn_high_u64 ))))
(display "vsubhn_high_u64" (current-error-port))
(define (vsubhn_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  15))
  (define %14 (extract  %12 %7.new0 a))
  (define %23 (extract  %12 %7.new0 b))
  (define %24 (bvsub  %14  %23))
  (define %32 (extract  15 8 %24))
  %32
 )
 )
)
)
)
result)
(define-symbolic a_vsubhn_s16 (bitvector 128))
(define-symbolic b_vsubhn_s16 (bitvector 128))
(verify (assert (equal? (vsubhn_s16.check a_vsubhn_s16 b_vsubhn_s16 ) (vsubhn_s16 a_vsubhn_s16 b_vsubhn_s16 ))))
(display "vsubhn_s16" (current-error-port))
(define (vsubhn_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  31))
  (define %14 (extract  %12 %7.new0 a))
  (define %23 (extract  %12 %7.new0 b))
  (define %24 (bvsub  %14  %23))
  (define %32 (extract  31 16 %24))
  %32
 )
 )
)
)
)
result)
(define-symbolic a_vsubhn_s32 (bitvector 128))
(define-symbolic b_vsubhn_s32 (bitvector 128))
(verify (assert (equal? (vsubhn_s32.check a_vsubhn_s32 b_vsubhn_s32 ) (vsubhn_s32 a_vsubhn_s32 b_vsubhn_s32 ))))
(display "vsubhn_s32" (current-error-port))
(define (vsubhn_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  63))
  (define %14 (extract  %12 %7.new0 a))
  (define %23 (extract  %12 %7.new0 b))
  (define %24 (bvsub  %14  %23))
  (define %32 (extract  63 32 %24))
  %32
 )
 )
)
)
)
result)
(define-symbolic a_vsubhn_s64 (bitvector 128))
(define-symbolic b_vsubhn_s64 (bitvector 128))
(verify (assert (equal? (vsubhn_s64.check a_vsubhn_s64 b_vsubhn_s64 ) (vsubhn_s64 a_vsubhn_s64 b_vsubhn_s64 ))))
(display "vsubhn_s64" (current-error-port))
(define (vsubhn_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  15))
  (define %14 (extract  %12 %7.new0 a))
  (define %23 (extract  %12 %7.new0 b))
  (define %24 (bvsub  %14  %23))
  (define %32 (extract  15 8 %24))
  %32
 )
 )
)
)
)
result)
(define-symbolic a_vsubhn_u16 (bitvector 128))
(define-symbolic b_vsubhn_u16 (bitvector 128))
(verify (assert (equal? (vsubhn_u16.check a_vsubhn_u16 b_vsubhn_u16 ) (vsubhn_u16 a_vsubhn_u16 b_vsubhn_u16 ))))
(display "vsubhn_u16" (current-error-port))
(define (vsubhn_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  31))
  (define %14 (extract  %12 %7.new0 a))
  (define %23 (extract  %12 %7.new0 b))
  (define %24 (bvsub  %14  %23))
  (define %32 (extract  31 16 %24))
  %32
 )
 )
)
)
)
result)
(define-symbolic a_vsubhn_u32 (bitvector 128))
(define-symbolic b_vsubhn_u32 (bitvector 128))
(verify (assert (equal? (vsubhn_u32.check a_vsubhn_u32 b_vsubhn_u32 ) (vsubhn_u32 a_vsubhn_u32 b_vsubhn_u32 ))))
(display "vsubhn_u32" (current-error-port))
(define (vsubhn_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7.new0 (*  e0.new  2))
  (define %12 (+  %7.new0  63))
  (define %14 (extract  %12 %7.new0 a))
  (define %23 (extract  %12 %7.new0 b))
  (define %24 (bvsub  %14  %23))
  (define %32 (extract  63 32 %24))
  %32
 )
 )
)
)
)
result)
(define-symbolic a_vsubhn_u64 (bitvector 128))
(define-symbolic b_vsubhn_u64 (bitvector 128))
(verify (assert (equal? (vsubhn_u64.check a_vsubhn_u64 b_vsubhn_u64 ) (vsubhn_u64 a_vsubhn_u64 b_vsubhn_u64 ))))
(display "vsubhn_u64" (current-error-port))
(define (vsubl_high_s16.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  15))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 32)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (sign-extend  %18 (bitvector 32)))
  (define %20.downcasted0 (bvsub  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  31 0 %20.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubl_high_s16 (bitvector 128))
(define-symbolic b_vsubl_high_s16 (bitvector 128))
(verify (assert (equal? (vsubl_high_s16.check a_vsubl_high_s16 b_vsubl_high_s16 ) (vsubl_high_s16 a_vsubl_high_s16 b_vsubl_high_s16 ))))
(display "vsubl_high_s16" (current-error-port))
(define (vsubl_high_s32.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  31))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 64)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (sign-extend  %18 (bitvector 64)))
  (define %20.downcasted0 (bvsub  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  63 0 %20.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubl_high_s32 (bitvector 128))
(define-symbolic b_vsubl_high_s32 (bitvector 128))
(verify (assert (equal? (vsubl_high_s32.check a_vsubl_high_s32 b_vsubl_high_s32 ) (vsubl_high_s32 a_vsubl_high_s32 b_vsubl_high_s32 ))))
(display "vsubl_high_s32" (current-error-port))
(define (vsubl_high_s8.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  7))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 16)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (sign-extend  %18 (bitvector 16)))
  (define %20.downcasted0 (bvsub  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  15 0 %20.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubl_high_s8 (bitvector 128))
(define-symbolic b_vsubl_high_s8 (bitvector 128))
(verify (assert (equal? (vsubl_high_s8.check a_vsubl_high_s8 b_vsubl_high_s8 ) (vsubl_high_s8 a_vsubl_high_s8 b_vsubl_high_s8 ))))
(display "vsubl_high_s8" (current-error-port))
(define (vsubl_high_u16.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  15))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 32)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (zero-extend  %18 (bitvector 32)))
  (define %20.downcasted0 (bvsub  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  31 0 %20.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubl_high_u16 (bitvector 128))
(define-symbolic b_vsubl_high_u16 (bitvector 128))
(verify (assert (equal? (vsubl_high_u16.check a_vsubl_high_u16 b_vsubl_high_u16 ) (vsubl_high_u16 a_vsubl_high_u16 b_vsubl_high_u16 ))))
(display "vsubl_high_u16" (current-error-port))
(define (vsubl_high_u32.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  31))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 64)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (zero-extend  %18 (bitvector 64)))
  (define %20.downcasted0 (bvsub  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  63 0 %20.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubl_high_u32 (bitvector 128))
(define-symbolic b_vsubl_high_u32 (bitvector 128))
(verify (assert (equal? (vsubl_high_u32.check a_vsubl_high_u32 b_vsubl_high_u32 ) (vsubl_high_u32 a_vsubl_high_u32 b_vsubl_high_u32 ))))
(display "vsubl_high_u32" (current-error-port))
(define (vsubl_high_u8.check  a b )
(define %2 (extract  127 64 a))
(define %5 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %8.new0 (/  e0.new  2))
  (define %11 (+  %8.new0  7))
  (define %12 (extract  %11 %8.new0 %2))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 16)))
  (define %18 (extract  %11 %8.new0 %5))
  (define %19.downcasted0 (zero-extend  %18 (bitvector 16)))
  (define %20.downcasted0 (bvsub  %13.downcasted0  %19.downcasted0))
  (define %31.downcasted0 (extract  15 0 %20.downcasted0))
  %31.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubl_high_u8 (bitvector 128))
(define-symbolic b_vsubl_high_u8 (bitvector 128))
(verify (assert (equal? (vsubl_high_u8.check a_vsubl_high_u8 b_vsubl_high_u8 ) (vsubl_high_u8 a_vsubl_high_u8 b_vsubl_high_u8 ))))
(display "vsubl_high_u8" (current-error-port))
(define (vsubl_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 32)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 32)))
  (define %14.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  31 0 %14.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubl_s16 (bitvector 64))
(define-symbolic b_vsubl_s16 (bitvector 64))
(verify (assert (equal? (vsubl_s16.check a_vsubl_s16 b_vsubl_s16 ) (vsubl_s16 a_vsubl_s16 b_vsubl_s16 ))))
(display "vsubl_s16" (current-error-port))
(define (vsubl_s32.check  a b )
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
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 64)))
  (define %14.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  63 0 %14.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubl_s32 (bitvector 64))
(define-symbolic b_vsubl_s32 (bitvector 64))
(verify (assert (equal? (vsubl_s32.check a_vsubl_s32 b_vsubl_s32 ) (vsubl_s32 a_vsubl_s32 b_vsubl_s32 ))))
(display "vsubl_s32" (current-error-port))
(define (vsubl_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (sign-extend  %6 (bitvector 16)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (sign-extend  %12 (bitvector 16)))
  (define %14.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  15 0 %14.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubl_s8 (bitvector 64))
(define-symbolic b_vsubl_s8 (bitvector 64))
(verify (assert (equal? (vsubl_s8.check a_vsubl_s8 b_vsubl_s8 ) (vsubl_s8 a_vsubl_s8 b_vsubl_s8 ))))
(display "vsubl_s8" (current-error-port))
(define (vsubl_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %5 (+  e0.new  15))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 32)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 32)))
  (define %14.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  31 0 %14.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubl_u16 (bitvector 64))
(define-symbolic b_vsubl_u16 (bitvector 64))
(verify (assert (equal? (vsubl_u16.check a_vsubl_u16 b_vsubl_u16 ) (vsubl_u16 a_vsubl_u16 b_vsubl_u16 ))))
(display "vsubl_u16" (current-error-port))
(define (vsubl_u32.check  a b )
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
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 64)))
  (define %14.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  63 0 %14.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubl_u32 (bitvector 64))
(define-symbolic b_vsubl_u32 (bitvector 64))
(verify (assert (equal? (vsubl_u32.check a_vsubl_u32 b_vsubl_u32 ) (vsubl_u32 a_vsubl_u32 b_vsubl_u32 ))))
(display "vsubl_u32" (current-error-port))
(define (vsubl_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %5 (+  e0.new  7))
  (define %6 (extract  %5 e0.new a))
  (define %7.downcasted0 (zero-extend  %6 (bitvector 16)))
  (define %12 (extract  %5 e0.new b))
  (define %13.downcasted0 (zero-extend  %12 (bitvector 16)))
  (define %14.downcasted0 (bvsub  %7.downcasted0  %13.downcasted0))
  (define %25.downcasted0 (extract  15 0 %14.downcasted0))
  %25.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubl_u8 (bitvector 64))
(define-symbolic b_vsubl_u8 (bitvector 64))
(verify (assert (equal? (vsubl_u8.check a_vsubl_u8 b_vsubl_u8 ) (vsubl_u8 a_vsubl_u8 b_vsubl_u8 ))))
(display "vsubl_u8" (current-error-port))
(define (vsubq_s16.check  a b )
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
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsubq_s16 (bitvector 128))
(define-symbolic b_vsubq_s16 (bitvector 128))
(verify (assert (equal? (vsubq_s16.check a_vsubq_s16 b_vsubq_s16 ) (vsubq_s16 a_vsubq_s16 b_vsubq_s16 ))))
(display "vsubq_s16" (current-error-port))
(define (vsubq_s32.check  a b )
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
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsubq_s32 (bitvector 128))
(define-symbolic b_vsubq_s32 (bitvector 128))
(verify (assert (equal? (vsubq_s32.check a_vsubq_s32 b_vsubq_s32 ) (vsubq_s32 a_vsubq_s32 b_vsubq_s32 ))))
(display "vsubq_s32" (current-error-port))
(define (vsubq_s64.check  a b )
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
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsubq_s64 (bitvector 128))
(define-symbolic b_vsubq_s64 (bitvector 128))
(verify (assert (equal? (vsubq_s64.check a_vsubq_s64 b_vsubq_s64 ) (vsubq_s64 a_vsubq_s64 b_vsubq_s64 ))))
(display "vsubq_s64" (current-error-port))
(define (vsubq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsubq_s8 (bitvector 128))
(define-symbolic b_vsubq_s8 (bitvector 128))
(verify (assert (equal? (vsubq_s8.check a_vsubq_s8 b_vsubq_s8 ) (vsubq_s8 a_vsubq_s8 b_vsubq_s8 ))))
(display "vsubq_s8" (current-error-port))
(define (vsubq_u16.check  a b )
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
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsubq_u16 (bitvector 128))
(define-symbolic b_vsubq_u16 (bitvector 128))
(verify (assert (equal? (vsubq_u16.check a_vsubq_u16 b_vsubq_u16 ) (vsubq_u16 a_vsubq_u16 b_vsubq_u16 ))))
(display "vsubq_u16" (current-error-port))
(define (vsubq_u32.check  a b )
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
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsubq_u32 (bitvector 128))
(define-symbolic b_vsubq_u32 (bitvector 128))
(verify (assert (equal? (vsubq_u32.check a_vsubq_u32 b_vsubq_u32 ) (vsubq_u32 a_vsubq_u32 b_vsubq_u32 ))))
(display "vsubq_u32" (current-error-port))
(define (vsubq_u64.check  a b )
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
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsubq_u64 (bitvector 128))
(define-symbolic b_vsubq_u64 (bitvector 128))
(verify (assert (equal? (vsubq_u64.check a_vsubq_u64 b_vsubq_u64 ) (vsubq_u64 a_vsubq_u64 b_vsubq_u64 ))))
(display "vsubq_u64" (current-error-port))
(define (vsubq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %15 (bvsub  %5  %10))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vsubq_u8 (bitvector 128))
(define-symbolic b_vsubq_u8 (bitvector 128))
(verify (assert (equal? (vsubq_u8.check a_vsubq_u8 b_vsubq_u8 ) (vsubq_u8 a_vsubq_u8 b_vsubq_u8 ))))
(display "vsubq_u8" (current-error-port))
(define (vsubw_high_s16.check  a b )
(define %3 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %12 (+  e0.new  31))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 64)))
  (define %16.new0 (/  e0.new  2))
  (define %19 (+  %16.new0  15))
  (define %20 (extract  %19 %16.new0 %3))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 64)))
  (define %22.downcasted0 (bvsub  %15.downcasted0  %21.downcasted0))
  (define %33.downcasted0 (extract  31 0 %22.downcasted0))
  %33.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubw_high_s16 (bitvector 128))
(define-symbolic b_vsubw_high_s16 (bitvector 128))
(verify (assert (equal? (vsubw_high_s16.check a_vsubw_high_s16 b_vsubw_high_s16 ) (vsubw_high_s16 a_vsubw_high_s16 b_vsubw_high_s16 ))))
(display "vsubw_high_s16" (current-error-port))
(define (vsubw_high_s32.check  a b )
(define %3 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %12 (+  e0.new  63))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 128)))
  (define %16.new0 (/  e0.new  2))
  (define %19 (+  %16.new0  31))
  (define %20 (extract  %19 %16.new0 %3))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 128)))
  (define %22.downcasted0 (bvsub  %15.downcasted0  %21.downcasted0))
  (define %33.downcasted0 (extract  63 0 %22.downcasted0))
  %33.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubw_high_s32 (bitvector 128))
(define-symbolic b_vsubw_high_s32 (bitvector 128))
(verify (assert (equal? (vsubw_high_s32.check a_vsubw_high_s32 b_vsubw_high_s32 ) (vsubw_high_s32 a_vsubw_high_s32 b_vsubw_high_s32 ))))
(display "vsubw_high_s32" (current-error-port))
(define (vsubw_high_s8.check  a b )
(define %3 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %12 (+  e0.new  15))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (sign-extend  %14 (bitvector 32)))
  (define %16.new0 (/  e0.new  2))
  (define %19 (+  %16.new0  7))
  (define %20 (extract  %19 %16.new0 %3))
  (define %21.downcasted0 (sign-extend  %20 (bitvector 32)))
  (define %22.downcasted0 (bvsub  %15.downcasted0  %21.downcasted0))
  (define %33.downcasted0 (extract  15 0 %22.downcasted0))
  %33.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubw_high_s8 (bitvector 128))
(define-symbolic b_vsubw_high_s8 (bitvector 128))
(verify (assert (equal? (vsubw_high_s8.check a_vsubw_high_s8 b_vsubw_high_s8 ) (vsubw_high_s8 a_vsubw_high_s8 b_vsubw_high_s8 ))))
(display "vsubw_high_s8" (current-error-port))
(define (vsubw_high_u16.check  a b )
(define %3 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %12 (+  e0.new  31))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 64)))
  (define %16.new0 (/  e0.new  2))
  (define %19 (+  %16.new0  15))
  (define %20 (extract  %19 %16.new0 %3))
  (define %21.downcasted0 (zero-extend  %20 (bitvector 64)))
  (define %22.downcasted0 (bvsub  %15.downcasted0  %21.downcasted0))
  (define %33.downcasted0 (extract  31 0 %22.downcasted0))
  %33.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubw_high_u16 (bitvector 128))
(define-symbolic b_vsubw_high_u16 (bitvector 128))
(verify (assert (equal? (vsubw_high_u16.check a_vsubw_high_u16 b_vsubw_high_u16 ) (vsubw_high_u16 a_vsubw_high_u16 b_vsubw_high_u16 ))))
(display "vsubw_high_u16" (current-error-port))
(define (vsubw_high_u32.check  a b )
(define %3 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %12 (+  e0.new  63))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 128)))
  (define %16.new0 (/  e0.new  2))
  (define %19 (+  %16.new0  31))
  (define %20 (extract  %19 %16.new0 %3))
  (define %21.downcasted0 (zero-extend  %20 (bitvector 128)))
  (define %22.downcasted0 (bvsub  %15.downcasted0  %21.downcasted0))
  (define %33.downcasted0 (extract  63 0 %22.downcasted0))
  %33.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubw_high_u32 (bitvector 128))
(define-symbolic b_vsubw_high_u32 (bitvector 128))
(verify (assert (equal? (vsubw_high_u32.check a_vsubw_high_u32 b_vsubw_high_u32 ) (vsubw_high_u32 a_vsubw_high_u32 b_vsubw_high_u32 ))))
(display "vsubw_high_u32" (current-error-port))
(define (vsubw_high_u8.check  a b )
(define %3 (extract  127 64 b))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %12 (+  e0.new  15))
  (define %14 (extract  %12 e0.new a))
  (define %15.downcasted0 (zero-extend  %14 (bitvector 32)))
  (define %16.new0 (/  e0.new  2))
  (define %19 (+  %16.new0  7))
  (define %20 (extract  %19 %16.new0 %3))
  (define %21.downcasted0 (zero-extend  %20 (bitvector 32)))
  (define %22.downcasted0 (bvsub  %15.downcasted0  %21.downcasted0))
  (define %33.downcasted0 (extract  15 0 %22.downcasted0))
  %33.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubw_high_u8 (bitvector 128))
(define-symbolic b_vsubw_high_u8 (bitvector 128))
(verify (assert (equal? (vsubw_high_u8.check a_vsubw_high_u8 b_vsubw_high_u8 ) (vsubw_high_u8 a_vsubw_high_u8 b_vsubw_high_u8 ))))
(display "vsubw_high_u8" (current-error-port))
(define (vsubw_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  31))
  (define %11 (extract  %9 %4.new0 a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 64)))
  (define %16 (+  e0.new  15))
  (define %17 (extract  %16 e0.new b))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 64)))
  (define %19.downcasted0 (bvsub  %12.downcasted0  %18.downcasted0))
  (define %30.downcasted0 (extract  31 0 %19.downcasted0))
  %30.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubw_s16 (bitvector 128))
(define-symbolic b_vsubw_s16 (bitvector 64))
(verify (assert (equal? (vsubw_s16.check a_vsubw_s16 b_vsubw_s16 ) (vsubw_s16 a_vsubw_s16 b_vsubw_s16 ))))
(display "vsubw_s16" (current-error-port))
(define (vsubw_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  63))
  (define %11 (extract  %9 %4.new0 a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 128)))
  (define %16 (+  e0.new  31))
  (define %17 (extract  %16 e0.new b))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 128)))
  (define %19.downcasted0 (bvsub  %12.downcasted0  %18.downcasted0))
  (define %30.downcasted0 (extract  63 0 %19.downcasted0))
  %30.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubw_s32 (bitvector 128))
(define-symbolic b_vsubw_s32 (bitvector 64))
(verify (assert (equal? (vsubw_s32.check a_vsubw_s32 b_vsubw_s32 ) (vsubw_s32 a_vsubw_s32 b_vsubw_s32 ))))
(display "vsubw_s32" (current-error-port))
(define (vsubw_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  15))
  (define %11 (extract  %9 %4.new0 a))
  (define %12.downcasted0 (sign-extend  %11 (bitvector 32)))
  (define %16 (+  e0.new  7))
  (define %17 (extract  %16 e0.new b))
  (define %18.downcasted0 (sign-extend  %17 (bitvector 32)))
  (define %19.downcasted0 (bvsub  %12.downcasted0  %18.downcasted0))
  (define %30.downcasted0 (extract  15 0 %19.downcasted0))
  %30.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubw_s8 (bitvector 128))
(define-symbolic b_vsubw_s8 (bitvector 64))
(verify (assert (equal? (vsubw_s8.check a_vsubw_s8 b_vsubw_s8 ) (vsubw_s8 a_vsubw_s8 b_vsubw_s8 ))))
(display "vsubw_s8" (current-error-port))
(define (vsubw_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  31))
  (define %11 (extract  %9 %4.new0 a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 64)))
  (define %16 (+  e0.new  15))
  (define %17 (extract  %16 e0.new b))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 64)))
  (define %19.downcasted0 (bvsub  %12.downcasted0  %18.downcasted0))
  (define %30.downcasted0 (extract  31 0 %19.downcasted0))
  %30.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubw_u16 (bitvector 128))
(define-symbolic b_vsubw_u16 (bitvector 64))
(verify (assert (equal? (vsubw_u16.check a_vsubw_u16 b_vsubw_u16 ) (vsubw_u16 a_vsubw_u16 b_vsubw_u16 ))))
(display "vsubw_u16" (current-error-port))
(define (vsubw_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  63))
  (define %11 (extract  %9 %4.new0 a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 128)))
  (define %16 (+  e0.new  31))
  (define %17 (extract  %16 e0.new b))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 128)))
  (define %19.downcasted0 (bvsub  %12.downcasted0  %18.downcasted0))
  (define %30.downcasted0 (extract  63 0 %19.downcasted0))
  %30.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubw_u32 (bitvector 128))
(define-symbolic b_vsubw_u32 (bitvector 64))
(verify (assert (equal? (vsubw_u32.check a_vsubw_u32 b_vsubw_u32 ) (vsubw_u32 a_vsubw_u32 b_vsubw_u32 ))))
(display "vsubw_u32" (current-error-port))
(define (vsubw_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4.new0 (*  e0.new  2))
  (define %9 (+  %4.new0  15))
  (define %11 (extract  %9 %4.new0 a))
  (define %12.downcasted0 (zero-extend  %11 (bitvector 32)))
  (define %16 (+  e0.new  7))
  (define %17 (extract  %16 e0.new b))
  (define %18.downcasted0 (zero-extend  %17 (bitvector 32)))
  (define %19.downcasted0 (bvsub  %12.downcasted0  %18.downcasted0))
  (define %30.downcasted0 (extract  15 0 %19.downcasted0))
  %30.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vsubw_u8 (bitvector 128))
(define-symbolic b_vsubw_u8 (bitvector 64))
(verify (assert (equal? (vsubw_u8.check a_vsubw_u8 b_vsubw_u8 ) (vsubw_u8 a_vsubw_u8 b_vsubw_u8 ))))
(display "vsubw_u8" (current-error-port))
(define (vtrn1_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 16))])
   (define %28.new0 (*  %iterator1.new  2))
   (define %33 (+  %28.new0  15))
   (define %34 (extract  %33 %28.new0 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 16))])
   (define %3.new0 (*  %iterator0.new  2))
   (define %8 (+  %3.new0  15))
   (define %17 (extract  %8 %3.new0 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn1_s16 (bitvector 64))
(define-symbolic b_vtrn1_s16 (bitvector 64))
(verify (assert (equal? (vtrn1_s16.check a_vtrn1_s16 b_vtrn1_s16 ) (vtrn1_s16 a_vtrn1_s16 b_vtrn1_s16 ))))
(display "vtrn1_s16" (current-error-port))
(define (vtrn1_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 32))])
   (define %28.new0 (*  %iterator1.new  2))
   (define %33 (+  %28.new0  31))
   (define %34 (extract  %33 %28.new0 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 32))])
   (define %3.new0 (*  %iterator0.new  2))
   (define %8 (+  %3.new0  31))
   (define %17 (extract  %8 %3.new0 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn1_s32 (bitvector 64))
(define-symbolic b_vtrn1_s32 (bitvector 64))
(verify (assert (equal? (vtrn1_s32.check a_vtrn1_s32 b_vtrn1_s32 ) (vtrn1_s32 a_vtrn1_s32 b_vtrn1_s32 ))))
(display "vtrn1_s32" (current-error-port))
(define (vtrn1_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 8))])
   (define %28.new0 (*  %iterator1.new  2))
   (define %33 (+  %28.new0  7))
   (define %34 (extract  %33 %28.new0 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 8))])
   (define %3.new0 (*  %iterator0.new  2))
   (define %8 (+  %3.new0  7))
   (define %17 (extract  %8 %3.new0 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn1_s8 (bitvector 64))
(define-symbolic b_vtrn1_s8 (bitvector 64))
(verify (assert (equal? (vtrn1_s8.check a_vtrn1_s8 b_vtrn1_s8 ) (vtrn1_s8 a_vtrn1_s8 b_vtrn1_s8 ))))
(display "vtrn1_s8" (current-error-port))
(define (vtrn1_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 16))])
   (define %28.new0 (*  %iterator1.new  2))
   (define %33 (+  %28.new0  15))
   (define %34 (extract  %33 %28.new0 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 16))])
   (define %3.new0 (*  %iterator0.new  2))
   (define %8 (+  %3.new0  15))
   (define %17 (extract  %8 %3.new0 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn1_u16 (bitvector 64))
(define-symbolic b_vtrn1_u16 (bitvector 64))
(verify (assert (equal? (vtrn1_u16.check a_vtrn1_u16 b_vtrn1_u16 ) (vtrn1_u16 a_vtrn1_u16 b_vtrn1_u16 ))))
(display "vtrn1_u16" (current-error-port))
(define (vtrn1_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 32))])
   (define %28.new0 (*  %iterator1.new  2))
   (define %33 (+  %28.new0  31))
   (define %34 (extract  %33 %28.new0 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 32))])
   (define %3.new0 (*  %iterator0.new  2))
   (define %8 (+  %3.new0  31))
   (define %17 (extract  %8 %3.new0 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn1_u32 (bitvector 64))
(define-symbolic b_vtrn1_u32 (bitvector 64))
(verify (assert (equal? (vtrn1_u32.check a_vtrn1_u32 b_vtrn1_u32 ) (vtrn1_u32 a_vtrn1_u32 b_vtrn1_u32 ))))
(display "vtrn1_u32" (current-error-port))
(define (vtrn1_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 8))])
   (define %28.new0 (*  %iterator1.new  2))
   (define %33 (+  %28.new0  7))
   (define %34 (extract  %33 %28.new0 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 8))])
   (define %3.new0 (*  %iterator0.new  2))
   (define %8 (+  %3.new0  7))
   (define %17 (extract  %8 %3.new0 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn1_u8 (bitvector 64))
(define-symbolic b_vtrn1_u8 (bitvector 64))
(verify (assert (equal? (vtrn1_u8.check a_vtrn1_u8 b_vtrn1_u8 ) (vtrn1_u8 a_vtrn1_u8 b_vtrn1_u8 ))))
(display "vtrn1_u8" (current-error-port))
(define (vtrn1q_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 16))])
   (define %28.new0 (*  %iterator1.new  2))
   (define %33 (+  %28.new0  15))
   (define %34 (extract  %33 %28.new0 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 16))])
   (define %3.new0 (*  %iterator0.new  2))
   (define %8 (+  %3.new0  15))
   (define %17 (extract  %8 %3.new0 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn1q_s16 (bitvector 128))
(define-symbolic b_vtrn1q_s16 (bitvector 128))
(verify (assert (equal? (vtrn1q_s16.check a_vtrn1q_s16 b_vtrn1q_s16 ) (vtrn1q_s16 a_vtrn1q_s16 b_vtrn1q_s16 ))))
(display "vtrn1q_s16" (current-error-port))
(define (vtrn1q_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 32))])
   (define %28.new0 (*  %iterator1.new  2))
   (define %33 (+  %28.new0  31))
   (define %34 (extract  %33 %28.new0 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 32))])
   (define %3.new0 (*  %iterator0.new  2))
   (define %8 (+  %3.new0  31))
   (define %17 (extract  %8 %3.new0 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn1q_s32 (bitvector 128))
(define-symbolic b_vtrn1q_s32 (bitvector 128))
(verify (assert (equal? (vtrn1q_s32.check a_vtrn1q_s32 b_vtrn1q_s32 ) (vtrn1q_s32 a_vtrn1q_s32 b_vtrn1q_s32 ))))
(display "vtrn1q_s32" (current-error-port))
(define (vtrn1q_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 64))])
   (define %28.new0 (*  %iterator1.new  2))
   (define %33 (+  %28.new0  63))
   (define %34 (extract  %33 %28.new0 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 64))])
   (define %3.new0 (*  %iterator0.new  2))
   (define %8 (+  %3.new0  63))
   (define %17 (extract  %8 %3.new0 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn1q_s64 (bitvector 128))
(define-symbolic b_vtrn1q_s64 (bitvector 128))
(verify (assert (equal? (vtrn1q_s64.check a_vtrn1q_s64 b_vtrn1q_s64 ) (vtrn1q_s64 a_vtrn1q_s64 b_vtrn1q_s64 ))))
(display "vtrn1q_s64" (current-error-port))
(define (vtrn1q_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 8))])
   (define %28.new0 (*  %iterator1.new  2))
   (define %33 (+  %28.new0  7))
   (define %34 (extract  %33 %28.new0 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 8))])
   (define %3.new0 (*  %iterator0.new  2))
   (define %8 (+  %3.new0  7))
   (define %17 (extract  %8 %3.new0 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn1q_s8 (bitvector 128))
(define-symbolic b_vtrn1q_s8 (bitvector 128))
(verify (assert (equal? (vtrn1q_s8.check a_vtrn1q_s8 b_vtrn1q_s8 ) (vtrn1q_s8 a_vtrn1q_s8 b_vtrn1q_s8 ))))
(display "vtrn1q_s8" (current-error-port))
(define (vtrn1q_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 16))])
   (define %28.new0 (*  %iterator1.new  2))
   (define %33 (+  %28.new0  15))
   (define %34 (extract  %33 %28.new0 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 16))])
   (define %3.new0 (*  %iterator0.new  2))
   (define %8 (+  %3.new0  15))
   (define %17 (extract  %8 %3.new0 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn1q_u16 (bitvector 128))
(define-symbolic b_vtrn1q_u16 (bitvector 128))
(verify (assert (equal? (vtrn1q_u16.check a_vtrn1q_u16 b_vtrn1q_u16 ) (vtrn1q_u16 a_vtrn1q_u16 b_vtrn1q_u16 ))))
(display "vtrn1q_u16" (current-error-port))
(define (vtrn1q_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 32))])
   (define %28.new0 (*  %iterator1.new  2))
   (define %33 (+  %28.new0  31))
   (define %34 (extract  %33 %28.new0 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 32))])
   (define %3.new0 (*  %iterator0.new  2))
   (define %8 (+  %3.new0  31))
   (define %17 (extract  %8 %3.new0 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn1q_u32 (bitvector 128))
(define-symbolic b_vtrn1q_u32 (bitvector 128))
(verify (assert (equal? (vtrn1q_u32.check a_vtrn1q_u32 b_vtrn1q_u32 ) (vtrn1q_u32 a_vtrn1q_u32 b_vtrn1q_u32 ))))
(display "vtrn1q_u32" (current-error-port))
(define (vtrn1q_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 64))])
   (define %28.new0 (*  %iterator1.new  2))
   (define %33 (+  %28.new0  63))
   (define %34 (extract  %33 %28.new0 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 64))])
   (define %3.new0 (*  %iterator0.new  2))
   (define %8 (+  %3.new0  63))
   (define %17 (extract  %8 %3.new0 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn1q_u64 (bitvector 128))
(define-symbolic b_vtrn1q_u64 (bitvector 128))
(verify (assert (equal? (vtrn1q_u64.check a_vtrn1q_u64 b_vtrn1q_u64 ) (vtrn1q_u64 a_vtrn1q_u64 b_vtrn1q_u64 ))))
(display "vtrn1q_u64" (current-error-port))
(define (vtrn1q_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 8))])
   (define %28.new0 (*  %iterator1.new  2))
   (define %33 (+  %28.new0  7))
   (define %34 (extract  %33 %28.new0 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 8))])
   (define %3.new0 (*  %iterator0.new  2))
   (define %8 (+  %3.new0  7))
   (define %17 (extract  %8 %3.new0 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn1q_u8 (bitvector 128))
(define-symbolic b_vtrn1q_u8 (bitvector 128))
(verify (assert (equal? (vtrn1q_u8.check a_vtrn1q_u8 b_vtrn1q_u8 ) (vtrn1q_u8 a_vtrn1q_u8 b_vtrn1q_u8 ))))
(display "vtrn1q_u8" (current-error-port))
(define (vtrn2_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 16))])
   (define %18.new0 (/  %iterator1.new  8))
   (define %19 (+  %18.new0  1))
   (define %20 (*  %19  16))
   (define %25 (+  %20  15))
   (define %34 (extract  %25 %20 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 16))])
   (define %9.new0 (/  %iterator0.new  8))
   (define %10 (+  %9.new0  1))
   (define %11 (*  %10  16))
   (define %16 (+  %11  15))
   (define %17 (extract  %16 %11 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn2_s16 (bitvector 64))
(define-symbolic b_vtrn2_s16 (bitvector 64))
(verify (assert (equal? (vtrn2_s16.check a_vtrn2_s16 b_vtrn2_s16 ) (vtrn2_s16 a_vtrn2_s16 b_vtrn2_s16 ))))
(display "vtrn2_s16" (current-error-port))
(define (vtrn2_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 32))])
   (define %18.new0 (/  %iterator1.new  16))
   (define %19 (+  %18.new0  1))
   (define %20 (*  %19  32))
   (define %25 (+  %20  31))
   (define %34 (extract  %25 %20 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 32))])
   (define %9.new0 (/  %iterator0.new  16))
   (define %10 (+  %9.new0  1))
   (define %11 (*  %10  32))
   (define %16 (+  %11  31))
   (define %17 (extract  %16 %11 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn2_s32 (bitvector 64))
(define-symbolic b_vtrn2_s32 (bitvector 64))
(verify (assert (equal? (vtrn2_s32.check a_vtrn2_s32 b_vtrn2_s32 ) (vtrn2_s32 a_vtrn2_s32 b_vtrn2_s32 ))))
(display "vtrn2_s32" (current-error-port))
(define (vtrn2_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 8))])
   (define %18.new0 (/  %iterator1.new  4))
   (define %19 (+  %18.new0  1))
   (define %20 (*  %19  8))
   (define %25 (+  %20  7))
   (define %34 (extract  %25 %20 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 8))])
   (define %9.new0 (/  %iterator0.new  4))
   (define %10 (+  %9.new0  1))
   (define %11 (*  %10  8))
   (define %16 (+  %11  7))
   (define %17 (extract  %16 %11 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn2_s8 (bitvector 64))
(define-symbolic b_vtrn2_s8 (bitvector 64))
(verify (assert (equal? (vtrn2_s8.check a_vtrn2_s8 b_vtrn2_s8 ) (vtrn2_s8 a_vtrn2_s8 b_vtrn2_s8 ))))
(display "vtrn2_s8" (current-error-port))
(define (vtrn2_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 16))])
   (define %18.new0 (/  %iterator1.new  8))
   (define %19 (+  %18.new0  1))
   (define %20 (*  %19  16))
   (define %25 (+  %20  15))
   (define %34 (extract  %25 %20 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 16))])
   (define %9.new0 (/  %iterator0.new  8))
   (define %10 (+  %9.new0  1))
   (define %11 (*  %10  16))
   (define %16 (+  %11  15))
   (define %17 (extract  %16 %11 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn2_u16 (bitvector 64))
(define-symbolic b_vtrn2_u16 (bitvector 64))
(verify (assert (equal? (vtrn2_u16.check a_vtrn2_u16 b_vtrn2_u16 ) (vtrn2_u16 a_vtrn2_u16 b_vtrn2_u16 ))))
(display "vtrn2_u16" (current-error-port))
(define (vtrn2_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 32))])
   (define %18.new0 (/  %iterator1.new  16))
   (define %19 (+  %18.new0  1))
   (define %20 (*  %19  32))
   (define %25 (+  %20  31))
   (define %34 (extract  %25 %20 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 32))])
   (define %9.new0 (/  %iterator0.new  16))
   (define %10 (+  %9.new0  1))
   (define %11 (*  %10  32))
   (define %16 (+  %11  31))
   (define %17 (extract  %16 %11 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn2_u32 (bitvector 64))
(define-symbolic b_vtrn2_u32 (bitvector 64))
(verify (assert (equal? (vtrn2_u32.check a_vtrn2_u32 b_vtrn2_u32 ) (vtrn2_u32 a_vtrn2_u32 b_vtrn2_u32 ))))
(display "vtrn2_u32" (current-error-port))
(define (vtrn2_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 8))])
   (define %18.new0 (/  %iterator1.new  4))
   (define %19 (+  %18.new0  1))
   (define %20 (*  %19  8))
   (define %25 (+  %20  7))
   (define %34 (extract  %25 %20 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 8))])
   (define %9.new0 (/  %iterator0.new  4))
   (define %10 (+  %9.new0  1))
   (define %11 (*  %10  8))
   (define %16 (+  %11  7))
   (define %17 (extract  %16 %11 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn2_u8 (bitvector 64))
(define-symbolic b_vtrn2_u8 (bitvector 64))
(verify (assert (equal? (vtrn2_u8.check a_vtrn2_u8 b_vtrn2_u8 ) (vtrn2_u8 a_vtrn2_u8 b_vtrn2_u8 ))))
(display "vtrn2_u8" (current-error-port))
(define (vtrn2q_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 16))])
   (define %18.new0 (/  %iterator1.new  8))
   (define %19 (+  %18.new0  1))
   (define %20 (*  %19  16))
   (define %25 (+  %20  15))
   (define %34 (extract  %25 %20 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 16))])
   (define %9.new0 (/  %iterator0.new  8))
   (define %10 (+  %9.new0  1))
   (define %11 (*  %10  16))
   (define %16 (+  %11  15))
   (define %17 (extract  %16 %11 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn2q_s16 (bitvector 128))
(define-symbolic b_vtrn2q_s16 (bitvector 128))
(verify (assert (equal? (vtrn2q_s16.check a_vtrn2q_s16 b_vtrn2q_s16 ) (vtrn2q_s16 a_vtrn2q_s16 b_vtrn2q_s16 ))))
(display "vtrn2q_s16" (current-error-port))
(define (vtrn2q_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 32))])
   (define %18.new0 (/  %iterator1.new  16))
   (define %19 (+  %18.new0  1))
   (define %20 (*  %19  32))
   (define %25 (+  %20  31))
   (define %34 (extract  %25 %20 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 32))])
   (define %9.new0 (/  %iterator0.new  16))
   (define %10 (+  %9.new0  1))
   (define %11 (*  %10  32))
   (define %16 (+  %11  31))
   (define %17 (extract  %16 %11 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn2q_s32 (bitvector 128))
(define-symbolic b_vtrn2q_s32 (bitvector 128))
(verify (assert (equal? (vtrn2q_s32.check a_vtrn2q_s32 b_vtrn2q_s32 ) (vtrn2q_s32 a_vtrn2q_s32 b_vtrn2q_s32 ))))
(display "vtrn2q_s32" (current-error-port))
(define (vtrn2q_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 64))])
   (define %18.new0 (/  %iterator1.new  32))
   (define %19 (+  %18.new0  1))
   (define %20 (*  %19  64))
   (define %25 (+  %20  63))
   (define %34 (extract  %25 %20 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 64))])
   (define %9.new0 (/  %iterator0.new  32))
   (define %10 (+  %9.new0  1))
   (define %11 (*  %10  64))
   (define %16 (+  %11  63))
   (define %17 (extract  %16 %11 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn2q_s64 (bitvector 128))
(define-symbolic b_vtrn2q_s64 (bitvector 128))
(verify (assert (equal? (vtrn2q_s64.check a_vtrn2q_s64 b_vtrn2q_s64 ) (vtrn2q_s64 a_vtrn2q_s64 b_vtrn2q_s64 ))))
(display "vtrn2q_s64" (current-error-port))
(define (vtrn2q_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 8))])
   (define %18.new0 (/  %iterator1.new  4))
   (define %19 (+  %18.new0  1))
   (define %20 (*  %19  8))
   (define %25 (+  %20  7))
   (define %34 (extract  %25 %20 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 8))])
   (define %9.new0 (/  %iterator0.new  4))
   (define %10 (+  %9.new0  1))
   (define %11 (*  %10  8))
   (define %16 (+  %11  7))
   (define %17 (extract  %16 %11 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn2q_s8 (bitvector 128))
(define-symbolic b_vtrn2q_s8 (bitvector 128))
(verify (assert (equal? (vtrn2q_s8.check a_vtrn2q_s8 b_vtrn2q_s8 ) (vtrn2q_s8 a_vtrn2q_s8 b_vtrn2q_s8 ))))
(display "vtrn2q_s8" (current-error-port))
(define (vtrn2q_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 16))])
   (define %18.new0 (/  %iterator1.new  8))
   (define %19 (+  %18.new0  1))
   (define %20 (*  %19  16))
   (define %25 (+  %20  15))
   (define %34 (extract  %25 %20 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 16))])
   (define %9.new0 (/  %iterator0.new  8))
   (define %10 (+  %9.new0  1))
   (define %11 (*  %10  16))
   (define %16 (+  %11  15))
   (define %17 (extract  %16 %11 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn2q_u16 (bitvector 128))
(define-symbolic b_vtrn2q_u16 (bitvector 128))
(verify (assert (equal? (vtrn2q_u16.check a_vtrn2q_u16 b_vtrn2q_u16 ) (vtrn2q_u16 a_vtrn2q_u16 b_vtrn2q_u16 ))))
(display "vtrn2q_u16" (current-error-port))
(define (vtrn2q_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 32))])
   (define %18.new0 (/  %iterator1.new  16))
   (define %19 (+  %18.new0  1))
   (define %20 (*  %19  32))
   (define %25 (+  %20  31))
   (define %34 (extract  %25 %20 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 32))])
   (define %9.new0 (/  %iterator0.new  16))
   (define %10 (+  %9.new0  1))
   (define %11 (*  %10  32))
   (define %16 (+  %11  31))
   (define %17 (extract  %16 %11 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn2q_u32 (bitvector 128))
(define-symbolic b_vtrn2q_u32 (bitvector 128))
(verify (assert (equal? (vtrn2q_u32.check a_vtrn2q_u32 b_vtrn2q_u32 ) (vtrn2q_u32 a_vtrn2q_u32 b_vtrn2q_u32 ))))
(display "vtrn2q_u32" (current-error-port))
(define (vtrn2q_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 64))])
   (define %18.new0 (/  %iterator1.new  32))
   (define %19 (+  %18.new0  1))
   (define %20 (*  %19  64))
   (define %25 (+  %20  63))
   (define %34 (extract  %25 %20 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 64))])
   (define %9.new0 (/  %iterator0.new  32))
   (define %10 (+  %9.new0  1))
   (define %11 (*  %10  64))
   (define %16 (+  %11  63))
   (define %17 (extract  %16 %11 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn2q_u64 (bitvector 128))
(define-symbolic b_vtrn2q_u64 (bitvector 128))
(verify (assert (equal? (vtrn2q_u64.check a_vtrn2q_u64 b_vtrn2q_u64 ) (vtrn2q_u64 a_vtrn2q_u64 b_vtrn2q_u64 ))))
(display "vtrn2q_u64" (current-error-port))
(define (vtrn2q_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 8))])
   (define %18.new0 (/  %iterator1.new  4))
   (define %19 (+  %18.new0  1))
   (define %20 (*  %19  8))
   (define %25 (+  %20  7))
   (define %34 (extract  %25 %20 b))
   %34
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 8))])
   (define %9.new0 (/  %iterator0.new  4))
   (define %10 (+  %9.new0  1))
   (define %11 (*  %10  8))
   (define %16 (+  %11  7))
   (define %17 (extract  %16 %11 a))
   %17
  )
  )
 )
)
)
)
result)
(define-symbolic a_vtrn2q_u8 (bitvector 128))
(define-symbolic b_vtrn2q_u8 (bitvector 128))
(verify (assert (equal? (vtrn2q_u8.check a_vtrn2q_u8 b_vtrn2q_u8 ) (vtrn2q_u8 a_vtrn2q_u8 b_vtrn2q_u8 ))))
(display "vtrn2q_u8" (current-error-port))
(define (vtst_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtst_s16 (bitvector 64))
(define-symbolic b_vtst_s16 (bitvector 64))
(verify (assert (equal? (vtst_s16.check a_vtst_s16 b_vtst_s16 ) (vtst_s16 a_vtst_s16 b_vtst_s16 ))))
(display "vtst_s16" (current-error-port))
(define (vtst_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtst_s32 (bitvector 64))
(define-symbolic b_vtst_s32 (bitvector 64))
(verify (assert (equal? (vtst_s32.check a_vtst_s32 b_vtst_s32 ) (vtst_s32 a_vtst_s32 b_vtst_s32 ))))
(display "vtst_s32" (current-error-port))
(define (vtst_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtst_s64 (bitvector 64))
(define-symbolic b_vtst_s64 (bitvector 64))
(verify (assert (equal? (vtst_s64.check a_vtst_s64 b_vtst_s64 ) (vtst_s64 a_vtst_s64 b_vtst_s64 ))))
(display "vtst_s64" (current-error-port))
(define (vtst_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtst_s8 (bitvector 64))
(define-symbolic b_vtst_s8 (bitvector 64))
(verify (assert (equal? (vtst_s8.check a_vtst_s8 b_vtst_s8 ) (vtst_s8 a_vtst_s8 b_vtst_s8 ))))
(display "vtst_s8" (current-error-port))
(define (vtst_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtst_u16 (bitvector 64))
(define-symbolic b_vtst_u16 (bitvector 64))
(verify (assert (equal? (vtst_u16.check a_vtst_u16 b_vtst_u16 ) (vtst_u16 a_vtst_u16 b_vtst_u16 ))))
(display "vtst_u16" (current-error-port))
(define (vtst_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtst_u32 (bitvector 64))
(define-symbolic b_vtst_u32 (bitvector 64))
(verify (assert (equal? (vtst_u32.check a_vtst_u32 b_vtst_u32 ) (vtst_u32 a_vtst_u32 b_vtst_u32 ))))
(display "vtst_u32" (current-error-port))
(define (vtst_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtst_u64 (bitvector 64))
(define-symbolic b_vtst_u64 (bitvector 64))
(verify (assert (equal? (vtst_u64.check a_vtst_u64 b_vtst_u64 ) (vtst_u64 a_vtst_u64 b_vtst_u64 ))))
(display "vtst_u64" (current-error-port))
(define (vtst_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtst_u8 (bitvector 64))
(define-symbolic b_vtst_u8 (bitvector 64))
(verify (assert (equal? (vtst_u8.check a_vtst_u8 b_vtst_u8 ) (vtst_u8 a_vtst_u8 b_vtst_u8 ))))
(display "vtst_u8" (current-error-port))
(define (vtstd_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtstd_s64 (bitvector 64))
(define-symbolic b_vtstd_s64 (bitvector 64))
(verify (assert (equal? (vtstd_s64.check a_vtstd_s64 b_vtstd_s64 ) (vtstd_s64 a_vtstd_s64 b_vtstd_s64 ))))
(display "vtstd_s64" (current-error-port))
(define (vtstd_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtstd_u64 (bitvector 64))
(define-symbolic b_vtstd_u64 (bitvector 64))
(verify (assert (equal? (vtstd_u64.check a_vtstd_u64 b_vtstd_u64 ) (vtstd_u64 a_vtstd_u64 b_vtstd_u64 ))))
(display "vtstd_u64" (current-error-port))
(define (vtstq_s16.check  a b )
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
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtstq_s16 (bitvector 128))
(define-symbolic b_vtstq_s16 (bitvector 128))
(verify (assert (equal? (vtstq_s16.check a_vtstq_s16 b_vtstq_s16 ) (vtstq_s16 a_vtstq_s16 b_vtstq_s16 ))))
(display "vtstq_s16" (current-error-port))
(define (vtstq_s32.check  a b )
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
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtstq_s32 (bitvector 128))
(define-symbolic b_vtstq_s32 (bitvector 128))
(verify (assert (equal? (vtstq_s32.check a_vtstq_s32 b_vtstq_s32 ) (vtstq_s32 a_vtstq_s32 b_vtstq_s32 ))))
(display "vtstq_s32" (current-error-port))
(define (vtstq_s64.check  a b )
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
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtstq_s64 (bitvector 128))
(define-symbolic b_vtstq_s64 (bitvector 128))
(verify (assert (equal? (vtstq_s64.check a_vtstq_s64 b_vtstq_s64 ) (vtstq_s64 a_vtstq_s64 b_vtstq_s64 ))))
(display "vtstq_s64" (current-error-port))
(define (vtstq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtstq_s8 (bitvector 128))
(define-symbolic b_vtstq_s8 (bitvector 128))
(verify (assert (equal? (vtstq_s8.check a_vtstq_s8 b_vtstq_s8 ) (vtstq_s8 a_vtstq_s8 b_vtstq_s8 ))))
(display "vtstq_s8" (current-error-port))
(define (vtstq_u16.check  a b )
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
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 65535 16) (bv 0 16)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtstq_u16 (bitvector 128))
(define-symbolic b_vtstq_u16 (bitvector 128))
(verify (assert (equal? (vtstq_u16.check a_vtstq_u16 b_vtstq_u16 ) (vtstq_u16 a_vtstq_u16 b_vtstq_u16 ))))
(display "vtstq_u16" (current-error-port))
(define (vtstq_u32.check  a b )
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
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 4294967295 32) (bv 0 32)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtstq_u32 (bitvector 128))
(define-symbolic b_vtstq_u32 (bitvector 128))
(verify (assert (equal? (vtstq_u32.check a_vtstq_u32 b_vtstq_u32 ) (vtstq_u32 a_vtstq_u32 b_vtstq_u32 ))))
(display "vtstq_u32" (current-error-port))
(define (vtstq_u64.check  a b )
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
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 18446744073709551615 64) (bv 0 64)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtstq_u64 (bitvector 128))
(define-symbolic b_vtstq_u64 (bitvector 128))
(verify (assert (equal? (vtstq_u64.check a_vtstq_u64 b_vtstq_u64 ) (vtstq_u64 a_vtstq_u64 b_vtstq_u64 ))))
(display "vtstq_u64" (current-error-port))
(define (vtstq_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new a))
  (define %10 (extract  %4 e0.new b))
  (define %11 (bvand  %5  %10))
  (define %12 (bvzero  %11))
  (define %13 (not  %12))
  (define %20 (if (equal? %13 #t) (bv 255 8) (bv 0 8)))
  %20
 )
 )
)
)
)
result)
(define-symbolic a_vtstq_u8 (bitvector 128))
(define-symbolic b_vtstq_u8 (bitvector 128))
(verify (assert (equal? (vtstq_u8.check a_vtstq_u8 b_vtstq_u8 ) (vtstq_u8 a_vtstq_u8 b_vtstq_u8 ))))
(display "vtstq_u8" (current-error-port))
(define (vuqadd_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnsw  %5  %12 16))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vuqadd_s16 (bitvector 64))
(define-symbolic b_vuqadd_s16 (bitvector 64))
(verify (assert (equal? (vuqadd_s16.check a_vuqadd_s16 b_vuqadd_s16 ) (vuqadd_s16 a_vuqadd_s16 b_vuqadd_s16 ))))
(display "vuqadd_s16" (current-error-port))
(define (vuqadd_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnsw  %5  %12 32))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vuqadd_s32 (bitvector 64))
(define-symbolic b_vuqadd_s32 (bitvector 64))
(verify (assert (equal? (vuqadd_s32.check a_vuqadd_s32 b_vuqadd_s32 ) (vuqadd_s32 a_vuqadd_s32 b_vuqadd_s32 ))))
(display "vuqadd_s32" (current-error-port))
(define (vuqadd_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnsw  %5  %12 64))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vuqadd_s64 (bitvector 64))
(define-symbolic b_vuqadd_s64 (bitvector 64))
(verify (assert (equal? (vuqadd_s64.check a_vuqadd_s64 b_vuqadd_s64 ) (vuqadd_s64 a_vuqadd_s64 b_vuqadd_s64 ))))
(display "vuqadd_s64" (current-error-port))
(define (vuqadd_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnsw  %5  %12 8))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vuqadd_s8 (bitvector 64))
(define-symbolic b_vuqadd_s8 (bitvector 64))
(verify (assert (equal? (vuqadd_s8.check a_vuqadd_s8 b_vuqadd_s8 ) (vuqadd_s8 a_vuqadd_s8 b_vuqadd_s8 ))))
(display "vuqadd_s8" (current-error-port))
(define (vuqaddb_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 8 8))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 8 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnsw  %5  %12 8))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vuqaddb_s8 (bitvector 8))
(define-symbolic b_vuqaddb_s8 (bitvector 8))
(verify (assert (equal? (vuqaddb_s8.check a_vuqaddb_s8 b_vuqaddb_s8 ) (vuqaddb_s8 a_vuqaddb_s8 b_vuqaddb_s8 ))))
(display "vuqaddb_s8" (current-error-port))
(define (vuqaddd_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnsw  %5  %12 64))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vuqaddd_s64 (bitvector 64))
(define-symbolic b_vuqaddd_s64 (bitvector 64))
(verify (assert (equal? (vuqaddd_s64.check a_vuqaddd_s64 b_vuqaddd_s64 ) (vuqaddd_s64 a_vuqaddd_s64 b_vuqaddd_s64 ))))
(display "vuqaddd_s64" (current-error-port))
(define (vuqaddh_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 16 16))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 16 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnsw  %5  %12 16))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vuqaddh_s16 (bitvector 16))
(define-symbolic b_vuqaddh_s16 (bitvector 16))
(verify (assert (equal? (vuqaddh_s16.check a_vuqaddh_s16 b_vuqaddh_s16 ) (vuqaddh_s16 a_vuqaddh_s16 b_vuqaddh_s16 ))))
(display "vuqaddh_s16" (current-error-port))
(define (vuqaddq_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %4 (+  e0.new  15))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnsw  %5  %12 16))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vuqaddq_s16 (bitvector 128))
(define-symbolic b_vuqaddq_s16 (bitvector 128))
(verify (assert (equal? (vuqaddq_s16.check a_vuqaddq_s16 b_vuqaddq_s16 ) (vuqaddq_s16 a_vuqaddq_s16 b_vuqaddq_s16 ))))
(display "vuqaddq_s16" (current-error-port))
(define (vuqaddq_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnsw  %5  %12 32))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vuqaddq_s32 (bitvector 128))
(define-symbolic b_vuqaddq_s32 (bitvector 128))
(verify (assert (equal? (vuqaddq_s32.check a_vuqaddq_s32 b_vuqaddq_s32 ) (vuqaddq_s32 a_vuqaddq_s32 b_vuqaddq_s32 ))))
(display "vuqaddq_s32" (current-error-port))
(define (vuqaddq_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %4 (+  e0.new  63))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnsw  %5  %12 64))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vuqaddq_s64 (bitvector 128))
(define-symbolic b_vuqaddq_s64 (bitvector 128))
(verify (assert (equal? (vuqaddq_s64.check a_vuqaddq_s64 b_vuqaddq_s64 ) (vuqaddq_s64 a_vuqaddq_s64 b_vuqaddq_s64 ))))
(display "vuqaddq_s64" (current-error-port))
(define (vuqaddq_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %4 (+  e0.new  7))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnsw  %5  %12 8))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vuqaddq_s8 (bitvector 128))
(define-symbolic b_vuqaddq_s8 (bitvector 128))
(verify (assert (equal? (vuqaddq_s8.check a_vuqaddq_s8 b_vuqaddq_s8 ) (vuqaddq_s8 a_vuqaddq_s8 b_vuqaddq_s8 ))))
(display "vuqaddq_s8" (current-error-port))
(define (vuqadds_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 32 32))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 32 32))])
  (define %4 (+  e0.new  31))
  (define %5 (extract  %4 e0.new b))
  (define %12 (extract  %4 e0.new a))
  (define %18.downcasted0 (bvaddnsw  %5  %12 32))
  %18.downcasted0
 )
 )
)
)
)
result)
(define-symbolic a_vuqadds_s32 (bitvector 32))
(define-symbolic b_vuqadds_s32 (bitvector 32))
(verify (assert (equal? (vuqadds_s32.check a_vuqadds_s32 b_vuqadds_s32 ) (vuqadds_s32 a_vuqadds_s32 b_vuqadds_s32 ))))
(display "vuqadds_s32" (current-error-port))
(define (vuzp1_s16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  15))
  (define %15 (extract  %14 %9.new0 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp1_s16 (bitvector 64))
(define-symbolic b_vuzp1_s16 (bitvector 64))
(verify (assert (equal? (vuzp1_s16.check a_vuzp1_s16 b_vuzp1_s16 ) (vuzp1_s16 a_vuzp1_s16 b_vuzp1_s16 ))))
(display "vuzp1_s16" (current-error-port))
(define (vuzp1_s32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  31))
  (define %15 (extract  %14 %9.new0 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp1_s32 (bitvector 64))
(define-symbolic b_vuzp1_s32 (bitvector 64))
(verify (assert (equal? (vuzp1_s32.check a_vuzp1_s32 b_vuzp1_s32 ) (vuzp1_s32 a_vuzp1_s32 b_vuzp1_s32 ))))
(display "vuzp1_s32" (current-error-port))
(define (vuzp1_s8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  7))
  (define %15 (extract  %14 %9.new0 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp1_s8 (bitvector 64))
(define-symbolic b_vuzp1_s8 (bitvector 64))
(verify (assert (equal? (vuzp1_s8.check a_vuzp1_s8 b_vuzp1_s8 ) (vuzp1_s8 a_vuzp1_s8 b_vuzp1_s8 ))))
(display "vuzp1_s8" (current-error-port))
(define (vuzp1_u16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  15))
  (define %15 (extract  %14 %9.new0 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp1_u16 (bitvector 64))
(define-symbolic b_vuzp1_u16 (bitvector 64))
(verify (assert (equal? (vuzp1_u16.check a_vuzp1_u16 b_vuzp1_u16 ) (vuzp1_u16 a_vuzp1_u16 b_vuzp1_u16 ))))
(display "vuzp1_u16" (current-error-port))
(define (vuzp1_u32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  31))
  (define %15 (extract  %14 %9.new0 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp1_u32 (bitvector 64))
(define-symbolic b_vuzp1_u32 (bitvector 64))
(verify (assert (equal? (vuzp1_u32.check a_vuzp1_u32 b_vuzp1_u32 ) (vuzp1_u32 a_vuzp1_u32 b_vuzp1_u32 ))))
(display "vuzp1_u32" (current-error-port))
(define (vuzp1_u8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  7))
  (define %15 (extract  %14 %9.new0 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp1_u8 (bitvector 64))
(define-symbolic b_vuzp1_u8 (bitvector 64))
(verify (assert (equal? (vuzp1_u8.check a_vuzp1_u8 b_vuzp1_u8 ) (vuzp1_u8 a_vuzp1_u8 b_vuzp1_u8 ))))
(display "vuzp1_u8" (current-error-port))
(define (vuzp1q_s16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  15))
  (define %15 (extract  %14 %9.new0 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp1q_s16 (bitvector 128))
(define-symbolic b_vuzp1q_s16 (bitvector 128))
(verify (assert (equal? (vuzp1q_s16.check a_vuzp1q_s16 b_vuzp1q_s16 ) (vuzp1q_s16 a_vuzp1q_s16 b_vuzp1q_s16 ))))
(display "vuzp1q_s16" (current-error-port))
(define (vuzp1q_s32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  31))
  (define %15 (extract  %14 %9.new0 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp1q_s32 (bitvector 128))
(define-symbolic b_vuzp1q_s32 (bitvector 128))
(verify (assert (equal? (vuzp1q_s32.check a_vuzp1q_s32 b_vuzp1q_s32 ) (vuzp1q_s32 a_vuzp1q_s32 b_vuzp1q_s32 ))))
(display "vuzp1q_s32" (current-error-port))
(define (vuzp1q_s64.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  63))
  (define %15 (extract  %14 %9.new0 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp1q_s64 (bitvector 128))
(define-symbolic b_vuzp1q_s64 (bitvector 128))
(verify (assert (equal? (vuzp1q_s64.check a_vuzp1q_s64 b_vuzp1q_s64 ) (vuzp1q_s64 a_vuzp1q_s64 b_vuzp1q_s64 ))))
(display "vuzp1q_s64" (current-error-port))
(define (vuzp1q_s8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  7))
  (define %15 (extract  %14 %9.new0 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp1q_s8 (bitvector 128))
(define-symbolic b_vuzp1q_s8 (bitvector 128))
(verify (assert (equal? (vuzp1q_s8.check a_vuzp1q_s8 b_vuzp1q_s8 ) (vuzp1q_s8 a_vuzp1q_s8 b_vuzp1q_s8 ))))
(display "vuzp1q_s8" (current-error-port))
(define (vuzp1q_u16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  15))
  (define %15 (extract  %14 %9.new0 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp1q_u16 (bitvector 128))
(define-symbolic b_vuzp1q_u16 (bitvector 128))
(verify (assert (equal? (vuzp1q_u16.check a_vuzp1q_u16 b_vuzp1q_u16 ) (vuzp1q_u16 a_vuzp1q_u16 b_vuzp1q_u16 ))))
(display "vuzp1q_u16" (current-error-port))
(define (vuzp1q_u32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  31))
  (define %15 (extract  %14 %9.new0 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp1q_u32 (bitvector 128))
(define-symbolic b_vuzp1q_u32 (bitvector 128))
(verify (assert (equal? (vuzp1q_u32.check a_vuzp1q_u32 b_vuzp1q_u32 ) (vuzp1q_u32 a_vuzp1q_u32 b_vuzp1q_u32 ))))
(display "vuzp1q_u32" (current-error-port))
(define (vuzp1q_u64.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  63))
  (define %15 (extract  %14 %9.new0 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp1q_u64 (bitvector 128))
(define-symbolic b_vuzp1q_u64 (bitvector 128))
(verify (assert (equal? (vuzp1q_u64.check a_vuzp1q_u64 b_vuzp1q_u64 ) (vuzp1q_u64 a_vuzp1q_u64 b_vuzp1q_u64 ))))
(display "vuzp1q_u64" (current-error-port))
(define (vuzp1q_u8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %9.new0 (*  e0.new  2))
  (define %14 (+  %9.new0  7))
  (define %15 (extract  %14 %9.new0 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp1q_u8 (bitvector 128))
(define-symbolic b_vuzp1q_u8 (bitvector 128))
(verify (assert (equal? (vuzp1q_u8.check a_vuzp1q_u8 b_vuzp1q_u8 ) (vuzp1q_u8 a_vuzp1q_u8 b_vuzp1q_u8 ))))
(display "vuzp1q_u8" (current-error-port))
(define (vuzp2_s16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7.new0 (/  e0.new  8))
  (define %8 (+  %7.new0  1))
  (define %9 (*  %8  16))
  (define %14 (+  %9  15))
  (define %15 (extract  %14 %9 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp2_s16 (bitvector 64))
(define-symbolic b_vuzp2_s16 (bitvector 64))
(verify (assert (equal? (vuzp2_s16.check a_vuzp2_s16 b_vuzp2_s16 ) (vuzp2_s16 a_vuzp2_s16 b_vuzp2_s16 ))))
(display "vuzp2_s16" (current-error-port))
(define (vuzp2_s32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7.new0 (/  e0.new  16))
  (define %8 (+  %7.new0  1))
  (define %9 (*  %8  32))
  (define %14 (+  %9  31))
  (define %15 (extract  %14 %9 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp2_s32 (bitvector 64))
(define-symbolic b_vuzp2_s32 (bitvector 64))
(verify (assert (equal? (vuzp2_s32.check a_vuzp2_s32 b_vuzp2_s32 ) (vuzp2_s32 a_vuzp2_s32 b_vuzp2_s32 ))))
(display "vuzp2_s32" (current-error-port))
(define (vuzp2_s8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7.new0 (/  e0.new  4))
  (define %8 (+  %7.new0  1))
  (define %9 (*  %8  8))
  (define %14 (+  %9  7))
  (define %15 (extract  %14 %9 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp2_s8 (bitvector 64))
(define-symbolic b_vuzp2_s8 (bitvector 64))
(verify (assert (equal? (vuzp2_s8.check a_vuzp2_s8 b_vuzp2_s8 ) (vuzp2_s8 a_vuzp2_s8 b_vuzp2_s8 ))))
(display "vuzp2_s8" (current-error-port))
(define (vuzp2_u16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 16))])
  (define %7.new0 (/  e0.new  8))
  (define %8 (+  %7.new0  1))
  (define %9 (*  %8  16))
  (define %14 (+  %9  15))
  (define %15 (extract  %14 %9 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp2_u16 (bitvector 64))
(define-symbolic b_vuzp2_u16 (bitvector 64))
(verify (assert (equal? (vuzp2_u16.check a_vuzp2_u16 b_vuzp2_u16 ) (vuzp2_u16 a_vuzp2_u16 b_vuzp2_u16 ))))
(display "vuzp2_u16" (current-error-port))
(define (vuzp2_u32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 32))])
  (define %7.new0 (/  e0.new  16))
  (define %8 (+  %7.new0  1))
  (define %9 (*  %8  32))
  (define %14 (+  %9  31))
  (define %15 (extract  %14 %9 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp2_u32 (bitvector 64))
(define-symbolic b_vuzp2_u32 (bitvector 64))
(verify (assert (equal? (vuzp2_u32.check a_vuzp2_u32 b_vuzp2_u32 ) (vuzp2_u32 a_vuzp2_u32 b_vuzp2_u32 ))))
(display "vuzp2_u32" (current-error-port))
(define (vuzp2_u8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 64 8))])
  (define %7.new0 (/  e0.new  4))
  (define %8 (+  %7.new0  1))
  (define %9 (*  %8  8))
  (define %14 (+  %9  7))
  (define %15 (extract  %14 %9 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp2_u8 (bitvector 64))
(define-symbolic b_vuzp2_u8 (bitvector 64))
(verify (assert (equal? (vuzp2_u8.check a_vuzp2_u8 b_vuzp2_u8 ) (vuzp2_u8 a_vuzp2_u8 b_vuzp2_u8 ))))
(display "vuzp2_u8" (current-error-port))
(define (vuzp2q_s16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %7.new0 (/  e0.new  8))
  (define %8 (+  %7.new0  1))
  (define %9 (*  %8  16))
  (define %14 (+  %9  15))
  (define %15 (extract  %14 %9 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp2q_s16 (bitvector 128))
(define-symbolic b_vuzp2q_s16 (bitvector 128))
(verify (assert (equal? (vuzp2q_s16.check a_vuzp2q_s16 b_vuzp2q_s16 ) (vuzp2q_s16 a_vuzp2q_s16 b_vuzp2q_s16 ))))
(display "vuzp2q_s16" (current-error-port))
(define (vuzp2q_s32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %7.new0 (/  e0.new  16))
  (define %8 (+  %7.new0  1))
  (define %9 (*  %8  32))
  (define %14 (+  %9  31))
  (define %15 (extract  %14 %9 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp2q_s32 (bitvector 128))
(define-symbolic b_vuzp2q_s32 (bitvector 128))
(verify (assert (equal? (vuzp2q_s32.check a_vuzp2q_s32 b_vuzp2q_s32 ) (vuzp2q_s32 a_vuzp2q_s32 b_vuzp2q_s32 ))))
(display "vuzp2q_s32" (current-error-port))
(define (vuzp2q_s64.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %7.new0 (/  e0.new  32))
  (define %8 (+  %7.new0  1))
  (define %9 (*  %8  64))
  (define %14 (+  %9  63))
  (define %15 (extract  %14 %9 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp2q_s64 (bitvector 128))
(define-symbolic b_vuzp2q_s64 (bitvector 128))
(verify (assert (equal? (vuzp2q_s64.check a_vuzp2q_s64 b_vuzp2q_s64 ) (vuzp2q_s64 a_vuzp2q_s64 b_vuzp2q_s64 ))))
(display "vuzp2q_s64" (current-error-port))
(define (vuzp2q_s8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %7.new0 (/  e0.new  4))
  (define %8 (+  %7.new0  1))
  (define %9 (*  %8  8))
  (define %14 (+  %9  7))
  (define %15 (extract  %14 %9 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp2q_s8 (bitvector 128))
(define-symbolic b_vuzp2q_s8 (bitvector 128))
(verify (assert (equal? (vuzp2q_s8.check a_vuzp2q_s8 b_vuzp2q_s8 ) (vuzp2q_s8 a_vuzp2q_s8 b_vuzp2q_s8 ))))
(display "vuzp2q_s8" (current-error-port))
(define (vuzp2q_u16.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 16))])
  (define %7.new0 (/  e0.new  8))
  (define %8 (+  %7.new0  1))
  (define %9 (*  %8  16))
  (define %14 (+  %9  15))
  (define %15 (extract  %14 %9 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp2q_u16 (bitvector 128))
(define-symbolic b_vuzp2q_u16 (bitvector 128))
(verify (assert (equal? (vuzp2q_u16.check a_vuzp2q_u16 b_vuzp2q_u16 ) (vuzp2q_u16 a_vuzp2q_u16 b_vuzp2q_u16 ))))
(display "vuzp2q_u16" (current-error-port))
(define (vuzp2q_u32.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 32))])
  (define %7.new0 (/  e0.new  16))
  (define %8 (+  %7.new0  1))
  (define %9 (*  %8  32))
  (define %14 (+  %9  31))
  (define %15 (extract  %14 %9 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp2q_u32 (bitvector 128))
(define-symbolic b_vuzp2q_u32 (bitvector 128))
(verify (assert (equal? (vuzp2q_u32.check a_vuzp2q_u32 b_vuzp2q_u32 ) (vuzp2q_u32 a_vuzp2q_u32 b_vuzp2q_u32 ))))
(display "vuzp2q_u32" (current-error-port))
(define (vuzp2q_u64.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 64))])
  (define %7.new0 (/  e0.new  32))
  (define %8 (+  %7.new0  1))
  (define %9 (*  %8  64))
  (define %14 (+  %9  63))
  (define %15 (extract  %14 %9 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp2q_u64 (bitvector 128))
(define-symbolic b_vuzp2q_u64 (bitvector 128))
(verify (assert (equal? (vuzp2q_u64.check a_vuzp2q_u64 b_vuzp2q_u64 ) (vuzp2q_u64 a_vuzp2q_u64 b_vuzp2q_u64 ))))
(display "vuzp2q_u64" (current-error-port))
(define (vuzp2q_u8.check  a b )
(define %1 (concat b a))
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([e0.new (reverse (range 0 128 8))])
  (define %7.new0 (/  e0.new  4))
  (define %8 (+  %7.new0  1))
  (define %9 (*  %8  8))
  (define %14 (+  %9  7))
  (define %15 (extract  %14 %9 %1))
  %15
 )
 )
)
)
)
result)
(define-symbolic a_vuzp2q_u8 (bitvector 128))
(define-symbolic b_vuzp2q_u8 (bitvector 128))
(verify (assert (equal? (vuzp2q_u8.check a_vuzp2q_u8 b_vuzp2q_u8 ) (vuzp2q_u8 a_vuzp2q_u8 b_vuzp2q_u8 ))))
(display "vuzp2q_u8" (current-error-port))
(define (vzip1_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 16))])
   (define %30 (+  %iterator1.new  15))
   (define %31 (extract  %30 %iterator1.new b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 16))])
   (define %15 (+  %iterator0.new  15))
   (define %16 (extract  %15 %iterator0.new a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip1_s16 (bitvector 64))
(define-symbolic b_vzip1_s16 (bitvector 64))
(verify (assert (equal? (vzip1_s16.check a_vzip1_s16 b_vzip1_s16 ) (vzip1_s16 a_vzip1_s16 b_vzip1_s16 ))))
(display "vzip1_s16" (current-error-port))
(define (vzip1_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 32))])
   (define %30 (+  %iterator1.new  31))
   (define %31 (extract  %30 %iterator1.new b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 32))])
   (define %15 (+  %iterator0.new  31))
   (define %16 (extract  %15 %iterator0.new a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip1_s32 (bitvector 64))
(define-symbolic b_vzip1_s32 (bitvector 64))
(verify (assert (equal? (vzip1_s32.check a_vzip1_s32 b_vzip1_s32 ) (vzip1_s32 a_vzip1_s32 b_vzip1_s32 ))))
(display "vzip1_s32" (current-error-port))
(define (vzip1_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 8))])
   (define %30 (+  %iterator1.new  7))
   (define %31 (extract  %30 %iterator1.new b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 8))])
   (define %15 (+  %iterator0.new  7))
   (define %16 (extract  %15 %iterator0.new a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip1_s8 (bitvector 64))
(define-symbolic b_vzip1_s8 (bitvector 64))
(verify (assert (equal? (vzip1_s8.check a_vzip1_s8 b_vzip1_s8 ) (vzip1_s8 a_vzip1_s8 b_vzip1_s8 ))))
(display "vzip1_s8" (current-error-port))
(define (vzip1_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 16))])
   (define %30 (+  %iterator1.new  15))
   (define %31 (extract  %30 %iterator1.new b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 16))])
   (define %15 (+  %iterator0.new  15))
   (define %16 (extract  %15 %iterator0.new a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip1_u16 (bitvector 64))
(define-symbolic b_vzip1_u16 (bitvector 64))
(verify (assert (equal? (vzip1_u16.check a_vzip1_u16 b_vzip1_u16 ) (vzip1_u16 a_vzip1_u16 b_vzip1_u16 ))))
(display "vzip1_u16" (current-error-port))
(define (vzip1_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 32))])
   (define %30 (+  %iterator1.new  31))
   (define %31 (extract  %30 %iterator1.new b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 32))])
   (define %15 (+  %iterator0.new  31))
   (define %16 (extract  %15 %iterator0.new a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip1_u32 (bitvector 64))
(define-symbolic b_vzip1_u32 (bitvector 64))
(verify (assert (equal? (vzip1_u32.check a_vzip1_u32 b_vzip1_u32 ) (vzip1_u32 a_vzip1_u32 b_vzip1_u32 ))))
(display "vzip1_u32" (current-error-port))
(define (vzip1_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 8))])
   (define %30 (+  %iterator1.new  7))
   (define %31 (extract  %30 %iterator1.new b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 8))])
   (define %15 (+  %iterator0.new  7))
   (define %16 (extract  %15 %iterator0.new a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip1_u8 (bitvector 64))
(define-symbolic b_vzip1_u8 (bitvector 64))
(verify (assert (equal? (vzip1_u8.check a_vzip1_u8 b_vzip1_u8 ) (vzip1_u8 a_vzip1_u8 b_vzip1_u8 ))))
(display "vzip1_u8" (current-error-port))
(define (vzip1q_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 16))])
   (define %30 (+  %iterator1.new  15))
   (define %31 (extract  %30 %iterator1.new b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 16))])
   (define %15 (+  %iterator0.new  15))
   (define %16 (extract  %15 %iterator0.new a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip1q_s16 (bitvector 128))
(define-symbolic b_vzip1q_s16 (bitvector 128))
(verify (assert (equal? (vzip1q_s16.check a_vzip1q_s16 b_vzip1q_s16 ) (vzip1q_s16 a_vzip1q_s16 b_vzip1q_s16 ))))
(display "vzip1q_s16" (current-error-port))
(define (vzip1q_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 32))])
   (define %30 (+  %iterator1.new  31))
   (define %31 (extract  %30 %iterator1.new b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 32))])
   (define %15 (+  %iterator0.new  31))
   (define %16 (extract  %15 %iterator0.new a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip1q_s32 (bitvector 128))
(define-symbolic b_vzip1q_s32 (bitvector 128))
(verify (assert (equal? (vzip1q_s32.check a_vzip1q_s32 b_vzip1q_s32 ) (vzip1q_s32 a_vzip1q_s32 b_vzip1q_s32 ))))
(display "vzip1q_s32" (current-error-port))
(define (vzip1q_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 64))])
   (define %30 (+  %iterator1.new  63))
   (define %31 (extract  %30 %iterator1.new b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 64))])
   (define %15 (+  %iterator0.new  63))
   (define %16 (extract  %15 %iterator0.new a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip1q_s64 (bitvector 128))
(define-symbolic b_vzip1q_s64 (bitvector 128))
(verify (assert (equal? (vzip1q_s64.check a_vzip1q_s64 b_vzip1q_s64 ) (vzip1q_s64 a_vzip1q_s64 b_vzip1q_s64 ))))
(display "vzip1q_s64" (current-error-port))
(define (vzip1q_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 8))])
   (define %30 (+  %iterator1.new  7))
   (define %31 (extract  %30 %iterator1.new b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 8))])
   (define %15 (+  %iterator0.new  7))
   (define %16 (extract  %15 %iterator0.new a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip1q_s8 (bitvector 128))
(define-symbolic b_vzip1q_s8 (bitvector 128))
(verify (assert (equal? (vzip1q_s8.check a_vzip1q_s8 b_vzip1q_s8 ) (vzip1q_s8 a_vzip1q_s8 b_vzip1q_s8 ))))
(display "vzip1q_s8" (current-error-port))
(define (vzip1q_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 16))])
   (define %30 (+  %iterator1.new  15))
   (define %31 (extract  %30 %iterator1.new b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 16))])
   (define %15 (+  %iterator0.new  15))
   (define %16 (extract  %15 %iterator0.new a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip1q_u16 (bitvector 128))
(define-symbolic b_vzip1q_u16 (bitvector 128))
(verify (assert (equal? (vzip1q_u16.check a_vzip1q_u16 b_vzip1q_u16 ) (vzip1q_u16 a_vzip1q_u16 b_vzip1q_u16 ))))
(display "vzip1q_u16" (current-error-port))
(define (vzip1q_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 32))])
   (define %30 (+  %iterator1.new  31))
   (define %31 (extract  %30 %iterator1.new b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 32))])
   (define %15 (+  %iterator0.new  31))
   (define %16 (extract  %15 %iterator0.new a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip1q_u32 (bitvector 128))
(define-symbolic b_vzip1q_u32 (bitvector 128))
(verify (assert (equal? (vzip1q_u32.check a_vzip1q_u32 b_vzip1q_u32 ) (vzip1q_u32 a_vzip1q_u32 b_vzip1q_u32 ))))
(display "vzip1q_u32" (current-error-port))
(define (vzip1q_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 64))])
   (define %30 (+  %iterator1.new  63))
   (define %31 (extract  %30 %iterator1.new b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 64))])
   (define %15 (+  %iterator0.new  63))
   (define %16 (extract  %15 %iterator0.new a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip1q_u64 (bitvector 128))
(define-symbolic b_vzip1q_u64 (bitvector 128))
(verify (assert (equal? (vzip1q_u64.check a_vzip1q_u64 b_vzip1q_u64 ) (vzip1q_u64 a_vzip1q_u64 b_vzip1q_u64 ))))
(display "vzip1q_u64" (current-error-port))
(define (vzip1q_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 8))])
   (define %30 (+  %iterator1.new  7))
   (define %31 (extract  %30 %iterator1.new b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 8))])
   (define %15 (+  %iterator0.new  7))
   (define %16 (extract  %15 %iterator0.new a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip1q_u8 (bitvector 128))
(define-symbolic b_vzip1q_u8 (bitvector 128))
(verify (assert (equal? (vzip1q_u8.check a_vzip1q_u8 b_vzip1q_u8 ) (vzip1q_u8 a_vzip1q_u8 b_vzip1q_u8 ))))
(display "vzip1q_u8" (current-error-port))
(define (vzip2_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 16))])
   (define %iterator1.new.div (/  %iterator1.new  16))
   (define %25 (+  2  %iterator1.new.div))
   (define %26 (*  %25  16))
   (define %30 (+  %26  15))
   (define %31 (extract  %30 %26 b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 16))])
   (define %iterator0.new.div (/  %iterator0.new  16))
   (define %10 (+  2  %iterator0.new.div))
   (define %11 (*  %10  16))
   (define %15 (+  %11  15))
   (define %16 (extract  %15 %11 a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip2_s16 (bitvector 64))
(define-symbolic b_vzip2_s16 (bitvector 64))
(verify (assert (equal? (vzip2_s16.check a_vzip2_s16 b_vzip2_s16 ) (vzip2_s16 a_vzip2_s16 b_vzip2_s16 ))))
(display "vzip2_s16" (current-error-port))
(define (vzip2_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 32))])
   (define %iterator1.new.div (/  %iterator1.new  32))
   (define %25 (+  1  %iterator1.new.div))
   (define %26 (*  %25  32))
   (define %30 (+  %26  31))
   (define %31 (extract  %30 %26 b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 32))])
   (define %iterator0.new.div (/  %iterator0.new  32))
   (define %10 (+  1  %iterator0.new.div))
   (define %11 (*  %10  32))
   (define %15 (+  %11  31))
   (define %16 (extract  %15 %11 a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip2_s32 (bitvector 64))
(define-symbolic b_vzip2_s32 (bitvector 64))
(verify (assert (equal? (vzip2_s32.check a_vzip2_s32 b_vzip2_s32 ) (vzip2_s32 a_vzip2_s32 b_vzip2_s32 ))))
(display "vzip2_s32" (current-error-port))
(define (vzip2_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 8))])
   (define %iterator1.new.div (/  %iterator1.new  8))
   (define %25 (+  4  %iterator1.new.div))
   (define %26 (*  %25  8))
   (define %30 (+  %26  7))
   (define %31 (extract  %30 %26 b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 8))])
   (define %iterator0.new.div (/  %iterator0.new  8))
   (define %10 (+  4  %iterator0.new.div))
   (define %11 (*  %10  8))
   (define %15 (+  %11  7))
   (define %16 (extract  %15 %11 a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip2_s8 (bitvector 64))
(define-symbolic b_vzip2_s8 (bitvector 64))
(verify (assert (equal? (vzip2_s8.check a_vzip2_s8 b_vzip2_s8 ) (vzip2_s8 a_vzip2_s8 b_vzip2_s8 ))))
(display "vzip2_s8" (current-error-port))
(define (vzip2_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 16))])
   (define %iterator1.new.div (/  %iterator1.new  16))
   (define %25 (+  2  %iterator1.new.div))
   (define %26 (*  %25  16))
   (define %30 (+  %26  15))
   (define %31 (extract  %30 %26 b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 16))])
   (define %iterator0.new.div (/  %iterator0.new  16))
   (define %10 (+  2  %iterator0.new.div))
   (define %11 (*  %10  16))
   (define %15 (+  %11  15))
   (define %16 (extract  %15 %11 a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip2_u16 (bitvector 64))
(define-symbolic b_vzip2_u16 (bitvector 64))
(verify (assert (equal? (vzip2_u16.check a_vzip2_u16 b_vzip2_u16 ) (vzip2_u16 a_vzip2_u16 b_vzip2_u16 ))))
(display "vzip2_u16" (current-error-port))
(define (vzip2_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 32))])
   (define %iterator1.new.div (/  %iterator1.new  32))
   (define %25 (+  1  %iterator1.new.div))
   (define %26 (*  %25  32))
   (define %30 (+  %26  31))
   (define %31 (extract  %30 %26 b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 32))])
   (define %iterator0.new.div (/  %iterator0.new  32))
   (define %10 (+  1  %iterator0.new.div))
   (define %11 (*  %10  32))
   (define %15 (+  %11  31))
   (define %16 (extract  %15 %11 a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip2_u32 (bitvector 64))
(define-symbolic b_vzip2_u32 (bitvector 64))
(verify (assert (equal? (vzip2_u32.check a_vzip2_u32 b_vzip2_u32 ) (vzip2_u32 a_vzip2_u32 b_vzip2_u32 ))))
(display "vzip2_u32" (current-error-port))
(define (vzip2_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 32 8))])
   (define %iterator1.new.div (/  %iterator1.new  8))
   (define %25 (+  4  %iterator1.new.div))
   (define %26 (*  %25  8))
   (define %30 (+  %26  7))
   (define %31 (extract  %30 %26 b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 32 8))])
   (define %iterator0.new.div (/  %iterator0.new  8))
   (define %10 (+  4  %iterator0.new.div))
   (define %11 (*  %10  8))
   (define %15 (+  %11  7))
   (define %16 (extract  %15 %11 a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip2_u8 (bitvector 64))
(define-symbolic b_vzip2_u8 (bitvector 64))
(verify (assert (equal? (vzip2_u8.check a_vzip2_u8 b_vzip2_u8 ) (vzip2_u8 a_vzip2_u8 b_vzip2_u8 ))))
(display "vzip2_u8" (current-error-port))
(define (vzip2q_s16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 16))])
   (define %iterator1.new.div (/  %iterator1.new  16))
   (define %25 (+  4  %iterator1.new.div))
   (define %26 (*  %25  16))
   (define %30 (+  %26  15))
   (define %31 (extract  %30 %26 b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 16))])
   (define %iterator0.new.div (/  %iterator0.new  16))
   (define %10 (+  4  %iterator0.new.div))
   (define %11 (*  %10  16))
   (define %15 (+  %11  15))
   (define %16 (extract  %15 %11 a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip2q_s16 (bitvector 128))
(define-symbolic b_vzip2q_s16 (bitvector 128))
(verify (assert (equal? (vzip2q_s16.check a_vzip2q_s16 b_vzip2q_s16 ) (vzip2q_s16 a_vzip2q_s16 b_vzip2q_s16 ))))
(display "vzip2q_s16" (current-error-port))
(define (vzip2q_s32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 32))])
   (define %iterator1.new.div (/  %iterator1.new  32))
   (define %25 (+  2  %iterator1.new.div))
   (define %26 (*  %25  32))
   (define %30 (+  %26  31))
   (define %31 (extract  %30 %26 b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 32))])
   (define %iterator0.new.div (/  %iterator0.new  32))
   (define %10 (+  2  %iterator0.new.div))
   (define %11 (*  %10  32))
   (define %15 (+  %11  31))
   (define %16 (extract  %15 %11 a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip2q_s32 (bitvector 128))
(define-symbolic b_vzip2q_s32 (bitvector 128))
(verify (assert (equal? (vzip2q_s32.check a_vzip2q_s32 b_vzip2q_s32 ) (vzip2q_s32 a_vzip2q_s32 b_vzip2q_s32 ))))
(display "vzip2q_s32" (current-error-port))
(define (vzip2q_s64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 64))])
   (define %iterator1.new.div (/  %iterator1.new  64))
   (define %25 (+  1  %iterator1.new.div))
   (define %26 (*  %25  64))
   (define %30 (+  %26  63))
   (define %31 (extract  %30 %26 b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 64))])
   (define %iterator0.new.div (/  %iterator0.new  64))
   (define %10 (+  1  %iterator0.new.div))
   (define %11 (*  %10  64))
   (define %15 (+  %11  63))
   (define %16 (extract  %15 %11 a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip2q_s64 (bitvector 128))
(define-symbolic b_vzip2q_s64 (bitvector 128))
(verify (assert (equal? (vzip2q_s64.check a_vzip2q_s64 b_vzip2q_s64 ) (vzip2q_s64 a_vzip2q_s64 b_vzip2q_s64 ))))
(display "vzip2q_s64" (current-error-port))
(define (vzip2q_s8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 8))])
   (define %iterator1.new.div (/  %iterator1.new  8))
   (define %25 (+  8  %iterator1.new.div))
   (define %26 (*  %25  8))
   (define %30 (+  %26  7))
   (define %31 (extract  %30 %26 b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 8))])
   (define %iterator0.new.div (/  %iterator0.new  8))
   (define %10 (+  8  %iterator0.new.div))
   (define %11 (*  %10  8))
   (define %15 (+  %11  7))
   (define %16 (extract  %15 %11 a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip2q_s8 (bitvector 128))
(define-symbolic b_vzip2q_s8 (bitvector 128))
(verify (assert (equal? (vzip2q_s8.check a_vzip2q_s8 b_vzip2q_s8 ) (vzip2q_s8 a_vzip2q_s8 b_vzip2q_s8 ))))
(display "vzip2q_s8" (current-error-port))
(define (vzip2q_u16.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 16))])
   (define %iterator1.new.div (/  %iterator1.new  16))
   (define %25 (+  4  %iterator1.new.div))
   (define %26 (*  %25  16))
   (define %30 (+  %26  15))
   (define %31 (extract  %30 %26 b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 16))])
   (define %iterator0.new.div (/  %iterator0.new  16))
   (define %10 (+  4  %iterator0.new.div))
   (define %11 (*  %10  16))
   (define %15 (+  %11  15))
   (define %16 (extract  %15 %11 a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip2q_u16 (bitvector 128))
(define-symbolic b_vzip2q_u16 (bitvector 128))
(verify (assert (equal? (vzip2q_u16.check a_vzip2q_u16 b_vzip2q_u16 ) (vzip2q_u16 a_vzip2q_u16 b_vzip2q_u16 ))))
(display "vzip2q_u16" (current-error-port))
(define (vzip2q_u32.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 32))])
   (define %iterator1.new.div (/  %iterator1.new  32))
   (define %25 (+  2  %iterator1.new.div))
   (define %26 (*  %25  32))
   (define %30 (+  %26  31))
   (define %31 (extract  %30 %26 b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 32))])
   (define %iterator0.new.div (/  %iterator0.new  32))
   (define %10 (+  2  %iterator0.new.div))
   (define %11 (*  %10  32))
   (define %15 (+  %11  31))
   (define %16 (extract  %15 %11 a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip2q_u32 (bitvector 128))
(define-symbolic b_vzip2q_u32 (bitvector 128))
(verify (assert (equal? (vzip2q_u32.check a_vzip2q_u32 b_vzip2q_u32 ) (vzip2q_u32 a_vzip2q_u32 b_vzip2q_u32 ))))
(display "vzip2q_u32" (current-error-port))
(define (vzip2q_u64.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 64))])
   (define %iterator1.new.div (/  %iterator1.new  64))
   (define %25 (+  1  %iterator1.new.div))
   (define %26 (*  %25  64))
   (define %30 (+  %26  63))
   (define %31 (extract  %30 %26 b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 64))])
   (define %iterator0.new.div (/  %iterator0.new  64))
   (define %10 (+  1  %iterator0.new.div))
   (define %11 (*  %10  64))
   (define %15 (+  %11  63))
   (define %16 (extract  %15 %11 a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip2q_u64 (bitvector 128))
(define-symbolic b_vzip2q_u64 (bitvector 128))
(verify (assert (equal? (vzip2q_u64.check a_vzip2q_u64 b_vzip2q_u64 ) (vzip2q_u64 a_vzip2q_u64 b_vzip2q_u64 ))))
(display "vzip2q_u64" (current-error-port))
(define (vzip2q_u8.check  a b )
(define result
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (concat 
  (apply
  concat
  (for/list ([%iterator1.new (reverse (range 0 64 8))])
   (define %iterator1.new.div (/  %iterator1.new  8))
   (define %25 (+  8  %iterator1.new.div))
   (define %26 (*  %25  8))
   (define %30 (+  %26  7))
   (define %31 (extract  %30 %26 b))
   %31
  )
  )
  (apply
  concat
  (for/list ([%iterator0.new (reverse (range 0 64 8))])
   (define %iterator0.new.div (/  %iterator0.new  8))
   (define %10 (+  8  %iterator0.new.div))
   (define %11 (*  %10  8))
   (define %15 (+  %11  7))
   (define %16 (extract  %15 %11 a))
   %16
  )
  )
 )
)
)
)
result)
(define-symbolic a_vzip2q_u8 (bitvector 128))
(define-symbolic b_vzip2q_u8 (bitvector 128))
(verify (assert (equal? (vzip2q_u8.check a_vzip2q_u8 b_vzip2q_u8 ) (vzip2q_u8 a_vzip2q_u8 b_vzip2q_u8 ))))
(display "vzip2q_u8" (current-error-port))
