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


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Get Length
;; ================================================================================
(define (aie:get-length prog env)
 (destruct prog
	[(dim-x id) 1]
	[(dim-y id) 1]
	[(idx-i id) 1]
	[(idx-j id) 1]
	[(reg id) (bvlength (vector-ref-bv env id))]
	[(lit v) (bvlength v)]
	[(nop v1) (aie:get-length v1 env)]
	[(idx-add i1 i2) 1]
	[(idx-mul i1 i2) 1]
	[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8) (* (max 1 (/ num_2 num_5)) (+ num_4 (* 2 num_6)) prec_i_o)]
	[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o) (* 2 size_i_o)]
	[(interleave-vector_dsl v0 size_i_o prec_i_o) size_i_o]
	[(deinterleave-vector_dsl v0 size_i_o prec_i_o) size_i_o]
	[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5) (* num_5 prec_i_o) ]
	[(llvm-vect-add_dsl v0 v1 num_2 prec_i_o) (* num_2 prec_i_o) ]
	[(llvm-vect-sub_dsl v0 v1 num_2 prec_i_o) (* num_2 prec_i_o) ]
	[(llvm-vect-mul_dsl v0 v1 num_2 prec_i_o) (* num_2 prec_i_o) ]
	[(llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o) (* num_2 prec_i_o) ]
	[(llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o) (* num_2 prec_i_o) ]
	[(v16int32_add16_dsl v0 v1)
		(cond 
		[(and ) 512]
		[else (error "Unable to infer length for v16int32_add16: "  prog)]
)

	]
	[(v8int32_add8_dsl v0 v1)
		(cond 
		[(and ) 256]
		[else (error "Unable to infer length for v8int32_add8: "  prog)]
)

	]
	[(v16int32_sub16_dsl v0 v1)
		(cond 
		[(and ) 512]
		[else (error "Unable to infer length for v16int32_sub16: "  prog)]
)

	]
	[(mul_elem_32_dsl v0 v1)
		(cond 
		[(and ) 1024]
		[else (error "Unable to infer length for mul_elem_32: "  prog)]
)

	]
	[(mac_elem_32_dsl v0 v1 v2)
		(cond 
		[(and ) 1024]
		[else (error "Unable to infer length for mac_elem_32: "  prog)]
)

	]
	[(srs_to_v32int16_dsl v0)
		(cond 
		[(and ) 512]
		[else (error "Unable to infer length for srs_to_v32int16: "  prog)]
)

	]
	[(ups_to_v32acc32_dsl v0)
		(cond 
		[(and ) 1024]
		[else (error "Unable to infer length for ups_to_v32acc32: "  prog)]
)

	]
	[(ups_8_32_to_8_80_dsl v0)
		(cond 
		[(and ) 640]
		[else (error "Unable to infer length for ups_8_32_to_8_80: "  prog)]
)

	]
 )
)
;; ================================================================================

