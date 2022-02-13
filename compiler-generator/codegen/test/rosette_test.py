#lang rosette

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)


(define (_m_pmulhw  a b )
(define  dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 64 64))])
 (apply
 concat
 (for/list ([%j0.new (reverse (range 0 64 16))])
  (define %1 (+  %j0.new  15))
  (define %2 (extract  %1 %j0.new a))
  (define %3 (sign-extend  %2 (bitvector 32)))
  (define %5 (extract  %1 %j0.new b))
  (define %6 (sign-extend  %5 (bitvector 32)))
  (define %7 (bvmul  %3  %6))
  (define %8 (extract  (- 31 16) (- 31 31) %7))
  %8
 )
 )
)
)
)
dst
)

(define (_mm_madd_epi16  a b )
(define  dst
(apply
concat
(for/list ([%outer.it (reverse (range 0 128 128))])
 (apply
 concat
 (for/list ([%j0.new (reverse (range 0 128 32))])
  (define %2 (+  %j0.new  16))
  (define %3 (+  %j0.new  31))
  (define %4 (extract  %3 %2 a))
  (define %7 (extract  %3 %2 b))
  (define %8 (sign-extend  %4 (bitvector 32)))
  (define %9 (sign-extend  %7 (bitvector 32)))
  (define %10 (bvmul  %8  %9))
  (define %11 (+  %j0.new  15))
  (define %12 (extract  %11 %j0.new a))
  (define %14 (extract  %11 %j0.new b))
  (define %15 (sign-extend  %12 (bitvector 32)))
  (define %16 (sign-extend  %14 (bitvector 32)))
  (define %17 (bvmul  %15  %16))
  (define %18 (bvadd  %10  %17))
  %18
 )
 )
)
)
)
dst
)


;; Test the semantics
(define a64 (bv #x0002000200020002 64))
(define b64 (bv #x0002000300040005 64))
(define src64 (bv 0 64))

(define a128 (bv #x00010001000100010001000100010001 128))
(define b128 (bv #x00020003000200030002000300020003 128))
(define src128 (bv 0 128))
(define mask8 (bv #x0f 8))

(define a256 (bv #x0001000100010001000100010001000100010001000100010001000100010001 256))
(define b256 (bv #x0002000300020003000200030002000300020003000200030002000300020003 256))
(define src256 (bv 0 256))
(define mask16 (bv #x0f0f 16))

(define a512 (bv #x00010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001 512))
(define b512 (bv #x00020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003 512))
(define src512 (bv 0 512))
(define mask128 (bv #x00010100000101000001010000010100 128))

(define a1024 (bv #x0001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001 1024))
(define b1024 (bv #x0001000100020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003000200030002000300020003 1024))
(define src1024 (bv 0 1024))

(define (res)
  (pretty-print (_m_pmulhw a64 b64))
  (pretty-print (_mm_madd_epi16 a128 b128))
 )

(res)

