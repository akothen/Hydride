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
	[ (vqmovn_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 16) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2))
(displayln "Scaling case for vqmovn_s32")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 16) (equal? num_9 2))
(displayln "Scaling case for vqmovn_u16")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 8) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2))
(displayln "Scaling case for vqmovn_s16")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_o 32) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2))
(displayln "Scaling case for vqmovnd_s64")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2))
(displayln "Scaling case for vqmovun_s32")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2))
(displayln "Scaling case for vqmovun_s64")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 64) (equal? num_9 2))
(displayln "Scaling case for vqmovnd_u64")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_o 16) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2))
(displayln "Scaling case for vqmovns_s32")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2))
(displayln "Scaling case for vqmovund_s64")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 32) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2))
(displayln "Scaling case for vqmovn_s64")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 16) (equal? num_9 2))
(displayln "Scaling case for vqmovnh_u16")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_o 8) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2))
(displayln "Scaling case for vqmovnh_s16")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2))
(displayln "Scaling case for vqmovun_s16")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 32) (equal? num_9 2))
(displayln "Scaling case for vqmovn_u32")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 32) (equal? num_9 2))
(displayln "Scaling case for vqmovns_u32")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2))
(displayln "Scaling case for vqmovuns_s32")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2))
(displayln "Scaling case for vqmovunh_s16")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 64) (equal? num_9 2))
(displayln "Scaling case for vqmovn_u64")
(vqmovn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_o
num_6
num_7
prec_i
num_9
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmull_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vqdmull_s32")
(vqdmull_s32_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
prec_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vqdmulls_s32")
(vqdmull_s32_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
prec_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 4) (equal? num_4 4) (equal? num_5 0) (equal? num_6 4) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vqdmullh_s16")
(vqdmull_s32_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
prec_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vqdmull_s16")
(vqdmull_s32_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
prec_o
num_9
num_10
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmlsls_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 16) (equal? num_17 1) (equal? num_18 1))
(displayln "Scaling case for vqdmlsls_s32")
(vqdmlsls_s32_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i
prec_o
num_10
num_11
num_12
num_13
num_14
num_15
(* scale-factor num_16)
num_17
num_18
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 16) (equal? num_17 1) (equal? num_18 1))
(displayln "Scaling case for vqdmlsl_s32")
(vqdmlsls_s32_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i
prec_o
num_10
num_11
num_12
num_13
num_14
num_15
(* scale-factor num_16)
num_17
num_18
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 1))
(displayln "Scaling case for vqdmlsl_s16")
(vqdmlsls_s32_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i
prec_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 4) (equal? num_5 4) (equal? num_6 0) (equal? num_7 4) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 8) (equal? num_17 1) (equal? num_18 1))
(displayln "Scaling case for vqdmlslh_s16")
(vqdmlsls_s32_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i
prec_o
num_10
num_11
num_12
num_13
num_14
num_15
(* scale-factor num_16)
num_17
num_18
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vcgtzq_s8_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtzq_s8")
(vcgtzq_s8_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtzd_s64")
(vcgtzq_s8_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtz_s32")
(vcgtzq_s8_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtzq_s32")
(vcgtzq_s8_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtzq_s64")
(vcgtzq_s8_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtzq_s16")
(vcgtzq_s8_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtz_s64")
(vcgtzq_s8_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtz_s8")
(vcgtzq_s8_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtz_s16")
(vcgtzq_s8_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmlsl_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0))
(displayln "Scaling case for vmlsl_u32")
(vmlsl_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
prec_o
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vmlsl_s8")
(vmlsl_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
prec_o
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0))
(displayln "Scaling case for vmlsl_u8")
(vmlsl_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
prec_o
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vmlsl_s16")
(vmlsl_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
prec_o
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0))
(displayln "Scaling case for vmlsl_u16")
(vmlsl_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
prec_o
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vmlsl_s32")
(vmlsl_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
prec_o
num_9
num_10
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vtrn1_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8))
(displayln "Scaling case for vtrn1_u16")
(vtrn1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16))
(displayln "Scaling case for vtrn1_s32")
(vtrn1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8))
(displayln "Scaling case for vtrn1q_u16")
(vtrn1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 2) (equal? num_12 64) (equal? num_13 1) (equal? num_14 32))
(displayln "Scaling case for vtrn1q_u64")
(vtrn1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8))
(displayln "Scaling case for vtrn1_s16")
(vtrn1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4))
(displayln "Scaling case for vtrn1_u8")
(vtrn1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4))
(displayln "Scaling case for vtrn1q_u8")
(vtrn1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16))
(displayln "Scaling case for vtrn1q_s32")
(vtrn1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8))
(displayln "Scaling case for vtrn1q_s16")
(vtrn1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4))
(displayln "Scaling case for vtrn1_s8")
(vtrn1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 2) (equal? num_12 64) (equal? num_13 1) (equal? num_14 32))
(displayln "Scaling case for vtrn1q_s64")
(vtrn1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16))
(displayln "Scaling case for vtrn1q_u32")
(vtrn1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4))
(displayln "Scaling case for vtrn1q_s8")
(vtrn1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16))
(displayln "Scaling case for vtrn1_u32")
(vtrn1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vneg_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vneg_s32")
(vneg_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vnegd_s64")
(vneg_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vneg_s64")
(vneg_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vnegq_s32")
(vneg_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vnegq_s8")
(vneg_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vnegq_s64")
(vneg_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vneg_s8")
(vneg_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vneg_s16")
(vneg_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vnegq_s16")
(vneg_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vuqadd_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqadd_s64")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqaddb_s8")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqaddd_s64")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqaddq_s32")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqadd_u8")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqaddq_u16")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqadd_u16")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqaddd_u64")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqaddq_u64")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqaddb_u8")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqaddh_s16")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqaddq_u32")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqadd_s32")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqaddq_u8")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqadd_s8")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqadd_u32")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqadd_u64")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqaddh_u16")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqaddq_s16")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqadds_s32")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqaddq_s64")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqaddq_s8")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqadd_s16")
(vuqadd_s64_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqadds_u32")
(vuqadd_s64_dsl
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
	[ (vmlsl_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 16) (equal? num_8 1) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vmlsl_n_s16")
(vmlsl_n_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
num_8
prec_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 16) (equal? num_8 0) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0))
(displayln "Scaling case for vmlsl_n_u16")
(vmlsl_n_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
num_8
prec_o
num_10
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vaddl_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vaddl_u8")
(vaddl_u8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vaddl_s32")
(vaddl_u8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vaddl_s16")
(vaddl_u8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vaddl_u16")
(vaddl_u8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vaddl_u32")
(vaddl_u8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vaddl_s8")
(vaddl_u8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmlsl_high_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 16) (equal? num_13 2))
(displayln "Scaling case for vmlsl_high_n_u16")
(vmlsl_high_n_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2))
(displayln "Scaling case for vmlsl_high_n_s16")
(vmlsl_high_n_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 16) (equal? num_9 1) (equal? prec_o 32) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 32) (equal? num_18 1))
(displayln "Scaling case for vqdmlal_n_s16")
(vqdmlal_n_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i
num_9
prec_o
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vaddw_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2))
(displayln "Scaling case for vaddw_s32")
(vaddw_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
num_5
num_6
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2))
(displayln "Scaling case for vaddw_s8")
(vaddw_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2))
(displayln "Scaling case for vaddw_s16")
(vaddw_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
num_5
num_6
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2))
(displayln "Scaling case for vaddw_u32")
(vaddw_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
num_5
num_6
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2))
(displayln "Scaling case for vaddw_u8")
(vaddw_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2))
(displayln "Scaling case for vaddw_u16")
(vaddw_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
num_5
num_6
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmlal_high_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16) (equal? num_17 1) (equal? num_18 2))
(displayln "Scaling case for vqdmlal_high_s16")
(vqdmlal_high_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 64) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 2))
(displayln "Scaling case for vqdmlal_high_s32")
(vqdmlal_high_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmlal_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 32) (equal? num_8 0) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0))
(displayln "Scaling case for vmlal_n_u32")
(vmlal_n_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
num_8
prec_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 32) (equal? num_8 1) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vmlal_n_s32")
(vmlal_n_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
num_8
prec_o
num_10
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vceq_s16_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_2 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16))
(displayln "Scaling case for vceq_s16")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_2 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16))
(displayln "Scaling case for vceq_u16")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_2 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8))
(displayln "Scaling case for vceq_u8")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64))
(displayln "Scaling case for vceqd_s64")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64))
(displayln "Scaling case for vceq_u64")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64))
(displayln "Scaling case for vceqq_u64")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_2 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8))
(displayln "Scaling case for vceqq_u8")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_2 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16))
(displayln "Scaling case for vceqq_u16")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_2 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16))
(displayln "Scaling case for vceqq_s16")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32))
(displayln "Scaling case for vceqq_s32")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_2 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8))
(displayln "Scaling case for vceq_s8")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_2 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8))
(displayln "Scaling case for vceqq_s8")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32))
(displayln "Scaling case for vceq_u32")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64))
(displayln "Scaling case for vceq_s64")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64))
(displayln "Scaling case for vceqq_s64")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32))
(displayln "Scaling case for vceq_s32")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64))
(displayln "Scaling case for vceqd_u64")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32))
(displayln "Scaling case for vceqq_u32")
(vceq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vsubw_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2))
(displayln "Scaling case for vsubw_s8")
(vsubw_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2))
(displayln "Scaling case for vsubw_s16")
(vsubw_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
num_5
num_6
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2))
(displayln "Scaling case for vsubw_u8")
(vsubw_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2))
(displayln "Scaling case for vsubw_u32")
(vsubw_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
num_5
num_6
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2))
(displayln "Scaling case for vsubw_s32")
(vsubw_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
num_5
num_6
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2))
(displayln "Scaling case for vsubw_u16")
(vsubw_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
num_5
num_6
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vsubw_high_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 2) (equal? num_12 1))
(displayln "Scaling case for vsubw_high_s32")
(vsubw_high_s32_dsl
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
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 32) (equal? num_11 2) (equal? num_12 0))
(displayln "Scaling case for vsubw_high_u32")
(vsubw_high_s32_dsl
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
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 8) (equal? num_11 2) (equal? num_12 0))
(displayln "Scaling case for vsubw_high_u8")
(vsubw_high_s32_dsl
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
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 16) (equal? num_11 2) (equal? num_12 0))
(displayln "Scaling case for vsubw_high_u16")
(vsubw_high_s32_dsl
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
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 2) (equal? num_12 1))
(displayln "Scaling case for vsubw_high_s8")
(vsubw_high_s32_dsl
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
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 2) (equal? num_12 1))
(displayln "Scaling case for vsubw_high_s16")
(vsubw_high_s32_dsl
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
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vtrn2q_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4))
(displayln "Scaling case for vtrn2q_s8")
(vtrn2q_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8))
(displayln "Scaling case for vtrn2_u16")
(vtrn2q_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8))
(displayln "Scaling case for vtrn2q_u16")
(vtrn2q_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16))
(displayln "Scaling case for vtrn2_s32")
(vtrn2q_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16))
(displayln "Scaling case for vtrn2q_s32")
(vtrn2q_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 32) (equal? num_13 2) (equal? num_14 64) (equal? num_15 1) (equal? num_16 32))
(displayln "Scaling case for vtrn2q_u64")
(vtrn2q_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8))
(displayln "Scaling case for vtrn2q_s16")
(vtrn2q_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4))
(displayln "Scaling case for vtrn2_s8")
(vtrn2q_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16))
(displayln "Scaling case for vtrn2_u32")
(vtrn2q_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4))
(displayln "Scaling case for vtrn2q_u8")
(vtrn2q_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 32) (equal? num_13 2) (equal? num_14 64) (equal? num_15 1) (equal? num_16 32))
(displayln "Scaling case for vtrn2q_s64")
(vtrn2q_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8))
(displayln "Scaling case for vtrn2_s16")
(vtrn2q_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4))
(displayln "Scaling case for vtrn2_u8")
(vtrn2q_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16))
(displayln "Scaling case for vtrn2q_u32")
(vtrn2q_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmulq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_s8")
(vmulq_s8_dsl
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
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_s32")
(vmulq_s8_dsl
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
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_s8")
(vmulq_s8_dsl
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
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_u16")
(vmulq_s8_dsl
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
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_u32")
(vmulq_s8_dsl
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
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_u16")
(vmulq_s8_dsl
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
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_s16")
(vmulq_s8_dsl
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
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_u8")
(vmulq_s8_dsl
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
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_u8")
(vmulq_s8_dsl
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
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_s32")
(vmulq_s8_dsl
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
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_s16")
(vmulq_s8_dsl
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
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_u32")
(vmulq_s8_dsl
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
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmulq_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_n_s32")
(vmulq_n_s32_dsl
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
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_n_s32")
(vmulq_n_s32_dsl
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
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_n_u32")
(vmulq_n_s32_dsl
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
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_n_u32")
(vmulq_n_s32_dsl
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
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmax_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmax_u16")
(vmax_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmaxq_u32")
(vmax_u16_dsl
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
(vmax_u16_dsl
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
(vmax_u16_dsl
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
(vmax_u16_dsl
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
(vmax_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmax_u8")
(vmax_u16_dsl
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
(vmax_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmaxq_u16")
(vmax_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmax_u32")
(vmax_u16_dsl
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
(vmax_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmaxq_u8")
(vmax_u16_dsl
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
	[ (vclt_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vclt_s16")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcltq_u8")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vclt_u16")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcltq_s8")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcltq_s32")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcltq_s16")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcltq_u16")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcltq_s64")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcltd_s64")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcltd_u64")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vclt_s64")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vclt_u8")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vclt_u32")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vclt_s32")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcltq_u32")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vclt_u64")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vclt_s8")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcltq_u64")
(vclt_s16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmull_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 32) (equal? num_7 0) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmull_n_u32")
(vmull_n_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
num_7
prec_o
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 32) (equal? num_7 1) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vmull_n_s32")
(vmull_n_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
num_7
prec_o
num_9
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 16) (equal? num_8 1) (equal? prec_o 32) (equal? num_10 2) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vqdmull_n_s16")
(vqdmull_n_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
num_8
prec_o
num_10
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmlal_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 32) (equal? num_16 1) (equal? num_17 16) (equal? num_18 2))
(displayln "Scaling case for vqdmlal_high_n_s16")
(vqdmlal_high_n_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmlal_high_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 32) (equal? num_13 2))
(displayln "Scaling case for vmlal_high_n_u32")
(vmlal_high_n_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1) (equal? num_12 32) (equal? num_13 2))
(displayln "Scaling case for vmlal_high_n_s32")
(vmlal_high_n_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmlsq_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_n_u32")
(vmlsq_n_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_n_s32")
(vmlsq_n_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_n_s32")
(vmlsq_n_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_n_u32")
(vmlsq_n_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmlal_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0))
(displayln "Scaling case for vmlal_u16")
(vmlal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
prec_o
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vmlal_s16")
(vmlal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
prec_o
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vmlal_s8")
(vmlal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
prec_o
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0))
(displayln "Scaling case for vmlal_u8")
(vmlal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
prec_o
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vmlal_s32")
(vmlal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
prec_o
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0))
(displayln "Scaling case for vmlal_u32")
(vmlal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
prec_o
num_9
num_10
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vhaddq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhaddq_u16")
(vhaddq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhadd_u8")
(vhaddq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhadd_u16")
(vhaddq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhaddq_u8")
(vhaddq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhaddq_s16")
(vhaddq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhaddq_s8")
(vhaddq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhadd_u32")
(vhaddq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhadd_s8")
(vhaddq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhadd_s16")
(vhaddq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhaddq_u32")
(vhaddq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhadd_s32")
(vhaddq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhaddq_s32")
(vhaddq_u16_dsl
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
	[ (vceqz_s8_dsl vc_0 v1 vc_2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1))
(displayln "Scaling case for vceqz_s8")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1))
(displayln "Scaling case for vceqzq_u16")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1))
(displayln "Scaling case for vceqzq_u8")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1))
(displayln "Scaling case for vceqz_u64")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1))
(displayln "Scaling case for vceqzq_u64")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1))
(displayln "Scaling case for vceqzq_s32")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1))
(displayln "Scaling case for vceqzd_s64")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1))
(displayln "Scaling case for vceqzq_s64")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1))
(displayln "Scaling case for vceqzq_s8")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1))
(displayln "Scaling case for vceqz_u8")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1))
(displayln "Scaling case for vceqz_s16")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1))
(displayln "Scaling case for vceqzd_u64")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1))
(displayln "Scaling case for vceqz_s32")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1))
(displayln "Scaling case for vceqzq_u32")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1))
(displayln "Scaling case for vceqz_u16")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1))
(displayln "Scaling case for vceqz_s64")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1))
(displayln "Scaling case for vceqz_u32")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1))
(displayln "Scaling case for vceqzq_s16")
(vceqz_s8_dsl
vc_0
(arm:scale-expr v1 scale-factor)
vc_2
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqsubq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsubq_u16")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsub_s16")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsub_u8")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsubq_u32")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsub_s8")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsubd_u64")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsub_u32")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsubq_s16")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsub_u16")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsubb_s8")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsub_s32")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsubb_u8")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsubq_s64")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsubq_s8")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsub_s64")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsubq_u64")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsubd_s64")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsubs_s32")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsub_u64")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsubh_s16")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsubq_u8")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsubh_u16")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsubq_s32")
(vqsubq_u16_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsubs_u32")
(vqsubq_u16_dsl
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
	[ (vmlsl_high_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 2))
(displayln "Scaling case for vmlsl_high_s16")
(vmlsl_high_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 32) (equal? num_12 0) (equal? num_13 2))
(displayln "Scaling case for vmlsl_high_u32")
(vmlsl_high_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 8) (equal? num_12 0) (equal? num_13 2))
(displayln "Scaling case for vmlsl_high_u8")
(vmlsl_high_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0) (equal? num_13 2))
(displayln "Scaling case for vmlsl_high_u16")
(vmlsl_high_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 2))
(displayln "Scaling case for vmlsl_high_s32")
(vmlsl_high_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 2))
(displayln "Scaling case for vmlsl_high_s8")
(vmlsl_high_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vcle_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcle_u16")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcle_u64")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcleq_u32")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcleq_u16")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcle_s64")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcle_s32")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcle_u8")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcle_s8")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcleq_u64")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcleq_s8")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcle_u32")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcled_s64")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcleq_u8")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcled_u64")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcleq_s16")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcleq_s64")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcleq_s32")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcle_s16")
(vcle_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vsubl_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vsubl_s8")
(vsubl_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vsubl_u16")
(vsubl_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vsubl_s16")
(vsubl_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vsubl_u8")
(vsubl_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vsubl_u32")
(vsubl_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vsubl_s32")
(vsubl_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmlal_high_s8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 8) (equal? num_12 1) (equal? num_13 2))
(displayln "Scaling case for vmlal_high_s8")
(vmlal_high_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 8) (equal? num_12 0) (equal? num_13 2))
(displayln "Scaling case for vmlal_high_u8")
(vmlal_high_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 32) (equal? num_12 0) (equal? num_13 2))
(displayln "Scaling case for vmlal_high_u32")
(vmlal_high_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 16) (equal? num_12 1) (equal? num_13 2))
(displayln "Scaling case for vmlal_high_s16")
(vmlal_high_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 16) (equal? num_12 0) (equal? num_13 2))
(displayln "Scaling case for vmlal_high_u16")
(vmlal_high_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1) (equal? num_11 32) (equal? num_12 1) (equal? num_13 2))
(displayln "Scaling case for vmlal_high_s32")
(vmlal_high_s8_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmls_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_n_u16")
(vmls_n_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_n_s16")
(vmls_n_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_n_u16")
(vmls_n_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_n_s16")
(vmls_n_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmlsl_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 32) (equal? num_18 2))
(displayln "Scaling case for vqdmlsl_high_n_s32")
(vqdmlsl_high_n_s32_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vzip1_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8))
(displayln "Scaling case for vzip1_u16")
(vzip1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8))
(displayln "Scaling case for vzip1q_s16")
(vzip1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16))
(displayln "Scaling case for vzip1q_u32")
(vzip1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4))
(displayln "Scaling case for vzip1_u8")
(vzip1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16))
(displayln "Scaling case for vzip1_s32")
(vzip1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16))
(displayln "Scaling case for vzip1q_s32")
(vzip1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8))
(displayln "Scaling case for vzip1_s16")
(vzip1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16))
(displayln "Scaling case for vzip1_u32")
(vzip1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4))
(displayln "Scaling case for vzip1_s8")
(vzip1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8))
(displayln "Scaling case for vzip1q_u16")
(vzip1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4))
(displayln "Scaling case for vzip1q_s8")
(vzip1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4))
(displayln "Scaling case for vzip1q_u8")
(vzip1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 64) (equal? num_12 1) (equal? num_13 32))
(displayln "Scaling case for vzip1q_s64")
(vzip1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 64) (equal? num_12 1) (equal? num_13 32))
(displayln "Scaling case for vzip1q_u64")
(vzip1_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmlsl_high_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1) (equal? num_12 32) (equal? num_13 2))
(displayln "Scaling case for vmlsl_high_n_s32")
(vmlsl_high_n_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 32) (equal? num_13 2))
(displayln "Scaling case for vmlsl_high_n_u32")
(vmlsl_high_n_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmla_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_n_s16")
(vmla_n_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_n_u16")
(vmla_n_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_n_s16")
(vmla_n_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_n_u16")
(vmla_n_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vaddq_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for vaddq_s16")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for vadd_s8")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for vadd_s16")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vaddq_s64")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vaddd_u64")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for vadd_u8")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vaddq_u64")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vaddd_s64")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for vaddq_s8")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for vaddq_u32")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for vaddq_u8")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vadd_u64")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for vadd_s32")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for vadd_u32")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vadd_s64")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for vadd_u16")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for vaddq_s32")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for vaddq_u16")
(vaddq_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmull_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmull_u32")
(vmull_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmull_u8")
(vmull_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmull_u16")
(vmull_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vmull_s8")
(vmull_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vmull_s16")
(vmull_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vmull_s32")
(vmull_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
num_9
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vpmin_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? num_15 8) (equal? num_16 2))
(displayln "Scaling case for vpmin_s8")
(vpmin_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? num_15 16) (equal? num_16 2))
(displayln "Scaling case for vpmin_s16")
(vpmin_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? num_15 32) (equal? num_16 2))
(displayln "Scaling case for vpmin_s32")
(vpmin_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? num_15 16) (equal? num_16 2))
(displayln "Scaling case for vpmin_u16")
(vpmin_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 32) (equal? num_16 2))
(displayln "Scaling case for vpminq_u32")
(vpmin_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? num_15 32) (equal? num_16 2))
(displayln "Scaling case for vpminq_s32")
(vpmin_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? num_15 16) (equal? num_16 2))
(displayln "Scaling case for vpminq_u16")
(vpmin_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? num_15 8) (equal? num_16 2))
(displayln "Scaling case for vpmin_u8")
(vpmin_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? num_15 8) (equal? num_16 2))
(displayln "Scaling case for vpminq_u8")
(vpmin_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? num_15 16) (equal? num_16 2))
(displayln "Scaling case for vpminq_s16")
(vpmin_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 32) (equal? num_16 2))
(displayln "Scaling case for vpmin_u32")
(vpmin_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? num_15 8) (equal? num_16 2))
(displayln "Scaling case for vpminq_s8")
(vpmin_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmla_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_n_u32")
(vmla_n_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_n_s32")
(vmla_n_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_n_s32")
(vmla_n_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_n_u32")
(vmla_n_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmin_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmin_s32")
(vmin_s32_dsl
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
(displayln "Scaling case for vminq_s8")
(vmin_s32_dsl
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
(vmin_s32_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmin_u8")
(vmin_s32_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmin_u16")
(vmin_s32_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vminq_u16")
(vmin_s32_dsl
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
(vmin_s32_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmin_u32")
(vmin_s32_dsl
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
(vmin_s32_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vminq_u32")
(vmin_s32_dsl
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
(vmin_s32_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vminq_u8")
(vmin_s32_dsl
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
	[ (vcltz_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltz_s32")
(vcltz_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltzq_s16")
(vcltz_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltzq_s32")
(vcltz_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltzq_s64")
(vcltz_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltz_s16")
(vcltz_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltzq_s8")
(vcltz_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltz_s8")
(vcltz_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltzd_s64")
(vcltz_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltz_s64")
(vcltz_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqrdmulhs_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 8) (equal? num_6 8) (equal? num_7 0) (equal? num_8 8) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulhs_s32")
(vqrdmulhs_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 4) (equal? num_6 4) (equal? num_7 0) (equal? num_8 4) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulhh_s16")
(vqrdmulhs_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqdmulhq_s32")
(vqrdmulhs_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 4) (equal? num_6 4) (equal? num_7 0) (equal? num_8 4) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqdmulhh_s16")
(vqrdmulhs_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulhq_s32")
(vqrdmulhs_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulh_s16")
(vqrdmulhs_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqdmulh_s16")
(vqrdmulhs_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulh_s32")
(vqrdmulhs_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqdmulh_s32")
(vqrdmulhs_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulhq_s16")
(vqrdmulhs_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 8) (equal? num_6 8) (equal? num_7 0) (equal? num_8 8) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqdmulhs_s32")
(vqrdmulhs_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqdmulhq_s16")
(vqrdmulhs_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vzip2q_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 2) (equal? num_13 64) (equal? num_14 64) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 32) (equal? num_19 64))
(displayln "Scaling case for vzip2q_u64")
(vzip2q_u64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
num_19
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 8) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8))
(displayln "Scaling case for vzip2q_s8")
(vzip2q_u64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
num_19
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 4) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 4) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8))
(displayln "Scaling case for vzip2_u8")
(vzip2q_u64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
num_19
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 2) (equal? num_13 64) (equal? num_14 64) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 32) (equal? num_19 64))
(displayln "Scaling case for vzip2q_s64")
(vzip2q_u64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
num_19
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 4) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 4) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16))
(displayln "Scaling case for vzip2q_u16")
(vzip2q_u64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
num_19
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32))
(displayln "Scaling case for vzip2_u32")
(vzip2q_u64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
num_19
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 4) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 4) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8))
(displayln "Scaling case for vzip2_s8")
(vzip2q_u64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
num_19
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32))
(displayln "Scaling case for vzip2_s32")
(vzip2q_u64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
num_19
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 8) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8))
(displayln "Scaling case for vzip2q_u8")
(vzip2q_u64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
num_19
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 2) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 2) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32))
(displayln "Scaling case for vzip2q_s32")
(vzip2q_u64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
num_19
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 2) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 2) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16))
(displayln "Scaling case for vzip2_s16")
(vzip2q_u64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
num_19
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 2) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 2) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16))
(displayln "Scaling case for vzip2_u16")
(vzip2q_u64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
num_19
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 2) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 2) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32))
(displayln "Scaling case for vzip2q_u32")
(vzip2q_u64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
num_19
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 4) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 4) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16))
(displayln "Scaling case for vzip2q_s16")
(vzip2q_u64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
num_19
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vrhaddq_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vrhaddq_s16")
(vrhaddq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vrhaddq_s32")
(vrhaddq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vrhaddq_u8")
(vrhaddq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vrhaddq_u32")
(vrhaddq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vrhadd_u8")
(vrhaddq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vrhadd_s16")
(vrhaddq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vrhadd_u32")
(vrhaddq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vrhadd_u16")
(vrhaddq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vrhadd_s32")
(vrhaddq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vrhaddq_u16")
(vrhaddq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vrhaddq_s8")
(vrhaddq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vrhadd_s8")
(vrhaddq_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmul_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_n_u16")
(vmul_n_u16_dsl
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
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_n_s16")
(vmul_n_u16_dsl
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
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_n_s16")
(vmul_n_u16_dsl
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
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_n_u16")
(vmul_n_u16_dsl
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
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmulhq_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1))
(displayln "Scaling case for vqdmulhq_n_s32")
(vqdmulhq_n_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulhq_n_s32")
(vqdmulhq_n_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulh_n_s32")
(vqdmulhq_n_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1))
(displayln "Scaling case for vqdmulh_n_s32")
(vqdmulhq_n_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmlsl_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 32) (equal? num_8 1) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vmlsl_n_s32")
(vmlsl_n_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
num_8
prec_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 32) (equal? num_8 0) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0))
(displayln "Scaling case for vmlsl_n_u32")
(vmlsl_n_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
num_8
prec_o
num_10
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqneg_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqneg_s64")
(vqneg_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqneg_s8")
(vqneg_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqnegq_s8")
(vqneg_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqnegq_s64")
(vqneg_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqnegb_s8")
(vqneg_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqnegq_s32")
(vqneg_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqnegs_s32")
(vqneg_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqnegq_s16")
(vqneg_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqneg_s32")
(vqneg_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqnegh_s16")
(vqneg_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqneg_s16")
(vqneg_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqnegd_s64")
(vqneg_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vaddw_high_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 8) (equal? num_11 2) (equal? num_12 0))
(displayln "Scaling case for vaddw_high_u8")
(vaddw_high_u8_dsl
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
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 16) (equal? num_11 2) (equal? num_12 0))
(displayln "Scaling case for vaddw_high_u16")
(vaddw_high_u8_dsl
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
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 2) (equal? num_12 1))
(displayln "Scaling case for vaddw_high_s8")
(vaddw_high_u8_dsl
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
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 32) (equal? num_11 2) (equal? num_12 0))
(displayln "Scaling case for vaddw_high_u32")
(vaddw_high_u8_dsl
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
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 2) (equal? num_12 1))
(displayln "Scaling case for vaddw_high_s32")
(vaddw_high_u8_dsl
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
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 2) (equal? num_12 1))
(displayln "Scaling case for vaddw_high_s16")
(vaddw_high_u8_dsl
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
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmlsl_high_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 32) (equal? num_16 1) (equal? num_17 16) (equal? num_18 2))
(displayln "Scaling case for vqdmlsl_high_n_s16")
(vqdmlsl_high_n_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 16) (equal? num_9 1) (equal? prec_o 32) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 32) (equal? num_18 1))
(displayln "Scaling case for vqdmlsl_n_s16")
(vqdmlsl_n_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i
num_9
prec_o
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 32) (equal? num_9 1) (equal? prec_o 64) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 16) (equal? num_18 1))
(displayln "Scaling case for vqdmlal_n_s32")
(vqdmlal_n_s32_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i
num_9
prec_o
num_11
num_12
num_13
num_14
num_15
num_16
(* scale-factor num_17)
num_18
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vraddhn_u64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000080000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2))
(displayln "Scaling case for vraddhn_u64")
(vraddhn_u64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2))
(displayln "Scaling case for vaddhn_u32")
(vraddhn_u64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2))
(displayln "Scaling case for vaddhn_u64")
(vraddhn_u64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000080000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2))
(displayln "Scaling case for vraddhn_s64")
(vraddhn_u64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000008000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2))
(displayln "Scaling case for vraddhn_u32")
(vraddhn_u64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2))
(displayln "Scaling case for vaddhn_u16")
(vraddhn_u64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000080 (bitvector 16)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2))
(displayln "Scaling case for vraddhn_s16")
(vraddhn_u64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2))
(displayln "Scaling case for vaddhn_s32")
(vraddhn_u64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2))
(displayln "Scaling case for vaddhn_s64")
(vraddhn_u64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000008000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2))
(displayln "Scaling case for vraddhn_s32")
(vraddhn_u64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2))
(displayln "Scaling case for vaddhn_s16")
(vraddhn_u64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000080 (bitvector 16)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2))
(displayln "Scaling case for vraddhn_u16")
(vraddhn_u64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmlal_high_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2))
(displayln "Scaling case for vmlal_high_n_s16")
(vmlal_high_n_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 16) (equal? num_13 2))
(displayln "Scaling case for vmlal_high_n_u16")
(vmlal_high_n_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vclezq_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclezq_s64")
(vclezq_s64_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclezq_s8")
(vclezq_s64_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclezq_s16")
(vclezq_s64_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclezd_s64")
(vclezq_s64_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclezq_s32")
(vclezq_s64_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclez_s16")
(vclezq_s64_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclez_s8")
(vclezq_s64_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclez_s64")
(vclezq_s64_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclez_s32")
(vclezq_s64_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmulh_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1))
(displayln "Scaling case for vqdmulh_n_s16")
(vqdmulh_n_s16_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1))
(displayln "Scaling case for vqdmulhq_n_s16")
(vqdmulh_n_s16_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 16) (equal? num_6 16) (equal? num_7 0) (equal? num_8 16) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulh_n_s16")
(vqdmulh_n_s16_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulhq_n_s16")
(vqdmulh_n_s16_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(arm:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmls_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_s16")
(vmls_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_u32")
(vmls_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_u32")
(vmls_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_s32")
(vmls_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_u16")
(vmls_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_u16")
(vmls_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_s16")
(vmls_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_u8")
(vmls_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_s32")
(vmls_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_s8")
(vmls_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_u8")
(vmls_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_s8")
(vmls_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmla_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_u32")
(vmla_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_s16")
(vmla_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_s8")
(vmla_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_u8")
(vmla_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_u16")
(vmla_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_u32")
(vmla_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_s16")
(vmla_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_s32")
(vmla_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_u16")
(vmla_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_s8")
(vmla_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_u8")
(vmla_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_s32")
(vmla_u32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqaddq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqaddq_u16")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqaddh_u16")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqaddq_u64")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqadd_s8")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqaddq_s32")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqaddd_s64")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqaddq_s64")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqaddh_s16")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqadds_s32")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqaddq_u8")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqadd_u32")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqaddb_s8")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqadd_s32")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqadd_s64")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqaddq_s8")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqadd_s16")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqaddq_u32")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqaddd_u64")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqadd_u16")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqadd_u64")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqadds_u32")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqadd_u8")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqaddb_u8")
(vqaddq_u16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqaddq_s16")
(vqaddq_u16_dsl
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
	[ (vpmax_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? num_15 8) (equal? num_16 2))
(displayln "Scaling case for vpmax_s8")
(vpmax_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? num_15 16) (equal? num_16 2))
(displayln "Scaling case for vpmax_u16")
(vpmax_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 32) (equal? num_16 2))
(displayln "Scaling case for vpmax_u32")
(vpmax_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? num_15 32) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_s32")
(vpmax_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? num_15 16) (equal? num_16 2))
(displayln "Scaling case for vpmax_s16")
(vpmax_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? num_15 8) (equal? num_16 2))
(displayln "Scaling case for vpmax_u8")
(vpmax_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? num_15 32) (equal? num_16 2))
(displayln "Scaling case for vpmax_s32")
(vpmax_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? num_15 8) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_u8")
(vpmax_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? num_15 16) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_s16")
(vpmax_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? num_15 32) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_u32")
(vpmax_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? num_15 8) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_s8")
(vpmax_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? num_15 16) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_u16")
(vpmax_s8_dsl
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
num_11
num_12
num_13
num_14
num_15
num_16
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 32) (equal? num_8 1) (equal? prec_o 64) (equal? num_10 2) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vqdmull_n_s32")
(vqdmull_n_s32_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
num_8
prec_o
num_10
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vhsub_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhsub_s16")
(vhsub_s16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhsubq_u32")
(vhsub_s16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhsub_s8")
(vhsub_s16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhsub_u8")
(vhsub_s16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhsubq_s8")
(vhsub_s16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhsub_u32")
(vhsub_s16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhsubq_s16")
(vhsub_s16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhsub_s32")
(vhsub_s16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhsub_u16")
(vhsub_s16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhsubq_u8")
(vhsub_s16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhsubq_u16")
(vhsub_s16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhsubq_s32")
(vhsub_s16_dsl
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
	[ (vmvn_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8))
(displayln "Scaling case for vmvn_s32")
(vmvn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 8))
(displayln "Scaling case for vmvnq_s16")
(vmvn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8))
(displayln "Scaling case for vmvn_u8")
(vmvn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 8))
(displayln "Scaling case for vmvnq_u8")
(vmvn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8))
(displayln "Scaling case for vmvn_u32")
(vmvn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 8))
(displayln "Scaling case for vmvnq_u32")
(vmvn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8))
(displayln "Scaling case for vmvn_s16")
(vmvn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 8))
(displayln "Scaling case for vmvnq_s32")
(vmvn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 8))
(displayln "Scaling case for vmvnq_s8")
(vmvn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8))
(displayln "Scaling case for vmvn_u16")
(vmvn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8))
(displayln "Scaling case for vmvn_s8")
(vmvn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 8))
(displayln "Scaling case for vmvnq_u16")
(vmvn_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqabss_s32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabss_s32")
(vqabss_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabsq_s64")
(vqabss_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabsq_s16")
(vqabss_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabsd_s64")
(vqabss_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabsh_s16")
(vqabss_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabs_s32")
(vqabss_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabsq_s32")
(vqabss_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabs_s8")
(vqabss_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabsb_s8")
(vqabss_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabsq_s8")
(vqabss_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabs_s16")
(vqabss_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabs_s64")
(vqabss_s32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vtstq_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16))
(displayln "Scaling case for vtstq_u16")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64))
(displayln "Scaling case for vtst_u64")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8))
(displayln "Scaling case for vtstq_u8")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64))
(displayln "Scaling case for vtst_s64")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16))
(displayln "Scaling case for vtst_u16")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32))
(displayln "Scaling case for vtst_s32")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32))
(displayln "Scaling case for vtstq_s32")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8))
(displayln "Scaling case for vtst_u8")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32))
(displayln "Scaling case for vtst_u32")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16))
(displayln "Scaling case for vtst_s16")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8))
(displayln "Scaling case for vtstq_s8")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64))
(displayln "Scaling case for vtstd_u64")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32))
(displayln "Scaling case for vtstq_u32")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64))
(displayln "Scaling case for vtstq_s64")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64))
(displayln "Scaling case for vtstd_s64")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8))
(displayln "Scaling case for vtst_s8")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16))
(displayln "Scaling case for vtstq_s16")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64))
(displayln "Scaling case for vtstq_u64")
(vtstq_u16_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmull_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 16) (equal? num_7 1) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vmull_n_s16")
(vmull_n_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
num_7
prec_o
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i 16) (equal? num_7 0) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmull_n_u16")
(vmull_n_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
num_7
prec_o
num_9
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vcgezq_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgezq_s32")
(vcgezq_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgezd_s64")
(vcgezq_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgezq_s64")
(vcgezq_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgezq_s8")
(vcgezq_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgez_s64")
(vcgezq_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgez_s8")
(vcgezq_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgez_s16")
(vcgezq_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgezq_s16")
(vcgezq_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgez_s32")
(vcgezq_s32_dsl
vc_0
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vsubq_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for vsubq_s32")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for vsub_s8")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for vsubq_u8")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vsubq_s64")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for vsub_u32")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vsub_s64")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for vsubq_s16")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vsub_u64")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for vsub_s32")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for vsubq_u32")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for vsub_u8")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vsubd_u64")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vsubd_s64")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for vsubq_u16")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vsubq_u64")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for vsub_u16")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for vsubq_s8")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for vsub_s16")
(vsubq_s32_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vcge_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcge_s32")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcged_s64")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcge_s64")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcge_u64")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgeq_s16")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgeq_u8")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgeq_s64")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgeq_s32")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgeq_u64")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgeq_u32")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcge_s16")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcged_u64")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgeq_s8")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgeq_u16")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcge_s8")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcge_u32")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcge_u8")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcge_u16")
(vcge_s32_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vsubhn_s64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2))
(displayln "Scaling case for vsubhn_s64")
(vsubhn_s64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2))
(displayln "Scaling case for vsubhn_u16")
(vsubhn_s64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2))
(displayln "Scaling case for vsubhn_s32")
(vsubhn_s64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000080 (bitvector 16)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2))
(displayln "Scaling case for vrsubhn_u16")
(vsubhn_s64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000080 (bitvector 16)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2))
(displayln "Scaling case for vrsubhn_s16")
(vsubhn_s64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2))
(displayln "Scaling case for vsubhn_s16")
(vsubhn_s64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000080000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2))
(displayln "Scaling case for vrsubhn_s64")
(vsubhn_s64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000080000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2))
(displayln "Scaling case for vrsubhn_u64")
(vsubhn_s64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000008000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2))
(displayln "Scaling case for vrsubhn_u32")
(vsubhn_s64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2))
(displayln "Scaling case for vsubhn_u32")
(vsubhn_s64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2))
(displayln "Scaling case for vsubhn_u64")
(vsubhn_s64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000008000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2))
(displayln "Scaling case for vrsubhn_s32")
(vsubhn_s64_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_o
num_8
num_9
num_10
prec_i
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vabs_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabs_s64")
(vabs_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabs_s8")
(vabs_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabsq_s16")
(vabs_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabs_s16")
(vabs_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabsd_s64")
(vabs_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabsq_s32")
(vabs_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabsq_s8")
(vabs_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabs_s32")
(vabs_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabsq_s64")
(vabs_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmlsl_high_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 64) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 2))
(displayln "Scaling case for vqdmlsl_high_s32")
(vqdmlsl_high_s32_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16) (equal? num_17 1) (equal? num_18 2))
(displayln "Scaling case for vqdmlsl_high_s16")
(vqdmlsl_high_s32_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmlal_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 16) (equal? num_8 0) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0))
(displayln "Scaling case for vmlal_n_u16")
(vmlal_n_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
num_8
prec_o
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 16) (equal? num_8 1) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vmlal_n_s16")
(vmlal_n_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i
num_8
prec_o
num_10
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmlal_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 1))
(displayln "Scaling case for vqdmlal_s16")
(vqdmlal_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i
prec_o
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 4) (equal? num_5 4) (equal? num_6 0) (equal? num_7 4) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 8) (equal? num_17 1) (equal? num_18 1))
(displayln "Scaling case for vqdmlalh_s16")
(vqdmlal_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i
prec_o
num_10
num_11
num_12
num_13
num_14
num_15
(* scale-factor num_16)
num_17
num_18
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 16) (equal? num_17 1) (equal? num_18 1))
(displayln "Scaling case for vqdmlal_s32")
(vqdmlal_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i
prec_o
num_10
num_11
num_12
num_13
num_14
num_15
(* scale-factor num_16)
num_17
num_18
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 16) (equal? num_17 1) (equal? num_18 1))
(displayln "Scaling case for vqdmlals_s32")
(vqdmlal_s16_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i
prec_o
num_10
num_11
num_12
num_13
num_14
num_15
(* scale-factor num_16)
num_17
num_18
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmovn_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8) (equal? num_6 2))
(displayln "Scaling case for vmovn_s16")
(vmovn_s16_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16) (equal? num_6 2))
(displayln "Scaling case for vmovn_u32")
(vmovn_s16_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 32) (equal? num_6 2))
(displayln "Scaling case for vmovn_s64")
(vmovn_s16_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 32) (equal? num_6 2))
(displayln "Scaling case for vmovn_u64")
(vmovn_s16_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16) (equal? num_6 2))
(displayln "Scaling case for vmovn_s32")
(vmovn_s16_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 8) (equal? num_6 2))
(displayln "Scaling case for vmovn_u16")
(vmovn_s16_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vcgtd_u64_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgtd_u64")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgtq_s16")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgtd_s64")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgtq_u16")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgt_s16")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgtq_u8")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgt_u8")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgt_u32")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgt_u64")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgtq_s8")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgtq_u32")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgtq_u64")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgtq_s32")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgt_s8")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgt_s32")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgtq_s64")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgt_s64")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgt_u16")
(vcgtd_u64_dsl
vc_0
vc_1
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmlal_high_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 32) (equal? num_18 2))
(displayln "Scaling case for vqdmlal_high_n_s32")
(vqdmlal_high_n_s32_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
num_18
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 32) (equal? num_9 1) (equal? prec_o 64) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 16) (equal? num_18 1))
(displayln "Scaling case for vqdmlsl_n_s32")
(vqdmlsl_n_s32_dsl
vc_0
(arm:scale-expr v1 scale-factor)
(arm:scale-expr v2 scale-factor)
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i
num_9
prec_o
num_11
num_12
num_13
num_14
num_15
num_16
(* scale-factor num_17)
num_18
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[_ (error "Unrecognized expression")]
 )
)
;; ================================================================================

