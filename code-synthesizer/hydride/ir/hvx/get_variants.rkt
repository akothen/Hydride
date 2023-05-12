#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/lib/destruct)

(require hydride/utils/bvops)
(require hydride/utils/misc)


(require hydride/ir/hydride/definition)
(require hydride/ir/hvx/definition)
(require hydride/ir/hvx/printer)


(provide (all-defined-out))


(define (get-variants-with-typeinfo prog input-sizes input-precs)

  (define variants (hvx:get-variants prog input-sizes input-precs))

  (define type-info-str
    (apply string-append (for/list ([i (range (length input-sizes))])
                                   (define prec (list-ref input-precs i))
                                   (define size (list-ref input-sizes i))
                                   (format "; (reg ~a) <~a x i~a>\n"  i (/ size prec) prec )
                                   )
           )
    )

  (define str 
    (for/list ([i (range (length variants))])
              (define v (list-ref variants i))
              (string-append "; variant" (~s i) "\n" 
                             type-info-str (hvx:hydride-printer v) 
                             "\n")
              )
    )

  (apply string-append str)


  )
;; ================================================================================
;;                                DSL Get Variants
;; ================================================================================
(define (hvx:get-variants prog input-sizes input-precs)
  (cond 
    [(equal? prog vector-two-input-swizzle_dsl)
     (define input-precs-dsl (list  8  ))
     (define input-size-dsl (list   (list 64 64 ) ) )
     (define variants (list (vector-two-input-swizzle_dsl (reg (bv 0 8)) (reg (bv 1 8)) 6 8 0 3 3 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog interleave-vectors_dsl)
     (define input-precs-dsl (list  16  ))
     (define input-size-dsl (list   (list 128 128 ) ) )
     (define variants (list (interleave-vectors_dsl (reg (bv 0 8)) (reg (bv 1 8)) 128 16 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog interleave-vector_dsl)
     (define input-precs-dsl (list  16  ))
     (define input-size-dsl (list   (list 128 ) ) )
     (define variants (list (interleave-vector_dsl (reg (bv 0 8)) 128 16 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog deinterleave-vector_dsl)
     (define input-precs-dsl (list  16  ))
     (define input-size-dsl (list   (list 128 ) ) )
     (define variants (list (deinterleave-vector_dsl (reg (bv 0 8)) 128 16 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog llvm_shuffle_vectors_dsl)
     (define input-precs-dsl (list  16  ))
     (define input-size-dsl (list   (list 128 128 128 ) ) )
     (define variants (list (llvm_shuffle_vectors_dsl (reg (bv 0 8)) (reg (bv 1 8)) 8 16 (reg (bv 2 8)) 4 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog llvm-vect-add_dsl)
     (define input-precs-dsl (list  16  ))
     (define input-size-dsl (list   (list 128 128 ) ) )
     (define variants (list (llvm-vect-add_dsl (reg (bv 0 8)) (reg (bv 1 8)) 8 16 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog llvm-vect-sub_dsl)
     (define input-precs-dsl (list  16  ))
     (define input-size-dsl (list   (list 128 128 ) ) )
     (define variants (list (llvm-vect-sub_dsl (reg (bv 0 8)) (reg (bv 1 8)) 8 16 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog llvm-vect-mul_dsl)
     (define input-precs-dsl (list  16  ))
     (define input-size-dsl (list   (list 128 128 ) ) )
     (define variants (list (llvm-vect-mul_dsl (reg (bv 0 8)) (reg (bv 1 8)) 8 16 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog llvm-vect-sdiv_dsl)
     (define input-precs-dsl (list  16  ))
     (define input-size-dsl (list   (list 128 128 ) ) )
     (define variants (list (llvm-vect-sdiv_dsl (reg (bv 0 8)) (reg (bv 1 8)) 8 16 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog llvm-vect-udiv_dsl)
     (define input-precs-dsl (list  16  ))
     (define input-size-dsl (list   (list 128 128 ) ) )
     (define variants (list (llvm-vect-udiv_dsl (reg (bv 0 8)) (reg (bv 1 8)) 8 16 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vshuffob_128B_dsl)
     (define input-precs-dsl (list  8 16  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vshuffob_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 8 2 8 0 ) 
                            (hexagon_V6_vshuffob_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 2 16 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_veqw_xor_128B_dsl)
     (define input-precs-dsl (list  4 8 2  ))
     (define input-size-dsl (list   (list 1024 1024 128 ) (list 1024 1024 128 ) (list 1024 1024 128 ) ) )
     (define variants (list (hexagon_V6_veqw_xor_128B_dsl (lit (bv #x000f (bitvector 4))) (lit (bv #x0000 (bitvector 4))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 4 32 1 0 ) 
                            (hexagon_V6_veqw_xor_128B_dsl (lit (bv #b1 (bitvector 1))) (lit (bv #b0 (bitvector 1))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 1 8 1 0 ) 
                            (hexagon_V6_veqw_xor_128B_dsl (lit (bv #b11 (bitvector 2))) (lit (bv #b00 (bitvector 2))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 2 16 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 3)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vasrh_acc_128B_dsl)
     (define input-precs-dsl (list  16  ))
     (define input-size-dsl (list   (list 1024 1024 32 ) ) )
     (define variants (list (hexagon_V6_vasrh_acc_128B_dsl (lit (bv #x0000000000000000000000000000000f (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 1024 16 -1 1 32 1 32 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vdmpyhb_acc_128B_dsl)
     (define input-precs-dsl (list  16 16  ))
     (define input-size-dsl (list   (list 1024 1024 32 ) (list 1024 32 ) ) )
     (define variants (list (hexagon_V6_vdmpyhb_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 32 0 16 8 -1 1 1 4 16 16 2 8 0 ) 
                            (hexagon_V6_vdmpyhb_acc_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 32 0 16 8 -1 1 1 4 16 16 2 8 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vminuh_128B_dsl)
     (define input-precs-dsl (list  16 32 8 16 8  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vminuh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 0 0 ) 
                            (hexagon_V6_vminuh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 1 0 ) 
                            (hexagon_V6_vminuh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 1 0 ) 
                            (hexagon_V6_vminuh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 1 0 ) 
                            (hexagon_V6_vminuh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 0 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 5)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyieoh_128B_dsl)
     (define input-precs-dsl (list  32  ))
     (define input-size-dsl (list   (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vmpyieoh_128B_dsl (lit (bv #x00000000000000000000000000000010 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 32 1 1 1 16 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vpackwuh_sat_128B_dsl)
     (define input-precs-dsl (list  32 32 16 16  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vpackwuh_sat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 0 512 16 0 32 1 32 0 32 1 16 0 ) 
                            (hexagon_V6_vpackwuh_sat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 0 512 16 1 32 1 32 1 32 1 16 0 ) 
                            (hexagon_V6_vpackwuh_sat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 8 0 512 8 0 16 1 64 0 16 1 8 0 ) 
                            (hexagon_V6_vpackwuh_sat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 8 0 512 8 1 16 1 64 1 16 1 8 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 4)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vpackeh_128B_dsl)
     (define input-precs-dsl (list  16 8  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vpackeh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 0 512 16 2 32 2 16 0 ) 
                            (hexagon_V6_vpackeh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 8 0 512 8 2 64 2 8 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyih_acc_128B_dsl)
     (define input-precs-dsl (list  16  ))
     (define input-size-dsl (list   (list 1024 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vmpyih_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 1024 16 -1 1 32 1 32 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_lvsplatb_128B_dsl)
     (define input-precs-dsl (list  -1 -1  ))
     (define input-size-dsl (list   (list 32 ) (list 32 ) ) )
     (define variants (list (hexagon_V6_lvsplatb_128B_dsl (reg (bv 0 8)) 1024 1024 0 1024 8 0 ) 
                            (hexagon_V6_lvsplatb_128B_dsl (reg (bv 0 8)) 1024 1024 0 1024 16 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vasrw_acc_128B_dsl)
     (define input-precs-dsl (list  32  ))
     (define input-size-dsl (list   (list 1024 1024 32 ) ) )
     (define variants (list (hexagon_V6_vasrw_acc_128B_dsl (lit (bv #x0000000000000000000000000000001f (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 1024 32 -1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vgtuw_and_128B_dsl)
     (define input-precs-dsl (list  4 2 2 4 8 8  ))
     (define input-size-dsl (list   (list 128 1024 1024 ) (list 128 1024 1024 ) (list 128 1024 1024 ) (list 128 1024 1024 ) (list 128 1024 1024 ) (list 128 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vgtuw_and_128B_dsl (lit (bv #x000f (bitvector 4))) (lit (bv #x0000 (bitvector 4))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 4 0 32 1 0 ) 
                            (hexagon_V6_vgtuw_and_128B_dsl (lit (bv #b11 (bitvector 2))) (lit (bv #b00 (bitvector 2))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 2 1 16 1 0 ) 
                            (hexagon_V6_vgtuw_and_128B_dsl (lit (bv #b11 (bitvector 2))) (lit (bv #b00 (bitvector 2))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 2 0 16 1 0 ) 
                            (hexagon_V6_vgtuw_and_128B_dsl (lit (bv #x000f (bitvector 4))) (lit (bv #x0000 (bitvector 4))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 4 1 32 1 0 ) 
                            (hexagon_V6_vgtuw_and_128B_dsl (lit (bv #b1 (bitvector 1))) (lit (bv #b0 (bitvector 1))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 1 0 8 1 0 ) 
                            (hexagon_V6_vgtuw_and_128B_dsl (lit (bv #b1 (bitvector 1))) (lit (bv #b0 (bitvector 1))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 1 1 8 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 6)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vaslh_acc_128B_dsl)
     (define input-precs-dsl (list  16  ))
     (define input-size-dsl (list   (list 1024 1024 32 ) ) )
     (define variants (list (hexagon_V6_vaslh_acc_128B_dsl (lit (bv #x0000000000000000000000000000000f (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 1024 16 -1 1 32 1 32 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpabus_128B_dsl)
     (define input-precs-dsl (list  8 8  ))
     (define input-size-dsl (list   (list 2048 32 ) (list 2048 32 ) ) )
     (define variants (list (hexagon_V6_vmpabus_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 32 32 0 512 8 0 512 8 16 1 -1 1 0 8 1024 1 0 0 16 1024 -1 1 0 24 1032 1 0 16 8 2 0 ) 
                            (hexagon_V6_vmpabus_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 32 32 0 512 8 0 512 8 16 1 -1 0 0 8 1024 0 0 0 16 1024 -1 0 0 24 1032 0 0 16 8 2 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vaslw_acc_128B_dsl)
     (define input-precs-dsl (list  32  ))
     (define input-size-dsl (list   (list 1024 1024 32 ) ) )
     (define variants (list (hexagon_V6_vaslw_acc_128B_dsl (lit (bv #x0000000000000000000000000000001f (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 1024 32 -1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vabsdiffh_128B_dsl)
     (define input-precs-dsl (list  16 16 8 32  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vabsdiffh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 -1 -1 1 0 ) 
                            (hexagon_V6_vabsdiffh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 -1 -1 0 0 ) 
                            (hexagon_V6_vabsdiffh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 -1 -1 0 0 ) 
                            (hexagon_V6_vabsdiffh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 -1 -1 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 4)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vshuffeb_128B_dsl)
     (define input-precs-dsl (list  8 16  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vshuffeb_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 8 8 2 0 ) 
                            (hexagon_V6_vshuffeb_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 16 2 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vaddcarrysat_128B_dsl)
     (define input-precs-dsl (list  32  ))
     (define input-size-dsl (list   (list 1024 1024 128 ) ) )
     (define variants (list (hexagon_V6_vaddcarrysat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 32 1 32 1 1 1 4 -1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_pred_and_128B_dsl)
     (define input-precs-dsl (list  -1 16  ))
     (define input-size-dsl (list   (list 128 128 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_pred_and_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 128 128 0 128 1 0 ) 
                            (hexagon_V6_pred_and_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vgtb_128B_dsl)
     (define input-precs-dsl (list  8 32 16 8 16 32  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vgtb_128B_dsl (lit (bv #b1 (bitvector 1))) (lit (bv #b0 (bitvector 1))) (reg (bv 0 8)) (reg (bv 1 8)) 128 128 0 128 1 1 8 1 0 ) 
                            (hexagon_V6_vgtb_128B_dsl (lit (bv #x000f (bitvector 4))) (lit (bv #x0000 (bitvector 4))) (reg (bv 0 8)) (reg (bv 1 8)) 128 128 0 128 4 0 32 1 0 ) 
                            (hexagon_V6_vgtb_128B_dsl (lit (bv #b11 (bitvector 2))) (lit (bv #b00 (bitvector 2))) (reg (bv 0 8)) (reg (bv 1 8)) 128 128 0 128 2 0 16 1 0 ) 
                            (hexagon_V6_vgtb_128B_dsl (lit (bv #b1 (bitvector 1))) (lit (bv #b0 (bitvector 1))) (reg (bv 0 8)) (reg (bv 1 8)) 128 128 0 128 1 0 8 1 0 ) 
                            (hexagon_V6_vgtb_128B_dsl (lit (bv #b11 (bitvector 2))) (lit (bv #b00 (bitvector 2))) (reg (bv 0 8)) (reg (bv 1 8)) 128 128 0 128 2 1 16 1 0 ) 
                            (hexagon_V6_vgtb_128B_dsl (lit (bv #x000f (bitvector 4))) (lit (bv #x0000 (bitvector 4))) (reg (bv 0 8)) (reg (bv 1 8)) 128 128 0 128 4 1 32 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 6)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vaddubh_128B_dsl)
     (define input-precs-dsl (list  8 16 16  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vaddubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 8 0 512 8 16 1 0 -1 16 1024 0 -1 8 2 0 ) 
                            (hexagon_V6_vaddubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 0 512 16 32 1 0 -1 32 1024 0 -1 16 2 0 ) 
                            (hexagon_V6_vaddubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 0 512 16 32 1 1 -1 32 1024 1 -1 16 2 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 3)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyewuh_128B_dsl)
     (define input-precs-dsl (list  32  ))
     (define input-size-dsl (list   (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vmpyewuh_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000010 (bitvector 64))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 32 1 0 64 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyh_128B_dsl)
     (define input-precs-dsl (list  16 16  ))
     (define input-size-dsl (list   (list 1024 32 ) (list 1024 32 ) ) )
     (define variants (list (hexagon_V6_vmpyh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 32 32 0 512 16 0 512 16 32 1 1 1 0 32 1024 1 1 16 16 2 0 ) 
                            (hexagon_V6_vmpyh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 32 32 0 512 16 0 512 16 32 1 0 0 0 32 1024 0 0 16 16 2 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyiewuh_128B_dsl)
     (define input-precs-dsl (list  32  ))
     (define input-size-dsl (list   (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vmpyiewuh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 32 1 1 64 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vshufoeh_128B_dsl)
     (define input-precs-dsl (list  16 8  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vshufoeh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 0 512 16 16 2 1040 1024 16 2 0 ) 
                            (hexagon_V6_vshufoeh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 8 0 512 8 8 2 1032 1024 8 2 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_lvsplatw_128B_dsl)
     (define input-precs-dsl (list  32  ))
     (define input-size-dsl (list   (list 32 ) ) )
     (define variants (list (hexagon_V6_lvsplatw_128B_dsl (reg (bv 0 8)) 1024 1024 0 1024 32 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vaddhsat_128B_dsl)
     (define input-precs-dsl (list  16 32 8 16 8 8 32 8 8 32 32 16 8 16 32 8 16 16 32  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 2048 2048 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 2048 2048 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 2048 2048 ) (list 2048 2048 ) (list 2048 2048 ) (list 1024 1024 ) (list 1024 1024 ) (list 2048 2048 ) (list 2048 2048 ) (list 2048 2048 ) (list 2048 2048 ) ) )
     (define variants (list (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 1 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 1 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 8 1 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 -1 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 -1 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 0 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 32 0 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 1 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 0 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 -1 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 32 1 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 16 -1 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 8 0 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 0 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 0 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 8 -1 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 16 1 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 16 0 0 ) 
                            (hexagon_V6_vaddhsat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 32 -1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 19)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vswap_128B_dsl)
     (define input-precs-dsl (list  8  ))
     (define input-size-dsl (list   (list 1024 128 1024 ) ) )
     (define variants (list (hexagon_V6_vswap_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) (lit (bv #b1 (bitvector 1))) 128 128 0 1024 8 0 128 1 1 8 8 1024 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vinsertwr_128B_dsl)
     (define input-precs-dsl (list  -1  ))
     (define input-size-dsl (list   (list 32 ) ) )
     (define variants (list (hexagon_V6_vinsertwr_128B_dsl (reg (bv 0 8)) 32 32 0 32 32 0 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vabsh_128B_dsl)
     (define input-precs-dsl (list  16 32 8  ))
     (define input-size-dsl (list   (list 1024 ) (list 1024 ) (list 1024 ) ) )
     (define variants (list (hexagon_V6_vabsh_128B_dsl (reg (bv 0 8)) 1024 1024 0 1024 16 0 ) 
                            (hexagon_V6_vabsh_128B_dsl (reg (bv 0 8)) 1024 1024 0 1024 32 0 ) 
                            (hexagon_V6_vabsh_128B_dsl (reg (bv 0 8)) 1024 1024 0 1024 8 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 3)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vunpackoh_128B_dsl)
     (define input-precs-dsl (list  32 16  ))
     (define input-size-dsl (list   (list 2048 1024 ) (list 2048 1024 ) ) )
     (define variants (list (hexagon_V6_vunpackoh_128B_dsl (lit (bv #x0000000000000010 (bitvector 16))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 32 1 0 0 ) 
                            (hexagon_V6_vunpackoh_128B_dsl (lit (bv #x00000008 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 16 1 0 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vabsw_sat_128B_dsl)
     (define input-precs-dsl (list  32 16 8  ))
     (define input-size-dsl (list   (list 1024 ) (list 1024 ) (list 1024 ) ) )
     (define variants (list (hexagon_V6_vabsw_sat_128B_dsl (reg (bv 0 8)) 1024 1024 0 1024 32 1 0 ) 
                            (hexagon_V6_vabsw_sat_128B_dsl (reg (bv 0 8)) 1024 1024 0 1024 16 1 0 ) 
                            (hexagon_V6_vabsw_sat_128B_dsl (reg (bv 0 8)) 1024 1024 0 1024 8 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 3)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vandqrt_128B_dsl)
     (define input-precs-dsl (list  8  ))
     (define input-size-dsl (list   (list 128 32 ) ) )
     (define variants (list (hexagon_V6_vandqrt_128B_dsl (lit (bv #b1 (bitvector 1))) (lit (bv #x00000000 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) 32 32 0 1024 8 4 1 8 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vsubuhw_128B_dsl)
     (define input-precs-dsl (list  16 16 8  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vsubuhw_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 0 512 16 32 1 0 -1 32 1024 0 -1 16 2 0 ) 
                            (hexagon_V6_vsubuhw_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 0 512 16 32 1 1 -1 32 1024 1 -1 16 2 0 ) 
                            (hexagon_V6_vsubuhw_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 8 0 512 8 16 1 0 -1 16 1024 0 -1 8 2 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 3)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_veqw_or_128B_dsl)
     (define input-precs-dsl (list  4 8 2  ))
     (define input-size-dsl (list   (list 1024 1024 128 ) (list 1024 1024 128 ) (list 1024 1024 128 ) ) )
     (define variants (list (hexagon_V6_veqw_or_128B_dsl (reg (bv 0 8)) (lit (bv #x0000 (bitvector 4))) (lit (bv #x000f (bitvector 4))) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 4 32 1 0 ) 
                            (hexagon_V6_veqw_or_128B_dsl (reg (bv 0 8)) (lit (bv #b0 (bitvector 1))) (lit (bv #b1 (bitvector 1))) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 1 8 1 0 ) 
                            (hexagon_V6_veqw_or_128B_dsl (reg (bv 0 8)) (lit (bv #b00 (bitvector 2))) (lit (bv #b11 (bitvector 2))) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 2 16 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 3)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vsubh_128B_dsl)
     (define input-precs-dsl (list  16 16 32 32 16 16 8 8 32 8 32 16 8 8 8 8 32 32 16  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 2048 2048 ) (list 2048 2048 ) (list 2048 2048 ) (list 1024 1024 ) (list 2048 2048 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 2048 2048 ) (list 2048 2048 ) (list 2048 2048 ) (list 2048 2048 ) (list 2048 2048 ) ) )
     (define variants (list (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 -1 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 0 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 0 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 32 1 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 16 0 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 16 1 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 -1 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 8 0 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 -1 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 1 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 1 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 1 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 0 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 0 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 8 -1 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 8 1 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 32 0 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 32 -1 0 ) 
                            (hexagon_V6_vsubh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 2048 16 -1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 19)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyiewh_acc_128B_dsl)
     (define input-precs-dsl (list  32 32  ))
     (define input-size-dsl (list   (list 1024 1024 1024 ) (list 1024 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vmpyiewh_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 16 32 1 -1 1 64 0 64 1 0 ) 
                            (hexagon_V6_vmpyiewh_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 16 32 1 -1 1 64 1 64 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vasruhubrndsat_128B_dsl)
     (define input-precs-dsl (list  16 16 16  ))
     (define input-size-dsl (list   (list 1024 1024 32 ) (list 1024 1024 32 ) (list 1024 1024 32 ) ) )
     (define variants (list (hexagon_V6_vasruhubrndsat_128B_dsl (lit (bv #x00000000000000000000000000000007 (bitvector 32))) (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 8 8 0 -1 0 32 16 1 0 -1 0 32 -1 0 ) 
                            (hexagon_V6_vasruhubrndsat_128B_dsl (lit (bv #x00000000000000000000000000000007 (bitvector 32))) (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 8 8 1 -1 1 32 16 1 1 -1 1 32 -1 0 ) 
                            (hexagon_V6_vasruhubrndsat_128B_dsl (lit (bv #x00000000000000000000000000000007 (bitvector 32))) (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 8 8 0 -1 1 32 16 1 0 -1 1 32 -1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 3)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyiowh_128B_dsl)
     (define input-precs-dsl (list  32  ))
     (define input-size-dsl (list   (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vmpyiowh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 32 1 1 64 1 16 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vaslhv_128B_dsl)
     (define input-precs-dsl (list  16 32  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vaslhv_128B_dsl (reg (bv 0 8)) (lit (bv #x0000000000000000 (bitvector 16))) (reg (bv 1 8)) 1024 1024 0 1024 16 1 0 ) 
                            (hexagon_V6_vaslhv_128B_dsl (reg (bv 0 8)) (lit (bv #x00000000000000000000000000000000 (bitvector 32))) (reg (bv 1 8)) 1024 1024 0 1024 32 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vgtub_xor_128B_dsl)
     (define input-precs-dsl (list  8 2 4 4 8 2  ))
     (define input-size-dsl (list   (list 128 1024 1024 ) (list 128 1024 1024 ) (list 128 1024 1024 ) (list 128 1024 1024 ) (list 128 1024 1024 ) (list 128 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vgtub_xor_128B_dsl (lit (bv #b1 (bitvector 1))) (lit (bv #b0 (bitvector 1))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 1 0 8 1 0 ) 
                            (hexagon_V6_vgtub_xor_128B_dsl (lit (bv #b11 (bitvector 2))) (lit (bv #b00 (bitvector 2))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 2 1 16 1 0 ) 
                            (hexagon_V6_vgtub_xor_128B_dsl (lit (bv #x000f (bitvector 4))) (lit (bv #x0000 (bitvector 4))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 4 1 32 1 0 ) 
                            (hexagon_V6_vgtub_xor_128B_dsl (lit (bv #x000f (bitvector 4))) (lit (bv #x0000 (bitvector 4))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 4 0 32 1 0 ) 
                            (hexagon_V6_vgtub_xor_128B_dsl (lit (bv #b1 (bitvector 1))) (lit (bv #b0 (bitvector 1))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 1 1 8 1 0 ) 
                            (hexagon_V6_vgtub_xor_128B_dsl (lit (bv #b11 (bitvector 2))) (lit (bv #b00 (bitvector 2))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 2 0 16 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 6)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyih_128B_dsl)
     (define input-precs-dsl (list  16  ))
     (define input-size-dsl (list   (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vmpyih_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 1 32 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyiwh_acc_128B_dsl)
     (define input-precs-dsl (list  32 32 32 16  ))
     (define input-size-dsl (list   (list 1024 1024 32 ) (list 1024 1024 32 ) (list 1024 1024 32 ) (list 1024 1024 32 ) ) )
     (define variants (list (hexagon_V6_vmpyiwh_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 32 32 0 512 16 32 1 -1 1 64 1 64 1 2 16 0 ) 
                            (hexagon_V6_vmpyiwh_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 32 32 0 256 8 32 1 -1 1 64 0 64 1 4 8 0 ) 
                            (hexagon_V6_vmpyiwh_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 32 32 0 256 8 32 1 -1 1 64 1 64 1 4 8 0 ) 
                            (hexagon_V6_vmpyiwh_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 32 32 0 512 8 16 1 -1 1 32 1 32 1 4 8 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 4)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vandvnqv_128B_dsl)
     (define input-precs-dsl (list  8  ))
     (define input-size-dsl (list   (list 1024 128 ) ) )
     (define variants (list (hexagon_V6_vandvnqv_128B_dsl (reg (bv 0 8)) (lit (bv #x00000000 (bitvector 8))) (reg (bv 1 8)) 128 128 0 128 1 8 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vlsrh_128B_dsl)
     (define input-precs-dsl (list  16 8  ))
     (define input-size-dsl (list   (list 1024 32 ) (list 1024 32 ) ) )
     (define variants (list (hexagon_V6_vlsrh_128B_dsl (lit (bv #x0000000000000000000000000000000f (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 0 32 0 ) 
                            (hexagon_V6_vlsrh_128B_dsl (lit (bv #x00000000000000000000000000000007 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 0 32 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpabus_acc_128B_dsl)
     (define input-precs-dsl (list  16 16  ))
     (define input-size-dsl (list   (list 2048 2048 32 ) (list 2048 2048 32 ) ) )
     (define variants (list (hexagon_V6_vmpabus_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 32 32 0 512 8 0 512 8 16 1 -1 -1 1 0 8 1024 1 0 0 16 -1 -1 1 0 24 1032 1 0 16 8 1024 2 0 ) 
                            (hexagon_V6_vmpabus_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 32 32 0 512 8 0 512 8 16 1 -1 -1 0 0 8 1024 0 0 0 16 -1 -1 0 0 24 1032 0 0 16 8 1024 2 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmux_128B_dsl)
     (define input-precs-dsl (list  8  ))
     (define input-size-dsl (list   (list 1024 128 1024 ) ) )
     (define variants (list (hexagon_V6_vmux_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (lit (bv #b1 (bitvector 1))) (reg (bv 2 8)) 1024 1024 0 1024 8 1 8 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vnavgw_128B_dsl)
     (define input-precs-dsl (list  32 8 16 8  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vnavgw_128B_dsl (lit (bv #x00000000000000000000000000000002 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 1 -1 0 ) 
                            (hexagon_V6_vnavgw_128B_dsl (lit (bv #x00000002 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 1 -1 0 ) 
                            (hexagon_V6_vnavgw_128B_dsl (lit (bv #x0000000000000002 (bitvector 16))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 1 -1 0 ) 
                            (hexagon_V6_vnavgw_128B_dsl (lit (bv #x00000002 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 0 -1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 4)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vaslh_128B_dsl)
     (define input-precs-dsl (list  16  ))
     (define input-size-dsl (list   (list 1024 32 ) ) )
     (define variants (list (hexagon_V6_vaslh_128B_dsl (lit (bv #x0000000000000000000000000000000f (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 1 32 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vandnqrt_acc_128B_dsl)
     (define input-precs-dsl (list  8  ))
     (define input-size-dsl (list   (list 32 1024 128 ) ) )
     (define variants (list (hexagon_V6_vandnqrt_acc_128B_dsl (lit (bv #x00000000 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 1 8 1 4 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vdealb_128B_dsl)
     (define input-precs-dsl (list  8 16  ))
     (define input-size-dsl (list   (list 1024 ) (list 1024 ) ) )
     (define variants (list (hexagon_V6_vdealb_128B_dsl (reg (bv 0 8)) 1024 1024 0 512 8 0 512 8 2 64 8 2 8 0 ) 
                            (hexagon_V6_vdealb_128B_dsl (reg (bv 0 8)) 1024 1024 0 512 16 0 512 16 2 32 16 2 16 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpahb_acc_128B_dsl)
     (define input-precs-dsl (list  32 32  ))
     (define input-size-dsl (list   (list 2048 2048 32 ) (list 2048 2048 32 ) ) )
     (define variants (list (hexagon_V6_vmpahb_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 32 32 0 256 8 0 256 8 32 1 -1 -1 1 1 8 16 1024 1 1 0 16 32 -1 -1 1 1 24 16 1040 1 1 16 16 16 1024 4 0 ) 
                            (hexagon_V6_vmpahb_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 32 32 0 256 8 0 256 8 32 1 -1 -1 1 1 8 16 1024 1 1 0 16 32 -1 -1 1 1 24 16 1040 1 1 16 16 16 1024 4 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vrounduhub_128B_dsl)
     (define input-precs-dsl (list  16 16 16  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vrounduhub_128B_dsl (lit (bv #x0000000000000080 (bitvector 16))) (lit (bv #x0000000000000008 (bitvector 16))) (lit (bv #x0000000000000080 (bitvector 16))) (lit (bv #x0000000000000008 (bitvector 16))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 8 8 0 -1 16 1 0 -1 0 ) 
                            (hexagon_V6_vrounduhub_128B_dsl (lit (bv #x0000000000000080 (bitvector 16))) (lit (bv #x0000000000000008 (bitvector 16))) (lit (bv #x0000000000000080 (bitvector 16))) (lit (bv #x0000000000000008 (bitvector 16))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 8 8 0 -1 16 1 0 -1 0 ) 
                            (hexagon_V6_vrounduhub_128B_dsl (lit (bv #x0000000000000080 (bitvector 16))) (lit (bv #x0000000000000008 (bitvector 16))) (lit (bv #x0000000000000080 (bitvector 16))) (lit (bv #x0000000000000008 (bitvector 16))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 8 8 1 -1 16 1 1 -1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 3)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vlsrw_128B_dsl)
     (define input-precs-dsl (list  32  ))
     (define input-size-dsl (list   (list 1024 32 ) ) )
     (define variants (list (hexagon_V6_vlsrw_128B_dsl (lit (bv #x0000000000000000000000000000001f (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyowh_128B_dsl)
     (define input-precs-dsl (list  32 32  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vmpyowh_128B_dsl (lit (bv #x000000000000000000000000000000000000000000000000000000000000000e (bitvector 64))) (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64))) (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 32 1 1 -1 1 64 1 16 0 ) 
                            (hexagon_V6_vmpyowh_128B_dsl (lit (bv #x000000000000000000000000000000000000000000000000000000000000000e (bitvector 64))) (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64))) (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 32 1 1 -1 1 64 1 16 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vsathub_128B_dsl)
     (define input-precs-dsl (list  16 32 32  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vsathub_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 8 8 0 16 1 0 0 ) 
                            (hexagon_V6_vsathub_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 16 1 32 1 1 0 ) 
                            (hexagon_V6_vsathub_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 16 0 32 1 0 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 3)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vdmpyhvsat_acc_128B_dsl)
     (define input-precs-dsl (list  16 16  ))
     (define input-size-dsl (list   (list 1024 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vdmpyhvsat_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 32 0 32 16 1 1 1 0 ) 
                            (hexagon_V6_vdmpyhvsat_acc_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 32 0 32 16 1 1 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_veqw_128B_dsl)
     (define input-precs-dsl (list  32 16 8  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_veqw_128B_dsl (lit (bv #x000f (bitvector 4))) (reg (bv 0 8)) (lit (bv #x0000 (bitvector 4))) (reg (bv 1 8)) 128 128 0 128 4 32 1 0 ) 
                            (hexagon_V6_veqw_128B_dsl (lit (bv #b11 (bitvector 2))) (reg (bv 0 8)) (lit (bv #b00 (bitvector 2))) (reg (bv 1 8)) 128 128 0 128 2 16 1 0 ) 
                            (hexagon_V6_veqw_128B_dsl (lit (bv #b1 (bitvector 1))) (reg (bv 0 8)) (lit (bv #b0 (bitvector 1))) (reg (bv 1 8)) 128 128 0 128 1 8 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 3)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyub_acc_128B_dsl)
     (define input-precs-dsl (list  16 16  ))
     (define input-size-dsl (list   (list 2048 1024 32 ) (list 2048 1024 32 ) ) )
     (define variants (list (hexagon_V6_vmpyub_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 32 32 0 512 8 0 512 8 16 1 -1 0 0 4 4 16 -1 0 0 4 1 4 8 1024 2 0 ) 
                            (hexagon_V6_vmpyub_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 32 32 0 512 8 0 512 8 16 1 -1 1 0 4 4 16 -1 1 0 4 1 4 8 1024 2 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vdealb4w_128B_dsl)
     (define input-precs-dsl (list  8  ))
     (define input-size-dsl (list   (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vdealb4w_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 256 8 0 256 8 0 256 8 0 256 8 4 32 16 4 8 64 4 8 96 16 4 8 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vrmpybv_128B_dsl)
     (define input-precs-dsl (list  8 8 8 8 8 8  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 1024 ) (list 1024 1024 ) (list 1024 1024 1024 ) (list 1024 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vrmpybv_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 32 0 32 8 -1 1 1 16 1 0 ) 
                            (hexagon_V6_vrmpybv_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 32 0 32 8 -1 1 1 16 1 0 ) 
                            (hexagon_V6_vrmpybv_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 32 0 32 8 -1 1 1 16 0 0 ) 
                            (hexagon_V6_vrmpybv_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 32 0 32 8 -1 1 1 16 0 0 ) 
                            (hexagon_V6_vrmpybv_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 32 0 32 8 -1 0 0 16 0 0 ) 
                            (hexagon_V6_vrmpybv_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 32 0 32 8 -1 0 0 16 0 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 6)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vrmpybus_acc_128B_dsl)
     (define input-precs-dsl (list  8 8 8 8  ))
     (define input-size-dsl (list   (list 1024 1024 32 ) (list 1024 32 ) (list 1024 32 ) (list 1024 1024 32 ) ) )
     (define variants (list (hexagon_V6_vrmpybus_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 32 0 32 8 -1 1 1 16 0 0 ) 
                            (hexagon_V6_vrmpybus_acc_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 32 0 32 8 -1 0 0 16 0 0 ) 
                            (hexagon_V6_vrmpybus_acc_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 32 0 32 8 -1 1 1 16 0 0 ) 
                            (hexagon_V6_vrmpybus_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 32 0 32 8 -1 0 0 16 0 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 4)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vdmpybus_128B_dsl)
     (define input-precs-dsl (list  8 8  ))
     (define input-size-dsl (list   (list 1024 32 ) (list 1024 1024 32 ) ) )
     (define variants (list (hexagon_V6_vdmpybus_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 16 0 16 8 -1 1 0 4 8 8 0 ) 
                            (hexagon_V6_vdmpybus_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 16 0 16 8 -1 1 0 4 8 8 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_veqh_and_128B_dsl)
     (define input-precs-dsl (list  2 8 4  ))
     (define input-size-dsl (list   (list 1024 1024 128 ) (list 1024 1024 128 ) (list 1024 1024 128 ) ) )
     (define variants (list (hexagon_V6_veqh_and_128B_dsl (lit (bv #b11 (bitvector 2))) (lit (bv #b00 (bitvector 2))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 2 16 1 0 ) 
                            (hexagon_V6_veqh_and_128B_dsl (lit (bv #b1 (bitvector 1))) (lit (bv #b0 (bitvector 1))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 1 8 1 0 ) 
                            (hexagon_V6_veqh_and_128B_dsl (lit (bv #x000f (bitvector 4))) (lit (bv #x0000 (bitvector 4))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 4 32 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 3)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyuhe_128B_dsl)
     (define input-precs-dsl (list  16  ))
     (define input-size-dsl (list   (list 1024 32 ) ) )
     (define variants (list (hexagon_V6_vmpyuhe_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 32 32 0 512 16 32 1 0 0 0 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vpackoh_128B_dsl)
     (define input-precs-dsl (list  16 8  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vpackoh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 0 512 16 16 2 32 16 2 16 0 ) 
                            (hexagon_V6_vpackoh_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 8 0 512 8 8 2 64 8 2 8 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vdmpyhisat_128B_dsl)
     (define input-precs-dsl (list  16 16 16 16  ))
     (define input-size-dsl (list   (list 2048 32 ) (list 1024 2048 32 ) (list 2048 32 ) (list 1024 2048 32 ) ) )
     (define variants (list (hexagon_V6_vdmpyhisat_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 32 0 32 16 1 1 1 64 16 1 16 0 ) 
                            (hexagon_V6_vdmpyhisat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 32 0 32 16 1 1 1 64 16 1 16 0 ) 
                            (hexagon_V6_vdmpyhisat_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 32 0 32 16 1 0 1 64 16 1 16 0 ) 
                            (hexagon_V6_vdmpyhisat_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 32 0 32 16 1 0 1 64 16 1 16 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 4)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vandnqrt_128B_dsl)
     (define input-precs-dsl (list  8  ))
     (define input-size-dsl (list   (list 32 128 ) ) )
     (define variants (list (hexagon_V6_vandnqrt_128B_dsl (reg (bv 0 8)) (lit (bv #x00000000 (bitvector 8))) (reg (bv 1 8)) 128 128 0 128 1 8 1 4 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vshuffh_128B_dsl)
     (define input-precs-dsl (list  16 8  ))
     (define input-size-dsl (list   (list 1024 ) (list 1024 ) ) )
     (define variants (list (hexagon_V6_vshuffh_128B_dsl (reg (bv 0 8)) 1024 32 0 32 16 32 2 0 ) 
                            (hexagon_V6_vshuffh_128B_dsl (reg (bv 0 8)) 1024 16 0 16 8 16 8 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vandvrt_acc_128B_dsl)
     (define input-precs-dsl (list  8  ))
     (define input-size-dsl (list   (list 32 128 1024 ) ) )
     (define variants (list (hexagon_V6_vandvrt_acc_128B_dsl (reg (bv 0 8)) (lit (bv #b1 (bitvector 1))) (lit (bv #x00000000 (bitvector 8))) (lit (bv #b0 (bitvector 1))) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 1 8 4 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpabusv_128B_dsl)
     (define input-precs-dsl (list  8 8  ))
     (define input-size-dsl (list   (list 2048 2048 ) (list 2048 2048 ) ) )
     (define variants (list (hexagon_V6_vmpabusv_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 512 8 0 512 8 16 1 -1 0 0 1024 0 0 16 1024 -1 0 0 1032 0 0 8 2 0 ) 
                            (hexagon_V6_vmpabusv_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 2048 0 512 8 0 512 8 16 1 -1 0 0 1024 0 0 16 1024 -1 0 0 1032 0 0 8 2 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vor_128B_dsl)
     (define input-precs-dsl (list  16 -1  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 128 128 ) ) )
     (define variants (list (hexagon_V6_vor_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 0 ) 
                            (hexagon_V6_vor_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 128 128 0 128 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vasruwuhsat_128B_dsl)
     (define input-precs-dsl (list  32 32 32  ))
     (define input-size-dsl (list   (list 1024 1024 32 ) (list 1024 1024 32 ) (list 1024 1024 32 ) ) )
     (define variants (list (hexagon_V6_vasruwuhsat_128B_dsl (lit (bv #x0000000000000000000000000000000f (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 16 16 0 32 1 0 0 ) 
                            (hexagon_V6_vasruwuhsat_128B_dsl (lit (bv #x0000000000000000000000000000000f (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 16 16 0 32 1 0 0 ) 
                            (hexagon_V6_vasruwuhsat_128B_dsl (lit (bv #x0000000000000000000000000000000f (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 16 16 1 32 1 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 3)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyowh_rnd_sacc_128B_dsl)
     (define input-precs-dsl (list  32 32  ))
     (define input-size-dsl (list   (list 1024 1024 1024 ) (list 1024 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vmpyowh_rnd_sacc_128B_dsl (lit (bv #x000000000000000000000000000000000000000000000000000000000000000e (bitvector 64))) (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64))) (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 16 32 1 1 -1 -1 1 64 1 64 1 16 0 ) 
                            (hexagon_V6_vmpyowh_rnd_sacc_128B_dsl (lit (bv #x000000000000000000000000000000000000000000000000000000000000000e (bitvector 64))) (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64))) (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 16 32 1 1 -1 -1 1 64 1 64 1 16 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vaddubh_acc_128B_dsl)
     (define input-precs-dsl (list  16 32 32  ))
     (define input-size-dsl (list   (list 2048 1024 1024 ) (list 2048 1024 1024 ) (list 2048 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vaddubh_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 8 0 512 8 16 1 -1 1 -1 16 -1 1 -1 8 1024 2 0 ) 
                            (hexagon_V6_vaddubh_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 16 0 512 16 32 1 -1 1 -1 32 -1 1 -1 16 1024 2 0 ) 
                            (hexagon_V6_vaddubh_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 16 0 512 16 32 1 -1 1 -1 32 -1 1 -1 16 1024 2 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 3)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vroundwuh_128B_dsl)
     (define input-precs-dsl (list  32 32 32  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vroundwuh_128B_dsl (lit (bv #x00000000000000000000000000008000 (bitvector 32))) (lit (bv #x00000000000000000000000000000010 (bitvector 32))) (lit (bv #x00000000000000000000000000008000 (bitvector 32))) (lit (bv #x00000000000000000000000000000010 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 16 0 -1 32 1 0 -1 0 ) 
                            (hexagon_V6_vroundwuh_128B_dsl (lit (bv #x00000000000000000000000000008000 (bitvector 32))) (lit (bv #x00000000000000000000000000000010 (bitvector 32))) (lit (bv #x00000000000000000000000000008000 (bitvector 32))) (lit (bv #x00000000000000000000000000000010 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 16 1 -1 32 1 1 -1 0 ) 
                            (hexagon_V6_vroundwuh_128B_dsl (lit (bv #x00000000000000000000000000008000 (bitvector 32))) (lit (bv #x00000000000000000000000000000010 (bitvector 32))) (lit (bv #x00000000000000000000000000008000 (bitvector 32))) (lit (bv #x00000000000000000000000000000010 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 16 0 -1 32 1 0 -1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 3)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyihb_128B_dsl)
     (define input-precs-dsl (list  16 32 32 32  ))
     (define input-size-dsl (list   (list 1024 32 ) (list 1024 32 ) (list 1024 32 ) (list 1024 32 ) ) )
     (define variants (list (hexagon_V6_vmpyihb_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 32 32 0 512 8 16 1 1 32 1 4 8 0 ) 
                            (hexagon_V6_vmpyihb_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 32 32 0 512 16 32 1 1 64 1 2 16 0 ) 
                            (hexagon_V6_vmpyihb_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 32 32 0 256 8 32 1 0 64 1 4 8 0 ) 
                            (hexagon_V6_vmpyihb_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 32 32 0 256 8 32 1 1 64 1 4 8 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 4)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_pred_xor_128B_dsl)
     (define input-precs-dsl (list  -1 16  ))
     (define input-size-dsl (list   (list 128 128 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_pred_xor_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 128 128 0 128 1 0 ) 
                            (hexagon_V6_pred_xor_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vandvrt_128B_dsl)
     (define input-precs-dsl (list  8  ))
     (define input-size-dsl (list   (list 32 1024 ) ) )
     (define variants (list (hexagon_V6_vandvrt_128B_dsl (lit (bv #b1 (bitvector 1))) (lit (bv #x00000000 (bitvector 8))) (reg (bv 0 8)) (lit (bv #b0 (bitvector 1))) (reg (bv 1 8)) 128 128 0 128 1 8 4 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vasrwh_128B_dsl)
     (define input-precs-dsl (list  32  ))
     (define input-size-dsl (list   (list 1024 1024 32 ) ) )
     (define variants (list (hexagon_V6_vasrwh_128B_dsl (lit (bv #x0000000000000000000000000000000f (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 16 16 32 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vandvqv_128B_dsl)
     (define input-precs-dsl (list  8  ))
     (define input-size-dsl (list   (list 128 1024 ) ) )
     (define variants (list (hexagon_V6_vandvqv_128B_dsl (lit (bv #b1 (bitvector 1))) (reg (bv 0 8)) (reg (bv 1 8)) (lit (bv #x00000000 (bitvector 8))) 1024 1024 0 1024 8 1 8 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vavgwrnd_128B_dsl)
     (define input-precs-dsl (list  32 8 16 32 16 8  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vavgwrnd_128B_dsl (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (lit (bv #x00000000000000000000000000000002 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 1 -1 -1 0 ) 
                            (hexagon_V6_vavgwrnd_128B_dsl (lit (bv #x00000001 (bitvector 8))) (lit (bv #x00000002 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 0 -1 -1 0 ) 
                            (hexagon_V6_vavgwrnd_128B_dsl (lit (bv #x0000000000000001 (bitvector 16))) (lit (bv #x0000000000000002 (bitvector 16))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 1 -1 -1 0 ) 
                            (hexagon_V6_vavgwrnd_128B_dsl (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (lit (bv #x00000000000000000000000000000002 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 0 -1 -1 0 ) 
                            (hexagon_V6_vavgwrnd_128B_dsl (lit (bv #x0000000000000001 (bitvector 16))) (lit (bv #x0000000000000002 (bitvector 16))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 0 -1 -1 0 ) 
                            (hexagon_V6_vavgwrnd_128B_dsl (lit (bv #x00000001 (bitvector 8))) (lit (bv #x00000002 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 1 -1 -1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 6)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vgth_or_128B_dsl)
     (define input-precs-dsl (list  2 2 8 8 4 4  ))
     (define input-size-dsl (list   (list 128 1024 1024 ) (list 128 1024 1024 ) (list 128 1024 1024 ) (list 128 1024 1024 ) (list 128 1024 1024 ) (list 128 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vgth_or_128B_dsl (lit (bv #b00 (bitvector 2))) (lit (bv #b11 (bitvector 2))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 2 1 16 1 0 ) 
                            (hexagon_V6_vgth_or_128B_dsl (lit (bv #b00 (bitvector 2))) (lit (bv #b11 (bitvector 2))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 2 0 16 1 0 ) 
                            (hexagon_V6_vgth_or_128B_dsl (lit (bv #b0 (bitvector 1))) (lit (bv #b1 (bitvector 1))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 1 1 8 1 0 ) 
                            (hexagon_V6_vgth_or_128B_dsl (lit (bv #b0 (bitvector 1))) (lit (bv #b1 (bitvector 1))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 1 0 8 1 0 ) 
                            (hexagon_V6_vgth_or_128B_dsl (lit (bv #x0000 (bitvector 4))) (lit (bv #x000f (bitvector 4))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 4 0 32 1 0 ) 
                            (hexagon_V6_vgth_or_128B_dsl (lit (bv #x0000 (bitvector 4))) (lit (bv #x000f (bitvector 4))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 128 128 0 128 4 1 32 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 6)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyuhe_acc_128B_dsl)
     (define input-precs-dsl (list  32  ))
     (define input-size-dsl (list   (list 1024 1024 32 ) ) )
     (define variants (list (hexagon_V6_vmpyuhe_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 32 32 0 512 16 32 1 -1 0 0 0 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmaxw_128B_dsl)
     (define input-precs-dsl (list  32 16 16 8 8  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vmaxw_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 1 0 ) 
                            (hexagon_V6_vmaxw_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 1 0 ) 
                            (hexagon_V6_vmaxw_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 0 0 ) 
                            (hexagon_V6_vmaxw_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 0 0 ) 
                            (hexagon_V6_vmaxw_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 5)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vandqrt_acc_128B_dsl)
     (define input-precs-dsl (list  8  ))
     (define input-size-dsl (list   (list 32 128 1024 ) ) )
     (define variants (list (hexagon_V6_vandqrt_acc_128B_dsl (lit (bv #b1 (bitvector 1))) (reg (bv 0 8)) (reg (bv 1 8)) (lit (bv #x00000000 (bitvector 8))) (reg (bv 2 8)) 32 32 0 1024 8 4 1 8 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyub_128B_dsl)
     (define input-precs-dsl (list  8 8  ))
     (define input-size-dsl (list   (list 1024 32 ) (list 1024 32 ) ) )
     (define variants (list (hexagon_V6_vmpyub_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 32 32 0 512 8 0 512 8 16 1 0 0 4 4 16 1024 0 0 4 1 4 8 2 0 ) 
                            (hexagon_V6_vmpyub_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 32 32 0 512 8 0 512 8 16 1 1 0 4 4 16 1024 1 0 4 1 4 8 2 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_pred_and_n_128B_dsl)
     (define input-precs-dsl (list  -1  ))
     (define input-size-dsl (list   (list 128 128 ) ) )
     (define variants (list (hexagon_V6_pred_and_n_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 128 128 0 128 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vasruwuhrndsat_128B_dsl)
     (define input-precs-dsl (list  32 32 32  ))
     (define input-size-dsl (list   (list 1024 1024 32 ) (list 1024 1024 32 ) (list 1024 1024 32 ) ) )
     (define variants (list (hexagon_V6_vasruwuhrndsat_128B_dsl (lit (bv #x0000000000000000000000000000000f (bitvector 32))) (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 16 16 0 -1 32 1 0 -1 -1 0 ) 
                            (hexagon_V6_vasruwuhrndsat_128B_dsl (lit (bv #x0000000000000000000000000000000f (bitvector 32))) (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 16 16 1 -1 32 1 1 -1 -1 0 ) 
                            (hexagon_V6_vasruwuhrndsat_128B_dsl (lit (bv #x0000000000000000000000000000000f (bitvector 32))) (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 16 16 0 -1 32 1 0 -1 -1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 3)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vaslw_128B_dsl)
     (define input-precs-dsl (list  32  ))
     (define input-size-dsl (list   (list 1024 32 ) ) )
     (define variants (list (hexagon_V6_vaslw_128B_dsl (lit (bv #x0000000000000000000000000000001f (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vavguw_128B_dsl)
     (define input-precs-dsl (list  32 16 16 8 8 32  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vavguw_128B_dsl (lit (bv #x00000000000000000000000000000002 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 0 -1 0 ) 
                            (hexagon_V6_vavguw_128B_dsl (lit (bv #x0000000000000002 (bitvector 16))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 1 -1 0 ) 
                            (hexagon_V6_vavguw_128B_dsl (lit (bv #x0000000000000002 (bitvector 16))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 0 -1 0 ) 
                            (hexagon_V6_vavguw_128B_dsl (lit (bv #x00000002 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 1 -1 0 ) 
                            (hexagon_V6_vavguw_128B_dsl (lit (bv #x00000002 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 0 -1 0 ) 
                            (hexagon_V6_vavguw_128B_dsl (lit (bv #x00000000000000000000000000000002 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 1 -1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 6)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vasrhubsat_128B_dsl)
     (define input-precs-dsl (list  16 16 16  ))
     (define input-size-dsl (list   (list 1024 1024 32 ) (list 1024 1024 32 ) (list 1024 1024 32 ) ) )
     (define variants (list (hexagon_V6_vasrhubsat_128B_dsl (lit (bv #x00000000000000000000000000000007 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 8 8 0 1 32 16 1 0 1 0 ) 
                            (hexagon_V6_vasrhubsat_128B_dsl (lit (bv #x00000000000000000000000000000007 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 8 8 1 1 32 16 1 1 1 0 ) 
                            (hexagon_V6_vasrhubsat_128B_dsl (lit (bv #x00000000000000000000000000000007 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 8 8 0 0 32 16 1 0 0 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 3)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_lo_128B_dsl)
     (define input-precs-dsl (list  8  ))
     (define input-size-dsl (list   (list 2048 ) ) )
     (define variants (list (hexagon_V6_lo_128B_dsl (reg (bv 0 8)) 1024 1024 0 1024 8 1024 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vassign_128B_dsl)
     (define input-precs-dsl (list  32 8  ))
     (define input-size-dsl (list   (list 1024 ) (list 2048 ) ) )
     (define variants (list (hexagon_V6_vassign_128B_dsl (reg (bv 0 8)) 1024 1024 0 1024 32 0 ) 
                            (hexagon_V6_vassign_128B_dsl (reg (bv 0 8)) 1024 1024 0 1024 8 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vunpackh_128B_dsl)
     (define input-precs-dsl (list  16 8 16 8  ))
     (define input-size-dsl (list   (list 1024 ) (list 1024 ) (list 1024 ) (list 1024 ) ) )
     (define variants (list (hexagon_V6_vunpackh_128B_dsl (reg (bv 0 8)) 1024 1024 0 1024 16 32 1 1 0 ) 
                            (hexagon_V6_vunpackh_128B_dsl (reg (bv 0 8)) 1024 1024 0 1024 8 16 1 1 0 ) 
                            (hexagon_V6_vunpackh_128B_dsl (reg (bv 0 8)) 1024 1024 0 1024 16 32 1 0 0 ) 
                            (hexagon_V6_vunpackh_128B_dsl (reg (bv 0 8)) 1024 1024 0 1024 8 16 1 0 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 4)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vcombine_128B_dsl)
     (define input-precs-dsl (list  8  ))
     (define input-size-dsl (list   (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vcombine_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 0 1024 8 1024 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpauhb_128B_dsl)
     (define input-precs-dsl (list  16 16  ))
     (define input-size-dsl (list   (list 2048 32 ) (list 2048 32 ) ) )
     (define variants (list (hexagon_V6_vmpauhb_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 32 32 0 256 8 0 256 8 32 1 -1 1 1 8 16 1024 1 1 0 16 32 1024 -1 1 1 24 16 1040 1 1 16 16 16 4 0 ) 
                            (hexagon_V6_vmpauhb_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 32 32 0 256 8 0 256 8 32 1 -1 1 1 8 16 1024 1 1 0 16 32 1024 -1 1 1 24 16 1040 1 1 16 16 16 4 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpybv_acc_128B_dsl)
     (define input-precs-dsl (list  16 16 32 16 16 16  ))
     (define input-size-dsl (list   (list 2048 1024 1024 ) (list 2048 1024 1024 ) (list 2048 1024 1024 ) (list 2048 1024 1024 ) (list 2048 1024 1024 ) (list 2048 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vmpybv_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 8 0 512 8 16 1 -1 1 1 16 -1 1 1 8 1024 2 0 ) 
                            (hexagon_V6_vmpybv_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 8 0 512 8 16 1 -1 1 0 16 -1 1 0 8 1024 2 0 ) 
                            (hexagon_V6_vmpybv_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 16 0 512 16 32 1 -1 0 1 32 -1 0 1 16 1024 2 0 ) 
                            (hexagon_V6_vmpybv_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 8 0 512 8 16 1 -1 0 0 16 -1 0 0 8 1024 2 0 ) 
                            (hexagon_V6_vmpybv_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 16 0 512 16 32 1 -1 0 0 32 -1 0 0 16 1024 2 0 ) 
                            (hexagon_V6_vmpybv_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 512 16 0 512 16 32 1 -1 1 1 32 -1 1 1 16 1024 2 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 6)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vlsrwv_128B_dsl)
     (define input-precs-dsl (list  32 16  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vlsrwv_128B_dsl (reg (bv 0 8)) (lit (bv #x00000000000000000000000000000000 (bitvector 32))) (reg (bv 1 8)) 1024 1024 0 1024 32 1 0 ) 
                            (hexagon_V6_vlsrwv_128B_dsl (reg (bv 0 8)) (lit (bv #x0000000000000000 (bitvector 16))) (reg (bv 1 8)) 1024 1024 0 1024 16 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vsubhnq_128B_dsl)
     (define input-precs-dsl (list  16 32 8 16 8 32  ))
     (define input-size-dsl (list   (list 1024 128 1024 ) (list 1024 128 1024 ) (list 1024 128 1024 ) (list 1024 128 1024 ) (list 1024 128 1024 ) (list 1024 128 1024 ) ) )
     (define variants (list (hexagon_V6_vsubhnq_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) (lit (bv #b1 (bitvector 1))) 1024 1024 0 1024 16 -1 1 16 0 ) 
                            (hexagon_V6_vsubhnq_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) (lit (bv #b1 (bitvector 1))) 1024 1024 0 1024 32 -1 1 32 0 ) 
                            (hexagon_V6_vsubhnq_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) (lit (bv #b1 (bitvector 1))) 1024 1024 0 1024 8 -1 1 8 0 ) 
                            (hexagon_V6_vsubhnq_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) (lit (bv #b1 (bitvector 1))) 1024 1024 0 1024 16 -1 1 16 0 ) 
                            (hexagon_V6_vsubhnq_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) (lit (bv #b1 (bitvector 1))) 1024 1024 0 1024 8 -1 1 8 0 ) 
                            (hexagon_V6_vsubhnq_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) (lit (bv #b1 (bitvector 1))) 1024 1024 0 1024 32 -1 1 32 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 6)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vsb_128B_dsl)
     (define input-precs-dsl (list  8 16 16 8  ))
     (define input-size-dsl (list   (list 1024 ) (list 1024 ) (list 1024 ) (list 1024 ) ) )
     (define variants (list (hexagon_V6_vsb_128B_dsl (reg (bv 0 8)) 1024 1024 0 512 8 0 512 8 16 1 1 16 1024 1 8 2 0 ) 
                            (hexagon_V6_vsb_128B_dsl (reg (bv 0 8)) 1024 1024 0 512 16 0 512 16 32 1 0 32 1024 0 16 2 0 ) 
                            (hexagon_V6_vsb_128B_dsl (reg (bv 0 8)) 1024 1024 0 512 16 0 512 16 32 1 1 32 1024 1 16 2 0 ) 
                            (hexagon_V6_vsb_128B_dsl (reg (bv 0 8)) 1024 1024 0 512 8 0 512 8 16 1 0 16 1024 0 8 2 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 4)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vaddbq_128B_dsl)
     (define input-precs-dsl (list  8 32 16 16 8 32  ))
     (define input-size-dsl (list   (list 1024 128 1024 ) (list 1024 128 1024 ) (list 1024 128 1024 ) (list 1024 128 1024 ) (list 1024 128 1024 ) (list 1024 128 1024 ) ) )
     (define variants (list (hexagon_V6_vaddbq_128B_dsl (reg (bv 0 8)) (lit (bv #b1 (bitvector 1))) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 1024 8 -1 1 8 0 ) 
                            (hexagon_V6_vaddbq_128B_dsl (reg (bv 0 8)) (lit (bv #b1 (bitvector 1))) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 1024 32 -1 1 32 0 ) 
                            (hexagon_V6_vaddbq_128B_dsl (reg (bv 0 8)) (lit (bv #b1 (bitvector 1))) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 1024 16 -1 1 16 0 ) 
                            (hexagon_V6_vaddbq_128B_dsl (reg (bv 0 8)) (lit (bv #b1 (bitvector 1))) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 1024 16 -1 1 16 0 ) 
                            (hexagon_V6_vaddbq_128B_dsl (reg (bv 0 8)) (lit (bv #b1 (bitvector 1))) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 1024 8 -1 1 8 0 ) 
                            (hexagon_V6_vaddbq_128B_dsl (reg (bv 0 8)) (lit (bv #b1 (bitvector 1))) (reg (bv 1 8)) (reg (bv 2 8)) 1024 1024 0 1024 32 -1 1 32 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 6)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpybv_128B_dsl)
     (define input-precs-dsl (list  8 16 8 8 16 16  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vmpybv_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 8 0 512 8 16 1 1 1 16 1024 1 1 8 2 0 ) 
                            (hexagon_V6_vmpybv_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 0 512 16 32 1 1 1 32 1024 1 1 16 2 0 ) 
                            (hexagon_V6_vmpybv_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 8 0 512 8 16 1 1 0 16 1024 1 0 8 2 0 ) 
                            (hexagon_V6_vmpybv_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 8 0 512 8 16 1 0 0 16 1024 0 0 8 2 0 ) 
                            (hexagon_V6_vmpybv_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 0 512 16 32 1 0 1 32 1024 0 1 16 2 0 ) 
                            (hexagon_V6_vmpybv_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 0 512 16 32 1 0 0 32 1024 0 0 16 2 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 6)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vasrhv_128B_dsl)
     (define input-precs-dsl (list  16 32  ))
     (define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vasrhv_128B_dsl (reg (bv 0 8)) (lit (bv #x0000000000000000 (bitvector 16))) (reg (bv 1 8)) 1024 1024 0 1024 16 1 0 ) 
                            (hexagon_V6_vasrhv_128B_dsl (reg (bv 0 8)) (lit (bv #x00000000000000000000000000000000 (bitvector 32))) (reg (bv 1 8)) 1024 1024 0 1024 32 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vdmpyhsat_acc_128B_dsl)
     (define input-precs-dsl (list  16 16 16 16  ))
     (define input-size-dsl (list   (list 1024 1024 32 ) (list 1024 32 ) (list 1024 32 ) (list 1024 1024 32 ) ) )
     (define variants (list (hexagon_V6_vdmpyhsat_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 32 0 32 16 1 1 1 0 ) 
                            (hexagon_V6_vdmpyhsat_acc_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 32 0 32 16 1 1 1 0 ) 
                            (hexagon_V6_vdmpyhsat_acc_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 1024))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 32 0 32 16 1 0 1 0 ) 
                            (hexagon_V6_vdmpyhsat_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 1024 32 0 32 16 1 0 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 4)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyh_acc_128B_dsl)
     (define input-precs-dsl (list  32 32 32  ))
     (define input-size-dsl (list   (list 2048 1024 32 ) (list 2048 1024 32 ) (list 2048 1024 32 ) ) )
     (define variants (list (hexagon_V6_vmpyh_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 32 32 0 512 16 0 512 16 32 1 -1 1 1 0 32 -1 1 1 16 16 1024 2 0 ) 
                            (hexagon_V6_vmpyh_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 32 32 0 512 16 0 512 16 32 1 -1 0 0 0 32 -1 0 0 16 16 1024 2 0 ) 
                            (hexagon_V6_vmpyh_acc_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 32 32 0 512 16 0 512 16 32 1 1 1 1 0 32 1 1 1 16 16 1024 2 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 3)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vnot_128B_dsl)
     (define input-precs-dsl (list  16 -1  ))
     (define input-size-dsl (list   (list 1024 ) (list 128 ) ) )
     (define variants (list (hexagon_V6_vnot_128B_dsl (reg (bv 0 8)) 1024 1024 0 1024 16 0 ) 
                            (hexagon_V6_vnot_128B_dsl (reg (bv 0 8)) 128 128 0 128 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 2)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_pred_or_n_128B_dsl)
     (define input-precs-dsl (list  -1  ))
     (define input-size-dsl (list   (list 128 128 ) ) )
     (define variants (list (hexagon_V6_pred_or_n_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) 128 128 0 128 1 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vmpyewuh_64_128B_dsl)
     (define input-precs-dsl (list  32  ))
     (define input-size-dsl (list   (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vmpyewuh_64_128B_dsl (lit (bv #x0000000000000000000000000000000000000000000000000000000000000010 (bitvector 64))) (lit (bv #x0000000000000000000000000000000000000000000000000000000000000010 (bitvector 64))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 512 16 0 512 16 32 1 1 64 1 32 1024 1 64 1 2 32 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vshuffvdd_128B_dsl)
     (define input-precs-dsl (list  8  ))
     (define input-size-dsl (list   (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vshuffvdd_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 2048 2048 0 1024 8 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    [(equal? prog hexagon_V6_vdealvdd_128B_dsl)
     (define input-precs-dsl (list  -1  ))
     (define input-size-dsl (list   (list 1024 1024 ) ) )
     (define variants (list (hexagon_V6_vdealvdd_128B_dsl (reg (bv 0 8)) (reg (bv 1 8)) (reg (bv 2 8)) 2048 2048 0 512 0 512 0 512 0 512 8 2 2 2 2 0 ) 
                            ))

     (define (filter-fn i)
       (define length-condition #f)
       (define prec-condition #f)

       (for/list ([l input-sizes])
                 (for/list ([l_ (list-ref input-size-dsl i)])
                           (cond [(equal? l l_) (set! length-condition #t)] )
                           )
                 )

       (for/list ([p input-precs])
                 (cond [(equal? p (list-ref input-precs-dsl i)) (set! prec-condition #t)] )
                 )

       (and length-condition prec-condition)
       )

     (define relavent-indices (filter filter-fn (range 0 1)))
     (for/list ([i relavent-indices]) (list-ref variants i))
     ]
    )
  )

;; ================================================================================
