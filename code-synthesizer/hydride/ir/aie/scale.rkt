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
	[ (add_v64uint8_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 0) (equal? prec_i_o 64))
(displayln "Scaling case for add_v16acc64")
(add_v64uint8_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 0) (equal? prec_i_o 32))
(displayln "Scaling case for add_v16int32")
(add_v64uint8_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 0) (equal? prec_i_o 32))
(displayln "Scaling case for add_v16uint32")
(add_v64uint8_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i_o 32))
(displayln "Scaling case for add_v32acc32")
(add_v64uint8_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i_o 16))
(displayln "Scaling case for add_v32int16")
(add_v64uint8_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i_o 16))
(displayln "Scaling case for add_v32uint16")
(add_v64uint8_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? prec_i_o 8))
(displayln "Scaling case for add_v64int8")
(add_v64uint8_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? prec_i_o 8))
(displayln "Scaling case for add_v64uint8")
(add_v64uint8_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (mul_elem_32_v32acc32_dsl v0 v1 size_i_o prec_i prec_o)
		(cond 
		[(and  (equal? size_i_o 0) (equal? prec_i 16) (equal? prec_o 64))
(displayln "Scaling case for mul_elem_16_2_conf_v16acc64")
(mul_elem_32_v32acc32_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i
prec_o
)
]
		[(and  (equal? size_i_o 0) (equal? prec_i 16) (equal? prec_o 64))
(displayln "Scaling case for mul_elem_16_2_v16acc64")
(mul_elem_32_v32acc32_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i
prec_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i 8) (equal? prec_o 32))
(displayln "Scaling case for mul_elem_32_2_conf_v32acc32")
(mul_elem_32_v32acc32_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i
prec_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i 8) (equal? prec_o 32))
(displayln "Scaling case for mul_elem_32_2_v32acc32")
(mul_elem_32_v32acc32_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i
prec_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i 16) (equal? prec_o 32))
(displayln "Scaling case for mul_elem_32_conf_v32acc32")
(mul_elem_32_v32acc32_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i
prec_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i 16) (equal? prec_o 32))
(displayln "Scaling case for mul_elem_32_v32acc32")
(mul_elem_32_v32acc32_dsl
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
	[ (sub_v64uint8_dsl v0 v1 size_i_o prec_i_o)
		(cond 
		[(and  (equal? size_i_o 0) (equal? prec_i_o 64))
(displayln "Scaling case for sub_v16acc64")
(sub_v64uint8_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 0) (equal? prec_i_o 32))
(displayln "Scaling case for sub_v16int32")
(sub_v64uint8_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 0) (equal? prec_i_o 32))
(displayln "Scaling case for sub_v16uint32")
(sub_v64uint8_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i_o 32))
(displayln "Scaling case for sub_v32acc32")
(sub_v64uint8_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i_o 16))
(displayln "Scaling case for sub_v32int16")
(sub_v64uint8_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? prec_i_o 16))
(displayln "Scaling case for sub_v32uint16")
(sub_v64uint8_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? prec_i_o 8))
(displayln "Scaling case for sub_v64int8")
(sub_v64uint8_dsl
(aie:scale-expr v0 scale-factor)
(aie:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? prec_i_o 8))
(displayln "Scaling case for sub_v64uint8")
(sub_v64uint8_dsl
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

