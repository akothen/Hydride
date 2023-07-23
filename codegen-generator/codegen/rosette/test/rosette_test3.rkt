#lang rosette

(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)


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
            (define %lastidx1 (- 32  1))
            (define %highidx0 (+  %lastidx1  16))
            (define %10 (extract highidx0 16 %9.ab0))
            (define %11.ab0 (bvsaturate %10 16 16 1))
            %11.ab0
          )
        )
      )
    )
  )
  (bvpadhighbits  Vd 0)
)



