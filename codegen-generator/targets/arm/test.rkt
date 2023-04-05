#lang rosette
(define (vaddl_s8  a b )
(define result
(apply
concat
(for/list ([e0 (reverse (range 0 8 1))])
 (define %2 (*  e0  8))
 (define %3 (+  e0  1))
 (define %4 (*  %3  8))
 (define %5 (-  %4  1))
 (define %6 (extract  %5 %2 a))
 (define %7 (sign-extend  %6 (bitvector 16)))
 (define %8 (*  e0  8))
 (define %9 (+  e0  1))
 (define %10 (*  %9  8))
 (define %11 (-  %10  1))
 (define %12 (extract  %11 %8 b))
 (define %13 (sign-extend  %12 (bitvector 16)))
 (define %14 (bvadd  %7  %13))
 (define %24 (extract  15 0 %14))
 %24
)
)
)
result)
(vaddl_s8 (bv #xedd1a4e079cf1ea4 64) (bv #x1115ccef91315b74 64))
(assert (eq? (vaddl_s8 (bv #xedd1a4e079cf1ea4 64) (bv #x1115ccef91315b74 64)) (bv #xfffeffe6ff70ffcf000a000000790018 128)))