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



(require hydride/ir/hydride/definition)
(require hydride/ir/aie/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                Hydride Visitor 
;; ================================================================================
(define (aie:visitor prog fn)
 (destruct prog
	[(dim-x id) (fn prog)]
	[(dim-y id) (fn prog)]
	[(idx-i id) (fn prog)]
	[(idx-j id) (fn prog)]
	[(reg id) (fn prog) ]
	[(lit v) (fn prog)]
	[(nop v1) (aie:visitor v1 fn)]
	[(idx-add i1 i2) (fn prog) ]
	[(idx-mul i1 i2) (fn prog) ]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(fn ( vector-two-input-swizzle_dsl v0-visited v1-visited num_2 prec_i_o num_4 num_5 num_6 num_7 num_8 ))
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(fn ( interleave-vectors_dsl v0-visited v1-visited size_i_o prec_i_o ))
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-visited (aie:visitor v0 fn))
		(fn ( interleave-vector_dsl v0-visited size_i_o prec_i_o ))
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(define v0-visited (aie:visitor v0 fn))
		(fn ( deinterleave-vector_dsl v0-visited size_i_o prec_i_o ))
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(define v4-visited (aie:visitor v4 fn))
		(fn ( llvm_shuffle_vectors_dsl v0-visited v1-visited num_2 prec_i_o v4-visited num_5 ))
	]
	[ (llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(fn ( llvm-vect-add_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(fn ( llvm-vect-sub_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(fn ( llvm-vect-mul_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(fn ( llvm-vect-sdiv_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(fn ( llvm-vect-udiv_dsl v0-visited v1-visited num_2 prec_i_o ))
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(define v0-visited (aie:visitor v0 fn))
		(fn ( llvm-zext_dsl v0-visited size_i size_o ))
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(define v0-visited (aie:visitor v0 fn))
		(fn ( scalar_splat_dsl v0-visited size_i size_o ))
	]
	[ (concat_v16int16_dsl v0 v1 size_i size_o prec_i prec_o)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(fn ( concat_v16int16_dsl v0-visited v1-visited size_i size_o prec_i prec_o ))
	]
	[ (ups_to_v16acc32_dsl v0)
		(define v0-visited (aie:visitor v0 fn))
		(fn ( ups_to_v16acc32_dsl v0-visited ))
	]
	[ (ups_to_v32acc32_dsl v0)
		(define v0-visited (aie:visitor v0 fn))
		(fn ( ups_to_v32acc32_dsl v0-visited ))
	]
	[ (srs_to_v16int16_dsl v0)
		(define v0-visited (aie:visitor v0 fn))
		(fn ( srs_to_v16int16_dsl v0-visited ))
	]
	[ (srs_to_v32int16_dsl v0)
		(define v0-visited (aie:visitor v0 fn))
		(fn ( srs_to_v32int16_dsl v0-visited ))
	]
	[ (mac_elem_32_dsl v0 v1 v2)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(define v2-visited (aie:visitor v2 fn))
		(fn ( mac_elem_32_dsl v0-visited v1-visited v2-visited ))
	]
	[ (mul_conv_16x4_conf_v16acc64_dsl v0 v1 num_2 num_3 size_i size_o prec_i prec_o)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(fn ( mul_conv_16x4_conf_v16acc64_dsl v0-visited v1-visited num_2 num_3 size_i size_o prec_i prec_o ))
	]
	[ (shift_v16int32_dsl v0 v1 v2 size_i_o prec_i_o)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(define v2-visited (aie:visitor v2 fn))
		(fn ( shift_v16int32_dsl v0-visited v1-visited v2-visited size_i_o prec_i_o ))
	]
	[ (shuffle_v128int4_lo_dsl v0 v1 size_i_o prec_i_o)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(fn ( shuffle_v128int4_lo_dsl v0-visited v1-visited size_i_o prec_i_o ))
	]
	[ (shuffle_v128int4_hi_dsl v0 v1 size_i_o prec_i_o)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(fn ( shuffle_v128int4_hi_dsl v0-visited v1-visited size_i_o prec_i_o ))
	]
	[ (add_v16acc64_dsl v0 v1 size_i_o prec_i_o)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(fn ( add_v16acc64_dsl v0-visited v1-visited size_i_o prec_i_o ))
	]
	[ (mul_elem_16_2_v16acc64_dsl v0 v1 size_i_o prec_i prec_o)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(fn ( mul_elem_16_2_v16acc64_dsl v0-visited v1-visited size_i_o prec_i prec_o ))
	]
	[ (mul_elem_16_2_conf_v16acc64_dsl v0 v1 v2 prec_i prec_o num_5)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(define v2-visited (aie:visitor v2 fn))
		(fn ( mul_elem_16_2_conf_v16acc64_dsl v0-visited v1-visited v2-visited prec_i prec_o num_5 ))
	]
	[ (sub_v16acc64_dsl v0 v1 size_i_o prec_i_o)
		(define v0-visited (aie:visitor v0 fn))
		(define v1-visited (aie:visitor v1 fn))
		(fn ( sub_v16acc64_dsl v0-visited v1-visited size_i_o prec_i_o ))
	]
	[_ (error "Unrecognized expression in visitor")]
 )
)
;; ================================================================================

