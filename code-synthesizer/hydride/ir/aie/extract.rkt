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
(require hydride/ir/aie/definition)

(provide (all-defined-out))
;; ================================================================================
;;                                DSL Extract Subexpressions
;; ================================================================================
(define (aie:extract-expr prog num-consumed depth)
 (cond [(equal? depth 0) (values (reg (bv num-consumed 8)) (+ 1 num-consumed))] 
[else
(destruct prog
	[(reg id) (values (reg (bv num-consumed 8)) (+ 1 num-consumed))]
	[(lit v) (values (lit v) num-consumed) ]
		[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))

(values (vector-two-input-swizzle_dsl expr-0 expr-1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 ) num-consumed-1)
	]
		[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))

(values (interleave-vectors_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)
	]
		[(interleave-vector_dsl v0 size_i_o prec_i_o)
		(define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))

(values (interleave-vector_dsl expr-0 size_i_o prec_i_o ) num-consumed-0)
	]
		[(deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))

(values (deinterleave-vector_dsl expr-0 size_i_o prec_i_o ) num-consumed-0)
	]
		[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (aie:extract-expr v4 num-consumed-1 (- depth 1)))

(values (llvm_shuffle_vectors_dsl expr-0 expr-1 num_2 prec_i_o expr-2 num_5 ) num-consumed-2)
	]
		[(llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-add_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-sub_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-mul_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-sdiv_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-udiv_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-zext_dsl v0 size_i size_o)
		(define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))

(values (llvm-zext_dsl expr-0 size_i size_o ) num-consumed-0)
	]
		[(scalar_splat_dsl v0 size_i size_o)
		(define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))

(values (scalar_splat_dsl expr-0 size_i size_o ) num-consumed-0)
	]
	[(add_v16acc64_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 16) (equal? prec_i_o 64)); add_v16acc64
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (add_v16acc64_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); add_v16int32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (add_v16acc64_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); add_v16uint32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (add_v16acc64_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 32)); add_v32acc32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (add_v16acc64_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); add_v32int16
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (add_v16acc64_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); add_v32uint16
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (add_v16acc64_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); add_v64int8
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (add_v16acc64_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); add_v64uint8
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (add_v16acc64_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[else (error "Unable to extract  for add_v16acc64")]
)

	]
	[(sub_v16acc64_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 16) (equal? prec_i_o 64)); sub_v16acc64
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (sub_v16acc64_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); sub_v16int32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (sub_v16acc64_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); sub_v16uint32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (sub_v16acc64_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 32)); sub_v32acc32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (sub_v16acc64_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); sub_v32int16
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (sub_v16acc64_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); sub_v32uint16
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (sub_v16acc64_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); sub_v64int8
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (sub_v16acc64_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); sub_v64uint8
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (sub_v16acc64_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[else (error "Unable to extract  for sub_v16acc64")]
)

	]
 )
]
) 
)
;; ================================================================================

