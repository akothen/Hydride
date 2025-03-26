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
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)

(require hydride/utils/bvops)
(require hydride/utils/misc)

(require hydride/ir/hydride/definition)
(require hydride/ir/aie/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Get Output Precision
;; ================================================================================
(define (aie:get-prec prog env)
 (destruct prog
	[(dim-x id) 1]
	[(dim-y id) 1]
	[(idx-i id) 1]
	[(idx-j id) 1]
	[(reg id) (bvlength (vector-ref-bv env id))] ;; FIX-ME NOTE: DO NOT USE THIS METHOD FOR PREC
	[(lit v) (bvlength v)]
	[(nop v1) (aie:get-prec v1 env)]
	[(idx-add i1 i2) 1]
	[(idx-mul i1 i2) 1]
	[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8) num_2]
	[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o) prec_i_o]
	[(interleave-vector_dsl v0 size_i_o prec_i_o) prec_i_o]
	[(deinterleave-vector_dsl v0 size_i_o prec_i_o) prec_i_o]
	[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5) prec_i_o]
	[(llvm-vect-add_dsl v0 v1 num_2 prec_i_o) prec_i_o ]
	[(llvm-vect-sub_dsl v0 v1 num_2 prec_i_o) prec_i_o ]
	[(llvm-vect-mul_dsl v0 v1 num_2 prec_i_o) prec_i_o ]
	[(llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o) prec_i_o ]
	[(llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o) prec_i_o ]
	[(add_v16int32_dsl v0 v1 num_2 num_3)
		(cond 
		[(and  (equal? num_2 16) (equal? num_3 64)) 64]
		[(and  (equal? num_2 16) (equal? num_3 32)) 32]
		[(and  (equal? num_2 16) (equal? num_3 32)) 32]
		[(and  (equal? num_2 32) (equal? num_3 32)) 32]
		[(and  (equal? num_2 32) (equal? num_3 16)) 16]
		[(and  (equal? num_2 32) (equal? num_3 16)) 16]
		[(and  (equal? num_2 64) (equal? num_3 8)) 8]
		[(and  (equal? num_2 64) (equal? num_3 8)) 8]
		[else (error "Unable to infer prec for add_v16int32")]
)

	]
	[(sub_v16acc64_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 16) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)) 8]
		[else (error "Unable to infer prec for sub_v16acc64")]
)

	]
	[(mac_elem_32_dsl v0 v1 v2)
		(cond 
		[(and ) 32]
		[else (error "Unable to infer prec for mac_elem_32")]
)

	]
	[(srs_to_v32int16_dsl v0)
		(cond 
		[(and ) 16]
		[else (error "Unable to infer prec for srs_to_v32int16")]
)

	]
	[(ups_to_v32acc32_dsl v0)
		(cond 
		[(and ) 32]
		[else (error "Unable to infer prec for ups_to_v32acc32")]
)

	]
	
[
v
 
1
]
 )
)
;; ================================================================================

