;#============================== Hydride File =================================
;#
;# Part of the Hydride Compiler Infrastructure.
;# <Placeholder for license information>
;#
;#=============================================================================
;#
;# Do NOT modify this file. It is automatically generated.
;#
;#=============================================================================

#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/lib/destruct)

(require hydride/utils/bvops)
(require hydride/utils/misc)


(require hydride/ir/hydride/definition)
(require hydride/ir/bitsimd/definition)
(require hydride/ir/bitsimd/printer)

(provide (all-defined-out))
;; ================================================================================
;;                                DSL Get Variants
;; ================================================================================
(define (bitsimd:get-variants prog input-sizes input-precs)
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
		(define input-precs-dsl (list  16 8 16 32 8 16 32  ))
		(define input-size-dsl (list   (list 128 128 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 2048 2048 ) (list 2048 2048 ) (list 2048 2048 ) ) )
		(define variants (list (interleave-vectors_dsl (reg (bv 0 8)) (reg (bv 1 8)) 128 16 ) 
(interleave-vectors_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 8 ) 
(interleave-vectors_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 16 ) 
(interleave-vectors_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 32 ) 
(interleave-vectors_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 8 ) 
(interleave-vectors_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 16 ) 
(interleave-vectors_dsl (reg (bv 0 8)) (reg (bv 1 8)) 2048 32 ) 
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
        
		(define relavent-indices (filter filter-fn (range 0 7)))
		(for/list ([i relavent-indices]) (list-ref variants i))
	]
		[(equal? prog interleave-vector_dsl)
		(define input-precs-dsl (list  16 8 16 32 8 16 32  ))
		(define input-size-dsl (list   (list 128 ) (list 1024 ) (list 1024 ) (list 1024 ) (list 2048 ) (list 2048 ) (list 2048 ) ) )
		(define variants (list (interleave-vector_dsl (reg (bv 0 8)) 128 16 ) 
(interleave-vector_dsl (reg (bv 0 8)) 1024 8 ) 
(interleave-vector_dsl (reg (bv 0 8)) 1024 16 ) 
(interleave-vector_dsl (reg (bv 0 8)) 1024 32 ) 
(interleave-vector_dsl (reg (bv 0 8)) 2048 8 ) 
(interleave-vector_dsl (reg (bv 0 8)) 2048 16 ) 
(interleave-vector_dsl (reg (bv 0 8)) 2048 32 ) 
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
        
		(define relavent-indices (filter filter-fn (range 0 7)))
		(for/list ([i relavent-indices]) (list-ref variants i))
	]
		[(equal? prog deinterleave-vector_dsl)
		(define input-precs-dsl (list  16 8 16 32 8 16 32  ))
		(define input-size-dsl (list   (list 128 ) (list 1024 ) (list 1024 ) (list 1024 ) (list 2048 ) (list 2048 ) (list 2048 ) ) )
		(define variants (list (deinterleave-vector_dsl (reg (bv 0 8)) 128 16 ) 
(deinterleave-vector_dsl (reg (bv 0 8)) 1024 8 ) 
(deinterleave-vector_dsl (reg (bv 0 8)) 1024 16 ) 
(deinterleave-vector_dsl (reg (bv 0 8)) 1024 32 ) 
(deinterleave-vector_dsl (reg (bv 0 8)) 2048 8 ) 
(deinterleave-vector_dsl (reg (bv 0 8)) 2048 16 ) 
(deinterleave-vector_dsl (reg (bv 0 8)) 2048 32 ) 
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
        
		(define relavent-indices (filter filter-fn (range 0 7)))
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
		[(equal? prog llvm-zext_dsl)
		(define input-precs-dsl (list  8 16  ))
		(define input-size-dsl (list   (list 8 ) (list 16 ) ) )
		(define variants (list (llvm-zext_dsl (reg (bv 0 8)) 8 32 ) 
(llvm-zext_dsl (reg (bv 0 8)) 16 32 ) 
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
		[(equal? prog scalar_splat_dsl)
		(define input-precs-dsl (list  8 16  ))
		(define input-size-dsl (list   (list 8 ) (list 16 ) ) )
		(define variants (list (scalar_splat_dsl (reg (bv 0 8)) 8 32 ) 
(scalar_splat_dsl (reg (bv 0 8)) 16 32 ) 
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
	[(equal? prog dram_pimcpy_v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 ) ) )
		(define variants (list (dram_pimcpy_v16384_e8__v16384_e8_dsl (reg (bv 0 8)) 131072 131072 0 131072 8 0 ) 
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
	[(equal? prog dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 131072 ) ) )
		(define variants (list (dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 1 0 ) 
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
	[(equal? prog dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 131072 ) ) )
		(define variants (list (dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl (lit (bv #b0 (bitvector 1))) (lit (bv #b1 (bitvector 1))) (reg (bv 0 8)) (reg (bv 1 8)) 16384 16384 0 16384 1 8 8 0 ) 
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
	[(equal? prog dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 131072 ) ) )
		(define variants (list (dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 0 ) 
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
	[(equal? prog dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 131072 ) ) )
		(define variants (list (dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 0 ) 
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
	[(equal? prog dram_pimnot_v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 ) ) )
		(define variants (list (dram_pimnot_v16384_e8__v16384_e8_dsl (reg (bv 0 8)) 131072 131072 0 131072 8 0 ) 
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
	[(equal? prog dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 131072 ) ) )
		(define variants (list (dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 0 ) 
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
	[(equal? prog dram_pimbitcount_v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 ) ) )
		(define variants (list (dram_pimbitcount_v16384_e8__v16384_e8_dsl (reg (bv 0 8)) 131072 131072 0 131072 8 0 ) 
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
	[(equal? prog dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl)
		(define input-precs-dsl (list  8 8  ))
		(define input-size-dsl (list   (list 131072 8 ) (list 131072 8 ) ) )
		(define variants (list (dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl (lit (bv #b1 (bitvector 1))) (lit (bv #b0 (bitvector 1))) (reg (bv 0 8)) (reg (bv 1 8)) 16384 16384 0 16384 1 8 0 8 0 ) 
(dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl (lit (bv #b1 (bitvector 1))) (lit (bv #b0 (bitvector 1))) (reg (bv 0 8)) (reg (bv 1 8)) 16384 16384 0 16384 1 8 0 8 0 ) 
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
	[(equal? prog dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 131072 ) ) )
		(define variants (list (dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 0 ) 
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
	[(equal? prog dram_pimabs_v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 ) ) )
		(define variants (list (dram_pimabs_v16384_e8__v16384_e8_dsl (reg (bv 0 8)) 131072 131072 0 131072 8 0 ) 
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
	[(equal? prog dram_pimpopcount_v1_e16__v16384_e1_dsl)
		(define input-precs-dsl (list  16384  ))
		(define input-size-dsl (list   (list 16384 ) ) )
		(define variants (list (dram_pimpopcount_v1_e16__v16384_e1_dsl (reg (bv 0 8)) 16384 16384 0 16384 1 16 0 -1 0 0 0 ) 
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
	[(equal? prog dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8 8  ))
		(define input-size-dsl (list   (list 131072 131072 ) (list 131072 131072 ) ) )
		(define variants (list (dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl (lit (bv #b0 (bitvector 1))) (lit (bv #b1 (bitvector 1))) (reg (bv 0 8)) (reg (bv 1 8)) 16384 16384 0 16384 1 1 8 8 0 ) 
(dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl (lit (bv #b0 (bitvector 1))) (lit (bv #b1 (bitvector 1))) (reg (bv 0 8)) (reg (bv 1 8)) 16384 16384 0 16384 1 1 8 8 0 ) 
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
	[(equal? prog dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 131072 ) ) )
		(define variants (list (dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 0 ) 
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
	[(equal? prog dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 131072 ) ) )
		(define variants (list (dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 1 1 16 1 16 0 ) 
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
	[(equal? prog dram_vadd_v16384_e8_dsl)
		(define input-precs-dsl (list  8 8  ))
		(define input-size-dsl (list   (list 131072 131072 ) (list 131072 131072 ) ) )
		(define variants (list (dram_vadd_v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 16384 8 -1 0 ) 
(dram_vadd_v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 -1 0 ) 
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
	[(equal? prog dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 131072 ) ) )
		(define variants (list (dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 0 ) 
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
	[(equal? prog dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 131072 ) ) )
		(define variants (list (dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 0 ) 
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
	[(equal? prog dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 131072 ) ) )
		(define variants (list (dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 1 0 ) 
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
	[(equal? prog dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 131072 ) ) )
		(define variants (list (dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 1 16 1 0 ) 
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
	[(equal? prog dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 16384 131072 131072 ) ) )
		(define variants (list (dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl (reg (bv 0 8)) (lit (bv #b1 (bitvector 1))) (reg (bv 1 8)) (reg (bv 2 8)) 131072 131072 0 131072 8 1 8 0 ) 
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
	[(equal? prog dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 131072 ) ) )
		(define variants (list (dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 -1 0 ) 
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
	[(equal? prog dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 131072 ) ) )
		(define variants (list (dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 0 ) 
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
	[(equal? prog dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 ) ) )
		(define variants (list (dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl (lit (bv #x00000000 (bitvector 8))) (reg (bv 0 8)) (lit (bv #x00000000 (bitvector 8))) 131072 131072 0 131072 8 1 0 ) 
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
	[(equal? prog dram_pimredsum_v1_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 ) ) )
		(define variants (list (dram_pimredsum_v1_e8__v16384_e8_dsl (reg (bv 0 8)) 8 8 0 131072 8 0 -1 0 0 ) 
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
	[(equal? prog dram_pimbrdcst_v16384_e8__v1_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 8 ) ) )
		(define variants (list (dram_pimbrdcst_v16384_e8__v1_e8_dsl (reg (bv 0 8)) 8 8 0 131072 8 0 0 ) 
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
	[(equal? prog dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8  ))
		(define input-size-dsl (list   (list 131072 131072 ) ) )
		(define variants (list (dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 0 ) 
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

