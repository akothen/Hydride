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


      ; hexagon_V6_vdmpyhb_acc_128B -> hexagon_V6_vdmpyhb_128B 
      [(hexagon_V6_vdmpyhb_acc_128B_dsl (lit vacc) v1 v2 1024 32 0 16 8 -1 1 1 4 16 16 2 8 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vdmpyhb_acc_128B -> hexagon_V6_vdmpyhb_128B ...")
          (hexagon_V6_vdmpyhb_acc_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) v1 v2 1024 32 0 16 8 -1 1 1 4 16 16 2 8 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpyih_acc_128B -> hexagon_V6_vmpyih_128B 
      [(hexagon_V6_vmpyih_acc_128B_dsl (lit vacc) v1 v2 1024 1024 0 1024 16 -1 1 32 1 32 1 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpyih_acc_128B -> hexagon_V6_vmpyih_128B ...")
          (hexagon_V6_vmpyih_128B_dsl v1 v2 1024 1024 0 1024 16 1 32 1 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vaslh_acc_128B -> hexagon_V6_vaslh_128B 
      [(hexagon_V6_vaslh_acc_128B_dsl (lit v_const_0) (lit vacc) v2 v3 1024 1024 0 1024 16 -1 1 32 1 32 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) (equal? v_const_0 (bv #x0000000000000000000000000000000f (bitvector 32))))
          (displayln "Rewriting hexagon_V6_vaslh_acc_128B -> hexagon_V6_vaslh_128B ...")
          (hexagon_V6_vaslh_128B_dsl (lit (bv #x0000000000000000000000000000000f (bitvector 32))) v2 v3 1024 1024 0 1024 16 1 32 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vaslw_acc_128B -> hexagon_V6_vaslw_128B 
      [(hexagon_V6_vaslw_acc_128B_dsl (lit v_const_0) (lit vacc) v2 v3 1024 1024 0 1024 32 -1 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) (equal? v_const_0 (bv #x0000000000000000000000000000001f (bitvector 32))))
          (displayln "Rewriting hexagon_V6_vaslw_acc_128B -> hexagon_V6_vaslw_128B ...")
          (hexagon_V6_vaslw_128B_dsl (lit (bv #x0000000000000000000000000000001f (bitvector 32))) v2 v3 1024 1024 0 1024 32 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpyiewuh_acc_128B -> hexagon_V6_vmpyiewuh_128B 
      [(hexagon_V6_vmpyiewh_acc_128B_dsl (lit vacc) v1 v2 1024 1024 0 512 16 32 1 -1 1 64 0 64 1 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpyiewuh_acc_128B -> hexagon_V6_vmpyiewuh_128B ...")
          (hexagon_V6_vmpyiewuh_128B_dsl v1 v2 1024 1024 0 512 16 32 1 1 64 1 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpyiwh_acc_128B -> hexagon_V6_vmpyiwh_128B 
      [(hexagon_V6_vmpyiwh_acc_128B_dsl (lit vacc) v1 v2 32 32 0 512 16 32 1 -1 1 64 1 64 1 2 16 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpyiwh_acc_128B -> hexagon_V6_vmpyiwh_128B ...")
          (hexagon_V6_vmpyihb_128B_dsl v1 v2 32 32 0 512 16 32 1 1 64 1 2 16 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpyiwub_acc_128B -> hexagon_V6_vmpyiwub_128B 
      [(hexagon_V6_vmpyiwh_acc_128B_dsl (lit vacc) v1 v2 32 32 0 256 8 32 1 -1 1 64 0 64 1 4 8 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpyiwub_acc_128B -> hexagon_V6_vmpyiwub_128B ...")
          (hexagon_V6_vmpyihb_128B_dsl v1 v2 32 32 0 256 8 32 1 0 64 1 4 8 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpyiwb_acc_128B -> hexagon_V6_vmpyiwb_128B 
      [(hexagon_V6_vmpyiwh_acc_128B_dsl (lit vacc) v1 v2 32 32 0 256 8 32 1 -1 1 64 1 64 1 4 8 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpyiwb_acc_128B -> hexagon_V6_vmpyiwb_128B ...")
          (hexagon_V6_vmpyihb_128B_dsl v1 v2 32 32 0 256 8 32 1 1 64 1 4 8 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpyihb_acc_128B -> hexagon_V6_vmpyihb_128B 
      [(hexagon_V6_vmpyiwh_acc_128B_dsl (lit vacc) v1 v2 32 32 0 512 8 16 1 -1 1 32 1 32 1 4 8 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpyihb_acc_128B -> hexagon_V6_vmpyihb_128B ...")
          (hexagon_V6_vmpyihb_128B_dsl v1 v2 32 32 0 512 8 16 1 1 32 1 4 8 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpabus_acc_128B -> hexagon_V6_vmpabus_128B 
      [(hexagon_V6_vmpabus_acc_128B_dsl (lit vacc) v1 v2 32 32 0 512 8 0 512 8 16 1 -1 -1 1 0 8 1024 1 0 0 16 -1 -1 1 0 24 1032 1 0 16 8 1024 2 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpabus_acc_128B -> hexagon_V6_vmpabus_128B ...")
          (hexagon_V6_vmpabus_128B_dsl v1 v2 32 32 0 512 8 0 512 8 16 1 -1 1 0 8 1024 1 0 0 16 1024 -1 1 0 24 1032 1 0 16 8 2 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpabuu_acc_128B -> hexagon_V6_vmpabuu_128B 
      [(hexagon_V6_vmpabus_acc_128B_dsl (lit vacc) v1 v2 32 32 0 512 8 0 512 8 16 1 -1 -1 0 0 8 1024 0 0 0 16 -1 -1 0 0 24 1032 0 0 16 8 1024 2 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpabuu_acc_128B -> hexagon_V6_vmpabuu_128B ...")
          (hexagon_V6_vmpabus_128B_dsl v1 v2 32 32 0 512 8 0 512 8 16 1 -1 0 0 8 1024 0 0 0 16 1024 -1 0 0 24 1032 0 0 16 8 2 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vandnqrt_acc_128B -> hexagon_V6_vandnqrt_128B 
      [(hexagon_V6_vandnqrt_acc_128B_dsl (lit v_const_0) (lit vacc) v2 v3 128 128 0 128 1 8 1 4 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) (equal? v_const_0 (bv #x00000000 (bitvector 8))))
          (displayln "Rewriting hexagon_V6_vandnqrt_acc_128B -> hexagon_V6_vandnqrt_128B ...")
          (hexagon_V6_vandnqrt_128B_dsl v2 (lit (bv #x00000000 (bitvector 8))) v3 128 128 0 128 1 8 1 4 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpahb_acc_128B -> hexagon_V6_vmpahb_128B 
      [(hexagon_V6_vmpahb_acc_128B_dsl (lit vacc) v1 v2 32 32 0 256 8 0 256 8 32 1 -1 -1 1 1 8 16 1024 1 1 0 16 32 -1 -1 1 1 24 16 1040 1 1 16 16 16 1024 4 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpahb_acc_128B -> hexagon_V6_vmpahb_128B ...")
          (hexagon_V6_vmpauhb_128B_dsl v1 v2 32 32 0 256 8 0 256 8 32 1 -1 1 1 8 16 1024 1 1 0 16 32 1024 -1 1 1 24 16 1040 1 1 16 16 16 4 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpauhb_acc_128B -> hexagon_V6_vmpauhb_128B 
      [(hexagon_V6_vmpahb_acc_128B_dsl (lit vacc) v1 v2 32 32 0 256 8 0 256 8 32 1 -1 -1 1 1 8 16 1024 1 1 0 16 32 -1 -1 1 1 24 16 1040 1 1 16 16 16 1024 4 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpauhb_acc_128B -> hexagon_V6_vmpauhb_128B ...")
          (hexagon_V6_vmpauhb_128B_dsl v1 v2 32 32 0 256 8 0 256 8 32 1 -1 1 1 8 16 1024 1 1 0 16 32 1024 -1 1 1 24 16 1040 1 1 16 16 16 4 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vdmpyhvsat_acc_128B -> hexagon_V6_vdmpyhvsat_128B 
      [(hexagon_V6_vdmpyhvsat_acc_128B_dsl (lit vacc) v1 v2 1024 32 0 32 16 1 1 1 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vdmpyhvsat_acc_128B -> hexagon_V6_vdmpyhvsat_128B ...")
          (hexagon_V6_vdmpyhvsat_acc_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) v1 v2 1024 32 0 32 16 1 1 1 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpyub_acc_128B -> hexagon_V6_vmpyub_128B 
      [(hexagon_V6_vmpyub_acc_128B_dsl (lit vacc) v1 v2 32 32 0 512 8 0 512 8 16 1 -1 0 0 4 4 16 -1 0 0 4 1 4 8 1024 2 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpyub_acc_128B -> hexagon_V6_vmpyub_128B ...")
          (hexagon_V6_vmpyub_128B_dsl v1 v2 32 32 0 512 8 0 512 8 16 1 0 0 4 4 16 1024 0 0 4 1 4 8 2 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpybus_acc_128B -> hexagon_V6_vmpybus_128B 
      [(hexagon_V6_vmpyub_acc_128B_dsl (lit vacc) v1 v2 32 32 0 512 8 0 512 8 16 1 -1 1 0 4 4 16 -1 1 0 4 1 4 8 1024 2 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpybus_acc_128B -> hexagon_V6_vmpybus_128B ...")
          (hexagon_V6_vmpyub_128B_dsl v1 v2 32 32 0 512 8 0 512 8 16 1 1 0 4 4 16 1024 1 0 4 1 4 8 2 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vrmpybus_acc_128B -> hexagon_V6_vrmpybus_128B 
      [(hexagon_V6_vrmpybus_acc_128B_dsl (lit vacc) v1 v2 1024 32 0 32 8 -1 1 1 16 0 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vrmpybus_acc_128B -> hexagon_V6_vrmpybus_128B ...")
          (hexagon_V6_vrmpybus_acc_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) v1 v2 1024 32 0 32 8 -1 1 1 16 0 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vrmpyub_acc_128B -> hexagon_V6_vrmpyub_128B 
      [(hexagon_V6_vrmpybus_acc_128B_dsl (lit vacc) v1 v2 1024 32 0 32 8 -1 0 0 16 0 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vrmpyub_acc_128B -> hexagon_V6_vrmpyub_128B ...")
          (hexagon_V6_vrmpybus_acc_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) v1 v2 1024 32 0 32 8 -1 0 0 16 0 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vandvrt_acc_128B -> hexagon_V6_vandvrt_128B 
      [(hexagon_V6_vandvrt_acc_128B_dsl (lit vacc) (lit v_const_1) (lit v_const_2) (lit v_const_3) v4 v5 128 128 0 128 1 8 4 1 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) (equal? v_const_1 (bv #b1 (bitvector 1))) (equal? v_const_2 (bv #x00000000 (bitvector 8))) (equal? v_const_3 (bv #b0 (bitvector 1))))
          (displayln "Rewriting hexagon_V6_vandvrt_acc_128B -> hexagon_V6_vandvrt_128B ...")
          (hexagon_V6_vandvrt_128B_dsl (lit (bv #b1 (bitvector 1))) (lit (bv #x00000000 (bitvector 8))) v4 (lit (bv #b0 (bitvector 1))) v5 128 128 0 128 1 8 4 1 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpyowh_rnd_sacc_128B -> hexagon_V6_vmpyowh_rnd_128B 
      [(hexagon_V6_vmpyowh_rnd_sacc_128B_dsl (lit v_const_0) (lit v_const_1) (lit v_const_2) (lit vacc) v4 v5 1024 1024 0 512 16 32 1 1 -1 -1 1 64 1 64 1 16 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) (equal? v_const_0 (bv #x000000000000000000000000000000000000000000000000000000000000000e (bitvector 64))) (equal? v_const_1 (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64))) (equal? v_const_2 (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64))))
          (displayln "Rewriting hexagon_V6_vmpyowh_rnd_sacc_128B -> hexagon_V6_vmpyowh_rnd_128B ...")
          (hexagon_V6_vmpyowh_128B_dsl (lit (bv #x000000000000000000000000000000000000000000000000000000000000000e (bitvector 64))) (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64))) (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64))) v4 v5 1024 1024 0 512 16 32 1 1 -1 1 64 1 16 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpyowh_sacc_128B -> hexagon_V6_vmpyowh_128B 
      [(hexagon_V6_vmpyowh_rnd_sacc_128B_dsl (lit v_const_0) (lit v_const_1) (lit v_const_2) (lit vacc) v4 v5 1024 1024 0 512 16 32 1 1 -1 -1 1 64 1 64 1 16 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) (equal? v_const_0 (bv #x000000000000000000000000000000000000000000000000000000000000000e (bitvector 64))) (equal? v_const_1 (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64))) (equal? v_const_2 (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64))))
          (displayln "Rewriting hexagon_V6_vmpyowh_sacc_128B -> hexagon_V6_vmpyowh_128B ...")
          (hexagon_V6_vmpyowh_128B_dsl (lit (bv #x000000000000000000000000000000000000000000000000000000000000000e (bitvector 64))) (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64))) (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64))) v4 v5 1024 1024 0 512 16 32 1 1 -1 1 64 1 16 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vaddubh_acc_128B -> hexagon_V6_vaddubh_128B 
      [(hexagon_V6_vaddubh_acc_128B_dsl (lit vacc) v1 v2 1024 1024 0 512 8 0 512 8 16 1 -1 1 -1 16 -1 1 -1 8 1024 2 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vaddubh_acc_128B -> hexagon_V6_vaddubh_128B ...")
          (hexagon_V6_vaddubh_128B_dsl v1 v2 1024 1024 0 512 8 0 512 8 16 1 0 -1 16 1024 0 -1 8 2 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vadduhw_acc_128B -> hexagon_V6_vadduhw_128B 
      [(hexagon_V6_vaddubh_acc_128B_dsl (lit vacc) v1 v2 1024 1024 0 512 16 0 512 16 32 1 -1 1 -1 32 -1 1 -1 16 1024 2 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vadduhw_acc_128B -> hexagon_V6_vadduhw_128B ...")
          (hexagon_V6_vaddubh_128B_dsl v1 v2 1024 1024 0 512 16 0 512 16 32 1 0 -1 32 1024 0 -1 16 2 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vaddhw_acc_128B -> hexagon_V6_vaddhw_128B 
      [(hexagon_V6_vaddubh_acc_128B_dsl (lit vacc) v1 v2 1024 1024 0 512 16 0 512 16 32 1 -1 1 -1 32 -1 1 -1 16 1024 2 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vaddhw_acc_128B -> hexagon_V6_vaddhw_128B ...")
          (hexagon_V6_vaddubh_128B_dsl v1 v2 1024 1024 0 512 16 0 512 16 32 1 1 -1 32 1024 1 -1 16 2 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpyuhe_acc_128B -> hexagon_V6_vmpyuhe_128B 
      [(hexagon_V6_vmpyuhe_acc_128B_dsl (lit vacc) v1 v2 32 32 0 512 16 32 1 -1 0 0 0 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpyuhe_acc_128B -> hexagon_V6_vmpyuhe_128B ...")
          (hexagon_V6_vmpyuhe_128B_dsl v1 v2 32 32 0 512 16 32 1 0 0 0 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vandqrt_acc_128B -> hexagon_V6_vandqrt_128B 
      [(hexagon_V6_vandqrt_acc_128B_dsl (lit v_const_0) (lit vacc) v2 (lit v_const_3) v4 32 32 0 1024 8 4 1 8 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) (equal? v_const_0 (bv #b1 (bitvector 1))) (equal? v_const_3 (bv #x00000000 (bitvector 8))))
          (displayln "Rewriting hexagon_V6_vandqrt_acc_128B -> hexagon_V6_vandqrt_128B ...")
          (hexagon_V6_vandqrt_128B_dsl (lit (bv #b1 (bitvector 1))) (lit (bv #x00000000 (bitvector 8))) v2 v4 32 32 0 1024 8 4 1 8 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpybv_acc_128B -> hexagon_V6_vmpybv_128B 
      [(hexagon_V6_vmpybv_acc_128B_dsl (lit vacc) v1 v2 1024 1024 0 512 8 0 512 8 16 1 -1 1 1 16 -1 1 1 8 1024 2 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpybv_acc_128B -> hexagon_V6_vmpybv_128B ...")
          (hexagon_V6_vmpybv_128B_dsl v1 v2 1024 1024 0 512 8 0 512 8 16 1 1 1 16 1024 1 1 8 2 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpybusv_acc_128B -> hexagon_V6_vmpybusv_128B 
      [(hexagon_V6_vmpybv_acc_128B_dsl (lit vacc) v1 v2 1024 1024 0 512 8 0 512 8 16 1 -1 1 0 16 -1 1 0 8 1024 2 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpybusv_acc_128B -> hexagon_V6_vmpybusv_128B ...")
          (hexagon_V6_vmpybv_128B_dsl v1 v2 1024 1024 0 512 8 0 512 8 16 1 1 0 16 1024 1 0 8 2 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpyhus_acc_128B -> hexagon_V6_vmpyhus_128B 
      [(hexagon_V6_vmpybv_acc_128B_dsl (lit vacc) v1 v2 1024 1024 0 512 16 0 512 16 32 1 -1 0 1 32 -1 0 1 16 1024 2 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpyhus_acc_128B -> hexagon_V6_vmpyhus_128B ...")
          (hexagon_V6_vmpybv_128B_dsl v1 v2 1024 1024 0 512 16 0 512 16 32 1 0 1 32 1024 0 1 16 2 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpyubv_acc_128B -> hexagon_V6_vmpyubv_128B 
      [(hexagon_V6_vmpybv_acc_128B_dsl (lit vacc) v1 v2 1024 1024 0 512 8 0 512 8 16 1 -1 0 0 16 -1 0 0 8 1024 2 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpyubv_acc_128B -> hexagon_V6_vmpyubv_128B ...")
          (hexagon_V6_vmpybv_128B_dsl v1 v2 1024 1024 0 512 8 0 512 8 16 1 0 0 16 1024 0 0 8 2 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpyuhv_acc_128B -> hexagon_V6_vmpyuhv_128B 
      [(hexagon_V6_vmpybv_acc_128B_dsl (lit vacc) v1 v2 1024 1024 0 512 16 0 512 16 32 1 -1 0 0 32 -1 0 0 16 1024 2 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpyuhv_acc_128B -> hexagon_V6_vmpyuhv_128B ...")
          (hexagon_V6_vmpybv_128B_dsl v1 v2 1024 1024 0 512 16 0 512 16 32 1 0 0 32 1024 0 0 16 2 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpyhv_acc_128B -> hexagon_V6_vmpyhv_128B 
      [(hexagon_V6_vmpybv_acc_128B_dsl (lit vacc) v1 v2 1024 1024 0 512 16 0 512 16 32 1 -1 1 1 32 -1 1 1 16 1024 2 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpyhv_acc_128B -> hexagon_V6_vmpyhv_128B ...")
          (hexagon_V6_vmpybv_128B_dsl v1 v2 1024 1024 0 512 16 0 512 16 32 1 1 1 32 1024 1 1 16 2 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vdmpyhsat_acc_128B -> hexagon_V6_vdmpyhsat_128B 
      [(hexagon_V6_vdmpyhsat_acc_128B_dsl (lit vacc) v1 v2 1024 32 0 32 16 1 1 1 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vdmpyhsat_acc_128B -> hexagon_V6_vdmpyhsat_128B ...")
          (hexagon_V6_vdmpyhsat_acc_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) v1 v2 1024 32 0 32 16 1 1 1 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vdmpyhsusat_acc_128B -> hexagon_V6_vdmpyhsusat_128B 
      [(hexagon_V6_vdmpyhsat_acc_128B_dsl (lit vacc) v1 v2 1024 32 0 32 16 1 0 1 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vdmpyhsusat_acc_128B -> hexagon_V6_vdmpyhsusat_128B ...")
          (hexagon_V6_vdmpyhsat_acc_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) v1 v2 1024 32 0 32 16 1 0 1 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpyh_acc_128B -> hexagon_V6_vmpyh_128B 
      [(hexagon_V6_vmpyh_acc_128B_dsl (lit vacc) v1 v2 32 32 0 512 16 0 512 16 32 1 -1 1 1 0 32 -1 1 1 16 16 1024 2 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpyh_acc_128B -> hexagon_V6_vmpyh_128B ...")
          (hexagon_V6_vmpyh_128B_dsl v1 v2 32 32 0 512 16 0 512 16 32 1 1 1 0 32 1024 1 1 16 16 2 0 )
          ]
         [else ele]
         )
       ]
      ; hexagon_V6_vmpyuh_acc_128B -> hexagon_V6_vmpyuh_128B 
      [(hexagon_V6_vmpyh_acc_128B_dsl (lit vacc) v1 v2 32 32 0 512 16 0 512 16 32 1 -1 0 0 0 32 -1 0 0 16 16 1024 2 0 )
       (cond 
         [(and (equal? (bitvector->integer vacc) 0) )
          (displayln "Rewriting hexagon_V6_vmpyuh_acc_128B -> hexagon_V6_vmpyuh_128B ...")
          (hexagon_V6_vmpyh_128B_dsl v1 v2 32 32 0 512 16 0 512 16 32 1 0 0 0 32 1024 0 0 16 16 2 0 )
          ]
         [else ele]
         )
       ]

      ;; combine multiply add
      [(hexagon_V6_vaddhsat_128B_dsl 
         (hexagon_V6_vmpybv_128B_dsl 
           reg_a ;<128 x i8>

           reg_b;<128 x i8>
           1024  1024  0  512  8  0  512  8  16  1  1  1  16  1024  1  1  8  2  0  );<128 x i16>

         acc_vec ;<128 x i16>
         2048  2048  0  2048  16  -1  0  )


       (displayln "Rewriting mulitply add into widening add")
       (hexagon_V6_vmpybv_acc_128B_dsl 
         acc_vec ;<128 x i16>
         reg_a ;<128 x i8>
         reg_b;<128 x i8>
         1024  1024  0  512  8  0  512  8  16  1  -1  1  0  16  -1  1  0  8  1024  2  0  )
       ]
      [

       (hexagon_V6_vaddhsat_128B_dsl 
         (hexagon_V6_vmpyub_128B_dsl 
           reg_a;<128 x i8>
           reg_const ; <4 x i8>
           32  32  0  512  8  0  512  8  16  1  1  0  4  4  16  1024  1  0  4  1  4  8  2  0  );<128 x i16>

         reg_addend;<128 x i16>
         2048  2048  0  2048  16  -1  0  )

       (hexagon_V6_vmpyub_acc_128B_dsl
         reg_addend
         reg_a
         reg_const
         32 32 0 512 8 0 512 8 16 1 -1 0 0 4 4 16 -1 0 0 4 1 4 8 1024 2 0
         )
       ]

      [

       (hexagon_V6_vaddhsat_128B_dsl 

         reg_addend;<128 x i16>

         (hexagon_V6_vmpyub_128B_dsl 
           reg_a;<128 x i8>
           reg_const ; <4 x i8>
           32  32  0  512  8  0  512  8  16  1  1  0  4  4  16  1024  1  0  4  1  4  8  2  0  );<128 x i16>
         2048  2048  0  2048  16  -1  0  )

       (hexagon_V6_vmpyub_acc_128B_dsl
         reg_addend
         reg_a
         reg_const
         32 32 0 512 8 0 512 8 16 1 -1 0 0 4 4 16 -1 0 0 4 1 4 8 1024 2 0
         )
       ]


      [_ ele]
      )
    )


  (hvx:visitor expr visitor-fn)


  )
