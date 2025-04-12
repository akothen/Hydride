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
	[(ups_to_v32acc32_dsl v0)
		(cond 
		[(and ) 32]
		[else (error "Unable to infer prec for ups_to_v32acc32")]
)

	]
	[(srs_to_v32int16_dsl v0)
		(cond 
		[(and ) 16]
		[else (error "Unable to infer prec for srs_to_v32int16")]
)

	]
	[(add_v64uint8_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 16) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)) 8]
		[else (error "Unable to infer prec for add_v64uint8")]
)

	]
	[(mul_elem_32_v32acc32_dsl v0 v1 size_i_o prec_i prec_o)
		(cond 
		[(and  (equal? size_i_o 16) (equal? prec_i 16) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 32) (equal? prec_i 8) (equal? prec_o 32)) 32]
		[(and  (equal? size_i_o 32) (equal? prec_i 16) (equal? prec_o 32)) 32]
		[else (error "Unable to infer prec for mul_elem_32_v32acc32")]
)

	]
	[(mul_elem_32_conf_v32acc32_dsl v0 v1 v2 prec_i prec_o num_5)
		(cond 
		[(and  (equal? prec_i 16) (equal? prec_o 16) (equal? num_5 64)) 64]
		[(and  (equal? prec_i 32) (equal? prec_o 8) (equal? num_5 32)) 32]
		[(and  (equal? prec_i 32) (equal? prec_o 16) (equal? num_5 32)) 32]
		[else (error "Unable to infer prec for mul_elem_32_conf_v32acc32")]
)

	]
	[(sub_v64uint8_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 16) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)) 8]
		[else (error "Unable to infer prec for sub_v64uint8")]
)

	]
	
[
v
 
1
]
 )
)
;; ================================================================================

