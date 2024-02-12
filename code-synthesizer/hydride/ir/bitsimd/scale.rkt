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
(require hydride/ir/bitsimd/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                Hydride Scale Expression 
;; ================================================================================
(define (bitsimd:scale-expr prog scale-factor)
 (destruct prog
	[(reg id) (reg id) ]
	[(lit v) (lit (apply concat (for/list ([i (range scale-factor)]) v) ) )]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(
		vector-two-input-swizzle_dsl
		(bitsimd:scale-expr v0 scale-factor)
		(bitsimd:scale-expr v1 scale-factor)
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
		(bitsimd:scale-expr v0 scale-factor)
		(bitsimd:scale-expr v1 scale-factor)
		(* scale-factor size_i_o)
		prec_i_o
		)
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(
		interleave-vector_dsl
		(bitsimd:scale-expr v0 scale-factor)
		(* scale-factor size_i_o)
		prec_i_o
		)
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(
		deinterleave-vector_dsl
		(bitsimd:scale-expr v0 scale-factor)
		(* scale-factor size_i_o)
		prec_i_o
		)
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(
		llvm_shuffle_vectors_dsl
		(bitsimd:scale-expr v0 scale-factor)
		(bitsimd:scale-expr v1 scale-factor)
		num_2
		prec_i_o
		(bitsimd:scale-expr v4 scale-factor)
		num_5
		)
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(
		llvm-zext_dsl
		(bitsimd:scale-expr v0 scale-factor)
		(* scale-factor size_i)
		(* scale-factor size_o)
		)
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(
		scalar_splat_dsl
		(bitsimd:scale-expr v0 scale-factor)
		(* scale-factor size_i)
		(* scale-factor size_o)
		)
	]
	[ (dram_pimcpy_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_2 4096) (equal? num_3 0) (equal? num_4 4096) (equal? prec_i_o 8) (equal? num_6 0))
(displayln "Scaling case for dram_pimcpy_v16384_e8__v16384_e8")
(dram_pimcpy_v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
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
	[ (dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for dram_pimmax_v16384_e8__v16384_e8__v16384_e8")
(dram_pimmax_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
		(cond 
		[(and  (equal? vc_0 (lit (bv #b0 (bitvector 1)))) (equal? vc_1 (lit (bv #b1 (bitvector 1)))) (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 1) (equal? prec_i 8) (equal? num_10 8) (equal? num_11 0))
(displayln "Scaling case for dram_pimeq_v16384_e1__v16384_e8__v16384_e8")
(dram_pimeq_v16384_e1__v16384_e8__v16384_e8_dsl
vc_0
vc_1
(bitsimd:scale-expr v2 scale-factor)
(bitsimd:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_o
prec_i
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8")
(dram_pimvar_rshift_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
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
	[ (dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for dram_pimor_v16384_e8__v16384_e8__v16384_e8")
(dram_pimor_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
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
	[ (dram_pimnot_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_2 4096) (equal? num_3 0) (equal? num_4 4096) (equal? prec_i_o 8) (equal? num_6 0))
(displayln "Scaling case for dram_pimnot_v16384_e8__v16384_e8")
(dram_pimnot_v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
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
	[ (dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8")
(dram_pimvar_lshift_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
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
	[ (dram_pimbitcount_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_2 4096) (equal? num_3 0) (equal? num_4 4096) (equal? prec_i_o 8) (equal? num_6 0))
(displayln "Scaling case for dram_pimbitcount_v16384_e8__v16384_e8")
(dram_pimbitcount_v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
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
	[ (dram_pimsearch_v16384_e1__v16384_e8__v1_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11 num_12)
		(cond 
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for dram_pimxor_v16384_e8__v16384_e8__v16384_e8")
(dram_pimxor_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
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
	[ (dram_pimabs_v16384_e8__v16384_e8_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_2 4096) (equal? num_3 0) (equal? num_4 4096) (equal? prec_i_o 8) (equal? num_6 0))
(displayln "Scaling case for dram_pimabs_v16384_e8__v16384_e8")
(dram_pimabs_v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
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
	[ (dram_pimpopcount_v1_e16__v16384_e1_dsl v0 size_i num_2 num_3 num_4 num_5 size_o num_7 num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? num_5 1) (equal? size_o 0) (equal? num_7 0) (equal? num_8 -1) (equal? num_9 0) (equal? num_10 0) (equal? num_11 0))
(displayln "Scaling case for dram_pimpopcount_v1_e16__v16384_e1")
(dram_pimpopcount_v1_e16__v16384_e1_dsl
(bitsimd:scale-expr v0 scale-factor)
(* scale-factor size_i)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
num_5
(* scale-factor size_o)
num_7
num_8
num_9
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
		(cond 
		[(and  (equal? vc_0 (lit (bv #b0 (bitvector 1)))) (equal? vc_1 (lit (bv #b1 (bitvector 1)))) (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 8) (equal? num_12 0))
(displayln "Scaling case for dram_pimlt_v16384_e1__v16384_e8__v16384_e8")
(dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl
vc_0
vc_1
(bitsimd:scale-expr v2 scale-factor)
(bitsimd:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_o
num_9
prec_i
num_11
num_12
)
]
		[(and  (equal? vc_0 (lit (bv #b0 (bitvector 1)))) (equal? vc_1 (lit (bv #b1 (bitvector 1)))) (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_o 1) (equal? num_9 1) (equal? prec_i 8) (equal? num_11 8) (equal? num_12 0))
(displayln "Scaling case for dram_pimgt_v16384_e1__v16384_e8__v16384_e8")
(dram_pimlt_v16384_e1__v16384_e8__v16384_e8_dsl
vc_0
vc_1
(bitsimd:scale-expr v2 scale-factor)
(bitsimd:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_o
num_9
prec_i
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for dram_pimnand_v16384_e8__v16384_e8__v16384_e8")
(dram_pimnand_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
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
	[ (dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0))
(displayln "Scaling case for dram_pimdiv_v16384_e8__v16384_e8__v16384_e8")
(dram_pimdiv_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
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
	[ (dram_vadd_v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for dram_vadd_v16384_e8")
(dram_vadd_v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for dram_pimadd_v16384_e8__v16384_e8__v16384_e8")
(dram_vadd_v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for dram_pimxnor_v16384_e8__v16384_e8__v16384_e8")
(dram_pimxnor_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
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
	[ (dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for dram_pimand_v16384_e8__v16384_e8__v16384_e8")
(dram_pimand_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
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
	[ (dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for dram_pimmin_v16384_e8__v16384_e8__v16384_e8")
(dram_pimmin_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for dram_pimmul_v16384_e8__v16384_e8__v16384_e8")
(dram_pimmul_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
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
	[ (dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? vc_1 (lit (bv #b1 (bitvector 1)))) (equal? size_i_o 4096) (equal? num_5 4096) (equal? num_6 0) (equal? num_7 4096) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 8) (equal? num_11 0))
(displayln "Scaling case for dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1")
(dram_pimif_else_v16384_e8__v16384_e8__v16384_e8__v16384_e1_dsl
(bitsimd:scale-expr v0 scale-factor)
vc_1
(bitsimd:scale-expr v2 scale-factor)
(bitsimd:scale-expr v3 scale-factor)
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
	[ (dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for dram_pimsub_v16384_e8__v16384_e8__v16384_e8")
(dram_pimsub_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for dram_pimrem_v16384_e8__v16384_e8__v16384_e8")
(dram_pimrem_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
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
	[ (dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl vc_0 v1 vc_2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 4096) (equal? num_4 4096) (equal? num_5 0) (equal? num_6 4096) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 0))
(displayln "Scaling case for dram_pimReLU_v16384_e8__v16384_e8__v1_e8")
(dram_pimReLU_v16384_e8__v16384_e8__v1_e8_dsl
vc_0
(bitsimd:scale-expr v1 scale-factor)
vc_2
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for dram_pimnor_v16384_e8__v16384_e8__v16384_e8")
(dram_pimnor_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
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
	[_ (error "Unrecognized expression")]
 )
)
;; ================================================================================

