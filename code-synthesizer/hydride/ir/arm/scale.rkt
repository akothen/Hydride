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
	[ (llvm-zext_dsl v0 size_i size_o)
		(
		llvm-zext_dsl
		(arm:scale-expr v0 scale-factor)
		(* scale-factor size_i)
		(* scale-factor size_o)
		)
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(
		scalar_splat_dsl
		(arm:scale-expr v0 scale-factor)
		(* scale-factor size_i)
		(* scale-factor size_o)
		)
	]
	[ (vqrdmulh_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulh_s32")
(vqrdmulh_s32_dsl
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
(displayln "Scaling case for vqrdmulhs_s32")
(vqrdmulh_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulh_s16")
(vqrdmulh_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulhq_s32")
(vqrdmulh_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulhq_s16")
(vqrdmulh_s32_dsl
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
(displayln "Scaling case for vqrdmulhh_s16")
(vqrdmulh_s32_dsl
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
	[ (vqshrn_n_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 2))
(displayln "Scaling case for vqshrn_n_s64")
(vqshrn_n_s64_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 2))
(displayln "Scaling case for vqshrun_n_s32")
(vqshrn_n_s64_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 2))
(displayln "Scaling case for vqshrns_n_s32")
(vqshrn_n_s64_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 2))
(displayln "Scaling case for vqshruns_n_s32")
(vqshrn_n_s64_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 2))
(displayln "Scaling case for vqshrnh_n_s16")
(vqshrn_n_s64_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 2))
(displayln "Scaling case for vqshrund_n_s64")
(vqshrn_n_s64_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 2))
(displayln "Scaling case for vqshrunh_n_s16")
(vqshrn_n_s64_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 2))
(displayln "Scaling case for vqshrun_n_s16")
(vqshrn_n_s64_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 2))
(displayln "Scaling case for vqshrnd_n_s64")
(vqshrn_n_s64_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 16) (equal? num_11 2))
(displayln "Scaling case for vqshrn_n_s16")
(vqshrn_n_s64_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 1) (equal? prec_i 64) (equal? num_11 2))
(displayln "Scaling case for vqshrun_n_s64")
(vqshrn_n_s64_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? prec_i 32) (equal? num_11 2))
(displayln "Scaling case for vqshrn_n_s32")
(vqshrn_n_s64_dsl
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
prec_i
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vcltzq_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltzq_s64")
(vcltzq_s64_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltz_s16")
(vcltzq_s64_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltzd_s64")
(vcltzq_s64_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltz_s32")
(vcltzq_s64_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltzq_s8")
(vcltzq_s64_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltz_s8")
(vcltzq_s64_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltzq_s32")
(vcltzq_s64_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltz_s64")
(vcltzq_s64_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcltzq_s16")
(vcltzq_s64_dsl
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
	[ (vsub_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for vsub_s32")
(vsub_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for vsub_u8")
(vsub_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for vsub_s16")
(vsub_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vsubd_s64")
(vsub_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for vsubq_u32")
(vsub_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for vsubq_s16")
(vsub_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vsub_s64")
(vsub_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for vsubq_s32")
(vsub_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for vsub_s8")
(vsub_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vsubq_s64")
(vsub_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for vsub_u16")
(vsub_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vsub_u64")
(vsub_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vsubd_u64")
(vsub_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vsubq_u64")
(vsub_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for vsub_u32")
(vsub_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for vsubq_u16")
(vsub_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for vsubq_u8")
(vsub_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for vsubq_s8")
(vsub_s32_dsl
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
	[ (vqdmlsl_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? num_9 1) (equal? prec_o 32) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 32) (equal? num_18 1))
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
	[ (vabal_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0))
(displayln "Scaling case for vabal_u32")
(vabal_u32_dsl
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
num_14
)
]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1))
(displayln "Scaling case for vabal_s16")
(vabal_u32_dsl
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
num_14
)
]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0))
(displayln "Scaling case for vabal_u8")
(vabal_u32_dsl
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
num_14
)
]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1))
(displayln "Scaling case for vabal_s8")
(vabal_u32_dsl
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
num_14
)
]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1))
(displayln "Scaling case for vabal_s32")
(vabal_u32_dsl
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
num_14
)
]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0))
(displayln "Scaling case for vabal_u16")
(vabal_u32_dsl
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
num_14
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vabdq_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vabdq_u8")
(vabdq_u8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vabd_u32")
(vabdq_u8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vabdq_s8")
(vabdq_u8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vabd_s16")
(vabdq_u8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vabdq_s16")
(vabdq_u8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vabdq_s32")
(vabdq_u8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vabd_u16")
(vabdq_u8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vabd_s8")
(vabdq_u8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vabdq_u16")
(vabdq_u8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vabdq_u32")
(vabdq_u8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vabd_s32")
(vabdq_u8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vabd_u8")
(vabdq_u8_dsl
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
	[ (vqrshl_s64_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshl_s64")
(vqrshl_s64_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshld_s64")
(vqrshl_s64_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 8) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? prec_i_o 8) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshlb_s8")
(vqrshl_s64_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 32) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshl_s32")
(vqrshl_s64_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_10 32) (equal? num_11 0) (equal? num_12 32) (equal? prec_i_o 32) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshls_s32")
(vqrshl_s64_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 32) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshlq_s32")
(vqrshl_s64_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 64) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshlq_s64")
(vqrshl_s64_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 8) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshl_s8")
(vqrshl_s64_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 16) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshl_s16")
(vqrshl_s64_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 8) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshlq_s8")
(vqrshl_s64_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 16) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshlq_s16")
(vqrshl_s64_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_10 16) (equal? num_11 0) (equal? num_12 16) (equal? prec_i_o 16) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshlh_s16")
(vqrshl_s64_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmull_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmull_u8")
(vmull_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vmull_s16")
(vmull_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vmull_s32")
(vmull_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vmull_s8")
(vmull_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmull_u32")
(vmull_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmull_u16")
(vmull_u8_dsl
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
	[ (vmovl_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 2) (equal? num_9 1))
(displayln "Scaling case for vmovl_s8")
(vmovl_s8_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i
prec_o
num_7
num_8
num_9
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 2) (equal? num_9 1))
(displayln "Scaling case for vmovl_s16")
(vmovl_s8_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i
prec_o
num_7
num_8
num_9
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 2) (equal? num_9 0))
(displayln "Scaling case for vmovl_u8")
(vmovl_s8_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i
prec_o
num_7
num_8
num_9
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 2) (equal? num_9 0))
(displayln "Scaling case for vmovl_u16")
(vmovl_s8_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i
prec_o
num_7
num_8
num_9
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 2) (equal? num_9 0))
(displayln "Scaling case for vmovl_u32")
(vmovl_s8_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i
prec_o
num_7
num_8
num_9
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_7 0) (equal? num_8 2) (equal? num_9 1))
(displayln "Scaling case for vmovl_s32")
(vmovl_s8_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i
prec_o
num_7
num_8
num_9
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqrdmulhq_n_s32_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulhq_n_s32")
(vqrdmulhq_n_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulh_n_s32")
(vqrdmulhq_n_s32_dsl
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
	[ (vqrshlb_u8_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 8) (equal? num_10 8) (equal? num_11 0) (equal? num_12 8) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshlb_u8")
(vqrshlb_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshl_u16")
(vqrshlb_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshld_u64")
(vqrshlb_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshl_u64")
(vqrshlb_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_10 16) (equal? num_11 0) (equal? num_12 16) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshlh_u16")
(vqrshlb_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_10 32) (equal? num_11 0) (equal? num_12 32) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshls_u32")
(vqrshlb_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshl_u32")
(vqrshlb_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshlq_u16")
(vqrshlb_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshlq_u8")
(vqrshlb_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshl_u8")
(vqrshlb_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshlq_u32")
(vqrshlb_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vqrshlq_u64")
(vqrshlb_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vneg_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vneg_s16")
(vneg_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vneg_s8")
(vneg_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vneg_s64")
(vneg_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vnegq_s16")
(vneg_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vneg_s32")
(vneg_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vnegq_s64")
(vneg_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vnegd_s64")
(vneg_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vnegq_s8")
(vneg_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vnegq_s32")
(vneg_s16_dsl
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
	[ (vsqaddq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqaddq_u32")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqadd_u16")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqaddq_u16")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqaddq_u8")
(vsqaddq_u32_dsl
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
(displayln "Scaling case for vuqadds_s32")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqaddd_u64")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqadd_s8")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqaddq_s32")
(vsqaddq_u32_dsl
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
(displayln "Scaling case for vsqadds_u32")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqaddb_s8")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqaddq_s16")
(vsqaddq_u32_dsl
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
(displayln "Scaling case for vuqaddh_s16")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqadd_u64")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqaddq_u64")
(vsqaddq_u32_dsl
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
(displayln "Scaling case for vsqaddh_u16")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqadd_s64")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqadd_s32")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqaddq_s8")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqaddb_u8")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqadd_u32")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqaddd_s64")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 1))
(displayln "Scaling case for vsqadd_u8")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqaddq_s64")
(vsqaddq_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for vuqadd_s16")
(vsqaddq_u32_dsl
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
	[ (vcle_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcle_s32")
(vcle_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcleq_s32")
(vcle_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcle_s64")
(vcle_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcleq_u64")
(vcle_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcleq_s16")
(vcle_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcleq_u16")
(vcle_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcle_u8")
(vcle_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcled_u64")
(vcle_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcle_s8")
(vcle_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcleq_u8")
(vcle_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcle_u16")
(vcle_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcleq_s8")
(vcle_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcled_s64")
(vcle_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcle_u32")
(vcle_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcle_u64")
(vcle_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcle_s16")
(vcle_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcleq_u32")
(vcle_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcleq_s64")
(vcle_s32_dsl
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
	[ (vmlal_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 1) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vmlal_n_s32")
(vmlal_n_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 0) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0))
(displayln "Scaling case for vmlal_n_u32")
(vmlal_n_s32_dsl
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
	[ (vuzp1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 2))
(displayln "Scaling case for vuzp1_s32")
(vuzp1_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 2))
(displayln "Scaling case for vuzp1q_u64")
(vuzp1_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 2))
(displayln "Scaling case for vuzp1q_u32")
(vuzp1_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 2))
(displayln "Scaling case for vuzp1q_s16")
(vuzp1_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 2))
(displayln "Scaling case for vuzp1_u16")
(vuzp1_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 2))
(displayln "Scaling case for vuzp1_u8")
(vuzp1_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 2))
(displayln "Scaling case for vuzp1q_s32")
(vuzp1_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 2))
(displayln "Scaling case for vuzp1q_u8")
(vuzp1_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 2))
(displayln "Scaling case for vuzp1_s16")
(vuzp1_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 2))
(displayln "Scaling case for vuzp1_u32")
(vuzp1_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 2))
(displayln "Scaling case for vuzp1_s8")
(vuzp1_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 2))
(displayln "Scaling case for vuzp1q_u16")
(vuzp1_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 2))
(displayln "Scaling case for vuzp1q_s8")
(vuzp1_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 2))
(displayln "Scaling case for vuzp1q_s64")
(vuzp1_s32_dsl
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
	[ (vrshrn_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 64) (equal? num_20 2))
(displayln "Scaling case for vrshrn_n_s64")
(vrshrn_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 64) (equal? num_20 2))
(displayln "Scaling case for vrshrn_n_u64")
(vrshrn_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 32) (equal? num_20 2))
(displayln "Scaling case for vrshrn_n_s32")
(vrshrn_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 32) (equal? num_20 2))
(displayln "Scaling case for vrshrn_n_u32")
(vrshrn_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 16) (equal? num_20 2))
(displayln "Scaling case for vrshrn_n_u16")
(vrshrn_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 16) (equal? num_20 2))
(displayln "Scaling case for vrshrn_n_s16")
(vrshrn_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vhsubq_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhsubq_u32")
(vhsubq_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhsub_s16")
(vhsubq_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhsubq_u8")
(vhsubq_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhsub_s8")
(vhsubq_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhsubq_s32")
(vhsubq_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhsubq_s16")
(vhsubq_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhsubq_u16")
(vhsubq_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhsubq_s8")
(vhsubq_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhsub_u16")
(vhsubq_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhsub_s32")
(vhsubq_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhsub_u8")
(vhsubq_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhsub_u32")
(vhsubq_u32_dsl
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
	[ (vqdmull_n_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 1) (equal? prec_o 64) (equal? num_10 2) (equal? num_11 1) (equal? num_12 1))
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
	[ (vshl_s64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vshl_s64")
(vshl_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vshlq_s64")
(vshl_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vshlq_s32")
(vshl_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vshlq_s16")
(vshl_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vshl_s8")
(vshl_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vshld_s64")
(vshl_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vshl_s32")
(vshl_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vshl_s16")
(vshl_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vshlq_s8")
(vshl_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vshrn_n_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 2))
(displayln "Scaling case for vshrn_n_u64")
(vshrn_n_u64_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 2))
(displayln "Scaling case for vshrn_n_s32")
(vshrn_n_u64_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 2))
(displayln "Scaling case for vshrn_n_s64")
(vshrn_n_u64_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 2))
(displayln "Scaling case for vshrn_n_s16")
(vshrn_n_u64_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 2))
(displayln "Scaling case for vshrn_n_u16")
(vshrn_n_u64_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 2))
(displayln "Scaling case for vshrn_n_u32")
(vshrn_n_u64_dsl
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
prec_i
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vrhaddq_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vrhaddq_s32")
(vrhaddq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vrhadd_u16")
(vrhaddq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vrhaddq_s8")
(vrhaddq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vrhaddq_u16")
(vrhaddq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vrhadd_s32")
(vrhaddq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vrhadd_u8")
(vrhaddq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vrhadd_s8")
(vrhaddq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vrhadd_u32")
(vrhaddq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vrhaddq_s16")
(vrhaddq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vrhaddq_u32")
(vrhaddq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vrhaddq_u8")
(vrhaddq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 1) (equal? num_9 -1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vrhadd_s16")
(vrhaddq_s32_dsl
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
	[ (vhadd_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhadd_u16")
(vhadd_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhaddq_u8")
(vhadd_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhaddq_s16")
(vhadd_u16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhadd_s32")
(vhadd_u16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhadd_u32")
(vhadd_u16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhadd_s8")
(vhadd_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhaddq_u32")
(vhadd_u16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhadd_s16")
(vhadd_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhaddq_u16")
(vhadd_u16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vhadd_u8")
(vhadd_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhaddq_s32")
(vhadd_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vhaddq_s8")
(vhadd_u16_dsl
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
	[ (vqshld_s64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshld_s64")
(vqshld_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshl_s8")
(vqshld_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshlq_s16")
(vqshld_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshlb_s8")
(vqshld_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshlq_s32")
(vqshld_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshlh_s16")
(vqshld_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshlq_s64")
(vqshld_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshlq_s8")
(vqshld_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshl_s16")
(vqshld_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshls_s32")
(vqshld_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshl_s32")
(vqshld_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshl_s64")
(vqshld_s64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vrshr_n_u8_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrshr_n_u8")
(vrshr_n_u8_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrshr_n_u32")
(vrshr_n_u8_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrshrq_n_u8")
(vrshr_n_u8_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrshr_n_u64")
(vrshr_n_u8_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrshr_n_u16")
(vrshr_n_u8_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrshrq_n_u16")
(vrshr_n_u8_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrshrq_n_u32")
(vrshr_n_u8_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrshrd_n_u64")
(vrshr_n_u8_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrshrq_n_u64")
(vrshr_n_u8_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vtst_u16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16))
(displayln "Scaling case for vtst_u16")
(vtst_u16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32))
(displayln "Scaling case for vtst_s32")
(vtst_u16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16))
(displayln "Scaling case for vtst_s16")
(vtst_u16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16))
(displayln "Scaling case for vtstq_s16")
(vtst_u16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64))
(displayln "Scaling case for vtstd_u64")
(vtst_u16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8))
(displayln "Scaling case for vtst_s8")
(vtst_u16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8))
(displayln "Scaling case for vtstq_s8")
(vtst_u16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32))
(displayln "Scaling case for vtstq_s32")
(vtst_u16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8))
(displayln "Scaling case for vtst_u8")
(vtst_u16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64))
(displayln "Scaling case for vtstq_s64")
(vtst_u16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32))
(displayln "Scaling case for vtstq_u32")
(vtst_u16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8))
(displayln "Scaling case for vtstq_u8")
(vtst_u16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16))
(displayln "Scaling case for vtstq_u16")
(vtst_u16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64))
(displayln "Scaling case for vtst_u64")
(vtst_u16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64))
(displayln "Scaling case for vtst_s64")
(vtst_u16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32))
(displayln "Scaling case for vtst_u32")
(vtst_u16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64))
(displayln "Scaling case for vtstq_u64")
(vtst_u16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64))
(displayln "Scaling case for vtstd_s64")
(vtst_u16_dsl
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
	[ (vaba_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vaba_u16")
(vaba_u16_dsl
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
)
]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vaba_s8")
(vaba_u16_dsl
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
)
]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vabaq_s8")
(vaba_u16_dsl
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
)
]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vaba_u32")
(vaba_u16_dsl
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
)
]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vabaq_s32")
(vaba_u16_dsl
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
)
]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vabaq_u32")
(vaba_u16_dsl
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
)
]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vaba_s32")
(vaba_u16_dsl
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
)
]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vabaq_u8")
(vaba_u16_dsl
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
)
]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vaba_u8")
(vaba_u16_dsl
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
)
]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vabaq_s16")
(vaba_u16_dsl
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
)
]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vabaq_u16")
(vaba_u16_dsl
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
)
]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vaba_s16")
(vaba_u16_dsl
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
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vshl_u32_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vshl_u32")
(vshl_u32_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vshlq_u8")
(vshl_u32_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vshlq_u64")
(vshl_u32_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vshld_u64")
(vshl_u32_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vshlq_u16")
(vshl_u32_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vshl_u8")
(vshl_u32_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vshlq_u32")
(vshl_u32_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vshl_u64")
(vshl_u32_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vshl_u16")
(vshl_u32_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmullh_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vqdmullh_s16")
(vqdmullh_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vqdmull_s16")
(vqdmullh_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vqdmull_s32")
(vqdmullh_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vqdmulls_s32")
(vqdmullh_s16_dsl
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
	[ (vqdmlalh_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 1))
(displayln "Scaling case for vqdmlalh_s16")
(vqdmlalh_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 1))
(displayln "Scaling case for vqdmlal_s32")
(vqdmlalh_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 1))
(displayln "Scaling case for vqdmlal_s16")
(vqdmlalh_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 1))
(displayln "Scaling case for vqdmlals_s32")
(vqdmlalh_s16_dsl
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
	[ (vqdmulhq_n_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vqdmulhq_n_s32")
(vqdmulhq_n_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vqdmulh_n_s32")
(vqdmulhq_n_s32_dsl
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
	[ (vsraq_n_u8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vsraq_n_u8")
(vsraq_n_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vsra_n_u8")
(vsraq_n_u8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vsraq_n_u16")
(vsraq_n_u8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vsraq_n_u32")
(vsraq_n_u8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vsraq_n_u64")
(vsraq_n_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vsra_n_u32")
(vsraq_n_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vsra_n_u16")
(vsraq_n_u8_dsl
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
	[ (vcgez_s32_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgez_s32")
(vcgez_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgez_s8")
(vcgez_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgez_s16")
(vcgez_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgezq_s8")
(vcgez_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgezq_s32")
(vcgez_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgezq_s64")
(vcgez_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgezq_s16")
(vcgez_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgezd_s64")
(vcgez_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgez_s64")
(vcgez_s32_dsl
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
	[ (vaddw_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2))
(displayln "Scaling case for vaddw_u32")
(vaddw_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2))
(displayln "Scaling case for vaddw_s16")
(vaddw_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2))
(displayln "Scaling case for vaddw_s8")
(vaddw_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2))
(displayln "Scaling case for vaddw_u16")
(vaddw_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2))
(displayln "Scaling case for vaddw_u8")
(vaddw_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2))
(displayln "Scaling case for vaddw_s32")
(vaddw_u32_dsl
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
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vsubhn_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 8) (equal? num_8 -1) (equal? prec_i 16) (equal? num_10 2))
(displayln "Scaling case for vsubhn_s16")
(vsubhn_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
prec_i
num_10
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 -1) (equal? prec_i 32) (equal? num_10 2))
(displayln "Scaling case for vsubhn_s32")
(vsubhn_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
prec_i
num_10
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 8) (equal? num_8 -1) (equal? prec_i 16) (equal? num_10 2))
(displayln "Scaling case for vsubhn_u16")
(vsubhn_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
prec_i
num_10
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 -1) (equal? prec_i 32) (equal? num_10 2))
(displayln "Scaling case for vsubhn_u32")
(vsubhn_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
prec_i
num_10
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 32) (equal? num_8 -1) (equal? prec_i 64) (equal? num_10 2))
(displayln "Scaling case for vsubhn_s64")
(vsubhn_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
prec_i
num_10
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 32) (equal? num_8 -1) (equal? prec_i 64) (equal? num_10 2))
(displayln "Scaling case for vsubhn_u64")
(vsubhn_s16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
prec_i
num_10
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmax_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmax_s16")
(vmax_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmax_s32")
(vmax_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmax_s8")
(vmax_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmaxq_u16")
(vmax_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmaxq_u32")
(vmax_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmaxq_s8")
(vmax_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmaxq_u8")
(vmax_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmax_u8")
(vmax_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmax_u32")
(vmax_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmax_u16")
(vmax_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmaxq_s16")
(vmax_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmaxq_s32")
(vmax_s16_dsl
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
	[ (vqsub_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsub_u64")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsubd_s64")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsubq_u8")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsub_s32")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsub_s8")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsubq_u16")
(vqsub_u64_dsl
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
(displayln "Scaling case for vqsubs_u32")
(vqsub_u64_dsl
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
(displayln "Scaling case for vqsubh_u16")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsubd_u64")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsub_u8")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsubq_u64")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsub_s16")
(vqsub_u64_dsl
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
(displayln "Scaling case for vqsubh_s16")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsubb_s8")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsubq_s16")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsubb_u8")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsub_s64")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsubq_u32")
(vqsub_u64_dsl
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
(displayln "Scaling case for vqsubs_s32")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsub_u32")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsubq_s64")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsubq_s8")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqsubq_s32")
(vqsub_u64_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqsub_u16")
(vqsub_u64_dsl
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
	[ (vmlal_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vmlal_s16")
(vmlal_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0))
(displayln "Scaling case for vmlal_u8")
(vmlal_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vmlal_s32")
(vmlal_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vmlal_s8")
(vmlal_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0))
(displayln "Scaling case for vmlal_u32")
(vmlal_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0))
(displayln "Scaling case for vmlal_u16")
(vmlal_s16_dsl
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
	[ (vqdmlal_n_s16_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? num_9 1) (equal? prec_o 32) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 32) (equal? num_18 1))
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
	[ (vabdl_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0))
(displayln "Scaling case for vabdl_u8")
(vabdl_u8_dsl
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
num_13
num_14
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1))
(displayln "Scaling case for vabdl_s16")
(vabdl_u8_dsl
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
num_13
num_14
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1))
(displayln "Scaling case for vabdl_s8")
(vabdl_u8_dsl
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
num_13
num_14
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1))
(displayln "Scaling case for vabdl_s32")
(vabdl_u8_dsl
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
num_13
num_14
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0))
(displayln "Scaling case for vabdl_u32")
(vabdl_u8_dsl
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
num_13
num_14
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 -1) (equal? num_13 0) (equal? num_14 0))
(displayln "Scaling case for vabdl_u16")
(vabdl_u8_dsl
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
num_13
num_14
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqdmlsl_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i prec_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 1))
(displayln "Scaling case for vqdmlsl_s32")
(vqdmlsl_s32_dsl
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
(displayln "Scaling case for vqdmlslh_s16")
(vqdmlsl_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 1))
(displayln "Scaling case for vqdmlsls_s32")
(vqdmlsl_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1) (equal? num_14 2) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 1))
(displayln "Scaling case for vqdmlsl_s16")
(vqdmlsl_s32_dsl
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
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vsra_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vsra_n_s16")
(vsra_n_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vsraq_n_s16")
(vsra_n_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vsrad_n_s64")
(vsra_n_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vsraq_n_s64")
(vsra_n_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vsra_n_s64")
(vsra_n_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vsraq_n_s8")
(vsra_n_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vsra_n_s32")
(vsra_n_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vsra_n_s8")
(vsra_n_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vsraq_n_s32")
(vsra_n_s16_dsl
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
	[ (vzip2q_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 2) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 2) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32))
(displayln "Scaling case for vzip2q_s32")
(vzip2q_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 2) (equal? num_13 64) (equal? num_14 64) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 32) (equal? num_19 64))
(displayln "Scaling case for vzip2q_s64")
(vzip2q_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 4) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 4) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16))
(displayln "Scaling case for vzip2q_s16")
(vzip2q_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 4) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 4) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16))
(displayln "Scaling case for vzip2q_u16")
(vzip2q_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 2) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 2) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16))
(displayln "Scaling case for vzip2_u16")
(vzip2q_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 2) (equal? num_12 2) (equal? num_13 16) (equal? num_14 16) (equal? num_15 2) (equal? num_16 16) (equal? num_17 1) (equal? num_18 8) (equal? num_19 16))
(displayln "Scaling case for vzip2_s16")
(vzip2q_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 2) (equal? num_13 64) (equal? num_14 64) (equal? num_15 1) (equal? num_16 64) (equal? num_17 1) (equal? num_18 32) (equal? num_19 64))
(displayln "Scaling case for vzip2q_u64")
(vzip2q_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 8) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8))
(displayln "Scaling case for vzip2q_s8")
(vzip2q_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 2) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 2) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32))
(displayln "Scaling case for vzip2q_u32")
(vzip2q_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 4) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 4) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8))
(displayln "Scaling case for vzip2_s8")
(vzip2q_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 4) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 4) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8))
(displayln "Scaling case for vzip2_u8")
(vzip2q_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 8) (equal? num_12 2) (equal? num_13 8) (equal? num_14 8) (equal? num_15 8) (equal? num_16 8) (equal? num_17 1) (equal? num_18 4) (equal? num_19 8))
(displayln "Scaling case for vzip2q_u8")
(vzip2q_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32))
(displayln "Scaling case for vzip2_s32")
(vzip2q_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 2) (equal? num_13 32) (equal? num_14 32) (equal? num_15 1) (equal? num_16 32) (equal? num_17 1) (equal? num_18 16) (equal? num_19 32))
(displayln "Scaling case for vzip2_u32")
(vzip2q_s32_dsl
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
	[ (vmlsl_n_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 0) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0))
(displayln "Scaling case for vmlsl_n_u32")
(vmlsl_n_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? num_8 1) (equal? prec_o 64) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vmlsl_n_s32")
(vmlsl_n_u32_dsl
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
	[ (vtrn1_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16))
(displayln "Scaling case for vtrn1_s32")
(vtrn1_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16))
(displayln "Scaling case for vtrn1_u32")
(vtrn1_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8))
(displayln "Scaling case for vtrn1_s16")
(vtrn1_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4))
(displayln "Scaling case for vtrn1_u8")
(vtrn1_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4))
(displayln "Scaling case for vtrn1q_u8")
(vtrn1_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4))
(displayln "Scaling case for vtrn1q_s8")
(vtrn1_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16))
(displayln "Scaling case for vtrn1q_u32")
(vtrn1_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8))
(displayln "Scaling case for vtrn1q_u16")
(vtrn1_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8))
(displayln "Scaling case for vtrn1q_s16")
(vtrn1_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 2) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4))
(displayln "Scaling case for vtrn1_s8")
(vtrn1_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 2) (equal? num_12 64) (equal? num_13 1) (equal? num_14 32))
(displayln "Scaling case for vtrn1q_s64")
(vtrn1_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 2) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8))
(displayln "Scaling case for vtrn1_u16")
(vtrn1_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 2) (equal? num_12 64) (equal? num_13 1) (equal? num_14 32))
(displayln "Scaling case for vtrn1q_u64")
(vtrn1_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 2) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16))
(displayln "Scaling case for vtrn1q_s32")
(vtrn1_s32_dsl
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
	[ (vqdmulh_n_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vqdmulh_n_s16")
(vqdmulh_n_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vqdmulhq_n_s16")
(vqdmulh_n_s16_dsl
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
	[ (vqabs_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabs_s8")
(vqabs_s8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabsd_s64")
(vqabs_s8_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabsb_s8")
(vqabs_s8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabsq_s32")
(vqabs_s8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabs_s16")
(vqabs_s8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabs_s64")
(vqabs_s8_dsl
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
(displayln "Scaling case for vqabss_s32")
(vqabs_s8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabsq_s64")
(vqabs_s8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabs_s32")
(vqabs_s8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabsq_s16")
(vqabs_s8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqabsq_s8")
(vqabs_s8_dsl
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
(displayln "Scaling case for vqabsh_s16")
(vqabs_s8_dsl
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
	[ (vcge_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
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
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
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
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
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
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
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
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
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
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
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
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
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
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
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
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
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
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vabs_s8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabs_s8")
(vabs_s8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabsq_s8")
(vabs_s8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabs_s32")
(vabs_s8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabs_s16")
(vabs_s8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabs_s64")
(vabs_s8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabsq_s64")
(vabs_s8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabsq_s16")
(vabs_s8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabsq_s32")
(vabs_s8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 1))
(displayln "Scaling case for vabsd_s64")
(vabs_s8_dsl
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
	[ (vqdmulhq_s16_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vqdmulhq_s16")
(vqdmulhq_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vqdmulh_s16")
(vqdmulhq_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vqdmulh_s32")
(vqdmulhq_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vqdmulhs_s32")
(vqdmulhq_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vqdmulhh_s16")
(vqdmulhq_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vqdmulhq_s32")
(vqdmulhq_s16_dsl
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
	[ (vqdmull_n_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 1) (equal? prec_o 32) (equal? num_10 2) (equal? num_11 1) (equal? num_12 1))
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
	[ (vqshrnh_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 prec_i num_11)
		(cond 
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 2))
(displayln "Scaling case for vqshrnh_n_u16")
(vqshrnh_n_u16_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 2))
(displayln "Scaling case for vqshrns_n_u32")
(vqshrnh_n_u16_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 16) (equal? num_11 2))
(displayln "Scaling case for vqshrn_n_u16")
(vqshrnh_n_u16_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 2))
(displayln "Scaling case for vqshrnd_n_u64")
(vqshrnh_n_u16_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 32) (equal? num_11 2))
(displayln "Scaling case for vqshrn_n_u32")
(vqshrnh_n_u16_dsl
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
prec_i
num_11
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? prec_i 64) (equal? num_11 2))
(displayln "Scaling case for vqshrn_n_u64")
(vqshrnh_n_u16_dsl
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
prec_i
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vpmin_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2))
(displayln "Scaling case for vpmin_s32")
(vpmin_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2))
(displayln "Scaling case for vpminq_s16")
(vpmin_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2))
(displayln "Scaling case for vpminq_u16")
(vpmin_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2))
(displayln "Scaling case for vpminq_u8")
(vpmin_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2))
(displayln "Scaling case for vpmin_s16")
(vpmin_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2))
(displayln "Scaling case for vpmin_u8")
(vpmin_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2))
(displayln "Scaling case for vpminq_u32")
(vpmin_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2))
(displayln "Scaling case for vpminq_s32")
(vpmin_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2))
(displayln "Scaling case for vpmin_u16")
(vpmin_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2))
(displayln "Scaling case for vpmin_u32")
(vpmin_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2))
(displayln "Scaling case for vpminq_s8")
(vpmin_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2))
(displayln "Scaling case for vpmin_s8")
(vpmin_s32_dsl
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
	[ (vqdmlsl_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? num_9 1) (equal? prec_o 64) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 64) (equal? num_18 1))
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
	[ (vqshld_u64_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vqshld_u64")
(vqshld_u64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vqshlq_u8")
(vqshld_u64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vqshlq_u32")
(vqshld_u64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vqshl_u8")
(vqshld_u64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vqshlh_u16")
(vqshld_u64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vqshls_u32")
(vqshld_u64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vqshlb_u8")
(vqshld_u64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vqshl_u16")
(vqshld_u64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vqshl_u32")
(vqshld_u64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vqshl_u64")
(vqshld_u64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vqshlq_u16")
(vqshld_u64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vqshlq_u64")
(vqshld_u64_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vcgtq_s8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgtq_s8")
(vcgtq_s8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgtq_s32")
(vcgtq_s8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgtq_u32")
(vcgtq_s8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgt_s8")
(vcgtq_s8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgt_s32")
(vcgtq_s8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgtq_u16")
(vcgtq_s8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgtd_u64")
(vcgtq_s8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgtq_s16")
(vcgtq_s8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgtq_u64")
(vcgtq_s8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgt_s64")
(vcgtq_s8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgt_u64")
(vcgtq_s8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgtq_u8")
(vcgtq_s8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgt_u8")
(vcgtq_s8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgt_s16")
(vcgtq_s8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgt_u32")
(vcgtq_s8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgtq_s64")
(vcgtq_s8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcgt_u16")
(vcgtq_s8_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcgtd_s64")
(vcgtq_s8_dsl
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
	[ (vadd_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for vadd_s8")
(vadd_s8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for vadd_u8")
(vadd_s8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for vaddq_u32")
(vadd_s8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for vaddq_u8")
(vadd_s8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for vaddq_s16")
(vadd_s8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vaddq_u64")
(vadd_s8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vadd_u64")
(vadd_s8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for vaddq_s8")
(vadd_s8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for vadd_s32")
(vadd_s8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for vaddq_s32")
(vadd_s8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vadd_s64")
(vadd_s8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vaddq_s64")
(vadd_s8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for vadd_u32")
(vadd_s8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for vadd_s16")
(vadd_s8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vaddd_s64")
(vadd_s8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for vadd_u16")
(vadd_s8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 -1))
(displayln "Scaling case for vaddd_u64")
(vadd_s8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for vaddq_u16")
(vadd_s8_dsl
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
	[ (vrsubhn_s16_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x0000000000000080 (bitvector 16)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2))
(displayln "Scaling case for vrsubhn_s16")
(vrsubhn_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000008000 (bitvector 32)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2))
(displayln "Scaling case for vrsubhn_s32")
(vrsubhn_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000080 (bitvector 16)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2))
(displayln "Scaling case for vrsubhn_u16")
(vrsubhn_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000080000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2))
(displayln "Scaling case for vrsubhn_s64")
(vrsubhn_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000080000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2))
(displayln "Scaling case for vrsubhn_u64")
(vrsubhn_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000008000 (bitvector 32)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2))
(displayln "Scaling case for vrsubhn_u32")
(vrsubhn_s16_dsl
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
	[ (vqshlb_n_s8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshlb_n_s8")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshluq_n_s16")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 0))
(displayln "Scaling case for vqshlb_n_u8")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshlh_n_s16")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshls_n_s32")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshluq_n_s32")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 0))
(displayln "Scaling case for vqshls_n_u32")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshluq_n_s64")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshlu_n_s8")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshlud_n_s64")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshlu_n_s64")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshlu_n_s32")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshlub_n_s8")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshlus_n_s32")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshluh_n_s16")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshlu_n_s16")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 1))
(displayln "Scaling case for vqshluq_n_s8")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 0) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 0))
(displayln "Scaling case for vqshlh_n_u16")
(vqshlb_n_s8_dsl
(arm:scale-expr v0 scale-factor)
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
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vrshlq_u16_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshlq_u16")
(vrshlq_u16_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshld_u64")
(vrshlq_u16_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshlq_u8")
(vrshlq_u16_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshl_u8")
(vrshlq_u16_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshlq_u64")
(vrshlq_u16_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshl_u32")
(vrshlq_u16_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshl_u64")
(vrshlq_u16_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshl_u16")
(vrshlq_u16_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshlq_u32")
(vrshlq_u16_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmls_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_n_s32")
(vmls_n_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_n_u32")
(vmls_n_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_n_s32")
(vmls_n_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_n_u32")
(vmls_n_s32_dsl
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
	[ (vraddhn_s32_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_o num_8 num_9 num_10 prec_i num_12)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000008000 (bitvector 32)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2))
(displayln "Scaling case for vraddhn_s32")
(vraddhn_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000080 (bitvector 16)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2))
(displayln "Scaling case for vraddhn_s16")
(vraddhn_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000080000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2))
(displayln "Scaling case for vraddhn_s64")
(vraddhn_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000008000 (bitvector 32)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 16) (equal? num_8 16) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 32) (equal? num_12 2))
(displayln "Scaling case for vraddhn_u32")
(vraddhn_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000080000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 32) (equal? num_8 32) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 64) (equal? num_12 2))
(displayln "Scaling case for vraddhn_u64")
(vraddhn_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000080 (bitvector 16)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_o 8) (equal? num_8 8) (equal? num_9 -1) (equal? num_10 -1) (equal? prec_i 16) (equal? num_12 2))
(displayln "Scaling case for vraddhn_u16")
(vraddhn_s32_dsl
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
	[ (vcltq_s32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcltq_s32")
(vcltq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vclt_s8")
(vcltq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcltq_u8")
(vcltq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vclt_s32")
(vcltq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vclt_u64")
(vcltq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcltq_u16")
(vcltq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcltd_s64")
(vcltq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcltq_u64")
(vcltq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vclt_s16")
(vcltq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vclt_u32")
(vcltq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcltq_s8")
(vcltq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcltd_u64")
(vcltq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcltq_s16")
(vcltq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vcltq_s64")
(vcltq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vclt_u8")
(vcltq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vclt_u16")
(vcltq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vcltq_u32")
(vcltq_s32_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1))
(displayln "Scaling case for vclt_s64")
(vcltq_s32_dsl
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
	[ (vrshrq_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 vc_5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrshrq_n_s64")
(vrshrq_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrshrd_n_s64")
(vrshrq_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrshrq_n_s16")
(vrshrq_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrshrq_n_s32")
(vrshrq_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrshr_n_s16")
(vrshrq_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrshr_n_s8")
(vrshrq_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrshrq_n_s8")
(vrshrq_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrshr_n_s32")
(vrshrq_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrshr_n_s64")
(vrshrq_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
vc_5
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmlal_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 1) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vmlal_n_s16")
(vmlal_n_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 0) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0))
(displayln "Scaling case for vmlal_n_u16")
(vmlal_n_s16_dsl
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
	[ (vrshlq_s32_dsl v0 vc_1 vc_2 vc_3 vc_4 vc_5 vc_6 vc_7 v8 size_i_o num_10 num_11 num_12 prec_i_o num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshlq_s32")
(vrshlq_s32_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshld_s64")
(vrshlq_s32_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshl_s64")
(vrshlq_s32_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshlq_s8")
(vrshlq_s32_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 8) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshl_s8")
(vrshlq_s32_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshlq_s16")
(vrshlq_s32_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_10 128) (equal? num_11 0) (equal? num_12 128) (equal? prec_i_o 64) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshlq_s64")
(vrshlq_s32_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 32) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshl_s32")
(vrshlq_s32_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_5 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_6 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_7 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_10 64) (equal? num_11 0) (equal? num_12 64) (equal? prec_i_o 16) (equal? num_14 0) (equal? num_15 -1) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? num_19 -1) (equal? num_20 1) (equal? num_21 -1) (equal? num_22 1))
(displayln "Scaling case for vrshl_s16")
(vrshlq_s32_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
vc_4
vc_5
vc_6
vc_7
(arm:scale-expr v8 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_10)
num_11
(* scale-factor num_12)
prec_i_o
num_14
num_15
num_16
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vminq_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vminq_u8")
(vminq_u8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vminq_u32")
(vminq_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmin_u8")
(vminq_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmin_s16")
(vminq_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmin_s8")
(vminq_u8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vminq_s16")
(vminq_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vmin_s32")
(vminq_u8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vminq_u16")
(vminq_u8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vminq_s8")
(vminq_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmin_u16")
(vminq_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vmin_u32")
(vminq_u8_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vminq_s32")
(vminq_u8_dsl
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
	[ (vuzp2_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 8))
(displayln "Scaling case for vuzp2_u16")
(vuzp2_u16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 1) (equal? num_9 4))
(displayln "Scaling case for vuzp2_s8")
(vuzp2_u16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 16))
(displayln "Scaling case for vuzp2_s32")
(vuzp2_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 16))
(displayln "Scaling case for vuzp2q_u32")
(vuzp2_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 1) (equal? num_9 4))
(displayln "Scaling case for vuzp2q_u8")
(vuzp2_u16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 1) (equal? num_9 4))
(displayln "Scaling case for vuzp2_u8")
(vuzp2_u16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 8))
(displayln "Scaling case for vuzp2_s16")
(vuzp2_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 8) (equal? num_8 1) (equal? num_9 4))
(displayln "Scaling case for vuzp2q_s8")
(vuzp2_u16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 16))
(displayln "Scaling case for vuzp2_u32")
(vuzp2_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 16))
(displayln "Scaling case for vuzp2q_s32")
(vuzp2_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 8))
(displayln "Scaling case for vuzp2q_s16")
(vuzp2_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 64) (equal? num_8 1) (equal? num_9 32))
(displayln "Scaling case for vuzp2q_u64")
(vuzp2_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 16) (equal? num_8 1) (equal? num_9 8))
(displayln "Scaling case for vuzp2q_u16")
(vuzp2_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 64) (equal? num_8 1) (equal? num_9 32))
(displayln "Scaling case for vuzp2q_s64")
(vuzp2_u16_dsl
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
	[ (vceqz_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1))
(displayln "Scaling case for vceqz_s64")
(vceqz_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1))
(displayln "Scaling case for vceqz_u64")
(vceqz_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1))
(displayln "Scaling case for vceqzd_u64")
(vceqz_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_2 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1))
(displayln "Scaling case for vceqzq_u8")
(vceqz_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1))
(displayln "Scaling case for vceqzq_s32")
(vceqz_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_2 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1))
(displayln "Scaling case for vceqz_s16")
(vceqz_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_2 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1))
(displayln "Scaling case for vceqzq_u16")
(vceqz_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1))
(displayln "Scaling case for vceqzq_u64")
(vceqz_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_2 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1))
(displayln "Scaling case for vceqzq_s16")
(vceqz_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_2 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1))
(displayln "Scaling case for vceqz_s8")
(vceqz_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1))
(displayln "Scaling case for vceqz_s32")
(vceqz_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_2 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1))
(displayln "Scaling case for vceqz_u8")
(vceqz_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_2 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1))
(displayln "Scaling case for vceqz_u16")
(vceqz_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1))
(displayln "Scaling case for vceqzq_u32")
(vceqz_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1))
(displayln "Scaling case for vceqzq_s64")
(vceqz_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_2 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1))
(displayln "Scaling case for vceqzq_s8")
(vceqz_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1))
(displayln "Scaling case for vceqz_u32")
(vceqz_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_2 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1))
(displayln "Scaling case for vceqzd_s64")
(vceqz_s64_dsl
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
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmla_n_s32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_n_s32")
(vmla_n_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_n_s32")
(vmla_n_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_n_u32")
(vmla_n_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_n_u32")
(vmla_n_s32_dsl
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
	[ (vmla_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_u16")
(vmla_u16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_s32")
(vmla_u16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_s16")
(vmla_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_s16")
(vmla_u16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_u8")
(vmla_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_u32")
(vmla_u16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_s8")
(vmla_u16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_u32")
(vmla_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_u8")
(vmla_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_u16")
(vmla_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_s8")
(vmla_u16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_s32")
(vmla_u16_dsl
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
	[ (vshll_n_u8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15)
		(cond 
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 8) (equal? num_9 0) (equal? prec_o 16) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 0))
(displayln "Scaling case for vshll_n_u8")
(vshll_n_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
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
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? num_9 0) (equal? prec_o 32) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1))
(displayln "Scaling case for vshll_n_s16")
(vshll_n_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
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
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? num_9 0) (equal? prec_o 64) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 0))
(displayln "Scaling case for vshll_n_u32")
(vshll_n_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
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
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? num_9 0) (equal? prec_o 64) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1))
(displayln "Scaling case for vshll_n_s32")
(vshll_n_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
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
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 8) (equal? num_9 0) (equal? prec_o 16) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 1))
(displayln "Scaling case for vshll_n_s8")
(vshll_n_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
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
)
]
		[(and  (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 16) (equal? num_9 0) (equal? prec_o 32) (equal? num_11 0) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 0))
(displayln "Scaling case for vshll_n_u16")
(vshll_n_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
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
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vtrn2_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16))
(displayln "Scaling case for vtrn2_s32")
(vtrn2_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4))
(displayln "Scaling case for vtrn2_s8")
(vtrn2_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16))
(displayln "Scaling case for vtrn2q_s32")
(vtrn2_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8))
(displayln "Scaling case for vtrn2_s16")
(vtrn2_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 32) (equal? num_13 2) (equal? num_14 64) (equal? num_15 1) (equal? num_16 32))
(displayln "Scaling case for vtrn2q_u64")
(vtrn2_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4))
(displayln "Scaling case for vtrn2q_s8")
(vtrn2_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 64) (equal? num_11 1) (equal? num_12 32) (equal? num_13 2) (equal? num_14 64) (equal? num_15 1) (equal? num_16 32))
(displayln "Scaling case for vtrn2q_s64")
(vtrn2_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8))
(displayln "Scaling case for vtrn2q_s16")
(vtrn2_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8))
(displayln "Scaling case for vtrn2_u16")
(vtrn2_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 16) (equal? num_11 1) (equal? num_12 8) (equal? num_13 2) (equal? num_14 16) (equal? num_15 1) (equal? num_16 8))
(displayln "Scaling case for vtrn2q_u16")
(vtrn2_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4))
(displayln "Scaling case for vtrn2q_u8")
(vtrn2_s32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16))
(displayln "Scaling case for vtrn2q_u32")
(vtrn2_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 8) (equal? num_11 1) (equal? num_12 4) (equal? num_13 2) (equal? num_14 8) (equal? num_15 1) (equal? num_16 4))
(displayln "Scaling case for vtrn2_u8")
(vtrn2_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 32) (equal? num_11 1) (equal? num_12 16) (equal? num_13 2) (equal? num_14 32) (equal? num_15 1) (equal? num_16 16))
(displayln "Scaling case for vtrn2_u32")
(vtrn2_s32_dsl
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
	[ (vqdmlal_n_s32_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i num_9 prec_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i 32) (equal? num_9 1) (equal? prec_o 64) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 64) (equal? num_18 1))
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
	[ (vmull_n_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? num_7 0) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmull_n_u16")
(vmull_n_u16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? num_7 1) (equal? prec_o 32) (equal? num_9 2) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vmull_n_s16")
(vmull_n_u16_dsl
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
	[ (vmulq_n_u32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_n_u32")
(vmulq_n_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_n_u32")
(vmulq_n_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_n_s32")
(vmulq_n_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_n_s32")
(vmulq_n_u32_dsl
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
	[ (vaddhn_s64_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 32) (equal? num_8 -1) (equal? prec_i 64) (equal? num_10 2))
(displayln "Scaling case for vaddhn_s64")
(vaddhn_s64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
prec_i
num_10
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 32) (equal? num_8 -1) (equal? prec_i 64) (equal? num_10 2))
(displayln "Scaling case for vaddhn_u64")
(vaddhn_s64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
prec_i
num_10
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 8) (equal? num_8 -1) (equal? prec_i 16) (equal? num_10 2))
(displayln "Scaling case for vaddhn_s16")
(vaddhn_s64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
prec_i
num_10
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 -1) (equal? prec_i 32) (equal? num_10 2))
(displayln "Scaling case for vaddhn_s32")
(vaddhn_s64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
prec_i
num_10
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 16) (equal? num_8 -1) (equal? prec_i 32) (equal? num_10 2))
(displayln "Scaling case for vaddhn_u32")
(vaddhn_s64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
prec_i
num_10
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 8) (equal? num_8 -1) (equal? prec_i 16) (equal? num_10 2))
(displayln "Scaling case for vaddhn_u16")
(vaddhn_s64_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
prec_i
num_10
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vpadal_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 0) (equal? num_16 2))
(displayln "Scaling case for vpadal_u16")
(vpadal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
prec_i
prec_o
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0) (equal? num_16 2))
(displayln "Scaling case for vpadalq_u32")
(vpadal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
prec_i
prec_o
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4) (equal? num_15 1) (equal? num_16 2))
(displayln "Scaling case for vpadal_s8")
(vpadal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
prec_i
prec_o
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16) (equal? num_15 1) (equal? num_16 2))
(displayln "Scaling case for vpadal_s32")
(vpadal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
prec_i
prec_o
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 1) (equal? num_16 2))
(displayln "Scaling case for vpadal_s16")
(vpadal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
prec_i
prec_o
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4) (equal? num_15 0) (equal? num_16 2))
(displayln "Scaling case for vpadalq_u8")
(vpadal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
prec_i
prec_o
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 1) (equal? num_16 2))
(displayln "Scaling case for vpadalq_s16")
(vpadal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
prec_i
prec_o
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16) (equal? num_15 0) (equal? num_16 2))
(displayln "Scaling case for vpadal_u32")
(vpadal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
prec_i
prec_o
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 16) (equal? num_13 1) (equal? num_14 8) (equal? num_15 0) (equal? num_16 2))
(displayln "Scaling case for vpadalq_u16")
(vpadal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
prec_i
prec_o
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4) (equal? num_15 0) (equal? num_16 2))
(displayln "Scaling case for vpadal_u8")
(vpadal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
prec_i
prec_o
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 8) (equal? num_13 1) (equal? num_14 4) (equal? num_15 1) (equal? num_16 2))
(displayln "Scaling case for vpadalq_s8")
(vpadal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
prec_i
prec_o
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 32) (equal? num_13 1) (equal? num_14 16) (equal? num_15 1) (equal? num_16 2))
(displayln "Scaling case for vpadalq_s32")
(vpadal_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
prec_i
prec_o
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
	[ (vqadd_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqadd_s16")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqaddb_u8")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqaddb_s8")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqaddq_u8")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqadd_u32")
(vqadd_s16_dsl
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
(displayln "Scaling case for vqadds_s32")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqaddd_s64")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqadd_u8")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqaddq_u64")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqadd_u64")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqaddd_u64")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqadd_s64")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqaddq_s8")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqaddq_u16")
(vqadd_s16_dsl
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
(displayln "Scaling case for vqaddh_u16")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqaddq_s16")
(vqadd_s16_dsl
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
(displayln "Scaling case for vqadds_u32")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 64) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqaddq_s64")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqaddq_s32")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqadd_u16")
(vqadd_s16_dsl
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
(displayln "Scaling case for vqaddh_s16")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqadd_s8")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0))
(displayln "Scaling case for vqaddq_u32")
(vqadd_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 -1) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vqadd_s32")
(vqadd_s16_dsl
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
	[ (vceqq_u8_dsl v0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o)
		(cond 
		[(and  (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8))
(displayln "Scaling case for vceqq_u8")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8))
(displayln "Scaling case for vceqq_s8")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32))
(displayln "Scaling case for vceqq_u32")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8))
(displayln "Scaling case for vceq_s8")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16))
(displayln "Scaling case for vceqq_s16")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32))
(displayln "Scaling case for vceq_s32")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64))
(displayln "Scaling case for vceqq_s64")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64))
(displayln "Scaling case for vceqd_u64")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16))
(displayln "Scaling case for vceq_u16")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64))
(displayln "Scaling case for vceq_u64")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000ff (bitvector 8)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8))
(displayln "Scaling case for vceq_u8")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32))
(displayln "Scaling case for vceq_u32")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64))
(displayln "Scaling case for vceq_s64")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32))
(displayln "Scaling case for vceqq_s32")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64))
(displayln "Scaling case for vceqd_s64")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64))
(displayln "Scaling case for vceqq_u64")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16))
(displayln "Scaling case for vceqq_u16")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
vc_2
(arm:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
)
]
		[(and  (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16))
(displayln "Scaling case for vceq_s16")
(vceqq_u8_dsl
(arm:scale-expr v0 scale-factor)
vc_1
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
	[ (vzip1q_u64_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 64) (equal? num_12 1) (equal? num_13 32))
(displayln "Scaling case for vzip1q_u64")
(vzip1q_u64_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4))
(displayln "Scaling case for vzip1_u8")
(vzip1q_u64_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8))
(displayln "Scaling case for vzip1q_u16")
(vzip1q_u64_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8))
(displayln "Scaling case for vzip1_s16")
(vzip1q_u64_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 8) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4))
(displayln "Scaling case for vzip1_s8")
(vzip1q_u64_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16))
(displayln "Scaling case for vzip1q_u32")
(vzip1q_u64_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16))
(displayln "Scaling case for vzip1_s32")
(vzip1q_u64_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4))
(displayln "Scaling case for vzip1q_u8")
(vzip1q_u64_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 64) (equal? num_10 2) (equal? num_11 64) (equal? num_12 1) (equal? num_13 32))
(displayln "Scaling case for vzip1q_s64")
(vzip1q_u64_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 16) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8))
(displayln "Scaling case for vzip1_u16")
(vzip1q_u64_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16))
(displayln "Scaling case for vzip1q_s32")
(vzip1q_u64_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 2) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8))
(displayln "Scaling case for vzip1q_s16")
(vzip1q_u64_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 32) (equal? num_6 32) (equal? num_7 0) (equal? num_8 32) (equal? prec_i_o 32) (equal? num_10 2) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16))
(displayln "Scaling case for vzip1_u32")
(vzip1q_u64_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 8) (equal? num_10 2) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4))
(displayln "Scaling case for vzip1q_s8")
(vzip1q_u64_dsl
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
	[ (vmlaq_n_s16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_n_s16")
(vmlaq_n_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_n_s16")
(vmlaq_n_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlaq_n_u16")
(vmlaq_n_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmla_n_u16")
(vmlaq_n_s16_dsl
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
	[ (vqrdmulhq_n_s16_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 128) (equal? num_6 128) (equal? num_7 0) (equal? num_8 128) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulhq_n_s16")
(vqrdmulhq_n_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010 (bitvector 192)))) (equal? size_i_o 64) (equal? num_6 64) (equal? num_7 0) (equal? num_8 64) (equal? prec_i_o 16) (equal? num_10 1) (equal? num_11 1) (equal? num_12 -1) (equal? num_13 1))
(displayln "Scaling case for vqrdmulh_n_s16")
(vqrdmulhq_n_s16_dsl
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
	[ (vqrshrn_n_s16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 16) (equal? num_20 2))
(displayln "Scaling case for vqrshrn_n_s16")
(vqrshrn_n_s16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 64) (equal? num_20 2))
(displayln "Scaling case for vqrshrn_n_s64")
(vqrshrn_n_s16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 32) (equal? num_20 2))
(displayln "Scaling case for vqrshrun_n_s32")
(vqrshrn_n_s16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 16) (equal? num_20 2))
(displayln "Scaling case for vqrshrunh_n_s16")
(vqrshrn_n_s16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 16) (equal? num_20 2))
(displayln "Scaling case for vqrshrun_n_s16")
(vqrshrn_n_s16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 16) (equal? num_20 2))
(displayln "Scaling case for vqrshrnh_n_s16")
(vqrshrn_n_s16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 32) (equal? num_20 2))
(displayln "Scaling case for vqrshruns_n_s32")
(vqrshrn_n_s16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 32) (equal? num_20 2))
(displayln "Scaling case for vqrshrn_n_s32")
(vqrshrn_n_s16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 64) (equal? num_20 2))
(displayln "Scaling case for vqrshrun_n_s64")
(vqrshrn_n_s16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 64) (equal? num_20 2))
(displayln "Scaling case for vqrshrnd_n_s64")
(vqrshrn_n_s16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 1) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 32) (equal? num_20 2))
(displayln "Scaling case for vqrshrns_n_s32")
(vqrshrn_n_s16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 1) (equal? prec_i 64) (equal? num_20 2))
(displayln "Scaling case for vqrshrund_n_s64")
(vqrshrn_n_s16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vshr_n_s64_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vshr_n_s64")
(vshr_n_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vshr_n_s32")
(vshr_n_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vshrq_n_s32")
(vshr_n_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vshrd_n_s64")
(vshr_n_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vshrq_n_s8")
(vshr_n_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vshrq_n_s64")
(vshr_n_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vshr_n_s8")
(vshr_n_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vshrq_n_s16")
(vshr_n_s64_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vshr_n_s16")
(vshr_n_s64_dsl
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
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vrsra_n_s64_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrsra_n_s64")
(vrsra_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrsra_n_s8")
(vrsra_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrsraq_n_s8")
(vrsra_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrsra_n_s16")
(vrsra_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrsraq_n_s16")
(vrsra_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrsraq_n_s32")
(vrsra_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrsrad_n_s64")
(vrsra_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrsra_n_s32")
(vrsra_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 1))
(displayln "Scaling case for vrsraq_n_s64")
(vrsra_n_s64_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmovn_s64_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 2))
(displayln "Scaling case for vmovn_s64")
(vmovn_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 2))
(displayln "Scaling case for vmovn_u64")
(vmovn_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 2))
(displayln "Scaling case for vmovn_s16")
(vmovn_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 2))
(displayln "Scaling case for vmovn_s32")
(vmovn_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 2))
(displayln "Scaling case for vmovn_u16")
(vmovn_s64_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 2))
(displayln "Scaling case for vmovn_u32")
(vmovn_s64_dsl
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
	[ (vclez_s16_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclez_s16")
(vclez_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclezq_s32")
(vclez_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclezq_s16")
(vclez_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclezq_s64")
(vclez_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclez_s64")
(vclez_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclezq_s8")
(vclez_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclezd_s64")
(vclez_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclez_s32")
(vclez_s16_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vclez_s8")
(vclez_s16_dsl
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
	[ (vmlsl_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i num_8 prec_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 0) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 0))
(displayln "Scaling case for vmlsl_n_u16")
(vmlsl_n_u16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? num_8 1) (equal? prec_o 32) (equal? num_10 -1) (equal? num_11 2) (equal? num_12 0) (equal? num_13 1))
(displayln "Scaling case for vmlsl_n_s16")
(vmlsl_n_u16_dsl
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
	[ (vaddl_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vaddl_s16")
(vaddl_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vaddl_u8")
(vaddl_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vaddl_s8")
(vaddl_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vaddl_u16")
(vaddl_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vaddl_s32")
(vaddl_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vaddl_u32")
(vaddl_s16_dsl
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
	[ (vpmax_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2))
(displayln "Scaling case for vpmax_s16")
(vpmax_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2))
(displayln "Scaling case for vpmax_u32")
(vpmax_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2))
(displayln "Scaling case for vpmax_s32")
(vpmax_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_u8")
(vpmax_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_u32")
(vpmax_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2))
(displayln "Scaling case for vpmax_s8")
(vpmax_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2))
(displayln "Scaling case for vpmax_u16")
(vpmax_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2))
(displayln "Scaling case for vpmax_u8")
(vpmax_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_s32")
(vpmax_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_s16")
(vpmax_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_u16")
(vpmax_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2))
(displayln "Scaling case for vpmaxq_s8")
(vpmax_s16_dsl
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
	[ (vshr_n_u8_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vshr_n_u8")
(vshr_n_u8_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vshrq_n_u32")
(vshr_n_u8_dsl
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
)
]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vsra_n_u64")
(vshr_n_u8_dsl
(arm:scale-expr vc_0 scale-factor)
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vsrad_n_u64")
(vshr_n_u8_dsl
(arm:scale-expr vc_0 scale-factor)
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
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vshrd_n_u64")
(vshr_n_u8_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vshr_n_u64")
(vshr_n_u8_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vshr_n_u32")
(vshr_n_u8_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vshrq_n_u8")
(vshr_n_u8_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vshrq_n_u16")
(vshr_n_u8_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vshrq_n_u64")
(vshr_n_u8_dsl
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vshr_n_u16")
(vshr_n_u8_dsl
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
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmls_n_u16_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0))
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
	[ (vmulq_n_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_n_s16")
(vmulq_n_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_n_u16")
(vmulq_n_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_n_s16")
(vmulq_n_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_n_u16")
(vmulq_n_s16_dsl
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
	[ (vmlsl_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0))
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1))
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0))
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1))
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 1) (equal? num_13 1))
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_9 -1) (equal? num_10 2) (equal? num_11 0) (equal? num_12 0) (equal? num_13 0))
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
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vqneg_s16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqneg_s16")
(vqneg_s16_dsl
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
(displayln "Scaling case for vqnegs_s32")
(vqneg_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqneg_s8")
(vqneg_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqnegd_s64")
(vqneg_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 16) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqnegq_s16")
(vqneg_s16_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqnegb_s8")
(vqneg_s16_dsl
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
(displayln "Scaling case for vqnegh_s16")
(vqneg_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqnegq_s64")
(vqneg_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqnegq_s8")
(vqneg_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqnegq_s32")
(vqneg_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqneg_s64")
(vqneg_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 32) (equal? num_6 1) (equal? num_7 1))
(displayln "Scaling case for vqneg_s32")
(vqneg_s16_dsl
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
	[ (vcgtzd_s64_dsl vc_0 vc_1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtzd_s64")
(vcgtzd_s64_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtz_s32")
(vcgtzd_s64_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtzq_s8")
(vcgtzd_s64_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtz_s64")
(vcgtzd_s64_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000ffffffffffffffff (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000000 (bitvector 64)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 64) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtzq_s64")
(vcgtzd_s64_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtz_s16")
(vcgtzd_s64_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000ffff (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtzq_s16")
(vcgtzd_s64_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000ff (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 64) (equal? num_5 64) (equal? num_6 0) (equal? num_7 64) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtz_s8")
(vcgtzd_s64_dsl
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
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000ffffffff (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? size_i_o 128) (equal? num_5 128) (equal? num_6 0) (equal? num_7 128) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 1))
(displayln "Scaling case for vcgtzq_s32")
(vcgtzd_s64_dsl
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
	[ (vmls_u32_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_u32")
(vmls_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_s16")
(vmls_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_s8")
(vmls_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_s32")
(vmls_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_u8")
(vmls_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_s8")
(vmls_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_u16")
(vmls_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_u8")
(vmls_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_u16")
(vmls_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_s32")
(vmls_u32_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmlsq_u32")
(vmls_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmls_s16")
(vmls_u32_dsl
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
	[ (vmull_n_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? num_7 1) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 0) (equal? num_11 1))
(displayln "Scaling case for vmull_n_s32")
(vmull_n_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? num_7 0) (equal? prec_o 64) (equal? num_9 2) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for vmull_n_u32")
(vmull_n_s32_dsl
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
	[ (vrsra_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrsra_n_u16")
(vrsra_n_u16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrsra_n_u64")
(vrsra_n_u16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrsraq_n_u8")
(vrsra_n_u16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrsrad_n_u64")
(vrsra_n_u16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrsraq_n_u64")
(vrsra_n_u16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrsraq_n_u32")
(vrsra_n_u16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 128) (equal? num_9 128) (equal? num_10 0) (equal? num_11 128) (equal? prec_i_o 16) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrsraq_n_u16")
(vrsra_n_u16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 8) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrsra_n_u8")
(vrsra_n_u16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_9 64) (equal? num_10 0) (equal? num_11 64) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 -1) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? num_19 -1) (equal? num_20 0))
(displayln "Scaling case for vrsra_n_u32")
(vrsra_n_u16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(arm:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
num_15
num_16
num_17
num_18
num_19
num_20
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vsubl_s32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vsubl_s32")
(vsubl_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vsubl_s8")
(vsubl_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 8) (equal? prec_o 16) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vsubl_u8")
(vsubl_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 32) (equal? prec_o 64) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vsubl_u32")
(vsubl_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 1))
(displayln "Scaling case for vsubl_s16")
(vsubl_s32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 16) (equal? prec_o 32) (equal? num_8 0) (equal? num_9 2) (equal? num_10 -1) (equal? num_11 0) (equal? num_12 0))
(displayln "Scaling case for vsubl_u16")
(vsubl_s32_dsl
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
	[ (vqmovn_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_o num_6 num_7 prec_i num_9)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 32) (equal? num_9 2))
(displayln "Scaling case for vqmovn_u32")
(vqmovn_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2))
(displayln "Scaling case for vqmovn_s64")
(vqmovn_u32_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 16) (equal? num_9 2))
(displayln "Scaling case for vqmovnh_u16")
(vqmovn_u32_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 32) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2))
(displayln "Scaling case for vqmovnd_s64")
(vqmovn_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2))
(displayln "Scaling case for vqmovun_s64")
(vqmovn_u32_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_o 8) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2))
(displayln "Scaling case for vqmovnh_s16")
(vqmovn_u32_dsl
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
(displayln "Scaling case for vqmovns_u32")
(vqmovn_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2))
(displayln "Scaling case for vqmovun_s32")
(vqmovn_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 16) (equal? num_9 2))
(displayln "Scaling case for vqmovn_u16")
(vqmovn_u32_dsl
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
(displayln "Scaling case for vqmovuns_s32")
(vqmovn_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2))
(displayln "Scaling case for vqmovun_s16")
(vqmovn_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 8) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2))
(displayln "Scaling case for vqmovn_s16")
(vqmovn_u32_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 64) (equal? num_9 2))
(displayln "Scaling case for vqmovund_s64")
(vqmovn_u32_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_o 8) (equal? num_6 0) (equal? num_7 1) (equal? prec_i 16) (equal? num_9 2))
(displayln "Scaling case for vqmovunh_s16")
(vqmovn_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 16) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2))
(displayln "Scaling case for vqmovn_s32")
(vqmovn_u32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 64) (equal? num_9 2))
(displayln "Scaling case for vqmovn_u64")
(vqmovn_u32_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_o 16) (equal? num_6 1) (equal? num_7 1) (equal? prec_i 32) (equal? num_9 2))
(displayln "Scaling case for vqmovns_s32")
(vqmovn_u32_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_o 32) (equal? num_6 0) (equal? num_7 0) (equal? prec_i 64) (equal? num_9 2))
(displayln "Scaling case for vqmovnd_u64")
(vqmovn_u32_dsl
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
	[ (vmul_s16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_s16")
(vmul_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_u32")
(vmul_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_u16")
(vmul_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_s16")
(vmul_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_s32")
(vmul_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_u16")
(vmul_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_s8")
(vmul_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_u32")
(vmul_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_s8")
(vmul_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_s32")
(vmul_s16_dsl
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
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmulq_u8")
(vmul_s16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0))
(displayln "Scaling case for vmul_u8")
(vmul_s16_dsl
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
	[ (vqrshrnh_n_u16_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 size_i_o num_8 num_9 num_10 prec_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 prec_i num_20)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 8) (equal? num_8 8) (equal? num_9 0) (equal? num_10 8) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 16) (equal? num_20 2))
(displayln "Scaling case for vqrshrnh_n_u16")
(vqrshrnh_n_u16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 16) (equal? num_8 16) (equal? num_9 0) (equal? num_10 16) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 32) (equal? num_20 2))
(displayln "Scaling case for vqrshrns_n_u32")
(vqrshrnh_n_u16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 32) (equal? num_8 32) (equal? num_9 0) (equal? num_10 32) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 64) (equal? num_20 2))
(displayln "Scaling case for vqrshrnd_n_u64")
(vqrshrnh_n_u16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 16) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 32) (equal? num_20 2))
(displayln "Scaling case for vqrshrn_n_u32")
(vqrshrnh_n_u16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 8) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 16) (equal? num_20 2))
(displayln "Scaling case for vqrshrn_n_u16")
(vqrshrnh_n_u16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[(and  (equal? vc_0 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_1 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_2 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? vc_3 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 192)))) (equal? vc_4 (lit (bv #x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001 (bitvector 192)))) (equal? size_i_o 64) (equal? num_8 64) (equal? num_9 0) (equal? num_10 64) (equal? prec_o 32) (equal? num_12 -1) (equal? num_13 1) (equal? num_14 -1) (equal? num_15 0) (equal? num_16 0) (equal? num_17 -1) (equal? num_18 0) (equal? prec_i 64) (equal? num_20 2))
(displayln "Scaling case for vqrshrn_n_u64")
(vqrshrnh_n_u16_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(arm:scale-expr v5 scale-factor)
(arm:scale-expr v6 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_8)
num_9
(* scale-factor num_10)
prec_o
num_12
num_13
num_14
num_15
num_16
num_17
num_18
prec_i
num_20
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vmvn_u8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8))
(displayln "Scaling case for vmvn_u8")
(vmvn_u8_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8))
(displayln "Scaling case for vmvn_s8")
(vmvn_u8_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8))
(displayln "Scaling case for vmvnq_s16")
(vmvn_u8_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8))
(displayln "Scaling case for vmvnq_u32")
(vmvn_u8_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8))
(displayln "Scaling case for vmvnq_s8")
(vmvn_u8_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8))
(displayln "Scaling case for vmvnq_u16")
(vmvn_u8_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8))
(displayln "Scaling case for vmvn_u32")
(vmvn_u8_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8))
(displayln "Scaling case for vmvnq_s32")
(vmvn_u8_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8))
(displayln "Scaling case for vmvn_u16")
(vmvn_u8_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8))
(displayln "Scaling case for vmvn_s32")
(vmvn_u8_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 8))
(displayln "Scaling case for vmvn_s16")
(vmvn_u8_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 128) (equal? num_2 128) (equal? num_3 0) (equal? num_4 128) (equal? prec_i_o 8))
(displayln "Scaling case for vmvnq_u8")
(vmvn_u8_dsl
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
	[ (vsubw_u8_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2))
(displayln "Scaling case for vsubw_u8")
(vsubw_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2))
(displayln "Scaling case for vsubw_u32")
(vsubw_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2))
(displayln "Scaling case for vsubw_s16")
(vsubw_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 0) (equal? num_11 0) (equal? num_12 2))
(displayln "Scaling case for vsubw_u16")
(vsubw_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2))
(displayln "Scaling case for vsubw_s8")
(vsubw_u8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? num_6 32) (equal? prec_i_o 64) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2))
(displayln "Scaling case for vsubw_s32")
(vsubw_u8_dsl
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
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vget_low_u32_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0))
(displayln "Scaling case for vget_low_u32")
(vget_low_u32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0))
(displayln "Scaling case for vget_low_s16")
(vget_low_u32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0))
(displayln "Scaling case for vget_low_u64")
(vget_low_u32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0))
(displayln "Scaling case for vget_low_u8")
(vget_low_u32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0))
(displayln "Scaling case for vget_low_s32")
(vget_low_u32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0))
(displayln "Scaling case for vget_low_u16")
(vget_low_u32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0))
(displayln "Scaling case for vget_low_s8")
(vget_low_u32_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0))
(displayln "Scaling case for vget_low_s64")
(vget_low_u32_dsl
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
	[ (vcombine_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 64) (equal? prec_o 128) (equal? num_8 0))
(displayln "Scaling case for vcombine_u16")
(vcombine_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 64) (equal? prec_o 128) (equal? num_8 0))
(displayln "Scaling case for vcombine_s16")
(vcombine_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 64) (equal? prec_o 128) (equal? num_8 0))
(displayln "Scaling case for vcombine_u64")
(vcombine_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 64) (equal? prec_o 128) (equal? num_8 0))
(displayln "Scaling case for vcombine_s32")
(vcombine_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 64) (equal? prec_o 128) (equal? num_8 0))
(displayln "Scaling case for vcombine_s8")
(vcombine_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 64) (equal? prec_o 128) (equal? num_8 0))
(displayln "Scaling case for vcombine_u8")
(vcombine_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 64) (equal? prec_o 128) (equal? num_8 0))
(displayln "Scaling case for vcombine_u32")
(vcombine_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i 64) (equal? prec_o 128) (equal? num_8 0))
(displayln "Scaling case for vcombine_s64")
(vcombine_u16_dsl
(arm:scale-expr v0 scale-factor)
(arm:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i
prec_o
num_8
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (vget_high_u16_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64))
(displayln "Scaling case for vget_high_s32")
(vget_high_u16_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
(* scale-factor num_7)
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64))
(displayln "Scaling case for vget_high_s8")
(vget_high_u16_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
(* scale-factor num_7)
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64))
(displayln "Scaling case for vget_high_u32")
(vget_high_u16_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
(* scale-factor num_7)
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64))
(displayln "Scaling case for vget_high_s16")
(vget_high_u16_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
(* scale-factor num_7)
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64))
(displayln "Scaling case for vget_high_u16")
(vget_high_u16_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
(* scale-factor num_7)
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64))
(displayln "Scaling case for vget_high_s64")
(vget_high_u16_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
(* scale-factor num_7)
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64))
(displayln "Scaling case for vget_high_u64")
(vget_high_u16_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
(* scale-factor num_7)
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64) (equal? num_6 0) (equal? num_7 64))
(displayln "Scaling case for vget_high_u8")
(vget_high_u16_dsl
(arm:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
(* scale-factor num_7)
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[_ (error "Unrecognized expression")]
 )
)
;; ================================================================================

