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
;;                                DSL Get Names
;; ================================================================================
(define (aie:get-target-name prog)
 (destruct prog
	[(reg id) '()]
	[(lit v) '()]
		[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		 (append (list  "two_input_swizzle_N6_T8_LO0_L3_G3_D1_R0") (aie:get-target-name v0) (aie:get-target-name v1))
	]
		[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		 (append (list  "interleave-vectors-128-16") (aie:get-target-name v0) (aie:get-target-name v1))
	]
		[(interleave-vector_dsl v0 size_i_o prec_i_o)
		 (append (list  "interleave-vector-128-16") (aie:get-target-name v0))
	]
		[(deinterleave-vector_dsl v0 size_i_o prec_i_o)
		 (append (list  "deinterleave-vector-128-16") (aie:get-target-name v0))
	]
		[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		 (append (list  "shuffle-vector-128-16-128") (aie:get-target-name v0) (aie:get-target-name v1) (aie:get-target-name v4))
	]
		[(llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-add-128-16") (aie:get-target-name v0) (aie:get-target-name v1))
	]
		[(llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-sub-128-16") (aie:get-target-name v0) (aie:get-target-name v1))
	]
		[(llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-mul-128-16") (aie:get-target-name v0) (aie:get-target-name v1))
	]
		[(llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-sdiv-128-16") (aie:get-target-name v0) (aie:get-target-name v1))
	]
		[(llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-udiv-128-16") (aie:get-target-name v0) (aie:get-target-name v1))
	]
		[(llvm-zext_dsl v0 size_i size_o)
		 (append (list  "llvm-zext-8-32") (aie:get-target-name v0))
	]
		[(scalar_splat_dsl v0 size_i size_o)
		 (append (list  "llvm-splat-8-32") (aie:get-target-name v0))
	]
	[(v16int32_add16_dsl v0 v1)
		(cond 
		[(and ) 
   (append (list  "v16int32_add16") (aie:get-target-name v0) (aie:get-target-name v1))]
		[else (error "Unable to get name  for v16int32_add16")]
)

	]
	[(v8int32_add8_dsl v0 v1)
		(cond 
		[(and ) 
   (append (list  "v8int32_add8") (aie:get-target-name v0) (aie:get-target-name v1))]
		[else (error "Unable to get name  for v8int32_add8")]
)

	]
	[(v16int32_sub16_dsl v0 v1)
		(cond 
		[(and ) 
   (append (list  "v16int32_sub16") (aie:get-target-name v0) (aie:get-target-name v1))]
		[else (error "Unable to get name  for v16int32_sub16")]
)

	]
	[(mul_elem_32_dsl v0 v1)
		(cond 
		[(and ) 
   (append (list  "mul_elem_32") (aie:get-target-name v0) (aie:get-target-name v1))]
		[else (error "Unable to get name  for mul_elem_32")]
)

	]
	[(mac_elem_32_dsl v0 v1 v2)
		(cond 
		[(and ) 
   (append (list  "mac_elem_32") (aie:get-target-name v0) (aie:get-target-name v1) (aie:get-target-name v2))]
		[else (error "Unable to get name  for mac_elem_32")]
)

	]
	[(srs_to_v32int16_dsl v0)
		(cond 
		[(and ) 
   (append (list  "srs_to_v32int16") (aie:get-target-name v0))]
		[else (error "Unable to get name  for srs_to_v32int16")]
)

	]
	[(ups_to_v32acc32_dsl v0)
		(cond 
		[(and ) 
   (append (list  "ups_to_v32acc32") (aie:get-target-name v0))]
		[else (error "Unable to get name  for ups_to_v32acc32")]
)

	]
	[(ups_8_32_to_8_80_dsl v0)
		(cond 
		[(and ) 
   (append (list  "ups_8_32_to_8_80") (aie:get-target-name v0))]
		[else (error "Unable to get name  for ups_8_32_to_8_80")]
)

	]
 )
)
;; ================================================================================

