#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/lib/destruct)
(require racket/match)




(require hydride/ir/hydride/definition)
(require hydride/ir/hvx/definition)

(require hydride/ir/hvx/interpreter)
(require hydride/ir/hvx/visitor)

(provide (all-defined-out))



(define (hvx:instcombine_fast expr)
  
  (define (visitor-fn ele)
    (match
      ele
    [(hexagon_V6_lo_128B_dsl  (hexagon_V6_vcombine_128B_dsl v0 v1 size_i_o_ num_3_ num_4_ num_5_ num_6_ num_7_ num_8_ prec_i_o_ num_10_ num_11_) size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
     (displayln "low-combine case")
     v1
     ]
    [(hexagon_V6_vassign_128B_dsl (hexagon_V6_vcombine_128B_dsl v0 v1 size_i_o_ num_3_ num_4_ num_5_ num_6_ num_7_ num_8_ prec_i_o_ num_10_ num_11_) size_i_o num_2 num_3 num_4 prec_i_o num_6)
     (displayln "hi-combine case")
     v0
     ]
    [_ ele]
      )
    )


  (hvx:visitor expr visitor-fn)
  
  
  )
