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
(require rosette/solver/smt/boolector)

(require hydride/utils/bvops)
(require hydride/utils/misc)


(require hydride/ir/hydride/definition)
(require hydride/ir/aie/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Cost Model
;; ================================================================================
(define cost_ups_to_v32acc32_dsl 1)
(define cost_srs_to_v32int16_dsl 1)
(define cost_mac_elem_32_dsl 1)
(define cost_mul_conv_32x8_dsl 1)
(define cost_add_v64uint8_dsl 1)
(define cost_mul_elem_32_v32acc32_dsl 1)
(define cost_mul_elem_32_conf_v32acc32_dsl 1)
(define cost_sub_v64uint8_dsl 1)

(define (aie:cost prog)
 (destruct prog
	[(reg id) 1]
	[(lit v) 1 ]
		[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(+ 4 (aie:cost  v0)  (aie:cost  v1)  
		 
		)
	]
		[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(+ 4 (aie:cost  v0)  (aie:cost  v1)  
		)
	]
		[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(+ 3 (aie:cost  v0) )
	]
		[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(+ 3 (aie:cost  v0) )
	]
		[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(+ 5 (aie:cost  v0)  (aie:cost  v1)  
		 (aie:cost  v4) )
	]
		[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (aie:cost  v0)  (aie:cost  v1)  
		)
	]
		[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (aie:cost  v0)  (aie:cost  v1)  
		)
	]
		[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (aie:cost  v0)  (aie:cost  v1)  
		)
	]
		[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (aie:cost  v0)  (aie:cost  v1)  
		)
	]
		[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(+ 2 (aie:cost  v0)  (aie:cost  v1)  
		)
	]
		[ (llvm-zext_dsl v0 size_i size_o)
		(+ 1 (aie:cost  v0) )
	]
		[ (scalar_splat_dsl v0 size_i size_o)
		(+ 1 (aie:cost  v0) )
	]
	[ (ups_to_v32acc32_dsl v0)
		(+ cost_ups_to_v32acc32_dsl (aie:cost  v0) )
	]
	[ (srs_to_v32int16_dsl v0)
		(+ cost_srs_to_v32int16_dsl (aie:cost  v0) )
	]
	[ (mac_elem_32_dsl v0 v1 v2)
		(+ cost_mac_elem_32_dsl (aie:cost  v0)  (aie:cost  v1)  (aie:cost  v2) )
	]
	[ (mul_conv_32x8_dsl v0 v1)
		(+ cost_mul_conv_32x8_dsl (aie:cost  v0)  (aie:cost  v1) )
	]
	[ (add_v64uint8_dsl v0 v1 size_i_o prec_i_o)
		(+ cost_add_v64uint8_dsl (aie:cost  v0)  (aie:cost  v1)  
		)
	]
	[ (mul_elem_32_v32acc32_dsl v0 v1 size_i_o prec_i prec_o)
		(+ cost_mul_elem_32_v32acc32_dsl (aie:cost  v0)  (aie:cost  v1)  
		)
	]
	[ (mul_elem_32_conf_v32acc32_dsl v0 v1 v2 prec_i prec_o num_5)
		(+ cost_mul_elem_32_conf_v32acc32_dsl (aie:cost  v0)  (aie:cost  v1)  (aie:cost  v2)  
		)
	]
	[ (sub_v64uint8_dsl v0 v1 size_i_o prec_i_o)
		(+ cost_sub_v64uint8_dsl (aie:cost  v0)  (aie:cost  v1)  
		)
	]
	[v  (error "Unrecognized Term in cost model" v)]
 )
)
;; ================================================================================

