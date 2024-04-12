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
(define cost_v16int32_add16_dsl 1)
(define cost_v8int32_add8_dsl 1)
(define cost_v16int32_sub16_dsl 1)
(define cost_v8acc80_mul32_dsl 1)
(define cost_srs_8_80_to_8_32_dsl 1)
(define cost_ups_8_32_to_8_80_dsl 1)

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
	[ (v16int32_add16_dsl v0 v1)
		(+ cost_v16int32_add16_dsl (aie:cost  v0)  (aie:cost  v1) )
	]
	[ (v8int32_add8_dsl v0 v1)
		(+ cost_v8int32_add8_dsl (aie:cost  v0)  (aie:cost  v1) )
	]
	[ (v16int32_sub16_dsl v0 v1)
		(+ cost_v16int32_sub16_dsl (aie:cost  v0)  (aie:cost  v1) )
	]
	[ (v8acc80_mul32_dsl v0 v1)
		(+ cost_v8acc80_mul32_dsl (aie:cost  v0)  (aie:cost  v1) )
	]
	[ (srs_8_80_to_8_32_dsl v0)
		(+ cost_srs_8_80_to_8_32_dsl (aie:cost  v0) )
	]
	[ (ups_8_32_to_8_80_dsl v0)
		(+ cost_ups_8_32_to_8_80_dsl (aie:cost  v0) )
	]
	[v  (error "Unrecognized Term in cost model" v)]
 )
)
;; ================================================================================

