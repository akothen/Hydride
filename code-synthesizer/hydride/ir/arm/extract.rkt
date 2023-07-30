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
(require hydride/ir/arm/definition)

(provide (all-defined-out))
;; ================================================================================
;;                                DSL Extract Subexpressions
;; ================================================================================
(define (arm:extract-expr prog num-consumed depth)
 (cond [(equal? depth 0) (values (reg (bv num-consumed 8)) (+ 1 num-consumed))] 
[else
(destruct prog
	[(reg id) (values (reg (bv num-consumed 8)) (+ 1 num-consumed))]
	[(lit v) (values (lit v) num-consumed) ]
		[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))

(values (vector-two-input-swizzle_dsl expr-0 expr-1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 ) num-consumed-1)
	]
		[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))

(values (interleave-vectors_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)
	]
		[(interleave-vector_dsl v0 size_i_o prec_i_o)
		(define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))

(values (interleave-vector_dsl expr-0 size_i_o prec_i_o ) num-consumed-0)
	]
		[(deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))

(values (deinterleave-vector_dsl expr-0 size_i_o prec_i_o ) num-consumed-0)
	]
		[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v4 num-consumed-1 (- depth 1)))

(values (llvm_shuffle_vectors_dsl expr-0 expr-1 num_2 prec_i_o expr-2 num_5 ) num-consumed-2)
	]
		[(llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-add_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-sub_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-mul_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-sdiv_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))

(values (llvm-vect-udiv_dsl expr-0 expr-1 num_2 prec_i_o ) num-consumed-1)
	]
		[(llvm-zext_dsl v0 size_i size_o)
		(define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))

(values (llvm-zext_dsl expr-0 size_i size_o ) num-consumed-0)
	]
		[(scalar_splat_dsl v0 size_i size_o)
		(define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))

(values (scalar_splat_dsl expr-0 size_i size_o ) num-consumed-0)
	]
	[(vqshrn_n_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 2)); vqshrn_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrn_n_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 2)); vqshrun_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrn_n_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 2)); vqshrns_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrn_n_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 2)); vqshruns_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrn_n_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 2)); vqshrnh_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrn_n_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 2)); vqshrund_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrn_n_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 2)); vqshrunh_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrn_n_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 2)); vqshrun_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrn_n_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 2)); vqshrnd_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrn_n_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 2)); vqshrn_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrn_n_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 2)); vqshrun_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrn_n_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 2)); vqshrn_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrn_n_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[else (error "Unable to extract  for vqshrn_n_s64")]
)

	]
	[(vmov_n_u16_dsl v0 size_o num_2 num_3 num_4 prec_o)
		(cond 
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16)); vmov_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 32)); vdupq_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 64)); vdupq_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8)); vmov_n_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8)); vmovq_n_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 32)); vmovq_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16)); vmov_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16)); vmovq_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 32)); vmovq_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32)); vdup_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8)); vmovq_n_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8)); vdup_n_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16)); vdup_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8)); vdup_n_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16)); vdupq_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32)); vmov_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8)); vmov_n_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 64)); vmovq_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 64)); vmovq_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32)); vmov_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 32)); vdupq_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 64)); vdupq_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8)); vdupq_n_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16)); vdup_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32)); vdup_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 8)); vdupq_n_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16)); vmovq_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[(and  (equal? size_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_o 16)); vdupq_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmov_n_u16_dsl expr-0 size_o num_2 num_3 num_4 prec_o ) num-consumed-0)]
		[else (error "Unable to extract  for vmov_n_u16")]
)

	]
	[(vcltzq_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)); vcltzq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcltzq_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)); vcltz_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcltzq_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)); vcltzd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcltzq_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)); vcltz_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcltzq_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)); vcltzq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcltzq_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)); vcltz_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcltzq_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)); vcltzq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcltzq_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)); vcltz_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcltzq_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)); vcltzq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcltzq_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[else (error "Unable to extract  for vcltzq_s64")]
)

	]
	[(vsub_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1)); vsub_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1)); vsub_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1)); vsub_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)); vsubd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1)); vsubq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1)); vsubq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)); vsub_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1)); vsubq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1)); vsub_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1)); vsubq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1)); vsub_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)); vsub_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)); vsubd_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1)); vsubq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1)); vsub_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1)); vsubq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1)); vsubq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1)); vsubq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsub_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[else (error "Unable to extract  for vsub_s32")]
)

	]
	[(vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? num_9 1) (equal? prec_o 32) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 32) (equal? num_18 1)); vqdmlsl_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v3 num-consumed-1 (- depth 1)))
 
 (values (vqdmlsl_n_s16_dsl vc_0 expr-0 expr-1 expr-2 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) num-consumed-2)]
		[else (error "Unable to extract  for vqdmlsl_n_s16")]
)

	]
	[(vabal_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0)); vabal_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vabal_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1)); vabal_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vabal_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0)); vabal_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vabal_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1)); vabal_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vabal_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1)); vabal_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vabal_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0)); vabal_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vabal_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ) num-consumed-2)]
		[else (error "Unable to extract  for vabal_u32")]
)

	]
	[(vabdq_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vabdq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdq_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vabd_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdq_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vabdq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdq_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vabd_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdq_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vabdq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdq_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vabdq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdq_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vabd_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdq_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vabd_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdq_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vabdq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdq_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vabdq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdq_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vabd_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdq_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vabd_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdq_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[else (error "Unable to extract  for vabdq_u8")]
)

	]
	[(vqrshl_s64_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshl_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshl_s64_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshld_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshl_s64_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 8) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? prec_i_o 8) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshlb_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshl_s64_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 32) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshl_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshl_s64_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_10 32) (equal? num_11 0) (equal? num_12 32) (equal? prec_i_o 32) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshls_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshl_s64_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 32) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshlq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshl_s64_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 64) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshlq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshl_s64_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 8) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshl_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshl_s64_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 16) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshl_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshl_s64_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 8) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshlq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshl_s64_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 16) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshlq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshl_s64_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_10 16) (equal? num_11 0) (equal? num_12 16) (equal? prec_i_o 16) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshlh_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshl_s64_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[else (error "Unable to extract  for vqrshl_s64")]
)

	]
	[(vmull_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0)); vmull_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmull_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1)); vmull_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmull_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1)); vmull_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmull_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1)); vmull_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmull_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0)); vmull_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmull_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0)); vmull_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmull_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[else (error "Unable to extract  for vmull_u8")]
)

	]
	[(vmovl_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 2) (equal? num_9 1)); vmovl_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmovl_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 2) (equal? num_9 1)); vmovl_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmovl_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 2) (equal? num_9 0)); vmovl_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmovl_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 2) (equal? num_9 0)); vmovl_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmovl_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 2) (equal? num_9 0)); vmovl_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmovl_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 2) (equal? num_9 1)); vmovl_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmovl_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9 ) num-consumed-0)]
		[else (error "Unable to extract  for vmovl_s8")]
)

	]
	[(vqrdmulhq_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)); vqrdmulhq_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v4 num-consumed-0 (- depth 1)))
 
 (values (vqrdmulhq_n_s32_dsl vc_0 vc_1 vc_2 expr-0 expr-1 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)); vqrdmulh_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v4 num-consumed-0 (- depth 1)))
 
 (values (vqrdmulhq_n_s32_dsl vc_0 vc_1 vc_2 expr-0 expr-1 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[else (error "Unable to extract  for vqrdmulhq_n_s32")]
)

	]
	[(vqrshlb_u8_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? size_i_o 8) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshlb_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshlb_u8_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshl_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshlb_u8_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshld_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshlb_u8_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshl_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshlb_u8_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_10 16) (equal? num_11 0) (equal? num_12 16) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshlh_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshlb_u8_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_10 32) (equal? num_11 0) (equal? num_12 32) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshls_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshlb_u8_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshl_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshlb_u8_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshlq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshlb_u8_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshlq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshlb_u8_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshl_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshlb_u8_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshlq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshlb_u8_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vqrshlq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vqrshlb_u8_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[else (error "Unable to extract  for vqrshlb_u8")]
)

	]
	[(vneg_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1)); vneg_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1)); vneg_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)); vneg_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1)); vnegq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1)); vneg_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)); vnegq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)); vnegd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1)); vnegq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1)); vnegq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[else (error "Unable to extract  for vneg_s16")]
)

	]
	[(vsqaddq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)); vsqaddq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)); vsqadd_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)); vsqaddq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)); vsqaddq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)); vuqadds_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)); vsqaddd_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)); vuqadd_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)); vuqaddq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)); vsqadds_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)); vuqaddb_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)); vuqaddq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)); vuqaddh_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)); vsqadd_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)); vsqaddq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)); vsqaddh_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)); vuqadd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)); vuqadd_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)); vuqaddq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)); vsqaddb_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)); vsqadd_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)); vuqaddd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1)); vsqadd_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)); vuqaddq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0)); vuqadd_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsqaddq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[else (error "Unable to extract  for vsqaddq_u32")]
)

	]
	[(vcle_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcle_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcleq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcle_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcleq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcleq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcleq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcle_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcled_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcle_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcleq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcle_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcleq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcled_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcle_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcle_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcle_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcleq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcleq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcle_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[else (error "Unable to extract  for vcle_s32")]
)

	]
	[(vmlal_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 1) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1)); vmlal_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlal_n_s32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 0) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0)); vmlal_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlal_n_s32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[else (error "Unable to extract  for vmlal_n_s32")]
)

	]
	[(vuzp1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 2)); vuzp1_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 2)); vuzp1q_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 2)); vuzp1q_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 2)); vuzp1q_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 2)); vuzp1_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 2)); vuzp1_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 2)); vuzp1q_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 2)); vuzp1q_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 2)); vuzp1_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 2)); vuzp1_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 2)); vuzp1_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 2)); vuzp1q_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 2)); vuzp1q_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 2)); vuzp1q_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[else (error "Unable to extract  for vuzp1_s32")]
)

	]
	[(vrshrn_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 64) (equal? num_20 2)); vrshrn_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vrshrn_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 64) (equal? num_20 2)); vrshrn_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vrshrn_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 32) (equal? num_20 2)); vrshrn_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vrshrn_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 32) (equal? num_20 2)); vrshrn_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vrshrn_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 16) (equal? num_20 2)); vrshrn_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vrshrn_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 16) (equal? num_20 2)); vrshrn_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vrshrn_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[else (error "Unable to extract  for vrshrn_n_s64")]
)

	]
	[(vhsubq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vhsubq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhsubq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vhsub_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhsubq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vhsubq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhsubq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vhsub_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhsubq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vhsubq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhsubq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vhsubq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhsubq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vhsubq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhsubq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vhsubq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhsubq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vhsub_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhsubq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vhsub_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhsubq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vhsub_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhsubq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vhsub_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhsubq_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[else (error "Unable to extract  for vhsubq_u32")]
)

	]
	[(vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 1) (equal? prec_o 64) (equal? num_10 2) (equal? num_11 1) (equal? num_12 1)); vqdmull_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vqdmull_n_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 ) num-consumed-1)]
		[else (error "Unable to extract  for vqdmull_n_s32")]
)

	]
	[(vshl_s64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vshl_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vshlq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vshlq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vshlq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vshl_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vshld_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vshl_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vshl_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vshlq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[else (error "Unable to extract  for vshl_s64")]
)

	]
	[(vshrn_n_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 2)); vshrn_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vshrn_n_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 2)); vshrn_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vshrn_n_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 2)); vshrn_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vshrn_n_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 2)); vshrn_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vshrn_n_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 2)); vshrn_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vshrn_n_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 2)); vshrn_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vshrn_n_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[else (error "Unable to extract  for vshrn_n_u64")]
)

	]
	[(vrhaddq_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vrhaddq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrhaddq_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vrhadd_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrhaddq_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vrhaddq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrhaddq_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vrhaddq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrhaddq_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vrhadd_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrhaddq_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vrhadd_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrhaddq_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vrhadd_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrhaddq_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vrhadd_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrhaddq_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vrhaddq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrhaddq_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vrhaddq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrhaddq_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vrhaddq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrhaddq_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vrhadd_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrhaddq_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[else (error "Unable to extract  for vrhaddq_s32")]
)

	]
	[(vhadd_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vhadd_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhadd_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vhaddq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhadd_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vhaddq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhadd_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vhadd_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhadd_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vhadd_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhadd_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vhadd_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhadd_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vhaddq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhadd_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vhadd_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhadd_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vhaddq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhadd_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vhadd_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhadd_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vhaddq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhadd_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vhaddq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vhadd_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[else (error "Unable to extract  for vhadd_u16")]
)

	]
	[(vdotq_u32_dsl v0 v1 v2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i 128) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vdotq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vdotq_u32_dsl expr-0 expr-1 expr-2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 ) num-consumed-2)]
		[(and  (equal? size_i 64) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vdot_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vdotq_u32_dsl expr-0 expr-1 expr-2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 ) num-consumed-2)]
		[(and  (equal? size_i 64) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vdot_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vdotq_u32_dsl expr-0 expr-1 expr-2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 ) num-consumed-2)]
		[(and  (equal? size_i 128) (equal? prec_o 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vdotq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vdotq_u32_dsl expr-0 expr-1 expr-2 size_i prec_o num_5 num_6 prec_i num_8 num_9 num_10 ) num-consumed-2)]
		[else (error "Unable to extract  for vdotq_u32")]
)

	]
	[(vqshld_s64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vqshld_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vqshl_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vqshlq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vqshlb_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vqshlq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vqshlh_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vqshlq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vqshlq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vqshl_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vqshls_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vqshl_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1)); vqshl_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_s64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[else (error "Unable to extract  for vqshld_s64")]
)

	]
	[(vrshr_n_u8_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrshr_n_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshr_n_u8_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrshr_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshr_n_u8_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrshrq_n_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshr_n_u8_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrshr_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshr_n_u8_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrshr_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshr_n_u8_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrshrq_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshr_n_u8_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrshrq_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshr_n_u8_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrshrd_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshr_n_u8_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrshrq_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshr_n_u8_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[else (error "Unable to extract  for vrshr_n_u8")]
)

	]
	[(vtst_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16)); vtst_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32)); vtst_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16)); vtst_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16)); vtstq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)); vtstd_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8)); vtst_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8)); vtstq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32)); vtstq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8)); vtst_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64)); vtstq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32)); vtstq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8)); vtstq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16)); vtstq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)); vtst_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)); vtst_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32)); vtst_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64)); vtstq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)); vtstd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vtst_u16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[else (error "Unable to extract  for vtst_u16")]
)

	]
	[(vaba_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vaba_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vaba_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vaba_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vaba_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vabaq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vaba_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vaba_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vaba_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vabaq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vaba_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vabaq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vaba_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vaba_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vaba_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vabaq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vaba_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vaba_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vaba_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vabaq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vaba_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vabaq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vaba_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vaba_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vaba_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-2)]
		[else (error "Unable to extract  for vaba_u16")]
)

	]
	[(vshl_u32_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vshl_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_u32_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vshlq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_u32_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vshlq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_u32_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vshld_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_u32_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vshlq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_u32_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vshl_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_u32_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vshlq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_u32_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vshl_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_u32_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vshl_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshl_u32_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[else (error "Unable to extract  for vshl_u32")]
)

	]
	[(vqdmullh_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1)); vqdmullh_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vqdmullh_s16_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1)); vqdmull_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vqdmullh_s16_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1)); vqdmull_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vqdmullh_s16_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1)); vqdmulls_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vqdmullh_s16_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[else (error "Unable to extract  for vqdmullh_s16")]
)

	]
	[(vqdmlalh_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 1)); vqdmlalh_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v3 num-consumed-1 (- depth 1)))
 
 (values (vqdmlalh_s16_dsl vc_0 expr-0 expr-1 expr-2 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 1)); vqdmlal_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v3 num-consumed-1 (- depth 1)))
 
 (values (vqdmlalh_s16_dsl vc_0 expr-0 expr-1 expr-2 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 1)); vqdmlal_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v3 num-consumed-1 (- depth 1)))
 
 (values (vqdmlalh_s16_dsl vc_0 expr-0 expr-1 expr-2 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) num-consumed-2)]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 1)); vqdmlals_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v3 num-consumed-1 (- depth 1)))
 
 (values (vqdmlalh_s16_dsl vc_0 expr-0 expr-1 expr-2 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) num-consumed-2)]
		[else (error "Unable to extract  for vqdmlalh_s16")]
)

	]
	[(vqdmulhq_n_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vqdmulhq_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqdmulhq_n_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vqdmulh_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqdmulhq_n_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[else (error "Unable to extract  for vqdmulhq_n_s32")]
)

	]
	[(vsraq_n_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vsraq_n_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vsraq_n_u8_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vsra_n_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vsraq_n_u8_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vsraq_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vsraq_n_u8_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vsraq_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vsraq_n_u8_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vsraq_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vsraq_n_u8_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vsra_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vsraq_n_u8_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vsra_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vsraq_n_u8_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[else (error "Unable to extract  for vsraq_n_u8")]
)

	]
	[(vcgez_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)); vcgez_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgez_s32_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)); vcgez_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgez_s32_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)); vcgez_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgez_s32_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)); vcgezq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgez_s32_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)); vcgezq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgez_s32_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)); vcgezq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgez_s32_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)); vcgezq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgez_s32_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)); vcgezd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgez_s32_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)); vcgez_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgez_s32_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[else (error "Unable to extract  for vcgez_s32")]
)

	]
	[(vaddw_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)); vaddw_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddw_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)); vaddw_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddw_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)); vaddw_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddw_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)); vaddw_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddw_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)); vaddw_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddw_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)); vaddw_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddw_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[else (error "Unable to extract  for vaddw_u32")]
)

	]
	[(vsubhn_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 8) (equal? num_8 -1) (equal? prec_i 16) (equal? num_10 2)); vsubhn_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubhn_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 -1) (equal? prec_i 32) (equal? num_10 2)); vsubhn_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubhn_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 8) (equal? num_8 -1) (equal? prec_i 16) (equal? num_10 2)); vsubhn_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubhn_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 -1) (equal? prec_i 32) (equal? num_10 2)); vsubhn_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubhn_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 32) (equal? num_8 -1) (equal? prec_i 64) (equal? num_10 2)); vsubhn_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubhn_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 32) (equal? num_8 -1) (equal? prec_i 64) (equal? num_10 2)); vsubhn_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubhn_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ) num-consumed-1)]
		[else (error "Unable to extract  for vsubhn_s16")]
)

	]
	[(vmax_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmax_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmax_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmax_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmaxq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmaxq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmaxq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmaxq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmax_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmax_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmax_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmaxq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmaxq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[else (error "Unable to extract  for vmax_s16")]
)

	]
	[(vqsub_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqsub_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqsubd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqsubq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqsub_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqsub_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqsubq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqsubs_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqsubh_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqsubd_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqsub_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqsubq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqsub_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqsubh_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqsubb_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqsubq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqsubb_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqsub_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqsubq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqsubs_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqsub_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqsubq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqsubq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqsubq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqsub_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqsub_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[else (error "Unable to extract  for vqsub_u64")]
)

	]
	[(vmlal_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)); vmlal_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlal_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)); vmlal_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlal_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)); vmlal_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlal_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)); vmlal_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlal_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)); vmlal_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlal_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)); vmlal_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlal_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[else (error "Unable to extract  for vmlal_s16")]
)

	]
	[(vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? num_9 1) (equal? prec_o 32) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 32) (equal? num_18 1)); vqdmlal_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v3 num-consumed-1 (- depth 1)))
 
 (values (vqdmlal_n_s16_dsl vc_0 expr-0 expr-1 expr-2 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) num-consumed-2)]
		[else (error "Unable to extract  for vqdmlal_n_s16")]
)

	]
	[(vabdl_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0)); vabdl_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdl_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1)); vabdl_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdl_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1)); vabdl_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdl_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1)); vabdl_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdl_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0)); vabdl_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdl_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0)); vabdl_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vabdl_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[else (error "Unable to extract  for vabdl_u8")]
)

	]
	[(vqdmlsl_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 1)); vqdmlsl_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v3 num-consumed-1 (- depth 1)))
 
 (values (vqdmlsl_s32_dsl vc_0 expr-0 expr-1 expr-2 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) num-consumed-2)]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 1)); vqdmlslh_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v3 num-consumed-1 (- depth 1)))
 
 (values (vqdmlsl_s32_dsl vc_0 expr-0 expr-1 expr-2 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) num-consumed-2)]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 1)); vqdmlsls_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v3 num-consumed-1 (- depth 1)))
 
 (values (vqdmlsl_s32_dsl vc_0 expr-0 expr-1 expr-2 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 1)); vqdmlsl_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v3 num-consumed-1 (- depth 1)))
 
 (values (vqdmlsl_s32_dsl vc_0 expr-0 expr-1 expr-2 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) num-consumed-2)]
		[else (error "Unable to extract  for vqdmlsl_s32")]
)

	]
	[(vsra_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vsra_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vsra_n_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vsraq_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vsra_n_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vsrad_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vsra_n_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vsraq_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vsra_n_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vsra_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vsra_n_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vsraq_n_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vsra_n_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vsra_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vsra_n_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vsra_n_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vsra_n_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vsraq_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vsra_n_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[else (error "Unable to extract  for vsra_n_s16")]
)

	]
	[(vzip2q_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 2) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 2) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32)); vzip2q_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip2q_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 2) (equal? num_13 64) (equal? num_14 64) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 32) (equal? num_19 64)); vzip2q_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip2q_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 4) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 4) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16)); vzip2q_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip2q_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 4) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 4) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16)); vzip2q_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip2q_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 2) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 2) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16)); vzip2_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip2q_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 2) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 2) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16)); vzip2_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip2q_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 2) (equal? num_13 64) (equal? num_14 64) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 32) (equal? num_19 64)); vzip2q_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip2q_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 8) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8)); vzip2q_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip2q_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 2) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 2) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32)); vzip2q_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip2q_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 4) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 4) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8)); vzip2_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip2q_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 4) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 4) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8)); vzip2_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip2q_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 8) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8)); vzip2q_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip2q_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32)); vzip2_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip2q_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32)); vzip2_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip2q_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 ) num-consumed-1)]
		[else (error "Unable to extract  for vzip2q_s32")]
)

	]
	[(vmlsl_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 0) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0)); vmlsl_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlsl_n_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 1) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1)); vmlsl_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlsl_n_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[else (error "Unable to extract  for vmlsl_n_u32")]
)

	]
	[(vtrn1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16)); vtrn1_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16)); vtrn1_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8)); vtrn1_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4)); vtrn1_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4)); vtrn1q_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4)); vtrn1q_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16)); vtrn1q_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8)); vtrn1q_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8)); vtrn1q_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4)); vtrn1_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 2) (equal? num_12 64) (equal? num_13 1) (equal? num_14 32)); vtrn1q_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8)); vtrn1_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 2) (equal? num_12 64) (equal? num_13 1) (equal? num_14 32)); vtrn1q_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16)); vtrn1q_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn1_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 ) num-consumed-1)]
		[else (error "Unable to extract  for vtrn1_s32")]
)

	]
	[(vqdmulh_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vqdmulh_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqdmulh_n_s16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vqdmulhq_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqdmulh_n_s16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[else (error "Unable to extract  for vqdmulh_n_s16")]
)

	]
	[(vqabs_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)); vqabs_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)); vqabsd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)); vqabsb_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)); vqabsq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)); vqabs_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)); vqabs_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)); vqabss_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)); vqabsq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)); vqabs_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)); vqabsq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)); vqabsq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)); vqabsh_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[else (error "Unable to extract  for vqabs_s8")]
)

	]
	[(vcge_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcge_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcge_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcgeq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcgeq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcgeq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcge_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcgeq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcgeq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcgeq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcge_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcge_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcge_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcged_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcged_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcge_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcge_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcgeq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcgeq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcge_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[else (error "Unable to extract  for vcge_s32")]
)

	]
	[(vabs_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1)); vabs_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1)); vabsq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1)); vabs_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1)); vabs_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)); vabs_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)); vabsq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1)); vabsq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1)); vabsq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1)); vabsd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vabs_s8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[else (error "Unable to extract  for vabs_s8")]
)

	]
	[(vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 1) (equal? prec_o 32) (equal? num_10 2) (equal? num_11 1) (equal? num_12 1)); vqdmull_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vqdmull_n_s16_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 ) num-consumed-1)]
		[else (error "Unable to extract  for vqdmull_n_s16")]
)

	]
	[(vqshrnh_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(cond 
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 2)); vqshrnh_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrnh_n_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 2)); vqshrns_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrnh_n_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 2)); vqshrn_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrnh_n_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 2)); vqshrnd_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrnh_n_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 2)); vqshrn_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrnh_n_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 2)); vqshrn_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqshrnh_n_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11 ) num-consumed-1)]
		[else (error "Unable to extract  for vqshrnh_n_u16")]
)

	]
	[(vpmin_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)); vpmin_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmin_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)); vpminq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmin_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)); vpminq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmin_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)); vpminq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmin_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)); vpmin_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmin_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)); vpmin_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmin_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)); vpminq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmin_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)); vpminq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmin_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)); vpmin_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmin_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)); vpmin_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmin_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)); vpminq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmin_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)); vpmin_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmin_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[else (error "Unable to extract  for vpmin_s32")]
)

	]
	[(vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? num_9 1) (equal? prec_o 64) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 64) (equal? num_18 1)); vqdmlsl_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v3 num-consumed-1 (- depth 1)))
 
 (values (vqdmlsl_n_s32_dsl vc_0 expr-0 expr-1 expr-2 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) num-consumed-2)]
		[else (error "Unable to extract  for vqdmlsl_n_s32")]
)

	]
	[(vqshld_u64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vqshld_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_u64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vqshlq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_u64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vqshlq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_u64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vqshl_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_u64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vqshlh_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_u64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vqshls_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_u64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vqshlb_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_u64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vqshl_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_u64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vqshl_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_u64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vqshl_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_u64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vqshlq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_u64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1)); vqshlq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshld_u64_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[else (error "Unable to extract  for vqshld_u64")]
)

	]
	[(vcgtq_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcgtq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcgtq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcgtq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcgt_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcgt_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcgtq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcgtd_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcgtq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcgtq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcgt_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcgt_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcgtq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcgt_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcgt_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcgt_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcgtq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcgt_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcgtd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcgtq_s8_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[else (error "Unable to extract  for vcgtq_s8")]
)

	]
	[(vadd_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1)); vadd_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1)); vadd_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1)); vaddq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1)); vaddq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1)); vaddq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1)); vaddq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)); vadd_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1)); vaddq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1)); vadd_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1)); vaddq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)); vadd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1)); vaddq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1)); vadd_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1)); vadd_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)); vaddd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1)); vadd_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1)); vaddd_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1)); vaddq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vadd_s8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 ) num-consumed-1)]
		[else (error "Unable to extract  for vadd_s8")]
)

	]
	[(vrsubhn_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2)); vrsubhn_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrsubhn_s16_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2)); vrsubhn_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrsubhn_s16_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2)); vrsubhn_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrsubhn_s16_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2)); vrsubhn_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrsubhn_s16_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2)); vrsubhn_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrsubhn_s16_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2)); vrsubhn_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vrsubhn_s16_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) num-consumed-1)]
		[else (error "Unable to extract  for vrsubhn_s16")]
)

	]
	[(vqshlb_n_s8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqshlb_n_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqshluq_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 0)); vqshlb_n_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqshlh_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqshls_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqshluq_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 0)); vqshls_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqshluq_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqshlu_n_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqshlud_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqshlu_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqshlu_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqshlub_n_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqshlus_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqshluh_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqshlu_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqshluq_n_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 0)); vqshlh_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqshlb_n_s8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[else (error "Unable to extract  for vqshlb_n_s8")]
)

	]
	[(vrshlq_u16_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshlq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_u16_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshld_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_u16_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshlq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_u16_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshl_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_u16_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshlq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_u16_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshl_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_u16_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshl_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_u16_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshl_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_u16_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshlq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_u16_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[else (error "Unable to extract  for vrshlq_u16")]
)

	]
	[(vmls_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vmls_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_n_s32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vmlsq_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_n_s32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vmlsq_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_n_s32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vmls_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_n_s32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[else (error "Unable to extract  for vmls_n_s32")]
)

	]
	[(vraddhn_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2)); vraddhn_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vraddhn_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2)); vraddhn_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vraddhn_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2)); vraddhn_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vraddhn_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2)); vraddhn_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vraddhn_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2)); vraddhn_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vraddhn_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2)); vraddhn_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vraddhn_s32_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12 ) num-consumed-1)]
		[else (error "Unable to extract  for vraddhn_s32")]
)

	]
	[(vcltq_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcltq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vclt_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcltq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vclt_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vclt_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcltq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcltd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcltq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vclt_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vclt_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcltq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcltd_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcltq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vcltq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vclt_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vclt_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0)); vcltq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vclt_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vcltq_s32_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[else (error "Unable to extract  for vcltq_s32")]
)

	]
	[(vrshrq_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrshrq_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshrq_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrshrd_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshrq_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrshrq_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshrq_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrshrq_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshrq_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrshr_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshrq_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrshr_n_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshrq_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrshrq_n_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshrq_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrshr_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshrq_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrshr_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v6 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v7 num-consumed-0 (- depth 1)))
 
 (values (vrshrq_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 expr-0 expr-1 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-1)]
		[else (error "Unable to extract  for vrshrq_n_s64")]
)

	]
	[(vmlal_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 1) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1)); vmlal_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlal_n_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 0) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0)); vmlal_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlal_n_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[else (error "Unable to extract  for vmlal_n_s16")]
)

	]
	[(vrshlq_s32_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshlq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_s32_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshld_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_s32_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshl_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_s32_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshlq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_s32_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshl_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_s32_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshlq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_s32_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshlq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_s32_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshl_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_s32_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1)); vrshl_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v8 num-consumed-0 (- depth 1)))
 
 (values (vrshlq_s32_dsl expr-0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 expr-1 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 ) num-consumed-1)]
		[else (error "Unable to extract  for vrshlq_s32")]
)

	]
	[(vminq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vminq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vminq_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vminq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vminq_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmin_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vminq_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmin_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vminq_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmin_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vminq_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vminq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vminq_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmin_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vminq_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vminq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vminq_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vminq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vminq_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmin_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vminq_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmin_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vminq_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vminq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vminq_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[else (error "Unable to extract  for vminq_u8")]
)

	]
	[(vuzp2_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 8)); vuzp2_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp2_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 1) (equal? num_9 4)); vuzp2_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp2_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 16)); vuzp2_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp2_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 16)); vuzp2q_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp2_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 1) (equal? num_9 4)); vuzp2q_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp2_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 1) (equal? num_9 4)); vuzp2_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp2_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 8)); vuzp2_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp2_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 1) (equal? num_9 4)); vuzp2q_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp2_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 16)); vuzp2_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp2_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 16)); vuzp2q_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp2_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 8)); vuzp2q_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp2_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 64) (equal? num_8 1) (equal? num_9 32)); vuzp2q_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp2_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 8)); vuzp2q_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp2_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 64) (equal? num_8 1) (equal? num_9 32)); vuzp2q_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vuzp2_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[else (error "Unable to extract  for vuzp2_u16")]
)

	]
	[(vceqz_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1)); vceqz_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1)); vceqz_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1)); vceqzd_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1)); vceqzq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1)); vceqzq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1)); vceqz_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1)); vceqzq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1)); vceqzq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1)); vceqzq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1)); vceqz_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1)); vceqz_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1)); vceqz_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1)); vceqz_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1)); vceqzq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1)); vceqzq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1)); vceqzq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1)); vceqz_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1)); vceqzd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vceqz_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 ) num-consumed-0)]
		[else (error "Unable to extract  for vceqz_s64")]
)

	]
	[(vmla_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vmla_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmla_n_s32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vmlaq_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmla_n_s32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vmla_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmla_n_s32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vmlaq_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmla_n_s32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[else (error "Unable to extract  for vmla_n_s32")]
)

	]
	[(vmla_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmla_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmla_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmla_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmla_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmla_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmla_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmlaq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmla_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmla_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmla_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmlaq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmla_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmla_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmla_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmla_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmla_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmlaq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmla_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmlaq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmla_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmlaq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmla_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmlaq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmla_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[else (error "Unable to extract  for vmla_u16")]
)

	]
	[(vshll_n_u8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 8) (equal? num_9 0) (equal? prec_o 16) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 0)); vshll_n_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshll_n_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? num_9 0) (equal? prec_o 32) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1)); vshll_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshll_n_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? num_9 0) (equal? prec_o 64) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 0)); vshll_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshll_n_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? num_9 0) (equal? prec_o 64) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1)); vshll_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshll_n_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 8) (equal? num_9 0) (equal? prec_o 16) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1)); vshll_n_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshll_n_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? num_9 0) (equal? prec_o 32) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 0)); vshll_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vshll_n_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 ) num-consumed-1)]
		[else (error "Unable to extract  for vshll_n_u8")]
)

	]
	[(vtrn2_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16)); vtrn2_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn2_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4)); vtrn2_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn2_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16)); vtrn2q_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn2_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8)); vtrn2_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn2_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 32) (equal? num_13 2) (equal? num_14 64) (equal? num_15 1) (equal? num_16 32)); vtrn2q_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn2_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4)); vtrn2q_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn2_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 32) (equal? num_13 2) (equal? num_14 64) (equal? num_15 1) (equal? num_16 32)); vtrn2q_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn2_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8)); vtrn2q_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn2_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8)); vtrn2_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn2_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8)); vtrn2q_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn2_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4)); vtrn2q_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn2_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16)); vtrn2q_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn2_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4)); vtrn2_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn2_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16)); vtrn2_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vtrn2_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[else (error "Unable to extract  for vtrn2_s32")]
)

	]
	[(vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? num_9 1) (equal? prec_o 64) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 64) (equal? num_18 1)); vqdmlal_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v3 num-consumed-1 (- depth 1)))
 
 (values (vqdmlal_n_s32_dsl vc_0 expr-0 expr-1 expr-2 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 ) num-consumed-2)]
		[else (error "Unable to extract  for vqdmlal_n_s32")]
)

	]
	[(vmull_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? num_7 0) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0)); vmull_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmull_n_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? num_7 1) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 0) (equal? num_11 1)); vmull_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmull_n_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 ) num-consumed-1)]
		[else (error "Unable to extract  for vmull_n_u16")]
)

	]
	[(vmulq_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmulq_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmulq_n_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmul_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmulq_n_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmul_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmulq_n_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmulq_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmulq_n_u32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[else (error "Unable to extract  for vmulq_n_u32")]
)

	]
	[(vaddhn_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 32) (equal? num_8 -1) (equal? prec_i 64) (equal? num_10 2)); vaddhn_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddhn_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 32) (equal? num_8 -1) (equal? prec_i 64) (equal? num_10 2)); vaddhn_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddhn_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 8) (equal? num_8 -1) (equal? prec_i 16) (equal? num_10 2)); vaddhn_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddhn_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 -1) (equal? prec_i 32) (equal? num_10 2)); vaddhn_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddhn_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 -1) (equal? prec_i 32) (equal? num_10 2)); vaddhn_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddhn_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 8) (equal? num_8 -1) (equal? prec_i 16) (equal? num_10 2)); vaddhn_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddhn_s64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 ) num-consumed-1)]
		[else (error "Unable to extract  for vaddhn_s64")]
)

	]
	[(vpadal_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 0) (equal? num_16 2)); vpadal_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpadal_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0) (equal? num_16 2)); vpadalq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpadal_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4) (equal? num_15 1) (equal? num_16 2)); vpadal_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpadal_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16) (equal? num_15 1) (equal? num_16 2)); vpadal_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpadal_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 1) (equal? num_16 2)); vpadal_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpadal_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4) (equal? num_15 0) (equal? num_16 2)); vpadalq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpadal_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 1) (equal? num_16 2)); vpadalq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpadal_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0) (equal? num_16 2)); vpadal_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpadal_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 0) (equal? num_16 2)); vpadalq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpadal_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4) (equal? num_15 0) (equal? num_16 2)); vpadal_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpadal_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4) (equal? num_15 1) (equal? num_16 2)); vpadalq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpadal_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16) (equal? num_15 1) (equal? num_16 2)); vpadalq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpadal_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-1)]
		[else (error "Unable to extract  for vpadal_u16")]
)

	]
	[(vqadd_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqadd_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqaddb_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqaddb_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqaddq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqadd_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqadds_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqaddd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqadd_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqaddq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqadd_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqaddd_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqadd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqaddq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqaddq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqaddh_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqaddq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqadds_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqaddq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqaddq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqadd_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqaddh_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqadd_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0)); vqaddq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1)); vqadd_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vqadd_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 ) num-consumed-1)]
		[else (error "Unable to extract  for vqadd_s16")]
)

	]
	[(vceqq_u8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8)); vceqq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8)); vceqq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32)); vceqq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8)); vceq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16)); vceqq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32)); vceq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64)); vceqq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)); vceqd_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16)); vceq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)); vceq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8)); vceq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32)); vceq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)); vceq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32)); vceqq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64)); vceqd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64)); vceqq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16)); vceqq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16)); vceq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vceqq_u8_dsl expr-0 vc_1 vc_2 expr-1 size_i_o num_5 num_6 num_7 prec_i_o ) num-consumed-1)]
		[else (error "Unable to extract  for vceqq_u8")]
)

	]
	[(vzip1q_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 64) (equal? num_12 1) (equal? num_13 32)); vzip1q_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip1q_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4)); vzip1_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip1q_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8)); vzip1q_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip1q_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8)); vzip1_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip1q_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4)); vzip1_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip1q_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16)); vzip1q_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip1q_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16)); vzip1_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip1q_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4)); vzip1q_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip1q_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 64) (equal? num_12 1) (equal? num_13 32)); vzip1q_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip1q_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8)); vzip1_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip1q_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16)); vzip1q_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip1q_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8)); vzip1q_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip1q_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16)); vzip1_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip1q_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4)); vzip1q_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vzip1q_u64_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[else (error "Unable to extract  for vzip1q_u64")]
)

	]
	[(vmlaq_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vmlaq_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlaq_n_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vmla_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlaq_n_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vmlaq_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlaq_n_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vmla_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlaq_n_s16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[else (error "Unable to extract  for vmlaq_n_s16")]
)

	]
	[(vqrdmulhq_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)); vqrdmulhq_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v4 num-consumed-0 (- depth 1)))
 
 (values (vqrdmulhq_n_s16_dsl vc_0 vc_1 vc_2 expr-0 expr-1 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1)); vqrdmulh_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v4 num-consumed-0 (- depth 1)))
 
 (values (vqrdmulhq_n_s16_dsl vc_0 vc_1 vc_2 expr-0 expr-1 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[else (error "Unable to extract  for vqrdmulhq_n_s16")]
)

	]
	[(vqrshrn_n_s16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 16) (equal? num_20 2)); vqrshrn_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrn_n_s16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 64) (equal? num_20 2)); vqrshrn_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrn_n_s16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 32) (equal? num_20 2)); vqrshrun_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrn_n_s16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 16) (equal? num_20 2)); vqrshrunh_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrn_n_s16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 16) (equal? num_20 2)); vqrshrun_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrn_n_s16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 16) (equal? num_20 2)); vqrshrnh_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrn_n_s16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 32) (equal? num_20 2)); vqrshruns_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrn_n_s16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 32) (equal? num_20 2)); vqrshrn_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrn_n_s16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 64) (equal? num_20 2)); vqrshrun_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrn_n_s16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 64) (equal? num_20 2)); vqrshrnd_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrn_n_s16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 32) (equal? num_20 2)); vqrshrns_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrn_n_s16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 64) (equal? num_20 2)); vqrshrund_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrn_n_s16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[else (error "Unable to extract  for vqrshrn_n_s16")]
)

	]
	[(vshr_n_s64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vshr_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_s64_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vshr_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_s64_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vshrq_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_s64_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vshrd_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_s64_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vshrq_n_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_s64_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vshrq_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_s64_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vshr_n_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_s64_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vshrq_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_s64_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1)); vshr_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_s64_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[else (error "Unable to extract  for vshr_n_s64")]
)

	]
	[(vrsra_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrsra_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrsra_n_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrsraq_n_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrsra_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrsraq_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrsraq_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrsrad_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrsra_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1)); vrsraq_n_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[else (error "Unable to extract  for vrsra_n_s64")]
)

	]
	[(vmovn_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 2)); vmovn_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmovn_s64_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 2)); vmovn_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmovn_s64_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 2)); vmovn_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmovn_s64_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 2)); vmovn_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmovn_s64_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 2)); vmovn_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmovn_s64_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 2)); vmovn_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmovn_s64_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[else (error "Unable to extract  for vmovn_s64")]
)

	]
	[(vclez_s16_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)); vclez_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vclez_s16_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)); vclezq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vclez_s16_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)); vclezq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vclez_s16_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)); vclezq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vclez_s16_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)); vclez_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vclez_s16_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)); vclezq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vclez_s16_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)); vclezd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vclez_s16_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)); vclez_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vclez_s16_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)); vclez_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vclez_s16_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[else (error "Unable to extract  for vclez_s16")]
)

	]
	[(vmlsl_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 0) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0)); vmlsl_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlsl_n_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 1) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1)); vmlsl_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlsl_n_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[else (error "Unable to extract  for vmlsl_n_u16")]
)

	]
	[(vaddl_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vaddl_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddl_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vaddl_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddl_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vaddl_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddl_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vaddl_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddl_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vaddl_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddl_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vaddl_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vaddl_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[else (error "Unable to extract  for vaddl_s16")]
)

	]
	[(vpmax_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)); vpmax_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)); vpmax_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)); vpmax_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)); vpmaxq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)); vpmaxq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)); vpmax_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)); vpmax_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)); vpmax_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)); vpmaxq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)); vpmaxq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)); vpmaxq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)); vpmaxq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vpmax_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16 ) num-consumed-1)]
		[else (error "Unable to extract  for vpmax_s16")]
)

	]
	[(vshr_n_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vshr_n_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vshrq_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vsra_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr vc_0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vshr_n_u8_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vsrad_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr vc_0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vshr_n_u8_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vshrd_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vshr_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vshr_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vshrq_n_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vshrq_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vshrq_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vshr_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vshr_n_u8_dsl vc_0 expr-0 expr-1 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[else (error "Unable to extract  for vshr_n_u8")]
)

	]
	[(vmls_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vmls_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_n_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vmlsq_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_n_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vmls_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_n_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0)); vmlsq_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_n_u16_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[else (error "Unable to extract  for vmls_n_u16")]
)

	]
	[(vmulq_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmulq_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmulq_n_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmul_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmulq_n_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmul_n_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmulq_n_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmulq_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmulq_n_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[else (error "Unable to extract  for vmulq_n_s16")]
)

	]
	[(vmlsl_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)); vmlsl_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlsl_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)); vmlsl_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlsl_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)); vmlsl_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlsl_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)); vmlsl_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlsl_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1)); vmlsl_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlsl_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0)); vmlsl_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmlsl_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 ) num-consumed-2)]
		[else (error "Unable to extract  for vmlsl_u32")]
)

	]
	[(vqneg_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)); vqneg_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)); vqnegs_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)); vqneg_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)); vqnegd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)); vqnegq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)); vqnegb_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1)); vqnegh_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)); vqnegq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1)); vqnegq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)); vqnegq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1)); vqneg_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1)); vqneg_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqneg_s16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[else (error "Unable to extract  for vqneg_s16")]
)

	]
	[(vcgtzd_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)); vcgtzd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgtzd_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)); vcgtz_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgtzd_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)); vcgtzq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgtzd_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)); vcgtz_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgtzd_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1)); vcgtzq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgtzd_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)); vcgtz_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgtzd_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1)); vcgtzq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgtzd_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1)); vcgtz_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgtzd_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1)); vcgtzq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
 
 (values (vcgtzd_s64_dsl vc_0 vc_1 vc_2 expr-0 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 ) num-consumed-0)]
		[else (error "Unable to extract  for vcgtzd_s64")]
)

	]
	[(vmls_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmls_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmlsq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmls_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmlsq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmls_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmlsq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmlsq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmlsq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmls_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmls_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmlsq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0)); vmls_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (vmls_u32_dsl expr-0 expr-1 expr-2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 ) num-consumed-2)]
		[else (error "Unable to extract  for vmls_u32")]
)

	]
	[(vmull_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? num_7 1) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 0) (equal? num_11 1)); vmull_n_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmull_n_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? num_7 0) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0)); vmull_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmull_n_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11 ) num-consumed-1)]
		[else (error "Unable to extract  for vmull_n_s32")]
)

	]
	[(vrsra_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrsra_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrsra_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrsraq_n_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrsrad_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrsraq_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrsraq_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[(and  (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrsraq_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrsra_n_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0)); vrsra_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (arm:extract-expr v7 num-consumed-1 (- depth 1)))
 
 (values (vrsra_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 expr-2 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 ) num-consumed-2)]
		[else (error "Unable to extract  for vrsra_n_u16")]
)

	]
	[(vsubl_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vsubl_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubl_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vsubl_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubl_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vsubl_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubl_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vsubl_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubl_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1)); vsubl_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubl_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0)); vsubl_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubl_s32_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[else (error "Unable to extract  for vsubl_s32")]
)

	]
	[(vqmovn_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 32) (equal? num_9 2)); vqmovn_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2)); vqmovn_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 16) (equal? num_9 2)); vqmovnh_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 32) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2)); vqmovnd_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2)); vqmovun_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_o 8) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2)); vqmovnh_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 32) (equal? num_9 2)); vqmovns_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2)); vqmovun_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 16) (equal? num_9 2)); vqmovn_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2)); vqmovuns_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2)); vqmovun_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2)); vqmovn_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2)); vqmovund_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2)); vqmovunh_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2)); vqmovn_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 64) (equal? num_9 2)); vqmovn_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 16) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2)); vqmovns_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 64) (equal? num_9 2)); vqmovnd_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vqmovn_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9 ) num-consumed-0)]
		[else (error "Unable to extract  for vqmovn_u32")]
)

	]
	[(vmul_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmul_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmul_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmul_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmul_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmul_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmul_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmulq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmul_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmul_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmul_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmulq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmul_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmul_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmul_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmulq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmul_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmulq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmul_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmulq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmul_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmulq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmul_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0)); vmul_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vmul_s16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 ) num-consumed-1)]
		[else (error "Unable to extract  for vmul_s16")]
)

	]
	[(vqrshrnh_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(cond 
		[(and  (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 16) (equal? num_20 2)); vqrshrnh_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrnh_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 32) (equal? num_20 2)); vqrshrns_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrnh_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 64) (equal? num_20 2)); vqrshrnd_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrnh_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 32) (equal? num_20 2)); vqrshrn_n_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrnh_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 16) (equal? num_20 2)); vqrshrn_n_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrnh_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 64) (equal? num_20 2)); vqrshrn_n_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v5 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v6 num-consumed-0 (- depth 1)))
 
 (values (vqrshrnh_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 expr-0 expr-1 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20 ) num-consumed-1)]
		[else (error "Unable to extract  for vqrshrnh_n_u16")]
)

	]
	[(vpaddq_u32_dsl vc_0 v1 v2 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i 128) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 64) (equal? num_7 32) (equal? num_8 -1) (equal? num_9 32) (equal? num_10 16) (equal? num_11 32)); vpaddq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vpaddq_u32_dsl vc_0 expr-0 expr-1 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i 128) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 32) (equal? num_7 16) (equal? num_8 -1) (equal? num_9 16) (equal? num_10 8) (equal? num_11 16)); vpaddq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vpaddq_u32_dsl vc_0 expr-0 expr-1 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i 128) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 128) (equal? num_7 64) (equal? num_8 -1) (equal? num_9 64) (equal? num_10 32) (equal? num_11 64)); vpaddq_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vpaddq_u32_dsl vc_0 expr-0 expr-1 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i 128) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 32) (equal? num_7 16) (equal? num_8 -1) (equal? num_9 16) (equal? num_10 8) (equal? num_11 16)); vpaddq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vpaddq_u32_dsl vc_0 expr-0 expr-1 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i 128) (equal? prec_i_o 64) (equal? num_5 0) (equal? num_6 128) (equal? num_7 64) (equal? num_8 -1) (equal? num_9 64) (equal? num_10 32) (equal? num_11 64)); vpaddq_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vpaddq_u32_dsl vc_0 expr-0 expr-1 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i 128) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 64) (equal? num_7 32) (equal? num_8 -1) (equal? num_9 32) (equal? num_10 16) (equal? num_11 32)); vpaddq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vpaddq_u32_dsl vc_0 expr-0 expr-1 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i 64) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 32) (equal? num_7 16) (equal? num_8 -1) (equal? num_9 16) (equal? num_10 8) (equal? num_11 16)); vpadd_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vpaddq_u32_dsl vc_0 expr-0 expr-1 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i 64) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 64) (equal? num_7 32) (equal? num_8 -1) (equal? num_9 32) (equal? num_10 16) (equal? num_11 32)); vpadd_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vpaddq_u32_dsl vc_0 expr-0 expr-1 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i 128) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 8) (equal? num_10 4) (equal? num_11 8)); vpaddq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vpaddq_u32_dsl vc_0 expr-0 expr-1 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i 64) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 8) (equal? num_10 4) (equal? num_11 8)); vpadd_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vpaddq_u32_dsl vc_0 expr-0 expr-1 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i 64) (equal? prec_i_o 32) (equal? num_5 0) (equal? num_6 64) (equal? num_7 32) (equal? num_8 -1) (equal? num_9 32) (equal? num_10 16) (equal? num_11 32)); vpadd_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vpaddq_u32_dsl vc_0 expr-0 expr-1 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i 64) (equal? prec_i_o 16) (equal? num_5 0) (equal? num_6 32) (equal? num_7 16) (equal? num_8 -1) (equal? num_9 16) (equal? num_10 8) (equal? num_11 16)); vpadd_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vpaddq_u32_dsl vc_0 expr-0 expr-1 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i 64) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 8) (equal? num_10 4) (equal? num_11 8)); vpadd_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vpaddq_u32_dsl vc_0 expr-0 expr-1 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i 128) (equal? prec_i_o 8) (equal? num_5 0) (equal? num_6 16) (equal? num_7 8) (equal? num_8 -1) (equal? num_9 8) (equal? num_10 4) (equal? num_11 8)); vpaddq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v2 num-consumed-0 (- depth 1)))
 
 (values (vpaddq_u32_dsl vc_0 expr-0 expr-1 size_i prec_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 ) num-consumed-1)]
		[else (error "Unable to extract  for vpaddq_u32")]
)

	]
	[(vmvn_u8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)); vmvn_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmvn_u8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)); vmvn_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmvn_u8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)); vmvnq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmvn_u8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)); vmvnq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmvn_u8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)); vmvnq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmvn_u8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)); vmvnq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmvn_u8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)); vmvn_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmvn_u8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)); vmvnq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmvn_u8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)); vmvn_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmvn_u8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)); vmvn_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmvn_u8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8)); vmvn_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmvn_u8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8)); vmvnq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vmvn_u8_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o ) num-consumed-0)]
		[else (error "Unable to extract  for vmvn_u8")]
)

	]
	[(vsubw_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)); vsubw_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubw_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)); vsubw_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubw_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)); vsubw_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubw_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2)); vsubw_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubw_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)); vsubw_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubw_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2)); vsubw_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vsubw_u8_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 ) num-consumed-1)]
		[else (error "Unable to extract  for vsubw_u8")]
)

	]
	[(vget_low_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0)); vget_low_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vget_low_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0)); vget_low_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vget_low_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0)); vget_low_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vget_low_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0)); vget_low_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vget_low_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0)); vget_low_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vget_low_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0)); vget_low_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vget_low_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0)); vget_low_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vget_low_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0)); vget_low_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vget_low_u32_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 ) num-consumed-0)]
		[else (error "Unable to extract  for vget_low_u32")]
)

	]
	[(vcombine_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 64) (equal? prec_o 128) (equal? num_8 0)); vcombine_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vcombine_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 64) (equal? prec_o 128) (equal? num_8 0)); vcombine_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vcombine_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 64) (equal? prec_o 128) (equal? num_8 0)); vcombine_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vcombine_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 64) (equal? prec_o 128) (equal? num_8 0)); vcombine_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vcombine_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 64) (equal? prec_o 128) (equal? num_8 0)); vcombine_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vcombine_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 64) (equal? prec_o 128) (equal? num_8 0)); vcombine_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vcombine_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 64) (equal? prec_o 128) (equal? num_8 0)); vcombine_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vcombine_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 64) (equal? prec_o 128) (equal? num_8 0)); vcombine_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (vcombine_u16_dsl expr-0 expr-1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 ) num-consumed-1)]
		[else (error "Unable to extract  for vcombine_u16")]
)

	]
	[(vget_high_u16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64)); vget_high_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vget_high_u16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64)); vget_high_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vget_high_u16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64)); vget_high_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vget_high_u16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64)); vget_high_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vget_high_u16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64)); vget_high_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vget_high_u16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64)); vget_high_s64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vget_high_u16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64)); vget_high_u64
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vget_high_u16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64)); vget_high_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v0 num-consumed (- depth 1)))
 
 (values (vget_high_u16_dsl expr-0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 ) num-consumed-0)]
		[else (error "Unable to extract  for vget_high_u16")]
)

	]
	[(vpaddl_s16_dsl vc_0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 1) (equal? num_16 2)); vpaddl_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
 
 (values (vpaddl_s16_dsl vc_0 expr-0 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4) (equal? num_15 0) (equal? num_16 2)); vpaddlq_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
 
 (values (vpaddl_s16_dsl vc_0 expr-0 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 0) (equal? num_16 2)); vpaddl_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
 
 (values (vpaddl_s16_dsl vc_0 expr-0 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16) (equal? num_15 1) (equal? num_16 2)); vpaddl_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
 
 (values (vpaddl_s16_dsl vc_0 expr-0 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16) (equal? num_15 1) (equal? num_16 2)); vpaddlq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
 
 (values (vpaddl_s16_dsl vc_0 expr-0 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0) (equal? num_16 2)); vpaddlq_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
 
 (values (vpaddl_s16_dsl vc_0 expr-0 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4) (equal? num_15 1) (equal? num_16 2)); vpaddlq_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
 
 (values (vpaddl_s16_dsl vc_0 expr-0 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 0) (equal? num_16 2)); vpaddlq_u16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
 
 (values (vpaddl_s16_dsl vc_0 expr-0 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4) (equal? num_15 1) (equal? num_16 2)); vpaddl_s8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
 
 (values (vpaddl_s16_dsl vc_0 expr-0 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-0)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 1) (equal? num_16 2)); vpaddlq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
 
 (values (vpaddl_s16_dsl vc_0 expr-0 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4) (equal? num_15 0) (equal? num_16 2)); vpaddl_u8
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
 
 (values (vpaddl_s16_dsl vc_0 expr-0 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-0)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0) (equal? num_16 2)); vpaddl_u32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v1 num-consumed (- depth 1)))
 
 (values (vpaddl_s16_dsl vc_0 expr-0 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 ) num-consumed-0)]
		[else (error "Unable to extract  for vpaddl_s16")]
)

	]
	[(vqrdmulhs_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqrdmulhs_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v4 num-consumed-0 (- depth 1)))
 
 (values (vqrdmulhs_s32_dsl vc_0 vc_1 vc_2 expr-0 expr-1 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqrdmulhq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v4 num-consumed-0 (- depth 1)))
 
 (values (vqrdmulhs_s32_dsl vc_0 vc_1 vc_2 expr-0 expr-1 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqrdmulhh_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v4 num-consumed-0 (- depth 1)))
 
 (values (vqrdmulhs_s32_dsl vc_0 vc_1 vc_2 expr-0 expr-1 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqrdmulh_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v4 num-consumed-0 (- depth 1)))
 
 (values (vqrdmulhs_s32_dsl vc_0 vc_1 vc_2 expr-0 expr-1 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqrdmulh_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v4 num-consumed-0 (- depth 1)))
 
 (values (vqrdmulhs_s32_dsl vc_0 vc_1 vc_2 expr-0 expr-1 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1)); vqrdmulhq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v3 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v4 num-consumed-0 (- depth 1)))
 
 (values (vqrdmulhs_s32_dsl vc_0 vc_1 vc_2 expr-0 expr-1 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 ) num-consumed-1)]
		[else (error "Unable to extract  for vqrdmulhs_s32")]
)

	]
	[(vqdmulh_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vqdmulh_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqdmulh_s16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vqdmulh_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqdmulh_s16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vqdmulhq_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqdmulh_s16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vqdmulhs_s32
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqdmulh_s16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vqdmulhh_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqdmulh_s16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1)); vqdmulhq_s16
 
 (define-values (expr-0 num-consumed-0) (arm:extract-expr v2 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (arm:extract-expr v3 num-consumed-0 (- depth 1)))
 
 (values (vqdmulh_s16_dsl vc_0 vc_1 expr-0 expr-1 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 ) num-consumed-1)]
		[else (error "Unable to extract  for vqdmulh_s16")]
)

	]
 )
]
) 
)
;; ================================================================================

