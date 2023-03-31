#lang rosette
(define (vsubq_s16  a b )
  (define result
    (apply
     concat
     (for/list ([e0 (reverse (range 0 8 1))])
       (define %1 (*  e0  16))
       (define %2 (+  e0  1))
       (define %3 (*  %2  16))
       (define %4 (-  %3  1))
       (define %5 (extract  %4 %1 a))
       (define %6 (*  e0  16))
       (define %7 (+  e0  1))
       (define %8 (*  %7  16))
       (define %9 (-  %8  1))
       (define %10 (extract  %9 %6 b))
       (define %11 (bvsub  %5  %10))
       %11
       )
     )
    )
  result)
(define a128 (bv #xf001f001f001f001f001f001f001f001 128))
(define b128 (bv #x10021003100210031002100310021003 128))
(assert (eq? (vsubq_s16 a128 b128) (bv #xdfffdffedfffdffedfffdffedfffdffe 128)))