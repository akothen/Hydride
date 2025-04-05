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
	[(add_v16acc64_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 16) (equal? prec_i_o 64)); add_v16acc64
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); add_v16int32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); add_v16uint32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 32)); add_v32acc32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); add_v32int16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); add_v32uint16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); add_v64int8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); add_v64uint8
 
  (list v0 v1)]
		[else (error "Unable to get ops  for add_v16acc64")]
)

	]
	[(sub_v16acc64_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 16) (equal? prec_i_o 64)); sub_v16acc64
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); sub_v16int32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); sub_v16uint32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 32)); sub_v32acc32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); sub_v32int16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); sub_v32uint16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); sub_v64int8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); sub_v64uint8
 
  (list v0 v1)]
		[else (error "Unable to get ops  for sub_v16acc64")]
)

	]
	[(srs_to_v32int16_dsl v0)
		(cond 
		[(and ); srs_to_v32int16
 
  (list v0)]
		[else (error "Unable to get ops  for srs_to_v32int16")]
)

	]
	[(ups_to_v32acc32_dsl v0)
		(cond 
		[(and ); ups_to_v32acc32
 
  (list v0)]
		[else (error "Unable to get ops  for ups_to_v32acc32")]
)

	]
	[(mac_elem_32_dsl v0 v1 v2)
		(cond 
		[(and ); mac_elem_32
 
  (list v0 v1 v2)]
		[else (error "Unable to get ops  for mac_elem_32")]
)

	]
 )
)
;; ================================================================================

