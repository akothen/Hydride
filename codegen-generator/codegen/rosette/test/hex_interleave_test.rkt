

#lang rosette

(require racket/pretty)


(define (hexagon_V6_vshuffvdd_128B  Vu Vv Rt)
(define Rt_int (bitvector->integer Rt))
(define %elem_size (* (- 0 Rt_int) 8))
(define Vdd
  (apply
    concat
    (for/list ([%outer.it (reverse (range 0 2048 2048))])
      (apply
        concat
        (for/list ([%inner.it (reverse (range 0 1024 %elem_size))])
          (define %low %inner.it)
          (define %high (+ %inner.it (- %elem_size 1)))
          (define %a (extract  %high %low Vu))
          (define %b (extract  %high %low Vv))
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
(define Rt1 (bv -1 32))
(define Rt2 (bv -2 32))
(define Rt3 (bv -4 32))

(pretty-print "hexagon_V6_vshuffvdd_128B 8-elem interleave:")
(pretty-print (hexagon_V6_vshuffvdd_128B a1024 b1024 Rt1))

(pretty-print "hexagon_V6_vshuffvdd_128B 16-elem interleave:")
(pretty-print (hexagon_V6_vshuffvdd_128B a1024 b1024 Rt2))

(pretty-print "hexagon_V6_vshuffvdd_128B 32-elem interleave:")
(pretty-print (hexagon_V6_vshuffvdd_128B a1024 b1024 Rt3))

