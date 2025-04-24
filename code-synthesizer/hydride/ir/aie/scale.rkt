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
;;                                Hydride Scale Expression 
;; ================================================================================
(define (aie:scale-expr prog scale-factor)
 (destruct prog
	[(reg id) (reg id) ]
	[(lit v) (lit (apply concat (for/list ([i (range scale-factor)]) v) ) )]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(
		vector-two-input-swizzle_dsl
		(aie:scale-expr v0 scale-factor)
		(aie:scale-expr v1 scale-factor)
		num_2
		prec_i_o
		num_4
		num_5
		num_6
		num_7
		num_8
		)
	]
	[ (interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(
		interleave-vectors_dsl
		(aie:scale-expr v0 scale-factor)
		(aie:scale-expr v1 scale-factor)
		(* scale-factor size_i_o)
		prec_i_o
		)
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(
		interleave-vector_dsl
		(aie:scale-expr v0 scale-factor)
		(* scale-factor size_i_o)
		prec_i_o
		)
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(
		deinterleave-vector_dsl
		(aie:scale-expr v0 scale-factor)
		(* scale-factor size_i_o)
		prec_i_o
		)
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(
		llvm_shuffle_vectors_dsl
		(aie:scale-expr v0 scale-factor)
		(aie:scale-expr v1 scale-factor)
		num_2
		prec_i_o
		(aie:scale-expr v4 scale-factor)
		num_5
		)
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(
		llvm-zext_dsl
		(aie:scale-expr v0 scale-factor)
		(* scale-factor size_i)
		(* scale-factor size_o)
		)
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(
		scalar_splat_dsl
		(aie:scale-expr v0 scale-factor)
		(* scale-factor size_i)
		(* scale-factor size_o)
		)
	]
	[ (shift_bytes_dsl v0 v1 num_2 size_i_o prec_i_o)
		(cond 
		[(and  (equal? num_2 8) (equal? size_i_o 0) (equal? prec_i_o 32))
(displayln "Scaling case for shift_bytes")
(shift_bytes_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
num_2
(* scale-factor size_i_o)
prec_i_o
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (shuffle_v128int4_lo_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 4) (equal? prec_i_o 4))
(displayln "Scaling case for shuffle_v128int4_lo")
(shuffle_v128int4_lo_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? prec_i_o 4))
(displayln "Scaling case for shuffle_v128uint4_lo")
(shuffle_v128int4_lo_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 0) (equal? prec_i_o 32))
(displayln "Scaling case for shuffle_v16int32_lo")
(shuffle_v128int4_lo_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 0) (equal? prec_i_o 32))
(displayln "Scaling case for shuffle_v16uint32_lo")
(shuffle_v128int4_lo_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i_o 16))
(displayln "Scaling case for shuffle_v32int16_lo")
(shuffle_v128int4_lo_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i_o 16))
(displayln "Scaling case for shuffle_v32uint16_lo")
(shuffle_v128int4_lo_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? prec_i_o 8))
(displayln "Scaling case for shuffle_v64int8_lo")
(shuffle_v128int4_lo_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? prec_i_o 8))
(displayln "Scaling case for shuffle_v64uint8_lo")
(shuffle_v128int4_lo_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (shuffle_v128int4_hi_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 4) (equal? prec_i_o 4))
(displayln "Scaling case for shuffle_v128int4_hi")
(shuffle_v128int4_hi_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? prec_i_o 4))
(displayln "Scaling case for shuffle_v128uint4_hi")
(shuffle_v128int4_hi_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 0) (equal? prec_i_o 32))
(displayln "Scaling case for shuffle_v16int32_hi")
(shuffle_v128int4_hi_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 0) (equal? prec_i_o 32))
(displayln "Scaling case for shuffle_v16uint32_hi")
(shuffle_v128int4_hi_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i_o 16))
(displayln "Scaling case for shuffle_v32int16_hi")
(shuffle_v128int4_hi_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i_o 16))
(displayln "Scaling case for shuffle_v32uint16_hi")
(shuffle_v128int4_hi_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? prec_i_o 8))
(displayln "Scaling case for shuffle_v64int8_hi")
(shuffle_v128int4_hi_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? prec_i_o 8))
(displayln "Scaling case for shuffle_v64uint8_hi")
(shuffle_v128int4_hi_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (add_v16acc64_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 0) (equal? prec_i_o 64))
(displayln "Scaling case for add_v16acc64")
(add_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 0) (equal? prec_i_o 32))
(displayln "Scaling case for add_v16int32")
(add_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 0) (equal? prec_i_o 32))
(displayln "Scaling case for add_v16uint32")
(add_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i_o 32))
(displayln "Scaling case for add_v32acc32")
(add_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i_o 16))
(displayln "Scaling case for add_v32int16")
(add_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i_o 16))
(displayln "Scaling case for add_v32uint16")
(add_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? prec_i_o 8))
(displayln "Scaling case for add_v64int8")
(add_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? prec_i_o 8))
(displayln "Scaling case for add_v64uint8")
(add_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (mul_elem_16_2_v16acc64_dsl v0 v1 size_i_o prec_i prec_o)
		(cond 
		[(and  (equal? size_i_o 0) (equal? prec_i 16) (equal? prec_o 64))
(displayln "Scaling case for mul_elem_16_2_v16acc64")
(mul_elem_16_2_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i
prec_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i 8) (equal? prec_o 32))
(displayln "Scaling case for mul_elem_32_2_v32acc32")
(mul_elem_16_2_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i
prec_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i 16) (equal? prec_o 32))
(displayln "Scaling case for mul_elem_32_v32acc32")
(mul_elem_16_2_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i
prec_o
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (mul_elem_16_2_conf_v16acc64_dsl v0 v1 v2 prec_i prec_o num_5)
		(cond 
		[(and  (equal? prec_i 16) (equal? prec_o 16) (equal? num_5 64))
(displayln "Scaling case for mul_elem_16_2_conf_v16acc64")
(mul_elem_16_2_conf_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(aie:scale-expr v2 scale-factor)
prec_i
prec_o
num_5
)
]
		[(and  (equal? prec_i 32) (equal? prec_o 8) (equal? num_5 32))
(displayln "Scaling case for mul_elem_32_2_conf_v32acc32")
(mul_elem_16_2_conf_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(aie:scale-expr v2 scale-factor)
prec_i
prec_o
num_5
)
]
		[(and  (equal? prec_i 32) (equal? prec_o 16) (equal? num_5 32))
(displayln "Scaling case for mul_elem_32_conf_v32acc32")
(mul_elem_16_2_conf_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(aie:scale-expr v2 scale-factor)
prec_i
prec_o
num_5
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (sub_v16acc64_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 0) (equal? prec_i_o 64))
(displayln "Scaling case for sub_v16acc64")
(sub_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 0) (equal? prec_i_o 32))
(displayln "Scaling case for sub_v16int32")
(sub_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 0) (equal? prec_i_o 32))
(displayln "Scaling case for sub_v16uint32")
(sub_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i_o 32))
(displayln "Scaling case for sub_v32acc32")
(sub_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i_o 16))
(displayln "Scaling case for sub_v32int16")
(sub_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i_o 16))
(displayln "Scaling case for sub_v32uint16")
(sub_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? prec_i_o 8))
(displayln "Scaling case for sub_v64int8")
(sub_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? prec_i_o 8))
(displayln "Scaling case for sub_v64uint8")
(sub_v16acc64_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[_ (error "Unrecognized expression")]
 )
)
;; ================================================================================

