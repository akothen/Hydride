
#lang rosette

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require hydride)


(define (hexagon_V6_vmpyhvsrs_128B  Vu Vv )
  (define Vd
    (apply
    concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
        (apply
        concat
          (for/list ([i.new (reverse (range 0 1024 16))])
            (define %lastidx0 (- 16  1))
            (define %1 (+  i.new  %lastidx0))
            (define %2 (extract  %1 i.new Vu))
            (define %3.ab0 (bvsizeext  %2 32 1))
            (define %4 (extract  %1 i.new Vv))
            (define %5.ab0 (bvsizeext  %4 32 1))
            (define %6 (bvmul %3.ab0 %5.ab0))
            (define %7 (bvshl %6 (bv 1 32)))
            (define %8.ab0 (bvaddnw %7 (bv #x00000000000000000000000000008000 32) 32 -1 ))
            (define %9.ab0 (bvsaturate %8.ab0 32 32 1))
            (define %lastidx1 (- 32  1)) ;; 31 
            (define %highidx0 (+  %lastidx1  16))
            (printf "extracting ~a ~a from ~a\n" %highidx0 16 %9.ab0) ;; Appears to be extracting out of bounds
            (define %10 (extract %highidx0 16 %9.ab0)) ; Before was  highidx0 instead of  highidx0
            (define %11.ab0 (bvsaturate %10 16 16 1))
            %11.ab0
          )
        )
      )
    )
  )
  (bvpadhighbits  Vd 0)
)

(define (get-halide-result env)
  (define buf-0 (halide:create-buffer (vector-ref env 0) 'int16))
  (define buf-1 (halide:create-buffer (vector-ref env 1) 'int16))
  (define fifteen (xBroadcast (int-imm (bv 15 16) #t) 64))

  (define halide-expr
    (vec-rounding_mul_shift_right buf-0 buf-1 fifteen)

    )

  (halide:assemble-bitvector (halide:interpret halide-expr) (halide:vec-len halide-expr))
  
  )


(define (get-hydride-result env)
  (hexagon_V6_vmpyhvsrs_128B (vector-ref env 0) (vector-ref env 1))
  )

(define v1 (?? (bitvector 1024)))
(define v2 (?? (bitvector 1024)))

;; comment these lines below for testing verification
(set! v1 (create-splat 128000 64 16));(create-tensor 1 64 16))
(set! v2 (create-splat 40 64 16))
(define env (vector v1 v2))

(define halide-result (get-halide-result env))
(printf "Halide Result:\t~a\n" halide-result)
(define hydride-result (get-hydride-result env))
(printf "Hydride Result:\t~a\n" hydride-result)

(printf "Equal? ~a\n" (equal? halide-result hydride-result))

(define cex
  (verify
    (assert (equal? halide-result hydride-result))
    )
  
  )

(println cex)

