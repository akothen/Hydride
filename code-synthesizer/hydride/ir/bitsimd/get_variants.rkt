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
	[(equal? prog pimMax_v16384_e8__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8 8 16 32 8 32 16  ))
		(define input-size-dsl (list   (list 131072 131072 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 512 512 ) (list 512 512 ) (list 512 512 ) ) )
		(define variants (list (pimMax_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 1 0 ) 
(pimMax_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 1 0 ) 
(pimMax_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 1 0 ) 
(pimMax_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 1 0 ) 
(pimMax_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 8 1 0 ) 
(pimMax_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 32 1 0 ) 
(pimMax_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 16 1 0 ) 
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
	[(equal? prog pimXor_v16384_e8__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8 8 32 16 8 16 32  ))
		(define input-size-dsl (list   (list 131072 131072 ) (list 512 512 ) (list 512 512 ) (list 1024 1024 ) (list 1024 1024 ) (list 512 512 ) (list 1024 1024 ) ) )
		(define variants (list (pimXor_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 0 ) 
(pimXor_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 8 0 ) 
(pimXor_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 32 0 ) 
(pimXor_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 0 ) 
(pimXor_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 0 ) 
(pimXor_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 16 0 ) 
(pimXor_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 0 ) 
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
	[(equal? prog pimDiv_v512_e16__v512_e16__v512_e16_dsl)
		(define input-precs-dsl (list  16 16  ))
		(define input-size-dsl (list   (list 512 512 ) (list 1024 1024 ) ) )
		(define variants (list (pimDiv_v512_e16__v512_e16__v512_e16_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 16 1 1 32 1 32 0 ) 
(pimDiv_v512_e16__v512_e16__v512_e16_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 1 1 32 1 32 0 ) 
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
	[(equal? prog pimEQ_v512_e8__v512_e8__v512_e8_dsl)
		(define input-precs-dsl (list  8 8 8 32 16 32 16  ))
		(define input-size-dsl (list   (list 512 512 ) (list 1024 1024 ) (list 131072 131072 ) (list 512 512 ) (list 512 512 ) (list 1024 1024 ) (list 1024 1024 ) ) )
		(define variants (list (pimEQ_v512_e8__v512_e8__v512_e8_dsl (lit (bv #x00000001 (bitvector 8))) (lit (bv #x00000000 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 8 0 ) 
(pimEQ_v512_e8__v512_e8__v512_e8_dsl (lit (bv #x00000001 (bitvector 8))) (lit (bv #x00000000 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 0 ) 
(pimEQ_v512_e8__v512_e8__v512_e8_dsl (lit (bv #x00000001 (bitvector 8))) (lit (bv #x00000000 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 0 ) 
(pimEQ_v512_e8__v512_e8__v512_e8_dsl (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (lit (bv #x00000000000000000000000000000000 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 32 0 ) 
(pimEQ_v512_e8__v512_e8__v512_e8_dsl (lit (bv #x0000000000000001 (bitvector 16))) (lit (bv #x0000000000000000 (bitvector 16))) (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 16 0 ) 
(pimEQ_v512_e8__v512_e8__v512_e8_dsl (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (lit (bv #x00000000000000000000000000000000 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 0 ) 
(pimEQ_v512_e8__v512_e8__v512_e8_dsl (lit (bv #x0000000000000001 (bitvector 16))) (lit (bv #x0000000000000000 (bitvector 16))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 0 ) 
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
	[(equal? prog pimMin_v512_e8__v512_e8__v512_e8_dsl)
		(define input-precs-dsl (list  8 32 32 8 16 16 8  ))
		(define input-size-dsl (list   (list 512 512 ) (list 1024 1024 ) (list 512 512 ) (list 1024 1024 ) (list 512 512 ) (list 1024 1024 ) (list 131072 131072 ) ) )
		(define variants (list (pimMin_v512_e8__v512_e8__v512_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 8 1 0 ) 
(pimMin_v512_e8__v512_e8__v512_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 1 0 ) 
(pimMin_v512_e8__v512_e8__v512_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 32 1 0 ) 
(pimMin_v512_e8__v512_e8__v512_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 1 0 ) 
(pimMin_v512_e8__v512_e8__v512_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 16 1 0 ) 
(pimMin_v512_e8__v512_e8__v512_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 1 0 ) 
(pimMin_v512_e8__v512_e8__v512_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 1 0 ) 
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
	[(equal? prog pimDiv_v512_e8__v512_e8__v512_e8_dsl)
		(define input-precs-dsl (list  8 8 8  ))
		(define input-size-dsl (list   (list 512 512 ) (list 1024 1024 ) (list 131072 131072 ) ) )
		(define variants (list (pimDiv_v512_e8__v512_e8__v512_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 8 1 1 16 1 16 0 ) 
(pimDiv_v512_e8__v512_e8__v512_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 1 1 16 1 16 0 ) 
(pimDiv_v512_e8__v512_e8__v512_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 1 1 16 1 16 0 ) 
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
	[(equal? prog pimOr_v1024_e32__v1024_e32__v1024_e32_dsl)
		(define input-precs-dsl (list  32 32 8 16 16 8 8  ))
		(define input-size-dsl (list   (list 1024 1024 ) (list 512 512 ) (list 1024 1024 ) (list 512 512 ) (list 1024 1024 ) (list 512 512 ) (list 131072 131072 ) ) )
		(define variants (list (pimOr_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 0 ) 
(pimOr_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 32 0 ) 
(pimOr_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 0 ) 
(pimOr_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 16 0 ) 
(pimOr_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 0 ) 
(pimOr_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 8 0 ) 
(pimOr_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 0 ) 
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
	[(equal? prog pimSub_v512_e8__v512_e8__v512_e8_dsl)
		(define input-precs-dsl (list  8 16 8 16 32 8 32  ))
		(define input-size-dsl (list   (list 512 512 ) (list 512 512 ) (list 1024 1024 ) (list 1024 1024 ) (list 512 512 ) (list 131072 131072 ) (list 1024 1024 ) ) )
		(define variants (list (pimSub_v512_e8__v512_e8__v512_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 8 -1 0 ) 
(pimSub_v512_e8__v512_e8__v512_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 16 -1 0 ) 
(pimSub_v512_e8__v512_e8__v512_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 -1 0 ) 
(pimSub_v512_e8__v512_e8__v512_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 -1 0 ) 
(pimSub_v512_e8__v512_e8__v512_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 32 -1 0 ) 
(pimSub_v512_e8__v512_e8__v512_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 -1 0 ) 
(pimSub_v512_e8__v512_e8__v512_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 -1 0 ) 
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
	[(equal? prog pimMul_v1024_e16__v1024_e16__v1024_e16_dsl)
		(define input-precs-dsl (list  16 32 32 8 16 8 8  ))
		(define input-size-dsl (list   (list 1024 1024 ) (list 512 512 ) (list 1024 1024 ) (list 1024 1024 ) (list 512 512 ) (list 512 512 ) (list 131072 131072 ) ) )
		(define variants (list (pimMul_v1024_e16__v1024_e16__v1024_e16_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 1 32 1 0 ) 
(pimMul_v1024_e16__v1024_e16__v1024_e16_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 32 1 64 1 0 ) 
(pimMul_v1024_e16__v1024_e16__v1024_e16_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 1 64 1 0 ) 
(pimMul_v1024_e16__v1024_e16__v1024_e16_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 1 16 1 0 ) 
(pimMul_v1024_e16__v1024_e16__v1024_e16_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 16 1 32 1 0 ) 
(pimMul_v1024_e16__v1024_e16__v1024_e16_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 8 1 16 1 0 ) 
(pimMul_v1024_e16__v1024_e16__v1024_e16_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 1 16 1 0 ) 
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
	[(equal? prog pimDiv_v1024_e32__v1024_e32__v1024_e32_dsl)
		(define input-precs-dsl (list  32 32  ))
		(define input-size-dsl (list   (list 1024 1024 ) (list 512 512 ) ) )
		(define variants (list (pimDiv_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 1 1 64 1 64 0 ) 
(pimDiv_v1024_e32__v1024_e32__v1024_e32_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 32 1 1 64 1 64 0 ) 
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
	[(equal? prog pimGT_v1024_e8__v1024_e8__v1024_e8_dsl)
		(define input-precs-dsl (list  8 32 16 8 8 16 8 32 8 8 16 32 16 32  ))
		(define input-size-dsl (list   (list 1024 1024 ) (list 1024 1024 ) (list 512 512 ) (list 512 512 ) (list 131072 131072 ) (list 512 512 ) (list 512 512 ) (list 1024 1024 ) (list 131072 131072 ) (list 1024 1024 ) (list 1024 1024 ) (list 512 512 ) (list 1024 1024 ) (list 512 512 ) ) )
		(define variants (list (pimGT_v1024_e8__v1024_e8__v1024_e8_dsl (lit (bv #x00000000 (bitvector 8))) (lit (bv #x00000001 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 1 0 ) 
(pimGT_v1024_e8__v1024_e8__v1024_e8_dsl (lit (bv #x00000000000000000000000000000000 (bitvector 32))) (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 1 0 ) 
(pimGT_v1024_e8__v1024_e8__v1024_e8_dsl (lit (bv #x0000000000000000 (bitvector 16))) (lit (bv #x0000000000000001 (bitvector 16))) (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 16 1 0 ) 
(pimGT_v1024_e8__v1024_e8__v1024_e8_dsl (lit (bv #x00000000 (bitvector 8))) (lit (bv #x00000001 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 8 1 0 ) 
(pimGT_v1024_e8__v1024_e8__v1024_e8_dsl (lit (bv #x00000000 (bitvector 8))) (lit (bv #x00000001 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 1 0 ) 
(pimGT_v1024_e8__v1024_e8__v1024_e8_dsl (lit (bv #x0000000000000000 (bitvector 16))) (lit (bv #x0000000000000001 (bitvector 16))) (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 16 1 0 ) 
(pimGT_v1024_e8__v1024_e8__v1024_e8_dsl (lit (bv #x00000000 (bitvector 8))) (lit (bv #x00000001 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 8 1 0 ) 
(pimGT_v1024_e8__v1024_e8__v1024_e8_dsl (lit (bv #x00000000000000000000000000000000 (bitvector 32))) (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 1 0 ) 
(pimGT_v1024_e8__v1024_e8__v1024_e8_dsl (lit (bv #x00000000 (bitvector 8))) (lit (bv #x00000001 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 1 0 ) 
(pimGT_v1024_e8__v1024_e8__v1024_e8_dsl (lit (bv #x00000000 (bitvector 8))) (lit (bv #x00000001 (bitvector 8))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 1 0 ) 
(pimGT_v1024_e8__v1024_e8__v1024_e8_dsl (lit (bv #x0000000000000000 (bitvector 16))) (lit (bv #x0000000000000001 (bitvector 16))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 1 0 ) 
(pimGT_v1024_e8__v1024_e8__v1024_e8_dsl (lit (bv #x00000000000000000000000000000000 (bitvector 32))) (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 32 1 0 ) 
(pimGT_v1024_e8__v1024_e8__v1024_e8_dsl (lit (bv #x0000000000000000 (bitvector 16))) (lit (bv #x0000000000000001 (bitvector 16))) (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 1 0 ) 
(pimGT_v1024_e8__v1024_e8__v1024_e8_dsl (lit (bv #x00000000000000000000000000000000 (bitvector 32))) (lit (bv #x00000000000000000000000000000001 (bitvector 32))) (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 32 1 0 ) 
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
        
		(define relavent-indices (filter filter-fn (range 0 14)))
		(for/list ([i relavent-indices]) (list-ref variants i))
	]
	[(equal? prog pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl)
		(define input-precs-dsl (list  16 16 8 32 8 8 32  ))
		(define input-size-dsl (list   (list 1024 1024 ) (list 512 512 ) (list 131072 131072 ) (list 1024 1024 ) (list 512 512 ) (list 1024 1024 ) (list 512 512 ) ) )
		(define variants (list (pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 -1 0 ) 
(pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 16 -1 0 ) 
(pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 -1 0 ) 
(pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 -1 0 ) 
(pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 8 -1 0 ) 
(pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 -1 0 ) 
(pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 32 -1 0 ) 
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
	[(equal? prog pimBroadCast_v512_e8__v8_e8_dsl)
		(define input-precs-dsl (list  8 16 32 32 16 8 8  ))
		(define input-size-dsl (list   (list 8 ) (list 16 ) (list 32 ) (list 512 ) (list 512 ) (list 8 ) (list 8 ) ) )
		(define variants (list (pimBroadCast_v512_e8__v8_e8_dsl (reg (bv 0 8)) 8 8 0 512 8 0 0 ) 
(pimBroadCast_v512_e8__v8_e8_dsl (reg (bv 0 8)) 16 16 0 1024 16 0 0 ) 
(pimBroadCast_v512_e8__v8_e8_dsl (reg (bv 0 8)) 32 32 0 1024 32 0 0 ) 
(pimBroadCast_v512_e8__v8_e8_dsl (reg (bv 0 8)) 512 512 0 512 32 0 0 ) 
(pimBroadCast_v512_e8__v8_e8_dsl (reg (bv 0 8)) 512 512 0 512 16 0 0 ) 
(pimBroadCast_v512_e8__v8_e8_dsl (reg (bv 0 8)) 8 8 0 131072 8 0 0 ) 
(pimBroadCast_v512_e8__v8_e8_dsl (reg (bv 0 8)) 8 8 0 1024 8 0 0 ) 
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
	[(equal? prog pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl)
		(define input-precs-dsl (list  8 16 8 16 32 8 32  ))
		(define input-size-dsl (list   (list 131072 131072 ) (list 512 512 ) (list 512 512 ) (list 1024 1024 ) (list 1024 1024 ) (list 1024 1024 ) (list 512 512 ) ) )
		(define variants (list (pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 131072 131072 0 131072 8 0 ) 
(pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 16 0 ) 
(pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 8 0 ) 
(pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 16 0 ) 
(pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 32 0 ) 
(pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 1024 1024 0 1024 8 0 ) 
(pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl (reg (bv 0 8)) (reg (bv 1 8)) 512 512 0 512 32 0 ) 
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
 )
)
;; ================================================================================

