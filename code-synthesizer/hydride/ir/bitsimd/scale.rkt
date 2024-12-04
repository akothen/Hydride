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
	[ (pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXorScalar_v8192_e32__v8192_e32__v8192_e32")
(pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXorScalar_v16_e32__v16_e32__v16_e32")
(pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXorScalar_v32_e32__v32_e32__v32_e32")
(pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXorScalar_v64_e32__v64_e32__v64_e32")
(pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXorScalar_v16384_e32__v16384_e32__v16384_e32")
(pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXorScalar_v8_e32__v8_e32__v8_e32")
(pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXorScalar_v256_e32__v256_e32__v256_e32")
(pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXorScalar_v1024_e32__v1024_e32__v1024_e32")
(pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXorScalar_v4096_e32__v4096_e32__v4096_e32")
(pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXorScalar_v2048_e32__v2048_e32__v2048_e32")
(pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXorScalar_v512_e32__v512_e32__v512_e32")
(pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
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
	[ (pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOrScalar_v8_e32__v8_e32__v8_e32")
(pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOrScalar_v32_e32__v32_e32__v32_e32")
(pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOrScalar_v2048_e32__v2048_e32__v2048_e32")
(pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOrScalar_v64_e32__v64_e32__v64_e32")
(pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOrScalar_v16_e32__v16_e32__v16_e32")
(pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOrScalar_v256_e32__v256_e32__v256_e32")
(pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOrScalar_v4096_e32__v4096_e32__v4096_e32")
(pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOrScalar_v1024_e32__v1024_e32__v1024_e32")
(pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOrScalar_v16384_e32__v16384_e32__v16384_e32")
(pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOrScalar_v512_e32__v512_e32__v512_e32")
(pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOrScalar_v8192_e32__v8192_e32__v8192_e32")
(pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
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
	[ (pimSub_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v8192_e16__v8192_e16__v8192_e16")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v1024_e32__v1024_e32__v1024_e32")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v8_e32__v8_e32__v8_e32")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v4096_e16__v4096_e16__v4096_e16")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v16384_e8__v16384_e8__v16384_e8")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v256_e8__v256_e8__v256_e8")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v8192_e8__v8192_e8__v8192_e8")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v64_e16__v64_e16__v64_e16")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v64_e32__v64_e32__v64_e32")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v32_e32__v32_e32__v32_e32")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v16384_e16__v16384_e16__v16384_e16")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v1024_e8__v1024_e8__v1024_e8")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v2048_e16__v2048_e16__v2048_e16")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v128_e16__v128_e16__v128_e16")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v4096_e32__v4096_e32__v4096_e32")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v128_e8__v128_e8__v128_e8")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v2048_e32__v2048_e32__v2048_e32")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v16384_e32__v16384_e32__v16384_e32")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v4096_e8__v4096_e8__v4096_e8")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v16_e32__v16_e32__v16_e32")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v2048_e8__v2048_e8__v2048_e8")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v64_e8__v64_e8__v64_e8")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v32_e8__v32_e8__v32_e8")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v1024_e16__v1024_e16__v1024_e16")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v16_e8__v16_e8__v16_e8")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v256_e32__v256_e32__v256_e32")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v16_e16__v16_e16__v16_e16")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v32_e16__v32_e16__v32_e16")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v8192_e32__v8192_e32__v8192_e32")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v8_e8__v8_e8__v8_e8")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v8_e16__v8_e16__v8_e16")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v512_e16__v512_e16__v512_e16")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSub_v512_e32__v512_e32__v512_e32")
(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl
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
	[ (pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMinScalar_v1024_e32__v1024_e32__v1024_e32")
(pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMinScalar_v512_e32__v512_e32__v512_e32")
(pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMinScalar_v16384_e32__v16384_e32__v16384_e32")
(pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMinScalar_v256_e32__v256_e32__v256_e32")
(pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMinScalar_v16_e32__v16_e32__v16_e32")
(pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMinScalar_v32_e32__v32_e32__v32_e32")
(pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMinScalar_v64_e32__v64_e32__v64_e32")
(pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMinScalar_v2048_e32__v2048_e32__v2048_e32")
(pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMinScalar_v8_e32__v8_e32__v8_e32")
(pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMinScalar_v4096_e32__v4096_e32__v4096_e32")
(pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMinScalar_v8192_e32__v8192_e32__v8192_e32")
(pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
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
	[ (pimOr_v4096_e32__v4096_e32__v4096_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOr_v4096_e32__v4096_e32__v4096_e32")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimOr_v4096_e16__v4096_e16__v4096_e16")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimOr_v512_e16__v512_e16__v512_e16")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimOr_v8_e16__v8_e16__v8_e16")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOr_v8192_e32__v8192_e32__v8192_e32")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimOr_v8_e8__v8_e8__v8_e8")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimOr_v64_e16__v64_e16__v64_e16")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimOr_v64_e8__v64_e8__v64_e8")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimOr_v1024_e16__v1024_e16__v1024_e16")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimOr_v16384_e8__v16384_e8__v16384_e8")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOr_v256_e32__v256_e32__v256_e32")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimOr_v128_e8__v128_e8__v128_e8")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimOr_v8192_e16__v8192_e16__v8192_e16")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOr_v32_e32__v32_e32__v32_e32")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimOr_v1024_e8__v1024_e8__v1024_e8")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimOr_v32_e16__v32_e16__v32_e16")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOr_v16_e32__v16_e32__v16_e32")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimOr_v128_e16__v128_e16__v128_e16")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimOr_v2048_e8__v2048_e8__v2048_e8")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimOr_v4096_e8__v4096_e8__v4096_e8")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOr_v2048_e32__v2048_e32__v2048_e32")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimOr_v16_e16__v16_e16__v16_e16")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOr_v512_e32__v512_e32__v512_e32")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOr_v64_e32__v64_e32__v64_e32")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimOr_v16384_e16__v16384_e16__v16384_e16")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimOr_v2048_e16__v2048_e16__v2048_e16")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimOr_v16_e8__v16_e8__v16_e8")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOr_v16384_e32__v16384_e32__v16384_e32")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOr_v1024_e32__v1024_e32__v1024_e32")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimOr_v8_e32__v8_e32__v8_e32")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimOr_v32_e8__v32_e8__v32_e8")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimOr_v8192_e8__v8192_e8__v8192_e8")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimOr_v256_e8__v256_e8__v256_e8")
(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl
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
	[ (pimAnd_v32_e32__v32_e32__v32_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v32_e32__v32_e32__v32_e32")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v4096_e32__v4096_e32__v4096_e32")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v16_e8__v16_e8__v16_e8")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v1024_e32__v1024_e32__v1024_e32")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v128_e16__v128_e16__v128_e16")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v64_e16__v64_e16__v64_e16")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v8_e8__v8_e8__v8_e8")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v8_e16__v8_e16__v8_e16")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v512_e32__v512_e32__v512_e32")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v16384_e16__v16384_e16__v16384_e16")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v1024_e8__v1024_e8__v1024_e8")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v8192_e16__v8192_e16__v8192_e16")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v16384_e8__v16384_e8__v16384_e8")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v2048_e32__v2048_e32__v2048_e32")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v8192_e8__v8192_e8__v8192_e8")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v1024_e16__v1024_e16__v1024_e16")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v256_e32__v256_e32__v256_e32")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v16384_e32__v16384_e32__v16384_e32")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v16_e32__v16_e32__v16_e32")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v4096_e16__v4096_e16__v4096_e16")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v2048_e8__v2048_e8__v2048_e8")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v8_e32__v8_e32__v8_e32")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v128_e8__v128_e8__v128_e8")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v64_e8__v64_e8__v64_e8")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v4096_e8__v4096_e8__v4096_e8")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v8192_e32__v8192_e32__v8192_e32")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v32_e8__v32_e8__v32_e8")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v32_e16__v32_e16__v32_e16")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v2048_e16__v2048_e16__v2048_e16")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v16_e16__v16_e16__v16_e16")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v256_e8__v256_e8__v256_e8")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v64_e32__v64_e32__v64_e32")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimAnd_v512_e16__v512_e16__v512_e16")
(pimAnd_v32_e32__v32_e32__v32_e32_dsl
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
	[ (pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v4096_e8__v4096_e8__v4096_e8")
(pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v2048_e8__v2048_e8__v2048_e8")
(pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl
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
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v8_e8__v8_e8__v8_e8")
(pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl
v0
v1
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v16384_e8__v16384_e8__v16384_e8")
(pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v1024_e8__v1024_e8__v1024_e8")
(pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v32_e8__v32_e8__v32_e8")
(pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v16_e8__v16_e8__v16_e8")
(pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl
v0
v1
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v128_e8__v128_e8__v128_e8")
(pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v256_e8__v256_e8__v256_e8")
(pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v64_e8__v64_e8__v64_e8")
(pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v8192_e8__v8192_e8__v8192_e8")
(pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl
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
	[ (pimMin_v64_e32__v64_e32__v64_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v64_e32__v64_e32__v64_e32")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v8192_e32__v8192_e32__v8192_e32")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v128_e8__v128_e8__v128_e8")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v1024_e16__v1024_e16__v1024_e16")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v512_e16__v512_e16__v512_e16")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v32_e32__v32_e32__v32_e32")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v16_e16__v16_e16__v16_e16")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v8_e8__v8_e8__v8_e8")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v8192_e8__v8192_e8__v8192_e8")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v64_e16__v64_e16__v64_e16")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v32_e16__v32_e16__v32_e16")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v8_e32__v8_e32__v8_e32")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v2048_e8__v2048_e8__v2048_e8")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v2048_e32__v2048_e32__v2048_e32")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v4096_e32__v4096_e32__v4096_e32")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v4096_e16__v4096_e16__v4096_e16")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v1024_e32__v1024_e32__v1024_e32")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v16384_e8__v16384_e8__v16384_e8")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v512_e32__v512_e32__v512_e32")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v8_e16__v8_e16__v8_e16")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v32_e8__v32_e8__v32_e8")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v256_e32__v256_e32__v256_e32")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v8192_e16__v8192_e16__v8192_e16")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v16384_e32__v16384_e32__v16384_e32")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v256_e8__v256_e8__v256_e8")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v64_e8__v64_e8__v64_e8")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v1024_e8__v1024_e8__v1024_e8")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v16_e32__v16_e32__v16_e32")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v2048_e16__v2048_e16__v2048_e16")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v128_e16__v128_e16__v128_e16")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v4096_e8__v4096_e8__v4096_e8")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v16384_e16__v16384_e16__v16384_e16")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMin_v16_e8__v16_e8__v16_e8")
(pimMin_v64_e32__v64_e32__v64_e32_dsl
v0
v1
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
	[ (pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSubScalar_v16384_e32__v16384_e32__v16384_e32")
(pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSubScalar_v16_e32__v16_e32__v16_e32")
(pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSubScalar_v8192_e32__v8192_e32__v8192_e32")
(pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSubScalar_v4096_e32__v4096_e32__v4096_e32")
(pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSubScalar_v32_e32__v32_e32__v32_e32")
(pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSubScalar_v512_e32__v512_e32__v512_e32")
(pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSubScalar_v64_e32__v64_e32__v64_e32")
(pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSubScalar_v256_e32__v256_e32__v256_e32")
(pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSubScalar_v8_e32__v8_e32__v8_e32")
(pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSubScalar_v2048_e32__v2048_e32__v2048_e32")
(pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimSubScalar_v1024_e32__v1024_e32__v1024_e32")
(pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
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
	[ (pimMulScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimMulScalar_v256_e32__v256_e32__v256_e32")
(pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimMulScalar_v32_e32__v32_e32__v32_e32")
(pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimMulScalar_v8_e32__v8_e32__v8_e32")
(pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimMulScalar_v8192_e32__v8192_e32__v8192_e32")
(pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimMulScalar_v2048_e32__v2048_e32__v2048_e32")
(pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimMulScalar_v4096_e32__v4096_e32__v4096_e32")
(pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimMulScalar_v16384_e32__v16384_e32__v16384_e32")
(pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimMulScalar_v64_e32__v64_e32__v64_e32")
(pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimMulScalar_v512_e32__v512_e32__v512_e32")
(pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimMulScalar_v16_e32__v16_e32__v16_e32")
(pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimMulScalar_v1024_e32__v1024_e32__v1024_e32")
(pimMulScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
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
	[ (pimMax_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v8192_e16__v8192_e16__v8192_e16")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v8_e8__v8_e8__v8_e8")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v1024_e32__v1024_e32__v1024_e32")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v32_e8__v32_e8__v32_e8")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v256_e32__v256_e32__v256_e32")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v64_e16__v64_e16__v64_e16")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v16_e8__v16_e8__v16_e8")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v32_e32__v32_e32__v32_e32")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v8192_e32__v8192_e32__v8192_e32")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v2048_e16__v2048_e16__v2048_e16")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v8_e32__v8_e32__v8_e32")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v4096_e8__v4096_e8__v4096_e8")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v4096_e32__v4096_e32__v4096_e32")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v2048_e32__v2048_e32__v2048_e32")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v2048_e8__v2048_e8__v2048_e8")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v128_e16__v128_e16__v128_e16")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v16384_e8__v16384_e8__v16384_e8")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v128_e8__v128_e8__v128_e8")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v256_e8__v256_e8__v256_e8")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v1024_e8__v1024_e8__v1024_e8")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v32_e16__v32_e16__v32_e16")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v4096_e16__v4096_e16__v4096_e16")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v16384_e32__v16384_e32__v16384_e32")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v1024_e16__v1024_e16__v1024_e16")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v64_e32__v64_e32__v64_e32")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v64_e8__v64_e8__v64_e8")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v512_e16__v512_e16__v512_e16")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v8192_e8__v8192_e8__v8192_e8")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v16_e32__v16_e32__v16_e32")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v8_e16__v8_e16__v8_e16")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v16384_e16__v16384_e16__v16384_e16")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v16_e16__v16_e16__v16_e16")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMax_v512_e32__v512_e32__v512_e32")
(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl
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
	[ (pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v4096_e32__v4096_e32__v4096_e32")
(pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v16_e32__v16_e32__v16_e32")
(pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v32_e32__v32_e32__v32_e32")
(pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v8192_e32__v8192_e32__v8192_e32")
(pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v512_e32__v512_e32__v512_e32")
(pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v2048_e32__v2048_e32__v2048_e32")
(pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v8_e32__v8_e32__v8_e32")
(pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v16384_e32__v16384_e32__v16384_e32")
(pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v64_e32__v64_e32__v64_e32")
(pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v256_e32__v256_e32__v256_e32")
(pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v1024_e32__v1024_e32__v1024_e32")
(pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl
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
	[ (pimAndScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAndScalar_v256_e32__v256_e32__v256_e32")
(pimAndScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAndScalar_v4096_e32__v4096_e32__v4096_e32")
(pimAndScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAndScalar_v512_e32__v512_e32__v512_e32")
(pimAndScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAndScalar_v2048_e32__v2048_e32__v2048_e32")
(pimAndScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAndScalar_v64_e32__v64_e32__v64_e32")
(pimAndScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAndScalar_v16384_e32__v16384_e32__v16384_e32")
(pimAndScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAndScalar_v16_e32__v16_e32__v16_e32")
(pimAndScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAndScalar_v32_e32__v32_e32__v32_e32")
(pimAndScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAndScalar_v8192_e32__v8192_e32__v8192_e32")
(pimAndScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAndScalar_v8_e32__v8_e32__v8_e32")
(pimAndScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimAndScalar_v1024_e32__v1024_e32__v1024_e32")
(pimAndScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
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
	[ (pimXor_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimXor_v8192_e16__v8192_e16__v8192_e16")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimXor_v4096_e8__v4096_e8__v4096_e8")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimXor_v256_e8__v256_e8__v256_e8")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXor_v16384_e32__v16384_e32__v16384_e32")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimXor_v64_e16__v64_e16__v64_e16")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimXor_v32_e8__v32_e8__v32_e8")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimXor_v1024_e16__v1024_e16__v1024_e16")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimXor_v16_e8__v16_e8__v16_e8")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimXor_v16_e16__v16_e16__v16_e16")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimXor_v8_e8__v8_e8__v8_e8")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimXor_v128_e16__v128_e16__v128_e16")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXor_v512_e32__v512_e32__v512_e32")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimXor_v1024_e8__v1024_e8__v1024_e8")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimXor_v8_e16__v8_e16__v8_e16")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
)
]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimXor_v2048_e16__v2048_e16__v2048_e16")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXor_v8192_e32__v8192_e32__v8192_e32")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimXor_v2048_e8__v2048_e8__v2048_e8")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXor_v2048_e32__v2048_e32__v2048_e32")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimXor_v64_e8__v64_e8__v64_e8")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimXor_v128_e8__v128_e8__v128_e8")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimXor_v16384_e16__v16384_e16__v16384_e16")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXor_v1024_e32__v1024_e32__v1024_e32")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXor_v256_e32__v256_e32__v256_e32")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXor_v64_e32__v64_e32__v64_e32")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXor_v8_e32__v8_e32__v8_e32")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimXor_v512_e16__v512_e16__v512_e16")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimXor_v4096_e16__v4096_e16__v4096_e16")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimXor_v16384_e8__v16384_e8__v16384_e8")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXor_v32_e32__v32_e32__v32_e32")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXor_v16_e32__v16_e32__v16_e32")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 0))
(displayln "Scaling case for pimXor_v32_e16__v32_e16__v32_e16")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 0))
(displayln "Scaling case for pimXor_v4096_e32__v4096_e32__v4096_e32")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 0))
(displayln "Scaling case for pimXor_v8192_e8__v8192_e8__v8192_e8")
(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl
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
	[ (pimEQ_v512_e16__v512_e16__v512_e16_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x0000000000000001 (bitvector 16)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 0))
(displayln "Scaling case for pimEQ_v512_e16__v512_e16__v512_e16")
(pimEQ_v512_e16__v512_e16__v512_e16_dsl
vc_0
(bitsimd:scale-expr v1 scale-factor)
vc_2
(bitsimd:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x00000001 (bitvector 8)))) (equal? size_i_o 4096) (equal? num_5 4096) (equal? num_6 0) (equal? num_7 4096) (equal? prec_i_o 8) (equal? num_9 0))
(displayln "Scaling case for pimEQ_v16384_e8__v16384_e8__v16384_e8")
(pimEQ_v512_e16__v512_e16__v512_e16_dsl
vc_0
(bitsimd:scale-expr v1 scale-factor)
vc_2
(bitsimd:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 0))
(displayln "Scaling case for pimEQ_v1024_e32__v1024_e32__v1024_e32")
(pimEQ_v512_e16__v512_e16__v512_e16_dsl
vc_0
(bitsimd:scale-expr v1 scale-factor)
vc_2
(bitsimd:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x00000001 (bitvector 8)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 0))
(displayln "Scaling case for pimEQ_v1024_e8__v1024_e8__v1024_e8")
(pimEQ_v512_e16__v512_e16__v512_e16_dsl
vc_0
(bitsimd:scale-expr v1 scale-factor)
vc_2
(bitsimd:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? vc_2 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 0))
(displayln "Scaling case for pimEQ_v512_e32__v512_e32__v512_e32")
(pimEQ_v512_e16__v512_e16__v512_e16_dsl
vc_0
(bitsimd:scale-expr v1 scale-factor)
vc_2
(bitsimd:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000 (bitvector 8)))) (equal? vc_2 (lit (bv #x00000001 (bitvector 8)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 0))
(displayln "Scaling case for pimEQ_v512_e8__v512_e8__v512_e8")
(pimEQ_v512_e16__v512_e16__v512_e16_dsl
vc_0
(bitsimd:scale-expr v1 scale-factor)
vc_2
(bitsimd:scale-expr v3 scale-factor)
(* scale-factor size_i_o)
(* scale-factor num_5)
num_6
(* scale-factor num_7)
prec_i_o
num_9
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? vc_2 (lit (bv #x0000000000000001 (bitvector 16)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 0))
(displayln "Scaling case for pimEQ_v1024_e16__v1024_e16__v1024_e16")
(pimEQ_v512_e16__v512_e16__v512_e16_dsl
vc_0
(bitsimd:scale-expr v1 scale-factor)
vc_2
(bitsimd:scale-expr v3 scale-factor)
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
	[ (pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMaxScalar_v256_e32__v256_e32__v256_e32")
(pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMaxScalar_v16_e32__v16_e32__v16_e32")
(pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMaxScalar_v4096_e32__v4096_e32__v4096_e32")
(pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMaxScalar_v2048_e32__v2048_e32__v2048_e32")
(pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMaxScalar_v8_e32__v8_e32__v8_e32")
(pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMaxScalar_v16384_e32__v16384_e32__v16384_e32")
(pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMaxScalar_v1024_e32__v1024_e32__v1024_e32")
(pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMaxScalar_v512_e32__v512_e32__v512_e32")
(pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMaxScalar_v8192_e32__v8192_e32__v8192_e32")
(pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMaxScalar_v64_e32__v64_e32__v64_e32")
(pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimMaxScalar_v32_e32__v32_e32__v32_e32")
(pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
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
	[ (pimGT_v16384_e8__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? vc_0 (lit (bv #x00000001 (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 4096) (equal? num_5 4096) (equal? num_6 0) (equal? num_7 4096) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimGT_v16384_e8__v16384_e8__v16384_e8")
(pimGT_v16384_e8__v16384_e8__v16384_e8_dsl
vc_0
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
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimGT_v1024_e32__v1024_e32__v1024_e32")
(pimGT_v16384_e8__v16384_e8__v16384_e8_dsl
vc_0
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
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimGT_v512_e32__v512_e32__v512_e32")
(pimGT_v16384_e8__v16384_e8__v16384_e8_dsl
vc_0
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000001 (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimGT_v512_e16__v512_e16__v512_e16")
(pimGT_v16384_e8__v16384_e8__v16384_e8_dsl
vc_0
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000001 (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimLT_v512_e16__v512_e16__v512_e16")
(pimGT_v16384_e8__v16384_e8__v16384_e8_dsl
vc_0
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000001 (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimLT_v1024_e16__v1024_e16__v1024_e16")
(pimGT_v16384_e8__v16384_e8__v16384_e8_dsl
vc_0
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
)
]
		[(and  (equal? vc_0 (lit (bv #x00000001 (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimGT_v512_e8__v512_e8__v512_e8")
(pimGT_v16384_e8__v16384_e8__v16384_e8_dsl
vc_0
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
)
]
		[(and  (equal? vc_0 (lit (bv #x00000001 (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimGT_v1024_e8__v1024_e8__v1024_e8")
(pimGT_v16384_e8__v16384_e8__v16384_e8_dsl
vc_0
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
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimLT_v1024_e32__v1024_e32__v1024_e32")
(pimGT_v16384_e8__v16384_e8__v16384_e8_dsl
vc_0
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
)
]
		[(and  (equal? vc_0 (lit (bv #x00000000000000000000000000000001 (bitvector 32)))) (equal? vc_1 (lit (bv #x00000000000000000000000000000000 (bitvector 32)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimLT_v512_e32__v512_e32__v512_e32")
(pimGT_v16384_e8__v16384_e8__v16384_e8_dsl
vc_0
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
)
]
		[(and  (equal? vc_0 (lit (bv #x0000000000000001 (bitvector 16)))) (equal? vc_1 (lit (bv #x0000000000000000 (bitvector 16)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimGT_v1024_e16__v1024_e16__v1024_e16")
(pimGT_v16384_e8__v16384_e8__v16384_e8_dsl
vc_0
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
)
]
		[(and  (equal? vc_0 (lit (bv #x00000001 (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 4096) (equal? num_5 4096) (equal? num_6 0) (equal? num_7 4096) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimLT_v16384_e8__v16384_e8__v16384_e8")
(pimGT_v16384_e8__v16384_e8__v16384_e8_dsl
vc_0
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
)
]
		[(and  (equal? vc_0 (lit (bv #x00000001 (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 32) (equal? num_5 32) (equal? num_6 0) (equal? num_7 32) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimLT_v1024_e8__v1024_e8__v1024_e8")
(pimGT_v16384_e8__v16384_e8__v16384_e8_dsl
vc_0
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
)
]
		[(and  (equal? vc_0 (lit (bv #x00000001 (bitvector 8)))) (equal? vc_1 (lit (bv #x00000000 (bitvector 8)))) (equal? size_i_o 16) (equal? num_5 16) (equal? num_6 0) (equal? num_7 16) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimLT_v512_e8__v512_e8__v512_e8")
(pimGT_v16384_e8__v16384_e8__v16384_e8_dsl
vc_0
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
)
]
		[else (error "Unable to identify how to scale up " prog)]
		)
	]
	[ (pimAddScalar_v8_e16__v8_e16__v8_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAddScalar_v8_e32__v8_e32__v8_e32")
(pimAddScalar_v8_e16__v8_e16__v8_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAddScalar_v64_e32__v64_e32__v64_e32")
(pimAddScalar_v8_e16__v8_e16__v8_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAddScalar_v32_e32__v32_e32__v32_e32")
(pimAddScalar_v8_e16__v8_e16__v8_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAddScalar_v16384_e32__v16384_e32__v16384_e32")
(pimAddScalar_v8_e16__v8_e16__v8_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAddScalar_v8192_e32__v8192_e32__v8192_e32")
(pimAddScalar_v8_e16__v8_e16__v8_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAddScalar_v16_e32__v16_e32__v16_e32")
(pimAddScalar_v8_e16__v8_e16__v8_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAddScalar_v2048_e32__v2048_e32__v2048_e32")
(pimAddScalar_v8_e16__v8_e16__v8_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAddScalar_v256_e32__v256_e32__v256_e32")
(pimAddScalar_v8_e16__v8_e16__v8_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAddScalar_v512_e32__v512_e32__v512_e32")
(pimAddScalar_v8_e16__v8_e16__v8_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAddScalar_v1024_e32__v1024_e32__v1024_e32")
(pimAddScalar_v8_e16__v8_e16__v8_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAddScalar_v4096_e32__v4096_e32__v4096_e32")
(pimAddScalar_v8_e16__v8_e16__v8_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
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
	[ (pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v8192_e16__v8192_e16__v8192_e16")
(pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v4096_e16__v4096_e16__v4096_e16")
(pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v32_e16__v32_e16__v32_e16")
(pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v16384_e16__v16384_e16__v16384_e16")
(pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v64_e16__v64_e16__v64_e16")
(pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v8_e16__v8_e16__v8_e16")
(pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl
v0
v1
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v16_e16__v16_e16__v16_e16")
(pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v128_e16__v128_e16__v128_e16")
(pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v1024_e16__v1024_e16__v1024_e16")
(pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v512_e16__v512_e16__v512_e16")
(pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0))
(displayln "Scaling case for pimDiv_v2048_e16__v2048_e16__v2048_e16")
(pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl
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
	[ (pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0))
(displayln "Scaling case for pimScaledAdd_v256_e32__v256_e32__v256_e32")
(pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
v2
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
)
]
		[(and  (equal? size_i_o 16384) (equal? num_4 16384) (equal? num_5 0) (equal? num_6 16384) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0))
(displayln "Scaling case for pimScaledAdd_v16384_e32__v16384_e32__v16384_e32")
(pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
v2
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
)
]
		[(and  (equal? size_i_o 2048) (equal? num_4 2048) (equal? num_5 0) (equal? num_6 2048) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0))
(displayln "Scaling case for pimScaledAdd_v2048_e32__v2048_e32__v2048_e32")
(pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
v2
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
)
]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0))
(displayln "Scaling case for pimScaledAdd_v1024_e32__v1024_e32__v1024_e32")
(pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
v2
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
)
]
		[(and  (equal? size_i_o 16) (equal? num_4 16) (equal? num_5 0) (equal? num_6 16) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0))
(displayln "Scaling case for pimScaledAdd_v16_e32__v16_e32__v16_e32")
(pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
v2
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
)
]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0))
(displayln "Scaling case for pimScaledAdd_v64_e32__v64_e32__v64_e32")
(pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
v2
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
)
]
		[(and  (equal? size_i_o 8) (equal? num_4 8) (equal? num_5 0) (equal? num_6 8) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0))
(displayln "Scaling case for pimScaledAdd_v8_e32__v8_e32__v8_e32")
(pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
v2
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
)
]
		[(and  (equal? size_i_o 4096) (equal? num_4 4096) (equal? num_5 0) (equal? num_6 4096) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0))
(displayln "Scaling case for pimScaledAdd_v4096_e32__v4096_e32__v4096_e32")
(pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
v2
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
)
]
		[(and  (equal? size_i_o 32) (equal? num_4 32) (equal? num_5 0) (equal? num_6 32) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0))
(displayln "Scaling case for pimScaledAdd_v32_e32__v32_e32__v32_e32")
(pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
v2
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
)
]
		[(and  (equal? size_i_o 512) (equal? num_4 512) (equal? num_5 0) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0))
(displayln "Scaling case for pimScaledAdd_v512_e32__v512_e32__v512_e32")
(pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
v2
(* scale-factor size_i_o)
(* scale-factor num_4)
num_5
(* scale-factor num_6)
prec_i_o
num_8
num_9
)
]
		[(and  (equal? size_i_o 8192) (equal? num_4 8192) (equal? num_5 0) (equal? num_6 8192) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0))
(displayln "Scaling case for pimScaledAdd_v8192_e32__v8192_e32__v8192_e32")
(pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl
(bitsimd:scale-expr v0 scale-factor)
(bitsimd:scale-expr v1 scale-factor)
v2
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
	[ (pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v1024_e32__v1024_e32__v1024_e32")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v2048_e16__v2048_e16__v2048_e16")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v32_e8__v32_e8__v32_e8")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v1024_e16__v1024_e16__v1024_e16")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v64_e32__v64_e32__v64_e32")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v2048_e32__v2048_e32__v2048_e32")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v16384_e32__v16384_e32__v16384_e32")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v8192_e32__v8192_e32__v8192_e32")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v8192_e8__v8192_e8__v8192_e8")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v32_e32__v32_e32__v32_e32")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v16_e8__v16_e8__v16_e8")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v256_e8__v256_e8__v256_e8")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v8_e32__v8_e32__v8_e32")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v8192_e16__v8192_e16__v8192_e16")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v4096_e32__v4096_e32__v4096_e32")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v16_e32__v16_e32__v16_e32")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v512_e16__v512_e16__v512_e16")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v64_e8__v64_e8__v64_e8")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v4096_e16__v4096_e16__v4096_e16")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v8_e16__v8_e16__v8_e16")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v16384_e8__v16384_e8__v16384_e8")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v128_e8__v128_e8__v128_e8")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v64_e16__v64_e16__v64_e16")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v1024_e8__v1024_e8__v1024_e8")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v2048_e8__v2048_e8__v2048_e8")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v128_e16__v128_e16__v128_e16")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v16384_e16__v16384_e16__v16384_e16")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v256_e32__v256_e32__v256_e32")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v32_e16__v32_e16__v32_e16")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v512_e32__v512_e32__v512_e32")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v4096_e8__v4096_e8__v4096_e8")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v8_e8__v8_e8__v8_e8")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0))
(displayln "Scaling case for pimAdd_v16_e16__v16_e16__v16_e16")
(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl
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
	[ (pimMul_v512_e8__v512_e8__v512_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v4096_e8__v4096_e8__v4096_e8")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v512_e16__v512_e16__v512_e16")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v8192_e8__v8192_e8__v8192_e8")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v4096_e32__v4096_e32__v4096_e32")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v8192_e32__v8192_e32__v8192_e32")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v64_e32__v64_e32__v64_e32")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v64_e16__v64_e16__v64_e16")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v32_e8__v32_e8__v32_e8")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v16384_e8__v16384_e8__v16384_e8")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v16_e8__v16_e8__v16_e8")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v128_e8__v128_e8__v128_e8")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v8_e32__v8_e32__v8_e32")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v512_e32__v512_e32__v512_e32")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v128_e16__v128_e16__v128_e16")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v1024_e8__v1024_e8__v1024_e8")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 4) (equal? num_3 4) (equal? num_4 0) (equal? num_5 4) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v8_e16__v8_e16__v8_e16")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v16_e32__v16_e32__v16_e32")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v256_e8__v256_e8__v256_e8")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v8192_e16__v8192_e16__v8192_e16")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v16384_e16__v16384_e16__v16384_e16")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v2048_e16__v2048_e16__v2048_e16")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v2048_e8__v2048_e8__v2048_e8")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v64_e8__v64_e8__v64_e8")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v16_e16__v16_e16__v16_e16")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v16384_e32__v16384_e32__v16384_e32")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v2048_e32__v2048_e32__v2048_e32")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 2) (equal? num_3 2) (equal? num_4 0) (equal? num_5 2) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v8_e8__v8_e8__v8_e8")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
v0
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
num_9
num_10
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v32_e32__v32_e32__v32_e32")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v1024_e16__v1024_e16__v1024_e16")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v32_e16__v32_e16__v32_e16")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v256_e32__v256_e32__v256_e32")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v4096_e16__v4096_e16__v4096_e16")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0))
(displayln "Scaling case for pimMul_v1024_e32__v1024_e32__v1024_e32")
(pimMul_v512_e8__v512_e8__v512_e8_dsl
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
	[ (pimDivScalar_v32_e16__v32_e16__v32_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimDivScalar_v256_e32__v256_e32__v256_e32")
(pimDivScalar_v32_e16__v32_e16__v32_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimDivScalar_v2048_e32__v2048_e32__v2048_e32")
(pimDivScalar_v32_e16__v32_e16__v32_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimDivScalar_v8192_e32__v8192_e32__v8192_e32")
(pimDivScalar_v32_e16__v32_e16__v32_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimDivScalar_v512_e32__v512_e32__v512_e32")
(pimDivScalar_v32_e16__v32_e16__v32_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimDivScalar_v16384_e32__v16384_e32__v16384_e32")
(pimDivScalar_v32_e16__v32_e16__v32_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 32) (equal? num_3 32) (equal? num_4 0) (equal? num_5 32) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimDivScalar_v32_e32__v32_e32__v32_e32")
(pimDivScalar_v32_e16__v32_e16__v32_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 16) (equal? num_3 16) (equal? num_4 0) (equal? num_5 16) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimDivScalar_v16_e32__v16_e32__v16_e32")
(pimDivScalar_v32_e16__v32_e16__v32_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 4096) (equal? num_3 4096) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimDivScalar_v4096_e32__v4096_e32__v4096_e32")
(pimDivScalar_v32_e16__v32_e16__v32_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 8) (equal? num_3 8) (equal? num_4 0) (equal? num_5 8) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimDivScalar_v8_e32__v8_e32__v8_e32")
(pimDivScalar_v32_e16__v32_e16__v32_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimDivScalar_v64_e32__v64_e32__v64_e32")
(pimDivScalar_v32_e16__v32_e16__v32_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
(* scale-factor size_i_o)
(* scale-factor num_3)
num_4
(* scale-factor num_5)
prec_i_o
num_7
num_8
)
]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0))
(displayln "Scaling case for pimDivScalar_v1024_e32__v1024_e32__v1024_e32")
(pimDivScalar_v32_e16__v32_e16__v32_e16_dsl
(bitsimd:scale-expr v0 scale-factor)
v1
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
	[_ (error "Unrecognized expression")]
 )
)
;; ================================================================================

