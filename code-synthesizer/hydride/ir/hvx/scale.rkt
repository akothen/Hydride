#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require rosette/lib/destruct)



(require hydride/ir/hydride/definition)
(require hydride/ir/hvx/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                Hydride Scale Expression 
;; ================================================================================
(define (hvx:scale-expr prog scale-factor)
 (destruct prog
	[(reg id) (reg id) ]
	[(lit v) (lit (apply concat (for/list ([i (range scale-factor)]) v) ) )]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(
		vector-two-input-swizzle_dsl
		(hvx:scale-expr v0 scale-factor)
		(hvx:scale-expr v1 scale-factor)
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
		(hvx:scale-expr v0 scale-factor)
		(hvx:scale-expr v1 scale-factor)
		(* scale-factor size_i_o)
		prec_i_o
		)
	]
	[ (interleave-vector_dsl v0 size_i_o prec_i_o)
		(
		interleave-vector_dsl
		(hvx:scale-expr v0 scale-factor)
		(* scale-factor size_i_o)
		prec_i_o
		)
	]
	[ (deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(
		deinterleave-vector_dsl
		(hvx:scale-expr v0 scale-factor)
		(* scale-factor size_i_o)
		prec_i_o
		)
	]
	[ (llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(
		llvm_shuffle_vectors_dsl
		(hvx:scale-expr v0 scale-factor)
		(hvx:scale-expr v1 scale-factor)
		num_2
		prec_i_o
		(hvx:scale-expr v4 scale-factor)
		num_5
		)
	]
	[ (hexagon_V6_vshuffob_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16))
(hexagon_V6_vshuffob_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16))
(hexagon_V6_vshuffob_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
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
	[ (hexagon_V6_veqw_xor_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_veqw_xor_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_veqw_xor_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_veqw_xor_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vasrh_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vasrh_acc_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
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
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vminuh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vminuh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vminuh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vminuh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vminuh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vminuh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
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
	[ (hexagon_V6_vmpyieoh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i prec_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 16))
(hexagon_V6_vmpyieoh_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
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
	[ (hexagon_V6_vpackwuh_sat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_o num_10 num_11 num_12 num_13 num_14 prec_i num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16))
(hexagon_V6_vpackwuh_sat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_o
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
num_17
num_18
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16))
(hexagon_V6_vpackwuh_sat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_o
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
num_17
num_18
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16))
(hexagon_V6_vpackwuh_sat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_o
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
num_17
num_18
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16))
(hexagon_V6_vpackwuh_sat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_o
num_10
num_11
num_12
num_13
num_14
prec_i
num_16
num_17
num_18
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vpackeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16))
(hexagon_V6_vpackeh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
num_13
num_14
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16))
(hexagon_V6_vpackeh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
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
	[ (hexagon_V6_vmpyih_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vmpyih_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
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
	[ (hexagon_V6_vasrw_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vasrw_acc_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
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
	[ (hexagon_V6_vgtuw_and_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgtuw_and_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
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
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgtuw_and_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
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
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgtuw_and_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
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
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgtuw_and_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
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
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgtuw_and_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
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
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgtuw_and_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
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
	[ (hexagon_V6_vaslh_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vaslh_acc_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
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
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vmpabus_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 prec_o num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_5 16) (equal? num_8 16) (equal? num_16 32) (equal? num_21 32))
(hexagon_V6_vmpabus_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
num_14
num_15
(* scale-factor num_16)
num_17
num_18
num_19
prec_o
(* scale-factor num_21)
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
num_32
)
]
		[(and  (equal? size_i_o 1) (equal? num_5 16) (equal? num_8 16) (equal? num_16 32) (equal? num_21 32))
(hexagon_V6_vmpabus_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
num_14
num_15
(* scale-factor num_16)
num_17
num_18
num_19
prec_o
(* scale-factor num_21)
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
num_32
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vaslw_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vaslw_acc_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
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
	[ (hexagon_V6_vabsdiffh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vabsdiffh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vabsdiffh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vabsdiffh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vabsdiffh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
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
	[ (hexagon_V6_vshuffeb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16))
(hexagon_V6_vshuffeb_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16))
(hexagon_V6_vshuffeb_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
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
	[ (hexagon_V6_vaddcarrysat_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 4))
(hexagon_V6_vaddcarrysat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
num_4
num_5
num_6
num_7
prec_i_o
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
	[ (hexagon_V6_pred_and_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
		(cond 
		[(and  (equal? size_o 32) (equal? num_3 32) (equal? num_5 32) (equal? prec_o 0))
(hexagon_V6_pred_and_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
(* scale-factor prec_o)
num_7
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vgtb_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 4) (equal? num_5 4) (equal? num_7 4))
(hexagon_V6_vgtb_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
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
		[(and  (equal? size_i_o 4) (equal? num_5 4) (equal? num_7 4))
(hexagon_V6_vgtb_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
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
		[(and  (equal? size_i_o 4) (equal? num_5 4) (equal? num_7 4))
(hexagon_V6_vgtb_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
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
		[(and  (equal? size_i_o 4) (equal? num_5 4) (equal? num_7 4))
(hexagon_V6_vgtb_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
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
		[(and  (equal? size_i_o 4) (equal? num_5 4) (equal? num_7 4))
(hexagon_V6_vgtb_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
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
		[(and  (equal? size_i_o 4) (equal? num_5 4) (equal? num_7 4))
(hexagon_V6_vgtb_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
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
	[ (hexagon_V6_vaddubh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16) (equal? num_15 32))
(hexagon_V6_vaddubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
prec_o
(* scale-factor num_15)
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16) (equal? num_15 32))
(hexagon_V6_vaddubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
prec_o
(* scale-factor num_15)
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16) (equal? num_15 32))
(hexagon_V6_vaddubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
prec_o
(* scale-factor num_15)
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
	[ (hexagon_V6_vmpyewuh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 16))
(hexagon_V6_vmpyewuh_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
num_7
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
	[ (hexagon_V6_vmpyh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 prec_o num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_5 16) (equal? num_8 16) (equal? num_16 32))
(hexagon_V6_vmpyh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
num_14
prec_o
(* scale-factor num_16)
num_17
num_18
num_19
num_20
num_21
num_22
)
]
		[(and  (equal? size_i_o 1) (equal? num_5 16) (equal? num_8 16) (equal? num_16 32))
(hexagon_V6_vmpyh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
num_14
prec_o
(* scale-factor num_16)
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
	[ (hexagon_V6_vmpyiewuh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16))
(hexagon_V6_vmpyiewuh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
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
	[ (hexagon_V6_vshufoeh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16) (equal? num_13 32))
(hexagon_V6_vshufoeh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
(* scale-factor num_13)
num_14
num_15
num_16
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16) (equal? num_13 32))
(hexagon_V6_vshufoeh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
(* scale-factor num_13)
num_14
num_15
num_16
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vaddhsat_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vaddhsat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
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
	[ (hexagon_V6_vswap_128B_dsl v0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 prec_i_o num_15 num_16 num_17)
		(cond 
		[(and  (equal? size_i_o 4) (equal? num_7 32) (equal? num_15 32))
(hexagon_V6_vswap_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
vc_3
(* scale-factor size_i_o)
num_5
num_6
(* scale-factor num_7)
num_8
num_9
num_10
num_11
num_12
num_13
prec_i_o
(* scale-factor num_15)
num_16
num_17
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vabsh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 32))
(hexagon_V6_vabsh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 32))
(hexagon_V6_vabsh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 32))
(hexagon_V6_vabsh_128B_dsl
(hvx:scale-expr v0 scale-factor)
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
	[ (hexagon_V6_vunpackoh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vunpackoh_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
num_7
prec_i_o
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vunpackoh_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
num_7
prec_i_o
num_9
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vabsw_sat_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 32))
(hexagon_V6_vabsw_sat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 32))
(hexagon_V6_vabsw_sat_128B_dsl
(hvx:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 32))
(hexagon_V6_vabsw_sat_128B_dsl
(hvx:scale-expr v0 scale-factor)
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
	[ (hexagon_V6_vandqrt_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_5 1) (equal? num_7 32))
(hexagon_V6_vandqrt_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vsubuhw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16) (equal? num_15 32))
(hexagon_V6_vsubuhw_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
prec_o
(* scale-factor num_15)
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16) (equal? num_15 32))
(hexagon_V6_vsubuhw_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
prec_o
(* scale-factor num_15)
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16) (equal? num_15 32))
(hexagon_V6_vsubuhw_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
prec_o
(* scale-factor num_15)
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
	[ (hexagon_V6_veqw_or_128B_dsl v0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_veqw_or_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
vc_2
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_veqw_or_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
vc_2
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_veqw_or_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
vc_2
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vsubh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 64))
(hexagon_V6_vsubh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
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
	[ (hexagon_V6_vmpyiewh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 16))
(hexagon_V6_vmpyiewh_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
num_7
prec_i_o
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
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 16))
(hexagon_V6_vmpyiewh_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
num_7
prec_i_o
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
	[ (hexagon_V6_vasruhubrndsat_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 num_14 num_15 prec_i num_17 num_18 num_19 num_20 num_21 num_22 num_23)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_7 32) (equal? num_9 16))
(hexagon_V6_vasruhubrndsat_128B_dsl
vc_0
vc_1
vc_2
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(hvx:scale-expr v5 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_7)
num_8
(* scale-factor num_9)
prec_o
num_11
num_12
num_13
num_14
num_15
prec_i
num_17
num_18
num_19
num_20
num_21
num_22
num_23
)
]
		[(and  (equal? size_i_o 32) (equal? num_7 32) (equal? num_9 16))
(hexagon_V6_vasruhubrndsat_128B_dsl
vc_0
vc_1
vc_2
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(hvx:scale-expr v5 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_7)
num_8
(* scale-factor num_9)
prec_o
num_11
num_12
num_13
num_14
num_15
prec_i
num_17
num_18
num_19
num_20
num_21
num_22
num_23
)
]
		[(and  (equal? size_i_o 32) (equal? num_7 32) (equal? num_9 16))
(hexagon_V6_vasruhubrndsat_128B_dsl
vc_0
vc_1
vc_2
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(hvx:scale-expr v5 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_7)
num_8
(* scale-factor num_9)
prec_o
num_11
num_12
num_13
num_14
num_15
prec_i
num_17
num_18
num_19
num_20
num_21
num_22
num_23
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vmpyiowh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16))
(hexagon_V6_vmpyiowh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
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
	[ (hexagon_V6_vaslhv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vaslhv_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vaslhv_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
(hvx:scale-expr v2 scale-factor)
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
	[ (hexagon_V6_vgtub_xor_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_o num_10 prec_i num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgtub_xor_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_o
num_10
prec_i
num_12
num_13
)
]
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgtub_xor_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_o
num_10
prec_i
num_12
num_13
)
]
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgtub_xor_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_o
num_10
prec_i
num_12
num_13
)
]
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgtub_xor_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_o
num_10
prec_i
num_12
num_13
)
]
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgtub_xor_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_o
num_10
prec_i
num_12
num_13
)
]
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgtub_xor_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_o
num_10
prec_i
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vmpyih_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vmpyih_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
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
	[ (hexagon_V6_vmpyiwh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_6 16))
(hexagon_V6_vmpyiwh_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
num_4
num_5
(* scale-factor num_6)
num_7
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
		[(and  (equal? size_i_o 1))
(hexagon_V6_vmpyiwh_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
num_4
num_5
num_6
num_7
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
		[(and  (equal? size_i_o 1))
(hexagon_V6_vmpyiwh_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
num_4
num_5
num_6
num_7
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
		[(and  (equal? size_i_o 1) (equal? num_6 16))
(hexagon_V6_vmpyiwh_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
num_4
num_5
(* scale-factor num_6)
num_7
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
	[ (hexagon_V6_vandvnqv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 4))
(hexagon_V6_vandvnqv_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
num_4
num_5
num_6
num_7
prec_i_o
num_9
num_10
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vlsrh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vlsrh_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vlsrh_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vmpabus_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 prec_i_o num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 num_34 num_35)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_6 16) (equal? num_9 16) (equal? num_18 32) (equal? num_33 32))
(hexagon_V6_vmpabus_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
num_4
num_5
(* scale-factor num_6)
num_7
num_8
(* scale-factor num_9)
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
(* scale-factor num_18)
num_19
num_20
num_21
prec_i_o
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
num_32
(* scale-factor num_33)
num_34
num_35
)
]
		[(and  (equal? size_i_o 1) (equal? num_6 16) (equal? num_9 16) (equal? num_18 32) (equal? num_33 32))
(hexagon_V6_vmpabus_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
num_4
num_5
(* scale-factor num_6)
num_7
num_8
(* scale-factor num_9)
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
(* scale-factor num_18)
num_19
num_20
num_21
prec_i_o
num_23
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
num_32
(* scale-factor num_33)
num_34
num_35
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vmux_128B_dsl v0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vmux_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
vc_2
(hvx:scale-expr v3 scale-factor)
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
	[ (hexagon_V6_vnavgw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vnavgw_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vnavgw_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vnavgw_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vnavgw_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vaslh_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vaslh_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vandnqrt_acc_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 4))
(hexagon_V6_vandnqrt_acc_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
num_5
num_6
num_7
num_8
prec_i_o
num_10
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vdealb_128B_dsl v0 size_i_o num_2 num_3 num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 16) (equal? num_7 16))
(hexagon_V6_vdealb_128B_dsl
(hvx:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
num_5
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
num_13
num_14
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 16) (equal? num_7 16))
(hexagon_V6_vdealb_128B_dsl
(hvx:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
num_5
num_6
(* scale-factor num_7)
prec_i_o
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
	[ (hexagon_V6_vmpahb_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 prec_i_o num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 num_33 num_34 num_35 num_36 num_37 num_38 num_39)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_19 32) (equal? num_37 32))
(hexagon_V6_vmpahb_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
num_4
num_5
num_6
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
num_17
num_18
(* scale-factor num_19)
num_20
num_21
num_22
num_23
prec_i_o
num_25
num_26
num_27
num_28
num_29
num_30
num_31
num_32
num_33
num_34
num_35
num_36
(* scale-factor num_37)
num_38
num_39
)
]
		[(and  (equal? size_i_o 1) (equal? num_19 32) (equal? num_37 32))
(hexagon_V6_vmpahb_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
num_4
num_5
num_6
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
num_17
num_18
(* scale-factor num_19)
num_20
num_21
num_22
num_23
prec_i_o
num_25
num_26
num_27
num_28
num_29
num_30
num_31
num_32
num_33
num_34
num_35
num_36
(* scale-factor num_37)
num_38
num_39
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vrounduhub_128B_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_7 32) (equal? num_9 16))
(hexagon_V6_vrounduhub_128B_dsl
vc_0
vc_1
vc_2
vc_3
(hvx:scale-expr v4 scale-factor)
(hvx:scale-expr v5 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_7)
num_8
(* scale-factor num_9)
prec_o
num_11
num_12
num_13
prec_i
num_15
num_16
num_17
num_18
)
]
		[(and  (equal? size_i_o 32) (equal? num_7 32) (equal? num_9 16))
(hexagon_V6_vrounduhub_128B_dsl
vc_0
vc_1
vc_2
vc_3
(hvx:scale-expr v4 scale-factor)
(hvx:scale-expr v5 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_7)
num_8
(* scale-factor num_9)
prec_o
num_11
num_12
num_13
prec_i
num_15
num_16
num_17
num_18
)
]
		[(and  (equal? size_i_o 32) (equal? num_7 32) (equal? num_9 16))
(hexagon_V6_vrounduhub_128B_dsl
vc_0
vc_1
vc_2
vc_3
(hvx:scale-expr v4 scale-factor)
(hvx:scale-expr v5 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_7)
num_8
(* scale-factor num_9)
prec_o
num_11
num_12
num_13
prec_i
num_15
num_16
num_17
num_18
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vlsrw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vlsrw_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vmpyowh_128B_dsl vc_0 vc_1 vc_2 v3 v4 size_i_o num_6 num_7 num_8 num_9 prec_i_o num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_6 32) (equal? num_8 16))
(hexagon_V6_vmpyowh_128B_dsl
vc_0
vc_1
vc_2
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
num_9
prec_i_o
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
		[(and  (equal? size_i_o 32) (equal? num_6 32) (equal? num_8 16))
(hexagon_V6_vmpyowh_128B_dsl
vc_0
vc_1
vc_2
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
num_9
prec_i_o
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
	[ (hexagon_V6_vsathub_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 prec_i num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16))
(hexagon_V6_vsathub_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
prec_i
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16))
(hexagon_V6_vsathub_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
prec_i
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16))
(hexagon_V6_vsathub_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_o
num_7
num_8
prec_i
num_10
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vdmpyhvsat_acc_128B_dsl v0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 32))
(hexagon_V6_vdmpyhvsat_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
prec_o
num_5
num_6
prec_i
num_8
num_9
num_10
num_11
)
]
		[(and  (equal? size_i_o 32))
(hexagon_V6_vdmpyhvsat_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
prec_o
num_5
num_6
prec_i
num_8
num_9
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_veqw_128B_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_o prec_i num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 4) (equal? num_5 4) (equal? num_7 4))
(hexagon_V6_veqw_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
vc_2
(hvx:scale-expr v3 scale-factor)
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
		[(and  (equal? size_i_o 4) (equal? num_5 4) (equal? num_7 4))
(hexagon_V6_veqw_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
vc_2
(hvx:scale-expr v3 scale-factor)
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
		[(and  (equal? size_i_o 4) (equal? num_5 4) (equal? num_7 4))
(hexagon_V6_veqw_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
vc_2
(hvx:scale-expr v3 scale-factor)
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
	[ (hexagon_V6_vmpyub_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_i_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_6 16) (equal? num_9 16) (equal? num_26 32))
(hexagon_V6_vmpyub_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
num_4
num_5
(* scale-factor num_6)
num_7
num_8
(* scale-factor num_9)
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
prec_i_o
num_19
num_20
num_21
num_22
num_23
num_24
num_25
(* scale-factor num_26)
num_27
num_28
)
]
		[(and  (equal? size_i_o 1) (equal? num_6 16) (equal? num_9 16) (equal? num_26 32))
(hexagon_V6_vmpyub_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
num_4
num_5
(* scale-factor num_6)
num_7
num_8
(* scale-factor num_9)
num_10
num_11
num_12
num_13
num_14
num_15
num_16
num_17
prec_i_o
num_19
num_20
num_21
num_22
num_23
num_24
num_25
(* scale-factor num_26)
num_27
num_28
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vdealb4w_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i_o num_16 num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_14 8))
(hexagon_V6_vdealb4w_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
num_5
num_6
num_7
num_8
num_9
num_10
num_11
num_12
num_13
(* scale-factor num_14)
prec_i_o
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
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vrmpybv_128B_dsl vc_0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 32))
(hexagon_V6_vrmpybv_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
prec_o
num_5
num_6
prec_i
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32))
(hexagon_V6_vrmpybv_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
prec_o
num_5
num_6
prec_i
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32))
(hexagon_V6_vrmpybv_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
prec_o
num_5
num_6
prec_i
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32))
(hexagon_V6_vrmpybv_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
prec_o
num_5
num_6
prec_i
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32))
(hexagon_V6_vrmpybv_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
prec_o
num_5
num_6
prec_i
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32))
(hexagon_V6_vrmpybv_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
prec_o
num_5
num_6
prec_i
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
	[ (hexagon_V6_vrmpybus_acc_128B_dsl v0 v1 v2 size_i_o prec_o num_5 num_6 prec_i num_8 num_9 num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 32))
(hexagon_V6_vrmpybus_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
prec_o
num_5
num_6
prec_i
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32))
(hexagon_V6_vrmpybus_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
prec_o
num_5
num_6
prec_i
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32))
(hexagon_V6_vrmpybus_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
prec_o
num_5
num_6
prec_i
num_8
num_9
num_10
num_11
num_12
num_13
)
]
		[(and  (equal? size_i_o 32))
(hexagon_V6_vrmpybus_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
prec_o
num_5
num_6
prec_i
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
	[ (hexagon_V6_veqh_and_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_veqh_and_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_veqh_and_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_veqh_and_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_i_o
num_10
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vmpyuhe_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i prec_o num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_5 16))
(hexagon_V6_vmpyuhe_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
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
	[ (hexagon_V6_vpackoh_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13 num_14 num_15 num_16)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16))
(hexagon_V6_vpackoh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16))
(hexagon_V6_vpackoh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
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
	[ (hexagon_V6_vandnqrt_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 4))
(hexagon_V6_vandnqrt_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
num_4
num_5
num_6
num_7
prec_i_o
num_9
num_10
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vshuffh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 32))
(hexagon_V6_vshuffh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
num_2
num_3
num_4
prec_i_o
num_6
num_7
num_8
)
]
		[(and  (equal? size_i_o 32))
(hexagon_V6_vshuffh_128B_dsl
(hvx:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
num_2
num_3
num_4
prec_i_o
num_6
num_7
num_8
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vandvrt_acc_128B_dsl v0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o prec_i num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 4) (equal? num_7 4) (equal? num_9 4))
(hexagon_V6_vandvrt_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
vc_2
vc_3
(hvx:scale-expr v4 scale-factor)
(hvx:scale-expr v5 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_7)
num_8
(* scale-factor num_9)
prec_o
prec_i
num_12
num_13
num_14
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vmpabusv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 prec_o num_19 num_20 num_21 num_22 num_23 num_24 num_25 num_26 num_27 num_28)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 16) (equal? num_8 16) (equal? num_15 32) (equal? num_19 32))
(hexagon_V6_vmpabusv_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
num_14
(* scale-factor num_15)
num_16
num_17
prec_o
(* scale-factor num_19)
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_5 16) (equal? num_8 16) (equal? num_15 32) (equal? num_19 32))
(hexagon_V6_vmpabusv_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
num_14
(* scale-factor num_15)
num_16
num_17
prec_o
(* scale-factor num_19)
num_20
num_21
num_22
num_23
num_24
num_25
num_26
num_27
num_28
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vor_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32) (equal? prec_i_o 0))
(hexagon_V6_vor_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
(* scale-factor prec_i_o)
num_7
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vasruwuhsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 prec_i num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 16))
(hexagon_V6_vasruwuhsat_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_o
num_9
num_10
prec_i
num_12
num_13
num_14
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 16))
(hexagon_V6_vasruwuhsat_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_o
num_9
num_10
prec_i
num_12
num_13
num_14
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 16))
(hexagon_V6_vasruwuhsat_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_o
num_9
num_10
prec_i
num_12
num_13
num_14
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vmpyowh_rnd_sacc_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 num_10 prec_i_o num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 num_22)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_7 32) (equal? num_9 16))
(hexagon_V6_vmpyowh_rnd_sacc_128B_dsl
vc_0
vc_1
vc_2
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(hvx:scale-expr v5 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_7)
num_8
(* scale-factor num_9)
num_10
prec_i_o
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
)
]
		[(and  (equal? size_i_o 32) (equal? num_7 32) (equal? num_9 16))
(hexagon_V6_vmpyowh_rnd_sacc_128B_dsl
vc_0
vc_1
vc_2
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(hvx:scale-expr v5 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_7)
num_8
(* scale-factor num_9)
num_10
prec_i_o
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
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vaddubh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 16) (equal? num_9 16) (equal? num_21 32))
(hexagon_V6_vaddubh_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
num_7
num_8
(* scale-factor num_9)
num_10
num_11
num_12
num_13
num_14
num_15
prec_i_o
num_17
num_18
num_19
num_20
(* scale-factor num_21)
num_22
num_23
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 16) (equal? num_9 16) (equal? num_21 32))
(hexagon_V6_vaddubh_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
num_7
num_8
(* scale-factor num_9)
num_10
num_11
num_12
num_13
num_14
num_15
prec_i_o
num_17
num_18
num_19
num_20
(* scale-factor num_21)
num_22
num_23
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 16) (equal? num_9 16) (equal? num_21 32))
(hexagon_V6_vaddubh_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
num_7
num_8
(* scale-factor num_9)
num_10
num_11
num_12
num_13
num_14
num_15
prec_i_o
num_17
num_18
num_19
num_20
(* scale-factor num_21)
num_22
num_23
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vroundwuh_128B_dsl vc_0 vc_1 vc_2 vc_3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_7 32) (equal? num_9 16))
(hexagon_V6_vroundwuh_128B_dsl
vc_0
vc_1
vc_2
vc_3
(hvx:scale-expr v4 scale-factor)
(hvx:scale-expr v5 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_7)
num_8
(* scale-factor num_9)
prec_o
num_11
num_12
num_13
prec_i
num_15
num_16
num_17
num_18
)
]
		[(and  (equal? size_i_o 32) (equal? num_7 32) (equal? num_9 16))
(hexagon_V6_vroundwuh_128B_dsl
vc_0
vc_1
vc_2
vc_3
(hvx:scale-expr v4 scale-factor)
(hvx:scale-expr v5 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_7)
num_8
(* scale-factor num_9)
prec_o
num_11
num_12
num_13
prec_i
num_15
num_16
num_17
num_18
)
]
		[(and  (equal? size_i_o 32) (equal? num_7 32) (equal? num_9 16))
(hexagon_V6_vroundwuh_128B_dsl
vc_0
vc_1
vc_2
vc_3
(hvx:scale-expr v4 scale-factor)
(hvx:scale-expr v5 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_7)
num_8
(* scale-factor num_9)
prec_o
num_11
num_12
num_13
prec_i
num_15
num_16
num_17
num_18
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vmpyihb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 prec_i_o num_8 num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_5 16))
(hexagon_V6_vmpyihb_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
(* scale-factor num_5)
num_6
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
		[(and  (equal? size_i_o 1) (equal? num_5 16))
(hexagon_V6_vmpyihb_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
(* scale-factor num_5)
num_6
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
		[(and  (equal? size_i_o 1))
(hexagon_V6_vmpyihb_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
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
num_13
num_14
)
]
		[(and  (equal? size_i_o 1))
(hexagon_V6_vmpyihb_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
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
num_13
num_14
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_pred_xor_128B_dsl v0 v1 size_o num_3 num_4 num_5 prec_o num_7)
		(cond 
		[(and  (equal? size_o 32) (equal? num_3 32) (equal? num_5 32) (equal? prec_o 0))
(hexagon_V6_pred_xor_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
(* scale-factor prec_o)
num_7
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vandvrt_128B_dsl vc_0 vc_1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_o prec_i num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vandvrt_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
vc_3
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_6)
num_7
(* scale-factor num_8)
prec_o
prec_i
num_11
num_12
num_13
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vasrwh_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 prec_i num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 16))
(hexagon_V6_vasrwh_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
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
	[ (hexagon_V6_vandvqv_128B_dsl vc_0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vandvqv_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
vc_3
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
	[ (hexagon_V6_vavgwrnd_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vavgwrnd_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vavgwrnd_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vavgwrnd_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vavgwrnd_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vavgwrnd_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vavgwrnd_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vgth_or_128B_dsl vc_0 vc_1 v2 v3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgth_or_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
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
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgth_or_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
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
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgth_or_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
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
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgth_or_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
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
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgth_or_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
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
		[(and  (equal? size_i_o 4) (equal? num_6 4) (equal? num_8 4))
(hexagon_V6_vgth_or_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
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
	[ (hexagon_V6_vmpyuhe_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12 num_13 num_14)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_6 16))
(hexagon_V6_vmpyuhe_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
num_4
num_5
(* scale-factor num_6)
num_7
prec_i_o
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
	[ (hexagon_V6_vmaxw_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vmaxw_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vmaxw_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vmaxw_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vmaxw_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32))
(hexagon_V6_vmaxw_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
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
	[ (hexagon_V6_vandqrt_acc_128B_dsl vc_0 v1 v2 vc_3 v4 size_i_o num_6 num_7 num_8 prec_i_o num_10 num_11 num_12 num_13)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_8 32))
(hexagon_V6_vandqrt_acc_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
vc_3
(hvx:scale-expr v4 scale-factor)
(* scale-factor size_i_o)
num_6
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
	[ (hexagon_V6_vmpyub_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 num_14 num_15 prec_o num_17 num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_5 16) (equal? num_8 16) (equal? num_17 32))
(hexagon_V6_vmpyub_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
num_14
num_15
prec_o
(* scale-factor num_17)
num_18
num_19
num_20
num_21
num_22
num_23
num_24
num_25
)
]
		[(and  (equal? size_i_o 1) (equal? num_5 16) (equal? num_8 16) (equal? num_17 32))
(hexagon_V6_vmpyub_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
num_14
num_15
prec_o
(* scale-factor num_17)
num_18
num_19
num_20
num_21
num_22
num_23
num_24
num_25
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vasruwuhrndsat_128B_dsl vc_0 vc_1 vc_2 v3 v4 v5 size_i_o num_7 num_8 num_9 prec_o num_11 num_12 num_13 prec_i num_15 num_16 num_17 num_18 num_19)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_7 32) (equal? num_9 16))
(hexagon_V6_vasruwuhrndsat_128B_dsl
vc_0
vc_1
vc_2
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(hvx:scale-expr v5 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_7)
num_8
(* scale-factor num_9)
prec_o
num_11
num_12
num_13
prec_i
num_15
num_16
num_17
num_18
num_19
)
]
		[(and  (equal? size_i_o 32) (equal? num_7 32) (equal? num_9 16))
(hexagon_V6_vasruwuhrndsat_128B_dsl
vc_0
vc_1
vc_2
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(hvx:scale-expr v5 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_7)
num_8
(* scale-factor num_9)
prec_o
num_11
num_12
num_13
prec_i
num_15
num_16
num_17
num_18
num_19
)
]
		[(and  (equal? size_i_o 32) (equal? num_7 32) (equal? num_9 16))
(hexagon_V6_vasruwuhrndsat_128B_dsl
vc_0
vc_1
vc_2
(hvx:scale-expr v3 scale-factor)
(hvx:scale-expr v4 scale-factor)
(hvx:scale-expr v5 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_7)
num_8
(* scale-factor num_9)
prec_o
num_11
num_12
num_13
prec_i
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
	[ (hexagon_V6_vaslw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vaslw_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vavguw_128B_dsl vc_0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vavguw_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vavguw_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vavguw_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vavguw_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vavguw_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vavguw_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
num_10
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vasrhubsat_128B_dsl vc_0 v1 v2 v3 size_i_o num_5 num_6 num_7 prec_o num_9 num_10 num_11 num_12 prec_i num_14 num_15 num_16 num_17)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 16))
(hexagon_V6_vasrhubsat_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_o
num_9
num_10
num_11
num_12
prec_i
num_14
num_15
num_16
num_17
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 16))
(hexagon_V6_vasrhubsat_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_o
num_9
num_10
num_11
num_12
prec_i
num_14
num_15
num_16
num_17
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 16))
(hexagon_V6_vasrhubsat_128B_dsl
vc_0
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_o
num_9
num_10
num_11
num_12
prec_i
num_14
num_15
num_16
num_17
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_lo_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_lo_128B_dsl
(hvx:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
(* scale-factor num_6)
num_7
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vassign_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 32))
(hexagon_V6_vassign_128B_dsl
(hvx:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
prec_i_o
num_6
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 32))
(hexagon_V6_vassign_128B_dsl
(hvx:scale-expr v0 scale-factor)
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
	[ (hexagon_V6_vunpackh_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i prec_o num_7 num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 32))
(hexagon_V6_vunpackh_128B_dsl
(hvx:scale-expr v0 scale-factor)
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
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 32))
(hexagon_V6_vunpackh_128B_dsl
(hvx:scale-expr v0 scale-factor)
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
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 32))
(hexagon_V6_vunpackh_128B_dsl
(hvx:scale-expr v0 scale-factor)
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
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 32))
(hexagon_V6_vunpackh_128B_dsl
(hvx:scale-expr v0 scale-factor)
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
	[ (hexagon_V6_vcombine_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i_o num_10 num_11)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 32) (equal? num_8 32) (equal? num_10 32))
(hexagon_V6_vcombine_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i_o
(* scale-factor num_10)
num_11
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vmpauhb_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 num_17 num_18 num_19 num_20 num_21 prec_o num_23 num_24 num_25 num_26 num_27 num_28 num_29 num_30 num_31 num_32 prec_i num_34 num_35 num_36)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_17 32) (equal? num_23 32))
(hexagon_V6_vmpauhb_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
num_5
num_6
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
(* scale-factor num_17)
num_18
num_19
num_20
num_21
prec_o
(* scale-factor num_23)
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
num_32
prec_i
num_34
num_35
num_36
)
]
		[(and  (equal? size_i_o 1) (equal? num_17 32) (equal? num_23 32))
(hexagon_V6_vmpauhb_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
num_3
num_4
num_5
num_6
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
(* scale-factor num_17)
num_18
num_19
num_20
num_21
prec_o
(* scale-factor num_23)
num_24
num_25
num_26
num_27
num_28
num_29
num_30
num_31
num_32
prec_i
num_34
num_35
num_36
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vmpybv_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 prec_i_o num_17 num_18 num_19 num_20 num_21 num_22 num_23)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 16) (equal? num_9 16) (equal? num_21 32))
(hexagon_V6_vmpybv_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
num_7
num_8
(* scale-factor num_9)
num_10
num_11
num_12
num_13
num_14
num_15
prec_i_o
num_17
num_18
num_19
num_20
(* scale-factor num_21)
num_22
num_23
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 16) (equal? num_9 16) (equal? num_21 32))
(hexagon_V6_vmpybv_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
num_7
num_8
(* scale-factor num_9)
num_10
num_11
num_12
num_13
num_14
num_15
prec_i_o
num_17
num_18
num_19
num_20
(* scale-factor num_21)
num_22
num_23
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 16) (equal? num_9 16) (equal? num_21 32))
(hexagon_V6_vmpybv_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
num_7
num_8
(* scale-factor num_9)
num_10
num_11
num_12
num_13
num_14
num_15
prec_i_o
num_17
num_18
num_19
num_20
(* scale-factor num_21)
num_22
num_23
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 16) (equal? num_9 16) (equal? num_21 32))
(hexagon_V6_vmpybv_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
num_7
num_8
(* scale-factor num_9)
num_10
num_11
num_12
num_13
num_14
num_15
prec_i_o
num_17
num_18
num_19
num_20
(* scale-factor num_21)
num_22
num_23
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 16) (equal? num_9 16) (equal? num_21 32))
(hexagon_V6_vmpybv_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
num_7
num_8
(* scale-factor num_9)
num_10
num_11
num_12
num_13
num_14
num_15
prec_i_o
num_17
num_18
num_19
num_20
(* scale-factor num_21)
num_22
num_23
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 16) (equal? num_9 16) (equal? num_21 32))
(hexagon_V6_vmpybv_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
num_7
num_8
(* scale-factor num_9)
num_10
num_11
num_12
num_13
num_14
num_15
prec_i_o
num_17
num_18
num_19
num_20
(* scale-factor num_21)
num_22
num_23
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vlsrwv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vlsrwv_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vlsrwv_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
(hvx:scale-expr v2 scale-factor)
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
	[ (hexagon_V6_vsubhnq_128B_dsl v0 v1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vsubhnq_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vsubhnq_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vsubhnq_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vsubhnq_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vsubhnq_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vsubhnq_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
vc_3
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vsb_128B_dsl v0 size_i_o num_2 num_3 num_4 num_5 num_6 num_7 prec_i num_9 num_10 num_11 prec_o num_13 num_14 num_15 num_16 num_17)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 16) (equal? num_7 16) (equal? num_13 32))
(hexagon_V6_vsb_128B_dsl
(hvx:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
num_5
num_6
(* scale-factor num_7)
prec_i
num_9
num_10
num_11
prec_o
(* scale-factor num_13)
num_14
num_15
num_16
num_17
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 16) (equal? num_7 16) (equal? num_13 32))
(hexagon_V6_vsb_128B_dsl
(hvx:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
num_5
num_6
(* scale-factor num_7)
prec_i
num_9
num_10
num_11
prec_o
(* scale-factor num_13)
num_14
num_15
num_16
num_17
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 16) (equal? num_7 16) (equal? num_13 32))
(hexagon_V6_vsb_128B_dsl
(hvx:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
num_5
num_6
(* scale-factor num_7)
prec_i
num_9
num_10
num_11
prec_o
(* scale-factor num_13)
num_14
num_15
num_16
num_17
)
]
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 16) (equal? num_7 16) (equal? num_13 32))
(hexagon_V6_vsb_128B_dsl
(hvx:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
num_5
num_6
(* scale-factor num_7)
prec_i
num_9
num_10
num_11
prec_o
(* scale-factor num_13)
num_14
num_15
num_16
num_17
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vaddbq_128B_dsl v0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vaddbq_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vaddbq_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vaddbq_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vaddbq_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vaddbq_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 32))
(hexagon_V6_vaddbq_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
num_10
num_11
num_12
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vmpybv_128B_dsl v0 v1 size_i_o num_3 num_4 num_5 num_6 num_7 num_8 prec_i num_10 num_11 num_12 num_13 prec_o num_15 num_16 num_17 num_18 num_19 num_20)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16) (equal? num_15 32))
(hexagon_V6_vmpybv_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
prec_o
(* scale-factor num_15)
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16) (equal? num_15 32))
(hexagon_V6_vmpybv_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
prec_o
(* scale-factor num_15)
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16) (equal? num_15 32))
(hexagon_V6_vmpybv_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
prec_o
(* scale-factor num_15)
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16) (equal? num_15 32))
(hexagon_V6_vmpybv_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
prec_o
(* scale-factor num_15)
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16) (equal? num_15 32))
(hexagon_V6_vmpybv_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
prec_o
(* scale-factor num_15)
num_16
num_17
num_18
num_19
num_20
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_5 16) (equal? num_8 16) (equal? num_15 32))
(hexagon_V6_vmpybv_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
num_6
num_7
(* scale-factor num_8)
prec_i
num_10
num_11
num_12
num_13
prec_o
(* scale-factor num_15)
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
	[ (hexagon_V6_vasrhv_128B_dsl v0 vc_1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vasrhv_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_6 32))
(hexagon_V6_vasrhv_128B_dsl
(hvx:scale-expr v0 scale-factor)
vc_1
(hvx:scale-expr v2 scale-factor)
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
	[ (hexagon_V6_vmpyh_acc_128B_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_i_o num_18 num_19 num_20 num_21 num_22 num_23 num_24 num_25)
		(cond 
		[(and  (equal? size_i_o 1) (equal? num_6 16) (equal? num_9 16) (equal? num_23 32))
(hexagon_V6_vmpyh_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
num_4
num_5
(* scale-factor num_6)
num_7
num_8
(* scale-factor num_9)
num_10
num_11
num_12
num_13
num_14
num_15
num_16
prec_i_o
num_18
num_19
num_20
num_21
num_22
(* scale-factor num_23)
num_24
num_25
)
]
		[(and  (equal? size_i_o 1) (equal? num_6 16) (equal? num_9 16) (equal? num_23 32))
(hexagon_V6_vmpyh_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
num_4
num_5
(* scale-factor num_6)
num_7
num_8
(* scale-factor num_9)
num_10
num_11
num_12
num_13
num_14
num_15
num_16
prec_i_o
num_18
num_19
num_20
num_21
num_22
(* scale-factor num_23)
num_24
num_25
)
]
		[(and  (equal? size_i_o 1) (equal? num_6 16) (equal? num_9 16) (equal? num_23 32))
(hexagon_V6_vmpyh_acc_128B_dsl
(hvx:scale-expr v0 scale-factor)
(hvx:scale-expr v1 scale-factor)
(hvx:scale-expr v2 scale-factor)
(* scale-factor size_i_o)
num_4
num_5
(* scale-factor num_6)
num_7
num_8
(* scale-factor num_9)
num_10
num_11
num_12
num_13
num_14
num_15
num_16
prec_i_o
num_18
num_19
num_20
num_21
num_22
(* scale-factor num_23)
num_24
num_25
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vnot_128B_dsl v0 size_i_o num_2 num_3 num_4 prec_i_o num_6)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_2 32) (equal? num_4 32) (equal? prec_i_o 0))
(hexagon_V6_vnot_128B_dsl
(hvx:scale-expr v0 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_2)
num_3
(* scale-factor num_4)
(* scale-factor prec_i_o)
num_6
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (hexagon_V6_vmpyewuh_64_128B_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 num_15 num_16 prec_o num_18 num_19 num_20 num_21 num_22 prec_i num_24)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_5 32) (equal? num_7 16) (equal? num_10 16) (equal? num_18 32))
(hexagon_V6_vmpyewuh_64_128B_dsl
vc_0
vc_1
(hvx:scale-expr v2 scale-factor)
(hvx:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
num_8
num_9
(* scale-factor num_10)
num_11
num_12
num_13
num_14
num_15
num_16
prec_o
(* scale-factor num_18)
num_19
num_20
num_21
num_22
prec_i
num_24
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[_ (error "Unrecognized expression")]
 )
)
;; ================================================================================
