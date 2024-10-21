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
(require hydride/ir/visa/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                Hydride Scale Expression 
;; ================================================================================
(define (visa:scale-expr prog scale-factor)
 (destruct prog
	[(reg id) (reg id) ]
	[(lit v) (lit (apply concat (for/list ([i (range scale-factor)]) v) ) )]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(
		vector-two-input-swizzle_dsl
		(visa:scale-expr v0 scale-factor)
		(visa:scale-expr v1 scale-factor)
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
		(visa:scale-expr v0 scale-factor)
		(visa:scale-expr v1 scale-factor)
		(* scale-factor size_i_o)
		prec_i_o
		)
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(
		interleave-vector_dsl
		(visa:scale-expr v0 scale-factor)
		(* scale-factor size_i_o)
		prec_i_o
		)
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(
		deinterleave-vector_dsl
		(visa:scale-expr v0 scale-factor)
		(* scale-factor size_i_o)
		prec_i_o
		)
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(
		llvm_shuffle_vectors_dsl
		(visa:scale-expr v0 scale-factor)
		(visa:scale-expr v1 scale-factor)
		num_2
		prec_i_o
		(visa:scale-expr v4 scale-factor)
		num_5
		)
	]
	[ (llvm-zext_dsl v0 size_i size_o)
		(
		llvm-zext_dsl
		(visa:scale-expr v0 scale-factor)
		(* scale-factor size_i)
		(* scale-factor size_o)
		)
	]
	[ (scalar_splat_dsl v0 size_i size_o)
		(
		scalar_splat_dsl
		(visa:scale-expr v0 scale-factor)
		(* scale-factor size_i)
		(* scale-factor size_o)
		)
	]
	[ (VMAD_sat_2_UB_UB_UB_UB_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 8) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_sat_32_B_B_B_B")
(VMAD_sat_2_UB_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 4) (equal? num_4 4) (equal? num_5 0) (equal? num_6 4) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_sat_16_B_B_B_B")
(VMAD_sat_2_UB_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 8) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_sat_32_UB_UB_UB_UB")
(VMAD_sat_2_UB_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 2) (equal? num_4 2) (equal? num_5 0) (equal? num_6 2) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 2) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1))
(displayln "Scaling case for VMAD_sat_8_UB_UB_UB_UB")
(VMAD_sat_2_UB_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
(* scale-factor num_11)
num_12
(* scale-factor num_13)
num_14
)
]
		[(and  (equal? size_i_o 2) (equal? num_4 2) (equal? num_5 0) (equal? num_6 2) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 2) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1))
(displayln "Scaling case for VMAD_sat_8_B_B_B_B")
(VMAD_sat_2_UB_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
(* scale-factor num_11)
num_12
(* scale-factor num_13)
num_14
)
]
		[(and  (equal? size_i_o 1) (equal? num_4 1) (equal? num_5 0) (equal? num_6 1) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_sat_4_B_B_B_B")
(VMAD_sat_2_UB_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 4) (equal? num_4 4) (equal? num_5 0) (equal? num_6 4) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_sat_16_UB_UB_UB_UB")
(VMAD_sat_2_UB_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 1) (equal? num_4 1) (equal? num_5 0) (equal? num_6 1) (equal? prec_i_o 8) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_sat_4_UB_UB_UB_UB")
(VMAD_sat_2_UB_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (VBFI_4_UD_UD_UD_UD_UD_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? size_i_o 4) (equal? num_9 4) (equal? num_10 0) (equal? num_11 4) (equal? prec_i_o 32) (equal? num_13 -1))
(displayln "Scaling case for VBFI_4_UD_UD_UD_UD_UD")
(VBFI_4_UD_UD_UD_UD_UD_dsl
vc_0
vc_1
vc_2
vc_3
(visa:scale-expr v4 scale-factor)
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? size_i_o 2) (equal? num_9 2) (equal? num_10 0) (equal? num_11 2) (equal? prec_i_o 32) (equal? num_13 -1))
(displayln "Scaling case for VBFI_2_UD_UD_UD_UD_UD")
(VBFI_4_UD_UD_UD_UD_UD_dsl
vc_0
vc_1
vc_2
vc_3
(visa:scale-expr v4 scale-factor)
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? size_i_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 8) (equal? prec_i_o 32) (equal? num_13 -1))
(displayln "Scaling case for VBFI_8_D_D_D_D_D")
(VBFI_4_UD_UD_UD_UD_UD_dsl
vc_0
vc_1
vc_2
vc_3
(visa:scale-expr v4 scale-factor)
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? size_i_o 32) (equal? num_9 32) (equal? num_10 0) (equal? num_11 32) (equal? prec_i_o 32) (equal? num_13 -1))
(displayln "Scaling case for VBFI_32_D_D_D_D_D")
(VBFI_4_UD_UD_UD_UD_UD_dsl
vc_0
vc_1
vc_2
vc_3
(visa:scale-expr v4 scale-factor)
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? size_i_o 2) (equal? num_9 2) (equal? num_10 0) (equal? num_11 2) (equal? prec_i_o 32) (equal? num_13 -1))
(displayln "Scaling case for VBFI_2_D_D_D_D_D")
(VBFI_4_UD_UD_UD_UD_UD_dsl
vc_0
vc_1
vc_2
vc_3
(visa:scale-expr v4 scale-factor)
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? size_i_o 16) (equal? num_9 16) (equal? num_10 0) (equal? num_11 16) (equal? prec_i_o 32) (equal? num_13 -1))
(displayln "Scaling case for VBFI_16_D_D_D_D_D")
(VBFI_4_UD_UD_UD_UD_UD_dsl
vc_0
vc_1
vc_2
vc_3
(visa:scale-expr v4 scale-factor)
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? size_i_o 16) (equal? num_9 16) (equal? num_10 0) (equal? num_11 16) (equal? prec_i_o 32) (equal? num_13 -1))
(displayln "Scaling case for VBFI_16_UD_UD_UD_UD_UD")
(VBFI_4_UD_UD_UD_UD_UD_dsl
vc_0
vc_1
vc_2
vc_3
(visa:scale-expr v4 scale-factor)
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? size_i_o 1) (equal? num_9 1) (equal? num_10 0) (equal? num_11 1) (equal? prec_i_o 32) (equal? num_13 -1))
(displayln "Scaling case for VBFI_1_UD_UD_UD_UD_UD")
(VBFI_4_UD_UD_UD_UD_UD_dsl
vc_0
vc_1
vc_2
vc_3
(visa:scale-expr v4 scale-factor)
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? size_i_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 8) (equal? prec_i_o 32) (equal? num_13 -1))
(displayln "Scaling case for VBFI_8_UD_UD_UD_UD_UD")
(VBFI_4_UD_UD_UD_UD_UD_dsl
vc_0
vc_1
vc_2
vc_3
(visa:scale-expr v4 scale-factor)
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? size_i_o 32) (equal? num_9 32) (equal? num_10 0) (equal? num_11 32) (equal? prec_i_o 32) (equal? num_13 -1))
(displayln "Scaling case for VBFI_32_UD_UD_UD_UD_UD")
(VBFI_4_UD_UD_UD_UD_UD_dsl
vc_0
vc_1
vc_2
vc_3
(visa:scale-expr v4 scale-factor)
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? size_i_o 1) (equal? num_9 1) (equal? num_10 0) (equal? num_11 1) (equal? prec_i_o 32) (equal? num_13 -1))
(displayln "Scaling case for VBFI_1_D_D_D_D_D")
(VBFI_4_UD_UD_UD_UD_UD_dsl
vc_0
vc_1
vc_2
vc_3
(visa:scale-expr v4 scale-factor)
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? size_i_o 4) (equal? num_9 4) (equal? num_10 0) (equal? num_11 4) (equal? prec_i_o 32) (equal? num_13 -1))
(displayln "Scaling case for VBFI_4_D_D_D_D_D")
(VBFI_4_UD_UD_UD_UD_UD_dsl
vc_0
vc_1
vc_2
vc_3
(visa:scale-expr v4 scale-factor)
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (VBFE_32_D_D_D_D_dsl vc_0 vc_1 vc_2 vc_3 vc_4 v5 v6 v7 size_i_o num_9 num_10 num_11 prec_i_o num_13 num_14)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_4 (lit (bv #x00000000000000000000000000000020 (bitvector 32)))) (equal? size_i_o 32) (equal? num_9 32) (equal? num_10 0) (equal? num_11 32) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1))
(displayln "Scaling case for VBFE_32_D_D_D_D")
(VBFE_32_D_D_D_D_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_4 (lit (bv #x00000000000000000000000000000020 (bitvector 32)))) (equal? size_i_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 8) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1))
(displayln "Scaling case for VBFE_8_D_D_D_D")
(VBFE_32_D_D_D_D_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_4 (lit (bv #x00000000000000000000000000000020 (bitvector 32)))) (equal? size_i_o 4) (equal? num_9 4) (equal? num_10 0) (equal? num_11 4) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1))
(displayln "Scaling case for VBFE_4_D_D_D_D")
(VBFE_32_D_D_D_D_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_4 (lit (bv #x00000000000000000000000000000020 (bitvector 32)))) (equal? size_i_o 16) (equal? num_9 16) (equal? num_10 0) (equal? num_11 16) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1))
(displayln "Scaling case for VBFE_16_D_D_D_D")
(VBFE_32_D_D_D_D_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_4 (lit (bv #x00000000000000000000000000000020 (bitvector 32)))) (equal? size_i_o 16) (equal? num_9 16) (equal? num_10 0) (equal? num_11 16) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1))
(displayln "Scaling case for VBFE_16_UD_UD_UD_UD")
(VBFE_32_D_D_D_D_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_4 (lit (bv #x00000000000000000000000000000020 (bitvector 32)))) (equal? size_i_o 1) (equal? num_9 1) (equal? num_10 0) (equal? num_11 1) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1))
(displayln "Scaling case for VBFE_1_D_D_D_D")
(VBFE_32_D_D_D_D_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_4 (lit (bv #x00000000000000000000000000000020 (bitvector 32)))) (equal? size_i_o 2) (equal? num_9 2) (equal? num_10 0) (equal? num_11 2) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1))
(displayln "Scaling case for VBFE_2_D_D_D_D")
(VBFE_32_D_D_D_D_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_4 (lit (bv #x00000000000000000000000000000020 (bitvector 32)))) (equal? size_i_o 8) (equal? num_9 8) (equal? num_10 0) (equal? num_11 8) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1))
(displayln "Scaling case for VBFE_8_UD_UD_UD_UD")
(VBFE_32_D_D_D_D_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_4 (lit (bv #x00000000000000000000000000000020 (bitvector 32)))) (equal? size_i_o 2) (equal? num_9 2) (equal? num_10 0) (equal? num_11 2) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1))
(displayln "Scaling case for VBFE_2_UD_UD_UD_UD")
(VBFE_32_D_D_D_D_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_4 (lit (bv #x00000000000000000000000000000020 (bitvector 32)))) (equal? size_i_o 1) (equal? num_9 1) (equal? num_10 0) (equal? num_11 1) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1))
(displayln "Scaling case for VBFE_1_UD_UD_UD_UD")
(VBFE_32_D_D_D_D_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_4 (lit (bv #x00000000000000000000000000000020 (bitvector 32)))) (equal? size_i_o 4) (equal? num_9 4) (equal? num_10 0) (equal? num_11 4) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1))
(displayln "Scaling case for VBFE_4_UD_UD_UD_UD")
(VBFE_32_D_D_D_D_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000001f (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_3 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_4 (lit (bv #x00000000000000000000000000000020 (bitvector 32)))) (equal? size_i_o 32) (equal? num_9 32) (equal? num_10 0) (equal? num_11 32) (equal? prec_i_o 32) (equal? num_13 -1) (equal? num_14 -1))
(displayln "Scaling case for VBFE_32_UD_UD_UD_UD")
(VBFE_32_D_D_D_D_dsl
vc_0
vc_1
vc_2
vc_3
vc_4
(visa:scale-expr v5 scale-factor)
(visa:scale-expr v6 scale-factor)
(visa:scale-expr v7 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_9)
num_10
(* scale-factor num_11)
prec_i_o
num_13
num_14
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (VAVG_sat_8_UB_UB_UB_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 2) (equal? num_5 2) (equal? num_6 0) (equal? num_7 2) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1) (equal? num_15 2))
(displayln "Scaling case for VAVG_sat_8_UB_UB_UB")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
(* scale-factor num_13)
num_14
(* scale-factor num_15)
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_32_W_W_W")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_32_UW_UW_UW")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_32_UB_UB_UB")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 1) (equal? num_5 1) (equal? num_6 0) (equal? num_7 1) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_1_D_D_D")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 4) (equal? num_5 4) (equal? num_6 0) (equal? num_7 4) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_16_B_B_B")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 1) (equal? num_5 1) (equal? num_6 0) (equal? num_7 1) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_1_UD_UD_UD")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 2) (equal? num_5 2) (equal? num_6 0) (equal? num_7 2) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1) (equal? num_15 2))
(displayln "Scaling case for VAVG_4_UW_UW_UW")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
(* scale-factor num_13)
num_14
(* scale-factor num_15)
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 1) (equal? num_5 1) (equal? num_6 0) (equal? num_7 1) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_1_UD_UD_UD")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_32_UD_UD_UD")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 1) (equal? num_5 1) (equal? num_6 0) (equal? num_7 1) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_2_UW_UW_UW")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_16_D_D_D")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_16_UD_UD_UD")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 4) (equal? num_5 4) (equal? num_6 0) (equal? num_7 4) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_8_UW_UW_UW")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_8_D_D_D")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 4) (equal? num_5 4) (equal? num_6 0) (equal? num_7 4) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_16_UB_UB_UB")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 2) (equal? num_5 2) (equal? num_6 0) (equal? num_7 2) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1) (equal? num_15 2))
(displayln "Scaling case for VAVG_sat_4_W_W_W")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
(* scale-factor num_13)
num_14
(* scale-factor num_15)
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 1) (equal? num_5 1) (equal? num_6 0) (equal? num_7 1) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_4_UB_UB_UB")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 1) (equal? num_5 1) (equal? num_6 0) (equal? num_7 1) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_2_W_W_W")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_32_UW_UW_UW")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 4) (equal? num_5 4) (equal? num_6 0) (equal? num_7 4) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_4_D_D_D")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_32_UD_UD_UD")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 4) (equal? num_5 4) (equal? num_6 0) (equal? num_7 4) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_8_UW_UW_UW")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 4) (equal? num_5 4) (equal? num_6 0) (equal? num_7 4) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_8_W_W_W")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 2) (equal? num_5 2) (equal? num_6 0) (equal? num_7 2) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1) (equal? num_15 2))
(displayln "Scaling case for VAVG_sat_2_D_D_D")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
(* scale-factor num_13)
num_14
(* scale-factor num_15)
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 4) (equal? num_5 4) (equal? num_6 0) (equal? num_7 4) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_4_D_D_D")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_16_UD_UD_UD")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_16_UW_UW_UW")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 1) (equal? num_5 1) (equal? num_6 0) (equal? num_7 1) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_4_UB_UB_UB")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 4) (equal? num_5 4) (equal? num_6 0) (equal? num_7 4) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_4_UD_UD_UD")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_8_UD_UD_UD")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 4) (equal? num_5 4) (equal? num_6 0) (equal? num_7 4) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_4_UD_UD_UD")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 1) (equal? num_5 1) (equal? num_6 0) (equal? num_7 1) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_2_W_W_W")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 2) (equal? num_5 2) (equal? num_6 0) (equal? num_7 2) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1) (equal? num_15 2))
(displayln "Scaling case for VAVG_8_UB_UB_UB")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
(* scale-factor num_13)
num_14
(* scale-factor num_15)
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_16_W_W_W")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 2) (equal? num_5 2) (equal? num_6 0) (equal? num_7 2) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1) (equal? num_15 2))
(displayln "Scaling case for VAVG_sat_4_UW_UW_UW")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
(* scale-factor num_13)
num_14
(* scale-factor num_15)
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 2) (equal? num_5 2) (equal? num_6 0) (equal? num_7 2) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1) (equal? num_15 2))
(displayln "Scaling case for VAVG_sat_2_UD_UD_UD")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
(* scale-factor num_13)
num_14
(* scale-factor num_15)
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 1) (equal? num_5 1) (equal? num_6 0) (equal? num_7 1) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_4_B_B_B")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 1) (equal? num_5 1) (equal? num_6 0) (equal? num_7 1) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_4_B_B_B")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_32_UB_UB_UB")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 2) (equal? num_5 2) (equal? num_6 0) (equal? num_7 2) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1) (equal? num_15 2))
(displayln "Scaling case for VAVG_4_W_W_W")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
(* scale-factor num_13)
num_14
(* scale-factor num_15)
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_16_W_W_W")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_32_B_B_B")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 2) (equal? num_5 2) (equal? num_6 0) (equal? num_7 2) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1) (equal? num_15 2))
(displayln "Scaling case for VAVG_8_B_B_B")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
(* scale-factor num_13)
num_14
(* scale-factor num_15)
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_32_D_D_D")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 2) (equal? num_5 2) (equal? num_6 0) (equal? num_7 2) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1) (equal? num_15 2))
(displayln "Scaling case for VAVG_sat_8_B_B_B")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
(* scale-factor num_13)
num_14
(* scale-factor num_15)
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 4) (equal? num_5 4) (equal? num_6 0) (equal? num_7 4) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_8_W_W_W")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_32_W_W_W")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 2) (equal? num_5 2) (equal? num_6 0) (equal? num_7 2) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1) (equal? num_15 2))
(displayln "Scaling case for VAVG_2_D_D_D")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
(* scale-factor num_13)
num_14
(* scale-factor num_15)
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 2) (equal? num_5 2) (equal? num_6 0) (equal? num_7 2) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1) (equal? num_15 2))
(displayln "Scaling case for VAVG_2_UD_UD_UD")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
(* scale-factor num_13)
num_14
(* scale-factor num_15)
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 4) (equal? num_5 4) (equal? num_6 0) (equal? num_7 4) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_16_UB_UB_UB")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_16_UW_UW_UW")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 1) (equal? num_5 1) (equal? num_6 0) (equal? num_7 1) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_1_D_D_D")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_16_D_D_D")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 1) (equal? num_5 1) (equal? num_6 0) (equal? num_7 1) (equal? prec_i_o 16) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_2_UW_UW_UW")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_32_D_D_D")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 -1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_32_B_B_B")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 4) (equal? num_5 4) (equal? num_6 0) (equal? num_7 4) (equal? prec_i_o 8) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_16_B_B_B")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_8_UD_UD_UD")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? vc_1 (lit (bv #x0000000000000000000000000000000000000000000000000000000000000001 (bitvector 64)))) (equal? size_i_o 8) (equal? num_5 8) (equal? num_6 0) (equal? num_7 8) (equal? prec_i_o 32) (equal? num_9 0) (equal? num_10 1) (equal? num_11 1) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1) (equal? num_15 64))
(displayln "Scaling case for VAVG_sat_8_D_D_D")
(VAVG_sat_8_UB_UB_UB_dsl
vc_0
vc_1
(visa:scale-expr v2 scale-factor)
(visa:scale-expr v3 scale-factor)
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
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (VMAD_4_B_B_B_B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_4 1) (equal? num_5 0) (equal? num_6 1) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_4_B_B_B_B")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 2) (equal? num_4 2) (equal? num_5 0) (equal? num_6 2) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 2) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1))
(displayln "Scaling case for VMAD_4_UW_UW_UW_UW")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
(* scale-factor num_11)
num_12
(* scale-factor num_13)
num_14
)
]
		[(and  (equal? size_i_o 2) (equal? num_4 2) (equal? num_5 0) (equal? num_6 2) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 2) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1))
(displayln "Scaling case for VMAD_2_UD_UD_UD_UD")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
(* scale-factor num_11)
num_12
(* scale-factor num_13)
num_14
)
]
		[(and  (equal? size_i_o 4) (equal? num_4 4) (equal? num_5 0) (equal? num_6 4) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_8_UW_UW_UW_UW")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 4) (equal? num_4 4) (equal? num_5 0) (equal? num_6 4) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_16_UB_UB_UB_UB")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 1) (equal? num_4 1) (equal? num_5 0) (equal? num_6 1) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_4_UB_UB_UB_UB")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_32_UD_UD_UD_UD")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 1) (equal? num_4 1) (equal? num_5 0) (equal? num_6 1) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_1_UD_UD_UD_UD")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 2) (equal? num_4 2) (equal? num_5 0) (equal? num_6 2) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 2) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1))
(displayln "Scaling case for VMAD_2_D_D_D_D")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
(* scale-factor num_11)
num_12
(* scale-factor num_13)
num_14
)
]
		[(and  (equal? size_i_o 4) (equal? num_4 4) (equal? num_5 0) (equal? num_6 4) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_16_B_B_B_B")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_32_W_W_W_W")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_16_W_W_W_W")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_32_UW_UW_UW_UW")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 8) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_8_UD_UD_UD_UD")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_32_D_D_D_D")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_16_D_D_D_D")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 2) (equal? num_4 2) (equal? num_5 0) (equal? num_6 2) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 2) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1))
(displayln "Scaling case for VMAD_8_B_B_B_B")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
(* scale-factor num_11)
num_12
(* scale-factor num_13)
num_14
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_16_UD_UD_UD_UD")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 8) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_8_D_D_D_D")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 1) (equal? num_4 1) (equal? num_5 0) (equal? num_6 1) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_2_UW_UW_UW_UW")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 4) (equal? num_4 4) (equal? num_5 0) (equal? num_6 4) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_4_D_D_D_D")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 8) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_32_B_B_B_B")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 8) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_32_UB_UB_UB_UB")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 8) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_16_UW_UW_UW_UW")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 1) (equal? num_4 1) (equal? num_5 0) (equal? num_6 1) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_2_W_W_W_W")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 2) (equal? num_4 2) (equal? num_5 0) (equal? num_6 2) (equal? prec_i_o 8) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 2) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1))
(displayln "Scaling case for VMAD_8_UB_UB_UB_UB")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
(* scale-factor num_11)
num_12
(* scale-factor num_13)
num_14
)
]
		[(and  (equal? size_i_o 4) (equal? num_4 4) (equal? num_5 0) (equal? num_6 4) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_8_W_W_W_W")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 4) (equal? num_4 4) (equal? num_5 0) (equal? num_6 4) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_4_UD_UD_UD_UD")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[(and  (equal? size_i_o 2) (equal? num_4 2) (equal? num_5 0) (equal? num_6 2) (equal? prec_i_o 16) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 2) (equal? num_12 1) (equal? num_13 2) (equal? num_14 1))
(displayln "Scaling case for VMAD_4_W_W_W_W")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
(* scale-factor num_11)
num_12
(* scale-factor num_13)
num_14
)
]
		[(and  (equal? size_i_o 1) (equal? num_4 1) (equal? num_5 0) (equal? num_6 1) (equal? prec_i_o 32) (equal? num_8 0) (equal? num_9 -1) (equal? num_10 1) (equal? num_11 64) (equal? num_12 1) (equal? num_13 64) (equal? num_14 1))
(displayln "Scaling case for VMAD_1_D_D_D_D")
(VMAD_4_B_B_B_B_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
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
num_14
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (VMULH_1_D_D_D_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1))
(displayln "Scaling case for VMULH_1_D_D_D")
(VMULH_1_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
(* scale-factor num_7)
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1))
(displayln "Scaling case for VMULH_8_D_D_D")
(VMULH_1_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1))
(displayln "Scaling case for VMULH_1_UD_UD_UD")
(VMULH_1_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
(* scale-factor num_7)
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 2) (equal? num_10 1))
(displayln "Scaling case for VMULH_2_D_D_D")
(VMULH_1_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
(* scale-factor num_9)
num_10
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 2) (equal? num_10 1))
(displayln "Scaling case for VMULH_2_UD_UD_UD")
(VMULH_1_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
(* scale-factor num_9)
num_10
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1))
(displayln "Scaling case for VMULH_8_UD_UD_UD")
(VMULH_1_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1))
(displayln "Scaling case for VMULH_32_UD_UD_UD")
(VMULH_1_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1))
(displayln "Scaling case for VMULH_16_UD_UD_UD")
(VMULH_1_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1))
(displayln "Scaling case for VMULH_16_D_D_D")
(VMULH_1_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1))
(displayln "Scaling case for VMULH_32_D_D_D")
(VMULH_1_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1))
(displayln "Scaling case for VMULH_4_D_D_D")
(VMULH_1_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 32) (equal? num_7 32) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1))
(displayln "Scaling case for VMULH_4_UD_UD_UD")
(VMULH_1_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
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
	[ (VMUL_sat_8_UW_UW_UW_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_sat_8_UW_UW_UW")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_sat_16_UW_UW_UW")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8))
(displayln "Scaling case for VMUL_sat_32_B_B_B")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_sat_8_W_W_W")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8))
(displayln "Scaling case for VMUL_sat_16_UB_UB_UB")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_sat_4_UW_UW_UW")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_sat_4_W_W_W")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8))
(displayln "Scaling case for VMUL_sat_8_B_B_B")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_sat_32_UW_UW_UW")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8))
(displayln "Scaling case for VMUL_sat_32_UB_UB_UB")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 8))
(displayln "Scaling case for VMUL_sat_4_UB_UB_UB")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_sat_2_W_W_W")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8))
(displayln "Scaling case for VMUL_sat_16_B_B_B")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_sat_16_W_W_W")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8))
(displayln "Scaling case for VMUL_sat_8_UB_UB_UB")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_sat_2_UW_UW_UW")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 8))
(displayln "Scaling case for VMUL_sat_4_B_B_B")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_sat_32_W_W_W")
(VMUL_sat_8_UW_UW_UW_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (VADD_4_W_W_W_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for VADD_4_W_W_W")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for VADD_4_B_B_B")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for VADD_32_UW_UW_UW")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for VADD_8_B_B_B")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_16_D_D_D")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 16) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_4_W_W_W")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for VADD_2_UD_UD_UD")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_16_UD_UD_UD")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for VADD_1_D_D_D")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_32_B_B_B")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_8_W_W_W")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_16_UW_UW_UW")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for VADD_8_UD_UD_UD")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_8_D_D_D")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 32) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_2_UD_UD_UD")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_8_UB_UB_UB")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_8_UW_UW_UW")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for VADD_32_UB_UB_UB")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for VADD_4_D_D_D")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_32_UD_UD_UD")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 16) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_2_UW_UW_UW")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_32_W_W_W")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for VADD_32_W_W_W")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_32_UB_UB_UB")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 32) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_2_D_D_D")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for VADD_16_UB_UB_UB")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for VADD_1_UD_UD_UD")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 32) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_1_D_D_D")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for VADD_2_W_W_W")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for VADD_32_B_B_B")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 16) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_4_UW_UW_UW")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for VADD_16_B_B_B")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_16_W_W_W")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 8) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_4_UB_UB_UB")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for VADD_4_UB_UB_UB")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for VADD_16_UW_UW_UW")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_16_B_B_B")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 32) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_4_D_D_D")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_8_UD_UD_UD")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for VADD_32_D_D_D")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for VADD_32_UD_UD_UD")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for VADD_8_D_D_D")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_32_D_D_D")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 32) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_4_UD_UD_UD")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 -1))
(displayln "Scaling case for VADD_8_UB_UB_UB")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for VADD_4_UW_UW_UW")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for VADD_16_W_W_W")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for VADD_8_W_W_W")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 8) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_4_B_B_B")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for VADD_2_UW_UW_UW")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for VADD_16_D_D_D")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_16_UB_UB_UB")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_8_B_B_B")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for VADD_4_UD_UD_UD")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 16) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_2_W_W_W")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 -1))
(displayln "Scaling case for VADD_8_UW_UW_UW")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for VADD_16_UD_UD_UD")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_32_UW_UW_UW")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 32) (equal? num_7 -1))
(displayln "Scaling case for VADD_2_D_D_D")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 32) (equal? num_7 1))
(displayln "Scaling case for VADD_sat_1_UD_UD_UD")
(VADD_4_W_W_W_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
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
	[ (VMOV_1_Q_Q_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_1_Q_Q")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_32_W_W")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 8))
(displayln "Scaling case for VMOV_8_B_B")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_8_Q_Q")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 8))
(displayln "Scaling case for VMOV_sat_8_B_B")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_sat_4_D_D")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_sat_4_UD_UD")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 8))
(displayln "Scaling case for VMOV_sat_4_B_B")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_4_D_D")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_sat_32_Q_Q")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_sat_2_UD_UD")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_sat_16_UW_UW")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 8))
(displayln "Scaling case for VMOV_4_UB_UB")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_sat_1_UD_UD")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_sat_8_Q_Q")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_16_W_W")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_sat_16_W_W")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_2_W_W")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_1_UD_UD")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_8_UD_UD")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_sat_16_UQ_UQ")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8))
(displayln "Scaling case for VMOV_32_UB_UB")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_4_W_W")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_8_UW_UW")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_16_Q_Q")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_sat_8_W_W")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 8))
(displayln "Scaling case for VMOV_4_B_B")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_16_UD_UD")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_8_D_D")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_sat_16_UD_UD")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_1_UQ_UQ")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_sat_4_UW_UW")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8))
(displayln "Scaling case for VMOV_32_B_B")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 8))
(displayln "Scaling case for VMOV_8_UB_UB")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 8))
(displayln "Scaling case for VMOV_sat_16_UB_UB")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_16_D_D")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_sat_4_Q_Q")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_32_D_D")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_sat_4_W_W")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8))
(displayln "Scaling case for VMOV_sat_32_B_B")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_sat_16_Q_Q")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_2_UD_UD")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_32_UW_UW")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_16_UQ_UQ")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_8_W_W")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_sat_1_D_D")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_sat_32_D_D")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_sat_32_UW_UW")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_sat_8_UQ_UQ")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_sat_16_D_D")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_sat_2_Q_Q")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 8))
(displayln "Scaling case for VMOV_16_B_B")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_sat_1_UQ_UQ")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 8))
(displayln "Scaling case for VMOV_sat_16_B_B")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_sat_8_UD_UD")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_sat_8_UW_UW")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 8))
(displayln "Scaling case for VMOV_16_UB_UB")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_4_UD_UD")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_32_UQ_UQ")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8))
(displayln "Scaling case for VMOV_sat_32_UB_UB")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_sat_32_UD_UD")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_sat_1_Q_Q")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_2_UQ_UQ")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_32_Q_Q")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_2_UW_UW")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_1_D_D")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_sat_2_W_W")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 8))
(displayln "Scaling case for VMOV_sat_8_UB_UB")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_sat_2_UW_UW")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_4_UQ_UQ")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 64) (equal? num_2 64) (equal? num_3 0) (equal? num_4 64) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_sat_32_UQ_UQ")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_sat_8_D_D")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_sat_2_UQ_UQ")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 8))
(displayln "Scaling case for VMOV_sat_4_UB_UB")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_16_UW_UW")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_32_UD_UD")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_sat_4_UQ_UQ")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_2_Q_Q")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_4_UW_UW")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_2_D_D")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_8_UQ_UQ")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 32))
(displayln "Scaling case for VMOV_sat_2_D_D")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16))
(displayln "Scaling case for VMOV_sat_32_W_W")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 64))
(displayln "Scaling case for VMOV_4_Q_Q")
(VMOV_1_Q_Q_dsl
(visa:scale-expr v0 scale-factor)
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
	[ (VDP4A_sat_32_D_D_D_D_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 256) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_sat_32_D_D_D_D")
(VDP4A_sat_32_D_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 4) (equal? num_4 4) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_sat_4_D_D_D_D")
(VDP4A_sat_32_D_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 1) (equal? num_4 1) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_sat_1_D_D_D_D")
(VDP4A_sat_32_D_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_sat_8_D_D_D_D")
(VDP4A_sat_32_D_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 2) (equal? num_4 2) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 2) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 2) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 2) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_sat_2_UD_UD_UD_UD")
(VDP4A_sat_32_D_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
num_9
num_10
num_11
(* scale-factor num_12)
num_13
num_14
(* scale-factor num_15)
num_16
num_17
num_18
num_19
(* scale-factor num_20)
num_21
num_22
num_23
num_24
(* scale-factor num_25)
num_26
num_27
num_28
(* scale-factor num_29)
num_30
num_31
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 128) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_sat_16_D_D_D_D")
(VDP4A_sat_32_D_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 1) (equal? num_4 1) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_sat_1_UD_UD_UD_UD")
(VDP4A_sat_32_D_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 128) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_sat_16_UD_UD_UD_UD")
(VDP4A_sat_32_D_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 4) (equal? num_4 4) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_sat_4_UD_UD_UD_UD")
(VDP4A_sat_32_D_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_sat_8_UD_UD_UD_UD")
(VDP4A_sat_32_D_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 2) (equal? num_4 2) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 2) (equal? num_13 1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 2) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 2) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 2) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_sat_2_D_D_D_D")
(VDP4A_sat_32_D_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
num_9
num_10
num_11
(* scale-factor num_12)
num_13
num_14
(* scale-factor num_15)
num_16
num_17
num_18
num_19
(* scale-factor num_20)
num_21
num_22
num_23
num_24
(* scale-factor num_25)
num_26
num_27
num_28
(* scale-factor num_29)
num_30
num_31
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 256) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 1) (equal? num_10 1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_sat_32_UD_UD_UD_UD")
(VDP4A_sat_32_D_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (VNOT_32_W_W_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16))
(displayln "Scaling case for VNOT_32_W_W")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 32))
(displayln "Scaling case for VNOT_4_D_D")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 16))
(displayln "Scaling case for VNOT_8_UW_UW")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32))
(displayln "Scaling case for VNOT_32_D_D")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 16))
(displayln "Scaling case for VNOT_8_W_W")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 32))
(displayln "Scaling case for VNOT_1_UD_UD")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 16))
(displayln "Scaling case for VNOT_16_UW_UW")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 16))
(displayln "Scaling case for VNOT_16_W_W")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 32))
(displayln "Scaling case for VNOT_1_D_D")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 8))
(displayln "Scaling case for VNOT_16_UB_UB")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 8))
(displayln "Scaling case for VNOT_16_B_B")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 8))
(displayln "Scaling case for VNOT_8_B_B")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 16))
(displayln "Scaling case for VNOT_2_UW_UW")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 16))
(displayln "Scaling case for VNOT_4_W_W")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 16))
(displayln "Scaling case for VNOT_32_UW_UW")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 32))
(displayln "Scaling case for VNOT_16_D_D")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 16) (equal? prec_i_o 32))
(displayln "Scaling case for VNOT_16_UD_UD")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 32))
(displayln "Scaling case for VNOT_8_UD_UD")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 32))
(displayln "Scaling case for VNOT_2_D_D")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8))
(displayln "Scaling case for VNOT_32_UB_UB")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 16))
(displayln "Scaling case for VNOT_4_UW_UW")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 32))
(displayln "Scaling case for VNOT_2_UD_UD")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 32) (equal? prec_i_o 32))
(displayln "Scaling case for VNOT_32_UD_UD")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 8))
(displayln "Scaling case for VNOT_4_B_B")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_2 2) (equal? num_3 0) (equal? num_4 2) (equal? prec_i_o 8))
(displayln "Scaling case for VNOT_8_UB_UB")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 8))
(displayln "Scaling case for VNOT_32_B_B")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 16))
(displayln "Scaling case for VNOT_2_W_W")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_2 4) (equal? num_3 0) (equal? num_4 4) (equal? prec_i_o 32))
(displayln "Scaling case for VNOT_4_UD_UD")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_2 1) (equal? num_3 0) (equal? num_4 1) (equal? prec_i_o 8))
(displayln "Scaling case for VNOT_4_UB_UB")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 8) (equal? prec_i_o 32))
(displayln "Scaling case for VNOT_8_D_D")
(VNOT_32_W_W_dsl
(visa:scale-expr v0 scale-factor)
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
	[ (VXOR_32_UD_UD_UD_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32))
(displayln "Scaling case for VXOR_32_UD_UD_UD")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 32))
(displayln "Scaling case for VXOR_2_D_D_D")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 32))
(displayln "Scaling case for VXOR_2_UD_UD_UD")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8))
(displayln "Scaling case for VXOR_32_UB_UB_UB")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8))
(displayln "Scaling case for VXOR_8_UB_UB_UB")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16))
(displayln "Scaling case for VXOR_16_UW_UW_UW")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8))
(displayln "Scaling case for VXOR_8_B_B_B")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32))
(displayln "Scaling case for VXOR_8_UD_UD_UD")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 16))
(displayln "Scaling case for VXOR_2_UW_UW_UW")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16))
(displayln "Scaling case for VXOR_32_UW_UW_UW")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32))
(displayln "Scaling case for VXOR_8_D_D_D")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16))
(displayln "Scaling case for VXOR_8_W_W_W")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 32))
(displayln "Scaling case for VXOR_1_D_D_D")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16))
(displayln "Scaling case for VXOR_32_W_W_W")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 16))
(displayln "Scaling case for VXOR_2_W_W_W")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 32))
(displayln "Scaling case for VXOR_1_UD_UD_UD")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16))
(displayln "Scaling case for VXOR_8_UW_UW_UW")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 16))
(displayln "Scaling case for VXOR_4_W_W_W")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 8))
(displayln "Scaling case for VXOR_4_UB_UB_UB")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8))
(displayln "Scaling case for VXOR_16_UB_UB_UB")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 32))
(displayln "Scaling case for VXOR_4_UD_UD_UD")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 32))
(displayln "Scaling case for VXOR_4_D_D_D")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32))
(displayln "Scaling case for VXOR_16_UD_UD_UD")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 16))
(displayln "Scaling case for VXOR_4_UW_UW_UW")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32))
(displayln "Scaling case for VXOR_16_D_D_D")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 8))
(displayln "Scaling case for VXOR_4_B_B_B")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8))
(displayln "Scaling case for VXOR_32_B_B_B")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8))
(displayln "Scaling case for VXOR_16_B_B_B")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32))
(displayln "Scaling case for VXOR_32_D_D_D")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16))
(displayln "Scaling case for VXOR_16_W_W_W")
(VXOR_32_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (VDP4A_1_UD_UD_UD_UD_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_4 1) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_1_UD_UD_UD_UD")
(VDP4A_1_UD_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_8_D_D_D_D")
(VDP4A_1_UD_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 64) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_8_UD_UD_UD_UD")
(VDP4A_1_UD_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 4) (equal? num_4 4) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_4_D_D_D_D")
(VDP4A_1_UD_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 128) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_16_UD_UD_UD_UD")
(VDP4A_1_UD_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 1) (equal? num_4 1) (equal? num_5 0) (equal? num_6 8) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_1_D_D_D_D")
(VDP4A_1_UD_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 2) (equal? num_4 2) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 2) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 2) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 2) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_2_UD_UD_UD_UD")
(VDP4A_1_UD_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
num_9
num_10
num_11
(* scale-factor num_12)
num_13
num_14
(* scale-factor num_15)
num_16
num_17
num_18
num_19
(* scale-factor num_20)
num_21
num_22
num_23
num_24
(* scale-factor num_25)
num_26
num_27
num_28
(* scale-factor num_29)
num_30
num_31
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 256) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_32_UD_UD_UD_UD")
(VDP4A_1_UD_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 4) (equal? num_4 4) (equal? num_5 0) (equal? num_6 32) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_4_UD_UD_UD_UD")
(VDP4A_1_UD_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 256) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_32_D_D_D_D")
(VDP4A_1_UD_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 128) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 64) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 64) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 64) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 64) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 64) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_16_D_D_D_D")
(VDP4A_1_UD_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
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
num_19
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
)
]
		[(and  (equal? size_i_o 2) (equal? num_4 2) (equal? num_5 0) (equal? num_6 16) (equal? prec_i 8) (equal? prec_o 32) (equal? num_9 0) (equal? num_10 -1) (equal? num_11 1) (equal? num_12 2) (equal? num_13 -1) (equal? num_14 1) (equal? num_15 2) (equal? num_16 1) (equal? num_17 24) (equal? num_18 -1) (equal? num_19 1) (equal? num_20 2) (equal? num_21 1) (equal? num_22 16) (equal? num_23 -1) (equal? num_24 1) (equal? num_25 2) (equal? num_26 1) (equal? num_27 8) (equal? num_28 1) (equal? num_29 2) (equal? num_30 1) (equal? num_31 4))
(displayln "Scaling case for VDP4A_2_D_D_D_D")
(VDP4A_1_UD_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(visa:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
num_6
prec_i
prec_o
num_9
num_10
num_11
(* scale-factor num_12)
num_13
num_14
(* scale-factor num_15)
num_16
num_17
num_18
num_19
(* scale-factor num_20)
num_21
num_22
num_23
num_24
(* scale-factor num_25)
num_26
num_27
num_28
(* scale-factor num_29)
num_30
num_31
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (VMUL_1_UB_UB_UB_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_8_UW_UW_UW")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 32))
(displayln "Scaling case for VMUL_4_D_D_D")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 32))
(displayln "Scaling case for VMUL_2_D_D_D")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8))
(displayln "Scaling case for VMUL_8_B_B_B")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32))
(displayln "Scaling case for VMUL_32_D_D_D")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32))
(displayln "Scaling case for VMUL_32_UD_UD_UD")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_32_W_W_W")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8))
(displayln "Scaling case for VMUL_32_B_B_B")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_8_W_W_W")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_16_W_W_W")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8))
(displayln "Scaling case for VMUL_16_UB_UB_UB")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_4_UW_UW_UW")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8))
(displayln "Scaling case for VMUL_32_UB_UB_UB")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_2_UW_UW_UW")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32))
(displayln "Scaling case for VMUL_8_UD_UD_UD")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_16_UW_UW_UW")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 8))
(displayln "Scaling case for VMUL_4_UB_UB_UB")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 32))
(displayln "Scaling case for VMUL_2_UD_UD_UD")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8))
(displayln "Scaling case for VMUL_8_UB_UB_UB")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_2_W_W_W")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32))
(displayln "Scaling case for VMUL_16_UD_UD_UD")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 32))
(displayln "Scaling case for VMUL_4_UD_UD_UD")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_32_UW_UW_UW")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 8))
(displayln "Scaling case for VMUL_4_B_B_B")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8))
(displayln "Scaling case for VMUL_16_B_B_B")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32))
(displayln "Scaling case for VMUL_8_D_D_D")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 32))
(displayln "Scaling case for VMUL_1_UD_UD_UD")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32))
(displayln "Scaling case for VMUL_16_D_D_D")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 32))
(displayln "Scaling case for VMUL_1_D_D_D")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 16))
(displayln "Scaling case for VMUL_4_W_W_W")
(VMUL_1_UB_UB_UB_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (VAND_1_UD_UD_UD_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 32))
(displayln "Scaling case for VAND_1_UD_UD_UD")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 16))
(displayln "Scaling case for VAND_2_UW_UW_UW")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8))
(displayln "Scaling case for VAND_8_B_B_B")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16))
(displayln "Scaling case for VAND_8_UW_UW_UW")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 8))
(displayln "Scaling case for VAND_4_B_B_B")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 32))
(displayln "Scaling case for VAND_4_UD_UD_UD")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16))
(displayln "Scaling case for VAND_8_W_W_W")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8))
(displayln "Scaling case for VAND_32_UB_UB_UB")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16))
(displayln "Scaling case for VAND_16_W_W_W")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 32))
(displayln "Scaling case for VAND_4_D_D_D")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16))
(displayln "Scaling case for VAND_16_UW_UW_UW")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 32))
(displayln "Scaling case for VAND_2_D_D_D")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16))
(displayln "Scaling case for VAND_32_UW_UW_UW")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 8))
(displayln "Scaling case for VAND_4_UB_UB_UB")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 16))
(displayln "Scaling case for VAND_2_W_W_W")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32))
(displayln "Scaling case for VAND_16_D_D_D")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8))
(displayln "Scaling case for VAND_32_B_B_B")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16))
(displayln "Scaling case for VAND_32_W_W_W")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8))
(displayln "Scaling case for VAND_16_B_B_B")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8))
(displayln "Scaling case for VAND_8_UB_UB_UB")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32))
(displayln "Scaling case for VAND_32_UD_UD_UD")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 32))
(displayln "Scaling case for VAND_2_UD_UD_UD")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32))
(displayln "Scaling case for VAND_8_D_D_D")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 32))
(displayln "Scaling case for VAND_1_D_D_D")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32))
(displayln "Scaling case for VAND_32_D_D_D")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 16))
(displayln "Scaling case for VAND_4_W_W_W")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8))
(displayln "Scaling case for VAND_16_UB_UB_UB")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32))
(displayln "Scaling case for VAND_8_UD_UD_UD")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 16))
(displayln "Scaling case for VAND_4_UW_UW_UW")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32))
(displayln "Scaling case for VAND_16_UD_UD_UD")
(VAND_1_UD_UD_UD_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (VOR_8_D_D_D_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o)
		(cond 
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32))
(displayln "Scaling case for VOR_8_D_D_D")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8))
(displayln "Scaling case for VOR_32_UB_UB_UB")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32))
(displayln "Scaling case for VOR_32_D_D_D")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8))
(displayln "Scaling case for VOR_16_UB_UB_UB")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 16))
(displayln "Scaling case for VOR_4_W_W_W")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 16))
(displayln "Scaling case for VOR_2_UW_UW_UW")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16))
(displayln "Scaling case for VOR_16_UW_UW_UW")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 8))
(displayln "Scaling case for VOR_4_UB_UB_UB")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8))
(displayln "Scaling case for VOR_32_B_B_B")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 16))
(displayln "Scaling case for VOR_2_W_W_W")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 32))
(displayln "Scaling case for VOR_2_UD_UD_UD")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 32))
(displayln "Scaling case for VOR_1_UD_UD_UD")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16))
(displayln "Scaling case for VOR_16_W_W_W")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16))
(displayln "Scaling case for VOR_32_UW_UW_UW")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32))
(displayln "Scaling case for VOR_16_UD_UD_UD")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32))
(displayln "Scaling case for VOR_16_D_D_D")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 32))
(displayln "Scaling case for VOR_2_D_D_D")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 16))
(displayln "Scaling case for VOR_4_UW_UW_UW")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8))
(displayln "Scaling case for VOR_16_B_B_B")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 32))
(displayln "Scaling case for VOR_4_D_D_D")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16))
(displayln "Scaling case for VOR_32_W_W_W")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8))
(displayln "Scaling case for VOR_8_B_B_B")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 8))
(displayln "Scaling case for VOR_4_B_B_B")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 32))
(displayln "Scaling case for VOR_4_UD_UD_UD")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16))
(displayln "Scaling case for VOR_8_UW_UW_UW")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16))
(displayln "Scaling case for VOR_8_W_W_W")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 1) (equal? num_3 1) (equal? num_4 0) (equal? num_5 1) (equal? prec_i_o 32))
(displayln "Scaling case for VOR_1_D_D_D")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32))
(displayln "Scaling case for VOR_8_UD_UD_UD")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32))
(displayln "Scaling case for VOR_32_UD_UD_UD")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
)
]
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8))
(displayln "Scaling case for VOR_8_UB_UB_UB")
(VOR_8_D_D_D_dsl
(visa:scale-expr v0 scale-factor)
(visa:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
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

