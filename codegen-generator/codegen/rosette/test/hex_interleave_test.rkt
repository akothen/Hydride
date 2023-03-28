

#lang rosette

(require racket/pretty)


(define (hexagon_V6_vshuff_128B  Vu Vv Rt)
(define Rt_int (bitvector->integer Rt))
(pretty-print "Rt_int")
(pretty-print Rt_int)
(define %elem_size (* (- 0 Rt_int) 8))
(pretty-print "%elem_size")
(pretty-print %elem_size)
(define Vdd
  (apply
    concat
    (for/list ([%outer.it (reverse (range 0 2048 2048))])
      (apply
        concat
        (for/list ([%inner.it (reverse (range 0 1024 %elem_size))])
          (define %low %inner.it)
          (pretty-print "%low:")
          (pretty-print %low)
          (define %high (+ %inner.it (- %elem_size 1)))
          (pretty-print "%high:")
          (pretty-print %high)
          (define %a (extract  %high %low Vu))
          (pretty-print "%a")
          (pretty-print %a)
          (define %b (extract  %high %low Vv))
          (pretty-print "%b")
          (pretty-print %b)
          (pretty-print "(concat %b %a):")
          (pretty-print (concat %b %a))
          (concat %b %a)
        )
      )
    )
  )
 )
 Vdd
)



(define a1024 (bv #x00112233445566778899aabbccddeeff00112233445566778899aabbccddeeff00112233445566778899aabbccddeeff00112233445566778899aabbccddeeff00112233445566778899aabbccddeeff00112233445566778899aabbccddeeff00112233445566778899aabbccddeeff00112233445566778899aabbccddeeff 1024))
(define b1024 (bv #xffeeddccbbaa99887766554433221100ffeeddccbbaa99887766554433221100ffeeddccbbaa99887766554433221100ffeeddccbbaa99887766554433221100ffeeddccbbaa99887766554433221100ffeeddccbbaa99887766554433221100ffeeddccbbaa99887766554433221100ffeeddccbbaa99887766554433221100 1024))
(define Rt (bv -1 32))

(pretty-print (hexagon_V6_vshuff_128B a1024 b1024 Rt))

