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
(require rosette/lib/destruct)



(require hydride/ir/hydride/definition)
(require hydride/ir/bitsimd/definition)

(provide (all-defined-out))
;; ================================================================================
;;                                DSL Extract Subexpressions
;; ================================================================================
(define (bitsimd:extract-expr prog num-consumed depth)
 (cond [(equal? depth 0) (values (reg (bv num-consumed 8)) (+ 1 num-consumed))] 
[else
(destruct prog
	[(reg id) (values (reg (bv num-consumed 8)) (+ 1 num-consumed))]
	[(lit v) (values (lit v) num-consumed) ]
		[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))

(values (vector-two-input-swizzle_dsl expr-0 expr-1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 ) num-consumed-1)
	]
		[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))

(values (interleave-vectors_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)
	]
		[(interleave-vector_dsl v0 size_i_o prec_i_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))

(values (interleave-vector_dsl expr-0 size_i_o prec_i_o ) num-consumed-0)
	]
		[(deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))

(values (deinterleave-vector_dsl expr-0 size_i_o prec_i_o ) num-consumed-0)
	]
		[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (bitsimd:extract-expr v4 num-consumed-1 (- depth 1)))

(values (llvm_shuffle_vectors_dsl expr-0 expr-1 num_2 prec_i_o expr-2 num_5 ) num-consumed-2)
	]
		[(llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-add_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-sub_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-mul_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-sdiv_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-udiv_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-zext_dsl v0 size_i size_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))

(values (llvm-zext_dsl expr-0 size_i size_o ) num-consumed-0)
	]
		[(scalar_splat_dsl v0 size_i size_o)
		(define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))

(values (scalar_splat_dsl expr-0 size_i size_o ) num-consumed-0)
	]
	[(pimMax_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMax_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMax_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMax_v1024_e8__v1024_e8__v1024_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMax_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMax_v1024_e16__v1024_e16__v1024_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMax_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMax_v1024_e32__v1024_e32__v1024_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMax_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMax_v512_e8__v512_e8__v512_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMax_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMax_v512_e32__v512_e32__v512_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMax_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMax_v512_e16__v512_e16__v512_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMax_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[else (error "Unable to extract  for pimMax_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(pimXor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); pimXor_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimXor_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)); pimXor_v512_e8__v512_e8__v512_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimXor_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)); pimXor_v512_e32__v512_e32__v512_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimXor_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0)); pimXor_v1024_e16__v1024_e16__v1024_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimXor_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0)); pimXor_v1024_e8__v1024_e8__v1024_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimXor_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)); pimXor_v512_e16__v512_e16__v512_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimXor_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0)); pimXor_v1024_e32__v1024_e32__v1024_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimXor_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[else (error "Unable to extract  for pimXor_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(pimDiv_v512_e16__v512_e16__v512_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); pimDiv_v512_e16__v512_e16__v512_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimDiv_v512_e16__v512_e16__v512_e16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); pimDiv_v1024_e16__v1024_e16__v1024_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimDiv_v512_e16__v512_e16__v512_e16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[else (error "Unable to extract  for pimDiv_v512_e16__v512_e16__v512_e16")]
)

	]
	[(pimEQ_v512_e8__v512_e8__v512_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(cond 
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 0)); pimEQ_v512_e8__v512_e8__v512_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimEQ_v512_e8__v512_e8__v512_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 0)); pimEQ_v1024_e8__v1024_e8__v1024_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimEQ_v512_e8__v512_e8__v512_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 131072) (equal? num_5 131072) (equal? num_6 0) (equal? num_7 131072) (equal? prec_i_o 8) (equal? num_9 0)); pimEQ_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimEQ_v512_e8__v512_e8__v512_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 0)); pimEQ_v512_e32__v512_e32__v512_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimEQ_v512_e8__v512_e8__v512_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 0)); pimEQ_v512_e16__v512_e16__v512_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimEQ_v512_e8__v512_e8__v512_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 0)); pimEQ_v1024_e32__v1024_e32__v1024_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimEQ_v512_e8__v512_e8__v512_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 0)); pimEQ_v1024_e16__v1024_e16__v1024_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimEQ_v512_e8__v512_e8__v512_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-1)]
		[else (error "Unable to extract  for pimEQ_v512_e8__v512_e8__v512_e8")]
)

	]
	[(pimMin_v512_e8__v512_e8__v512_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMin_v512_e8__v512_e8__v512_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMin_v512_e8__v512_e8__v512_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMin_v1024_e32__v1024_e32__v1024_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMin_v512_e8__v512_e8__v512_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMin_v512_e32__v512_e32__v512_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMin_v512_e8__v512_e8__v512_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMin_v1024_e8__v1024_e8__v1024_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMin_v512_e8__v512_e8__v512_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMin_v512_e16__v512_e16__v512_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMin_v512_e8__v512_e8__v512_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMin_v1024_e16__v1024_e16__v1024_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMin_v512_e8__v512_e8__v512_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMin_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMin_v512_e8__v512_e8__v512_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[else (error "Unable to extract  for pimMin_v512_e8__v512_e8__v512_e8")]
)

	]
	[(pimDiv_v512_e8__v512_e8__v512_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); pimDiv_v512_e8__v512_e8__v512_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimDiv_v512_e8__v512_e8__v512_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); pimDiv_v1024_e8__v1024_e8__v1024_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimDiv_v512_e8__v512_e8__v512_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); pimDiv_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimDiv_v512_e8__v512_e8__v512_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[else (error "Unable to extract  for pimDiv_v512_e8__v512_e8__v512_e8")]
)

	]
	[(pimOr_v1024_e32__v1024_e32__v1024_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0)); pimOr_v1024_e32__v1024_e32__v1024_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimOr_v1024_e32__v1024_e32__v1024_e32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)); pimOr_v512_e32__v512_e32__v512_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimOr_v1024_e32__v1024_e32__v1024_e32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0)); pimOr_v1024_e8__v1024_e8__v1024_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimOr_v1024_e32__v1024_e32__v1024_e32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)); pimOr_v512_e16__v512_e16__v512_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimOr_v1024_e32__v1024_e32__v1024_e32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0)); pimOr_v1024_e16__v1024_e16__v1024_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimOr_v1024_e32__v1024_e32__v1024_e32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)); pimOr_v512_e8__v512_e8__v512_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimOr_v1024_e32__v1024_e32__v1024_e32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); pimOr_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimOr_v1024_e32__v1024_e32__v1024_e32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[else (error "Unable to extract  for pimOr_v1024_e32__v1024_e32__v1024_e32")]
)

	]
	[(pimSub_v512_e8__v512_e8__v512_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSub_v512_e8__v512_e8__v512_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimSub_v512_e8__v512_e8__v512_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSub_v512_e16__v512_e16__v512_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimSub_v512_e8__v512_e8__v512_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSub_v1024_e8__v1024_e8__v1024_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimSub_v512_e8__v512_e8__v512_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSub_v1024_e16__v1024_e16__v1024_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimSub_v512_e8__v512_e8__v512_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSub_v512_e32__v512_e32__v512_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimSub_v512_e8__v512_e8__v512_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSub_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimSub_v512_e8__v512_e8__v512_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSub_v1024_e32__v1024_e32__v1024_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimSub_v512_e8__v512_e8__v512_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[else (error "Unable to extract  for pimSub_v512_e8__v512_e8__v512_e8")]
)

	]
	[(pimMul_v1024_e16__v1024_e16__v1024_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)); pimMul_v1024_e16__v1024_e16__v1024_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMul_v1024_e16__v1024_e16__v1024_e16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)); pimMul_v512_e32__v512_e32__v512_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMul_v1024_e16__v1024_e16__v1024_e16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)); pimMul_v1024_e32__v1024_e32__v1024_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMul_v1024_e16__v1024_e16__v1024_e16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)); pimMul_v1024_e8__v1024_e8__v1024_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMul_v1024_e16__v1024_e16__v1024_e16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)); pimMul_v512_e16__v512_e16__v512_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMul_v1024_e16__v1024_e16__v1024_e16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)); pimMul_v512_e8__v512_e8__v512_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMul_v1024_e16__v1024_e16__v1024_e16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)); pimMul_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimMul_v1024_e16__v1024_e16__v1024_e16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[else (error "Unable to extract  for pimMul_v1024_e16__v1024_e16__v1024_e16")]
)

	]
	[(pimDiv_v1024_e32__v1024_e32__v1024_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)); pimDiv_v1024_e32__v1024_e32__v1024_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimDiv_v1024_e32__v1024_e32__v1024_e32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)); pimDiv_v512_e32__v512_e32__v512_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimDiv_v1024_e32__v1024_e32__v1024_e32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[else (error "Unable to extract  for pimDiv_v1024_e32__v1024_e32__v1024_e32")]
)

	]
	[(pimGT_v1024_e8__v1024_e8__v1024_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)); pimGT_v1024_e8__v1024_e8__v1024_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimGT_v1024_e8__v1024_e8__v1024_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0)); pimLT_v1024_e32__v1024_e32__v1024_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimGT_v1024_e8__v1024_e8__v1024_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0)); pimLT_v512_e16__v512_e16__v512_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimGT_v1024_e8__v1024_e8__v1024_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)); pimGT_v512_e8__v512_e8__v512_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimGT_v1024_e8__v1024_e8__v1024_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 131072) (equal? num_5 131072) (equal? num_6 0) (equal? num_7 131072) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)); pimGT_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimGT_v1024_e8__v1024_e8__v1024_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0)); pimGT_v512_e16__v512_e16__v512_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimGT_v1024_e8__v1024_e8__v1024_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)); pimLT_v512_e8__v512_e8__v512_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimGT_v1024_e8__v1024_e8__v1024_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0)); pimGT_v1024_e32__v1024_e32__v1024_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimGT_v1024_e8__v1024_e8__v1024_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 131072) (equal? num_5 131072) (equal? num_6 0) (equal? num_7 131072) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)); pimLT_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimGT_v1024_e8__v1024_e8__v1024_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)); pimLT_v1024_e8__v1024_e8__v1024_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimGT_v1024_e8__v1024_e8__v1024_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0)); pimLT_v1024_e16__v1024_e16__v1024_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimGT_v1024_e8__v1024_e8__v1024_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0)); pimGT_v512_e32__v512_e32__v512_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimGT_v1024_e8__v1024_e8__v1024_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0)); pimGT_v1024_e16__v1024_e16__v1024_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimGT_v1024_e8__v1024_e8__v1024_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0)); pimLT_v512_e32__v512_e32__v512_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (pimGT_v1024_e8__v1024_e8__v1024_e8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-1)]
		[else (error "Unable to extract  for pimGT_v1024_e8__v1024_e8__v1024_e8")]
)

	]
	[(pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v1024_e16__v1024_e16__v1024_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v512_e16__v512_e16__v512_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v1024_e32__v1024_e32__v1024_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v512_e8__v512_e8__v512_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v1024_e8__v1024_e8__v1024_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v512_e32__v512_e32__v512_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimAdd_v1024_e16__v1024_e16__v1024_e16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 ) num-consumed-1)]
		[else (error "Unable to extract  for pimAdd_v1024_e16__v1024_e16__v1024_e16")]
)

	]
	[(pimBroadCast_v512_e8__v8_e8_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)); pimBroadCast_v512_e8__v8_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
 
 (values (pimBroadCast_v512_e8__v8_e8_dsl expr-0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)); pimBroadCast_v1024_e16__v16_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
 
 (values (pimBroadCast_v512_e8__v8_e8_dsl expr-0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)); pimBroadCast_v1024_e32__v32_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
 
 (values (pimBroadCast_v512_e8__v8_e8_dsl expr-0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)); pimBroadCast_v512_e32__v32_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
 
 (values (pimBroadCast_v512_e8__v8_e8_dsl expr-0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)); pimBroadCast_v512_e16__v16_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
 
 (values (pimBroadCast_v512_e8__v8_e8_dsl expr-0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 131072) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)); pimBroadCast_v16384_e8__v8_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
 
 (values (pimBroadCast_v512_e8__v8_e8_dsl expr-0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)); pimBroadCast_v1024_e8__v8_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
 
 (values (pimBroadCast_v512_e8__v8_e8_dsl expr-0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[else (error "Unable to extract  for pimBroadCast_v512_e8__v8_e8")]
)

	]
	[(pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); pimAnd_v16384_e8__v16384_e8__v16384_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)); pimAnd_v512_e16__v512_e16__v512_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)); pimAnd_v512_e8__v512_e8__v512_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0)); pimAnd_v1024_e16__v1024_e16__v1024_e16
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0)); pimAnd_v1024_e32__v1024_e32__v1024_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0)); pimAnd_v1024_e8__v1024_e8__v1024_e8
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)); pimAnd_v512_e32__v512_e32__v512_e32
 
 (define-values (expr-0 num-consumed-0) (bitsimd:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (bitsimd:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (pimAnd_v16384_e8__v16384_e8__v16384_e8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[else (error "Unable to extract  for pimAnd_v16384_e8__v16384_e8__v16384_e8")]
)

	]
 )
]
) 
)
;; ================================================================================

