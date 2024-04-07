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
(require hydride/ir/aie/definition)
(require hydride/ir/aie/printer)

(provide (all-defined-out))
;; ================================================================================
;;                                DSL Get Variants
;; ================================================================================
(define (aie:get-variants prog input-sizes input-precs)
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
	[(equal? prog v16int32_add16_dsl)
		(define input-precs-dsl (list  32  ))
		(define input-size-dsl (list   (list 512 512 ) ) )
		(define variants (list (v16int32_add16_dsl (reg (bv 0 8)) (reg (bv 1 8)) ) 
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
	[(equal? prog v8int32_add8_dsl)
		(define input-precs-dsl (list  32  ))
		(define input-size-dsl (list   (list 256 256 ) ) )
		(define variants (list (v8int32_add8_dsl (reg (bv 0 8)) (reg (bv 1 8)) ) 
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
	[(equal? prog v16int32_sub16_dsl)
		(define input-precs-dsl (list  32  ))
		(define input-size-dsl (list   (list 512 512 ) ) )
		(define variants (list (v16int32_sub16_dsl (reg (bv 0 8)) (reg (bv 1 8)) ) 
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
	[(equal? prog v8acc80_mul32_dsl)
		(define input-precs-dsl (list  32  ))
		(define input-size-dsl (list   (list 256 256 ) ) )
		(define variants (list (v8acc80_mul32_dsl (reg (bv 0 8)) (reg (bv 1 8)) ) 
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
	[(equal? prog srs_dsl)
		(define input-precs-dsl (list  80  ))
		(define input-size-dsl (list   (list 640 ) ) )
		(define variants (list (srs_dsl (reg (bv 0 8)) ) 
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

