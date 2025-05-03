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
	[(concat_v16int16_dsl v0 v1 size_i size_o prec_i prec_o)
		(cond 
		[(and  (equal? size_i 16) (equal? size_o 32) (equal? prec_i 16) (equal? prec_o 16)); concat_v16int16
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (concat_v16int16_dsl expr-0 expr-1 size_i size_o prec_i prec_o ) num-consumed-1)]
		[(and  (equal? size_i 32) (equal? size_o 64) (equal? prec_i 8) (equal? prec_o 8)); concat_v32int8
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (concat_v16int16_dsl expr-0 expr-1 size_i size_o prec_i prec_o ) num-consumed-1)]
		[else (error "Unable to extract  for concat_v16int16")]
)

	]
	[(ups_to_v16acc32_dsl v0)
		(cond 
		[(and ); ups_to_v16acc32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
 
 (values (ups_to_v16acc32_dsl expr-0 ) num-consumed-0)]
		[else (error "Unable to extract  for ups_to_v16acc32")]
)

	]
	[(ups_to_v32acc32_dsl v0)
		(cond 
		[(and ); ups_to_v32acc32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
 
 (values (ups_to_v32acc32_dsl expr-0 ) num-consumed-0)]
		[else (error "Unable to extract  for ups_to_v32acc32")]
)

	]
	[(srs_to_v16int16_dsl v0)
		(cond 
		[(and ); srs_to_v16int16
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
 
 (values (srs_to_v16int16_dsl expr-0 ) num-consumed-0)]
		[else (error "Unable to extract  for srs_to_v16int16")]
)

	]
	[(srs_to_v32int16_dsl v0)
		(cond 
		[(and ); srs_to_v32int16
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
 
 (values (srs_to_v32int16_dsl expr-0 ) num-consumed-0)]
		[else (error "Unable to extract  for srs_to_v32int16")]
)

	]
	[(mac_elem_32_dsl v0 v1 v2)
		(cond 
		[(and ); mac_elem_32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (aie:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (mac_elem_32_dsl expr-0 expr-1 expr-2 ) num-consumed-2)]
		[else (error "Unable to extract  for mac_elem_32")]
)

	]
	[(mul_conv_16x4_conf_v16acc64_dsl v0 v1 num_2 num_3 size_i size_o prec_i prec_o)
		(cond 
		[(and  (equal? num_2 16) (equal? num_3 4) (equal? size_i 32) (equal? size_o 16) (equal? prec_i 16) (equal? prec_o 64)); mul_conv_16x4_conf_v16acc64
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (mul_conv_16x4_conf_v16acc64_dsl expr-0 expr-1 num_2 num_3 size_i size_o prec_i prec_o ) num-consumed-1)]
		[(and  (equal? num_2 16) (equal? num_3 4) (equal? size_i 32) (equal? size_o 16) (equal? prec_i 16) (equal? prec_o 64)); mul_conv_16x4_v16acc64
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (mul_conv_16x4_conf_v16acc64_dsl expr-0 expr-1 num_2 num_3 size_i size_o prec_i prec_o ) num-consumed-1)]
		[(and  (equal? num_2 32) (equal? num_3 8) (equal? size_i 64) (equal? size_o 32) (equal? prec_i 8) (equal? prec_o 32)); mul_conv_32x8_conf_v32acc32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (mul_conv_16x4_conf_v16acc64_dsl expr-0 expr-1 num_2 num_3 size_i size_o prec_i prec_o ) num-consumed-1)]
		[(and  (equal? num_2 32) (equal? num_3 8) (equal? size_i 64) (equal? size_o 32) (equal? prec_i 8) (equal? prec_o 32)); mul_conv_32x8_v32acc32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (mul_conv_16x4_conf_v16acc64_dsl expr-0 expr-1 num_2 num_3 size_i size_o prec_i prec_o ) num-consumed-1)]
		[(and  (equal? num_2 4) (equal? num_3 4) (equal? size_i 64) (equal? size_o 32) (equal? prec_i 8) (equal? prec_o 32)); mul_conv_4x4_8ch_conf_v32acc32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (mul_conv_16x4_conf_v16acc64_dsl expr-0 expr-1 num_2 num_3 size_i size_o prec_i prec_o ) num-consumed-1)]
		[(and  (equal? num_2 4) (equal? num_3 4) (equal? size_i 64) (equal? size_o 32) (equal? prec_i 8) (equal? prec_o 32)); mul_conv_4x4_8ch_v32acc32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (mul_conv_16x4_conf_v16acc64_dsl expr-0 expr-1 num_2 num_3 size_i size_o prec_i prec_o ) num-consumed-1)]
		[(and  (equal? num_2 8) (equal? num_3 8) (equal? size_i 64) (equal? size_o 32) (equal? prec_i 8) (equal? prec_o 32)); mul_conv_8x8_4ch_conf_v32acc32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (mul_conv_16x4_conf_v16acc64_dsl expr-0 expr-1 num_2 num_3 size_i size_o prec_i prec_o ) num-consumed-1)]
		[(and  (equal? num_2 8) (equal? num_3 8) (equal? size_i 64) (equal? size_o 32) (equal? prec_i 8) (equal? prec_o 32)); mul_conv_8x8_4ch_v32acc32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (mul_conv_16x4_conf_v16acc64_dsl expr-0 expr-1 num_2 num_3 size_i size_o prec_i prec_o ) num-consumed-1)]
		[else (error "Unable to extract  for mul_conv_16x4_conf_v16acc64")]
)

	]
	[(shift_v16int32_dsl v0 v1 v2 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); shift_v16int32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (aie:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (shift_v16int32_dsl expr-0 expr-1 expr-2 size_i_o prec_i_o ) num-consumed-2)]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); shift_v16uint32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (aie:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (shift_v16int32_dsl expr-0 expr-1 expr-2 size_i_o prec_i_o ) num-consumed-2)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); shift_v32int16
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (aie:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (shift_v16int32_dsl expr-0 expr-1 expr-2 size_i_o prec_i_o ) num-consumed-2)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); shift_v32uint16
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (aie:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (shift_v16int32_dsl expr-0 expr-1 expr-2 size_i_o prec_i_o ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); shift_v64int8
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (aie:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (shift_v16int32_dsl expr-0 expr-1 expr-2 size_i_o prec_i_o ) num-consumed-2)]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); shift_v64uint8
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (aie:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (shift_v16int32_dsl expr-0 expr-1 expr-2 size_i_o prec_i_o ) num-consumed-2)]
		[else (error "Unable to extract  for shift_v16int32")]
)

	]
	[(shuffle_v128int4_lo_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 128) (equal? prec_i_o 4)); shuffle_v128int4_lo
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (shuffle_v128int4_lo_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? prec_i_o 4)); shuffle_v128uint4_lo
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (shuffle_v128int4_lo_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); shuffle_v16int32_lo
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (shuffle_v128int4_lo_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); shuffle_v16uint32_lo
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (shuffle_v128int4_lo_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); shuffle_v32int16_lo
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (shuffle_v128int4_lo_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); shuffle_v32uint16_lo
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (shuffle_v128int4_lo_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); shuffle_v64int8_lo
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (shuffle_v128int4_lo_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); shuffle_v64uint8_lo
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (shuffle_v128int4_lo_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[else (error "Unable to extract  for shuffle_v128int4_lo")]
)

	]
	[(shuffle_v128int4_hi_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 128) (equal? prec_i_o 4)); shuffle_v128int4_hi
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (shuffle_v128int4_hi_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 128) (equal? prec_i_o 4)); shuffle_v128uint4_hi
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (shuffle_v128int4_hi_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); shuffle_v16int32_hi
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (shuffle_v128int4_hi_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); shuffle_v16uint32_hi
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (shuffle_v128int4_hi_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); shuffle_v32int16_hi
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (shuffle_v128int4_hi_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); shuffle_v32uint16_hi
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (shuffle_v128int4_hi_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); shuffle_v64int8_hi
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (shuffle_v128int4_hi_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); shuffle_v64uint8_hi
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (shuffle_v128int4_hi_dsl expr-0 expr-1 size_i_o prec_i_o ) num-consumed-1)]
		[else (error "Unable to extract  for shuffle_v128int4_hi")]
)

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
	[(mul_elem_16_2_v16acc64_dsl v0 v1 size_i_o prec_i prec_o)
		(cond 
		[(and  (equal? size_i_o 16) (equal? prec_i 16) (equal? prec_o 64)); mul_elem_16_2_v16acc64
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (mul_elem_16_2_v16acc64_dsl expr-0 expr-1 size_i_o prec_i prec_o ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? prec_i 8) (equal? prec_o 32)); mul_elem_32_2_v32acc32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (mul_elem_16_2_v16acc64_dsl expr-0 expr-1 size_i_o prec_i prec_o ) num-consumed-1)]
		[(and  (equal? size_i_o 32) (equal? prec_i 16) (equal? prec_o 32)); mul_elem_32_v32acc32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
 
 (values (mul_elem_16_2_v16acc64_dsl expr-0 expr-1 size_i_o prec_i prec_o ) num-consumed-1)]
		[else (error "Unable to extract  for mul_elem_16_2_v16acc64")]
)

	]
	[(mul_elem_16_2_conf_v16acc64_dsl v0 v1 v2 prec_i prec_o num_5)
		(cond 
		[(and  (equal? prec_i 16) (equal? prec_o 16) (equal? num_5 64)); mul_elem_16_2_conf_v16acc64
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (aie:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (mul_elem_16_2_conf_v16acc64_dsl expr-0 expr-1 expr-2 prec_i prec_o num_5 ) num-consumed-2)]
		[(and  (equal? prec_i 32) (equal? prec_o 8) (equal? num_5 32)); mul_elem_32_2_conf_v32acc32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (aie:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (mul_elem_16_2_conf_v16acc64_dsl expr-0 expr-1 expr-2 prec_i prec_o num_5 ) num-consumed-2)]
		[(and  (equal? prec_i 32) (equal? prec_o 16) (equal? num_5 32)); mul_elem_32_conf_v32acc32
 
 (define-values (expr-0 num-consumed-0) (aie:extract-expr v0 num-consumed (- depth 1)))
(define-values (expr-1 num-consumed-1) (aie:extract-expr v1 num-consumed-0 (- depth 1)))
(define-values (expr-2 num-consumed-2) (aie:extract-expr v2 num-consumed-1 (- depth 1)))
 
 (values (mul_elem_16_2_conf_v16acc64_dsl expr-0 expr-1 expr-2 prec_i prec_o num_5 ) num-consumed-2)]
		[else (error "Unable to extract  for mul_elem_16_2_conf_v16acc64")]
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

