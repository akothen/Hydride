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
;;                                DSL Get Sub-Expressions
;; ================================================================================
(define (aie:get-sub-exprs prog)
 (destruct prog
	[(reg id) (list (reg id))]
	[(lit v) '()]
		[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(list v0 v1)
	]
		[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(list v0 v1)
	]
		[(interleave-vector_dsl v0 size_i_o prec_i_o)
		(list v0)
	]
		[(deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(list v0)
	]
		[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(list v0 v1 v4)
	]
		[(llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(list v0 v1)
	]
		[(llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(list v0 v1)
	]
		[(llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(list v0 v1)
	]
		[(llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(list v0 v1)
	]
		[(llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(list v0 v1)
	]
		[(llvm-zext_dsl v0 size_i size_o)
		(list v0)
	]
		[(scalar_splat_dsl v0 size_i size_o)
		(list v0)
	]
	[(v16int32_add16_dsl v0 v1)
		(cond 
		[(and ); v16int32_add16
 
  (list v0 v1)]
		[else (error "Unable to get ops  for v16int32_add16")]
)

	]
	[(v8int32_add8_dsl v0 v1)
		(cond 
		[(and ); v8int32_add8
 
  (list v0 v1)]
		[else (error "Unable to get ops  for v8int32_add8")]
)

	]
	[(v16int32_sub16_dsl v0 v1)
		(cond 
		[(and ); v16int32_sub16
 
  (list v0 v1)]
		[else (error "Unable to get ops  for v16int32_sub16")]
)

	]
	[(v8acc80_mul32_dsl v0 v1)
		(cond 
		[(and ); v8acc80_mul32
 
  (list v0 v1)]
		[else (error "Unable to get ops  for v8acc80_mul32")]
)

	]
	[(srs_8_80_to_8_32_dsl v0)
		(cond 
		[(and ); srs_8_80_to_8_32
 
  (list v0)]
		[else (error "Unable to get ops  for srs_8_80_to_8_32")]
)

	]
	[(ups_8_32_to_8_80_dsl v0)
		(cond 
		[(and ); ups_8_32_to_8_80
 
  (list v0)]
		[else (error "Unable to get ops  for ups_8_32_to_8_80")]
)

	]
 )
)
;; ================================================================================

