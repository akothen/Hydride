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
;;                                DSL Get Ops
;; ================================================================================
(define (aie:get-bv-ops prog)
 (destruct prog
	[(reg id) '()]
	[(lit v) '()]
		[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(remove-duplicates (append (list  'if) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))
	]
		[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(remove-duplicates (append (list  ) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))
	]
		[(interleave-vector_dsl v0 size_i_o prec_i_o)
		(remove-duplicates (append (list  'cond) (aie:get-bv-ops v0)))
	]
		[(deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(remove-duplicates (append (list  'cond) (aie:get-bv-ops v0)))
	]
		[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(remove-duplicates (append (list  'bitvector->integer 'if) (aie:get-bv-ops v0) (aie:get-bv-ops v1) (aie:get-bv-ops v4)))
	]
		[(llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(remove-duplicates (append (list  'bvadd) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))
	]
		[(llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(remove-duplicates (append (list  'bvsub) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))
	]
		[(llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(remove-duplicates (append (list  'bvmul) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))
	]
		[(llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(remove-duplicates (append (list  'bvsdiv) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))
	]
		[(llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(remove-duplicates (append (list  'bvudiv) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))
	]
		[(llvm-zext_dsl v0 size_i size_o)
		(remove-duplicates (append (list  'zero-extend) (aie:get-bv-ops v0)))
	]
		[(scalar_splat_dsl v0 size_i size_o)
		(remove-duplicates (append (list  'zero-extend) (aie:get-bv-ops v0)))
	]
	[(add_v16acc64_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 16) (equal? prec_i_o 64)); add_v16acc64
 
  (remove-duplicates (append (list  'bvadd) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); add_v16int32
 
  (remove-duplicates (append (list  'bvadd) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); add_v16uint32
 
  (remove-duplicates (append (list  'bvadd) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 32)); add_v32acc32
 
  (remove-duplicates (append (list  'bvadd) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); add_v32int16
 
  (remove-duplicates (append (list  'bvadd) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); add_v32uint16
 
  (remove-duplicates (append (list  'bvadd) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); add_v64int8
 
  (remove-duplicates (append (list  'bvadd) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); add_v64uint8
 
  (remove-duplicates (append (list  'bvadd) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))]
		[else (error "Unable to get ops  for add_v16acc64")]
)

	]
	[(sub_v16acc64_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 16) (equal? prec_i_o 64)); sub_v16acc64
 
  (remove-duplicates (append (list  'bvsub) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); sub_v16int32
 
  (remove-duplicates (append (list  'bvsub) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)); sub_v16uint32
 
  (remove-duplicates (append (list  'bvsub) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 32)); sub_v32acc32
 
  (remove-duplicates (append (list  'bvsub) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); sub_v32int16
 
  (remove-duplicates (append (list  'bvsub) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)); sub_v32uint16
 
  (remove-duplicates (append (list  'bvsub) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); sub_v64int8
 
  (remove-duplicates (append (list  'bvsub) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)); sub_v64uint8
 
  (remove-duplicates (append (list  'bvsub) (aie:get-bv-ops v0) (aie:get-bv-ops v1)))]
		[else (error "Unable to get ops  for sub_v16acc64")]
)

	]
	[(srs_to_v32int16_dsl v0)
		(cond 
		[(and ); srs_to_v32int16
 
  (remove-duplicates (append (list  ) (aie:get-bv-ops v0)))]
		[else (error "Unable to get ops  for srs_to_v32int16")]
)

	]
	[(ups_to_v32acc32_dsl v0)
		(cond 
		[(and ); ups_to_v32acc32
 
  (remove-duplicates (append (list  'sign-extend) (aie:get-bv-ops v0)))]
		[else (error "Unable to get ops  for ups_to_v32acc32")]
)

	]
	[(mac_elem_32_dsl v0 v1 v2)
		(cond 
		[(and ); mac_elem_32
 
  (remove-duplicates (append (list  'bvadd 'bvmul 'sign-extend) (aie:get-bv-ops v0) (aie:get-bv-ops v1) (aie:get-bv-ops v2)))]
		[else (error "Unable to get ops  for mac_elem_32")]
)

	]
 )
)
;; ================================================================================

