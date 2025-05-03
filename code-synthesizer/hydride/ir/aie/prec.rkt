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
	[(concat_v16int16_dsl v0 v1 size_i size_o prec_i prec_o)
		(cond 
		[(and  (equal? size_i 16) (equal? size_o 32) (equal? prec_i 16) (equal? prec_o 16)) 32]
		[(and  (equal? size_i 32) (equal? size_o 64) (equal? prec_i 8) (equal? prec_o 8)) 8]
		[else (error "Unable to infer prec for concat_v16int16")]
)

	]
	[(ups_to_v16acc32_dsl v0)
		(cond 
		[(and ) 32]
		[else (error "Unable to infer prec for ups_to_v16acc32")]
)

	]
	[(ups_to_v32acc32_dsl v0)
		(cond 
		[(and ) 32]
		[else (error "Unable to infer prec for ups_to_v32acc32")]
)

	]
	[(srs_to_v16int16_dsl v0)
		(cond 
		[(and ) 16]
		[else (error "Unable to infer prec for srs_to_v16int16")]
)

	]
	[(srs_to_v32int16_dsl v0)
		(cond 
		[(and ) 16]
		[else (error "Unable to infer prec for srs_to_v32int16")]
)

	]
	[(mac_elem_32_dsl v0 v1 v2)
		(cond 
		[(and ) 32]
		[else (error "Unable to infer prec for mac_elem_32")]
)

	]
	[(mul_conv_16x4_conf_v16acc64_dsl v0 v1 num_2 num_3 size_i size_o prec_i prec_o)
		(cond 
		[(and  (equal? num_2 16) (equal? num_3 4) (equal? size_i 32) (equal? size_o 16) (equal? prec_i 16) (equal? prec_o 64)) 64]
		[(and  (equal? num_2 16) (equal? num_3 4) (equal? size_i 32) (equal? size_o 16) (equal? prec_i 16) (equal? prec_o 64)) 64]
		[(and  (equal? num_2 32) (equal? num_3 8) (equal? size_i 64) (equal? size_o 32) (equal? prec_i 8) (equal? prec_o 32)) 32]
		[(and  (equal? num_2 32) (equal? num_3 8) (equal? size_i 64) (equal? size_o 32) (equal? prec_i 8) (equal? prec_o 32)) 32]
		[(and  (equal? num_2 4) (equal? num_3 4) (equal? size_i 64) (equal? size_o 32) (equal? prec_i 8) (equal? prec_o 32)) 32]
		[(and  (equal? num_2 4) (equal? num_3 4) (equal? size_i 64) (equal? size_o 32) (equal? prec_i 8) (equal? prec_o 32)) 32]
		[(and  (equal? num_2 8) (equal? num_3 8) (equal? size_i 64) (equal? size_o 32) (equal? prec_i 8) (equal? prec_o 32)) 32]
		[(and  (equal? num_2 8) (equal? num_3 8) (equal? size_i 64) (equal? size_o 32) (equal? prec_i 8) (equal? prec_o 32)) 32]
		[else (error "Unable to infer prec for mul_conv_16x4_conf_v16acc64")]
)

	]
	[(shift_v16int32_dsl v0 v1 v2 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)) 8]
		[else (error "Unable to infer prec for shift_v16int32")]
)

	]
	[(shuffle_v128int4_lo_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 128) (equal? prec_i_o 4)) 4]
		[(and  (equal? size_i_o 128) (equal? prec_i_o 4)) 4]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)) 8]
		[else (error "Unable to infer prec for shuffle_v128int4_lo")]
)

	]
	[(shuffle_v128int4_hi_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 128) (equal? prec_i_o 4)) 4]
		[(and  (equal? size_i_o 128) (equal? prec_i_o 4)) 4]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)) 8]
		[else (error "Unable to infer prec for shuffle_v128int4_hi")]
)

	]
	[(add_v16acc64_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 16) (equal? prec_i_o 64)) 64]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 16) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 32)) 32]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 32) (equal? prec_i_o 16)) 16]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)) 8]
		[(and  (equal? size_i_o 64) (equal? prec_i_o 8)) 8]
		[else (error "Unable to infer prec for add_v16acc64")]
)

	]
	[(mul_elem_16_2_v16acc64_dsl v0 v1 size_i_o prec_i prec_o)
		(cond 
		[(and  (equal? size_i_o 16) (equal? prec_i 16) (equal? prec_o 64)) 64]
		[(and  (equal? size_i_o 32) (equal? prec_i 8) (equal? prec_o 32)) 32]
		[(and  (equal? size_i_o 32) (equal? prec_i 16) (equal? prec_o 32)) 32]
		[else (error "Unable to infer prec for mul_elem_16_2_v16acc64")]
)

	]
	[(mul_elem_16_2_conf_v16acc64_dsl v0 v1 v2 prec_i prec_o num_5)
		(cond 
		[(and  (equal? prec_i 16) (equal? prec_o 16) (equal? num_5 64)) 64]
		[(and  (equal? prec_i 32) (equal? prec_o 8) (equal? num_5 32)) 32]
		[(and  (equal? prec_i 32) (equal? prec_o 16) (equal? num_5 32)) 32]
		[else (error "Unable to infer prec for mul_elem_16_2_conf_v16acc64")]
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
	
[
v
 
1
]
 )
)
;; ================================================================================

