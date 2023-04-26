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
(require hydride/ir/arm/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                Hydride Scale Expression 
;; ================================================================================
(define (arm:scale-expr prog scale-factor)
 (destruct prog
	[(reg id) (reg id) ]
	[(lit v) (lit (apply concat (for/list ([i (range scale-factor)]) v) ) )]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(
		vector-two-input-swizzle_dsl
		(arm:scale-expr v0 scale-factor)
		(arm:scale-expr v1 scale-factor)
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
		(arm:scale-expr v0 scale-factor)
		(arm:scale-expr v1 scale-factor)
		(* scale-factor size_i_o)
		prec_i_o
		)
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(
		interleave-vector_dsl
		(arm:scale-expr v0 scale-factor)
		(* scale-factor size_i_o)
		prec_i_o
		)
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(
		deinterleave-vector_dsl
		(arm:scale-expr v0 scale-factor)
		(* scale-factor size_i_o)
		prec_i_o
		)
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(
		llvm_shuffle_vectors_dsl
		(arm:scale-expr v0 scale-factor)
		(arm:scale-expr v1 scale-factor)
		num_2
		prec_i_o
		(arm:scale-expr v4 scale-factor)
		num_5
		)
	]
	[ (vpmin_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2))
(displayln "Scaling case for vpmin_u16")
(vpmin_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2))
(displayln "Scaling case for vpminq_u16")
(vpmin_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2))
(displayln "Scaling case for vpmin_s8")
(vpmin_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2))
(displayln "Scaling case for vpminq_u8")
(vpmin_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2))
(displayln "Scaling case for vpminq_u32")
(vpmin_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2))
(displayln "Scaling case for vpminq_s16")
(vpmin_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2))
(displayln "Scaling case for vpminq_s32")
(vpmin_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2))
(displayln "Scaling case for vpmin_u32")
(vpmin_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2))
(displayln "Scaling case for vpminq_s8")
(vpmin_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2))
(displayln "Scaling case for vpmin_s16")
(vpmin_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2))
(displayln "Scaling case for vpmin_u8")
(vpmin_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2))
(displayln "Scaling case for vpmin_s32")
(vpmin_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vpmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_u16")
(vpmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2))
(displayln "Scaling case for vpmax_u32")
(vpmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2))
(displayln "Scaling case for vpmax_s16")
(vpmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_u32")
(vpmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2))
(displayln "Scaling case for vpmax_s8")
(vpmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_u8")
(vpmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_s32")
(vpmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2))
(displayln "Scaling case for vpmax_u16")
(vpmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_s8")
(vpmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2))
(displayln "Scaling case for vpmax_u8")
(vpmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_s16")
(vpmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2))
(displayln "Scaling case for vpmax_s32")
(vpmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
num_9
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmaxq_u16")
(vmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmaxq_s16")
(vmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmax_u32")
(vmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmax_s16")
(vmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmax_u16")
(vmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmax_u8")
(vmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmaxq_u8")
(vmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmaxq_s8")
(vmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmaxq_u32")
(vmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmaxq_s32")
(vmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmax_s32")
(vmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmax_s8")
(vmaxq_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vminq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vminq_s8")
(vminq_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmin_s8")
(vminq_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmin_u16")
(vminq_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmin_s32")
(vminq_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vminq_u32")
(vminq_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vminq_u16")
(vminq_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmin_u32")
(vminq_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmin_s16")
(vminq_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vminq_s32")
(vminq_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmin_u8")
(vminq_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vminq_s16")
(vminq_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vminq_u8")
(vminq_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[_ (error "Unrecognized expression")]
 )
)
;; ================================================================================

