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
(require rosette/lib/destruct)



(require hydride/ir/hydride/definition)
(require hydride/ir/bitsimd/definition)

(provide (all-defined-out))
;; ================================================================================
;;                                DSL Get Sub-Expressions
;; ================================================================================
(define (bitsimd:get-sub-exprs prog)
 (destruct prog
	[(reg id) (list (reg id))]
	[(lit v) '()]
		[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(list v0 v1)
	]
		[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(list v0 v1)
	]
		[(interleave-vector_dsl v0 size_i_o prec_i_o)
		(list v0)
	]
		[(deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(list v0)
	]
		[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(list v0 v1 v4)
	]
		[(llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		(list v0 v1)
	]
		[(llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		(list v0 v1)
	]
		[(llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		(list v0 v1)
	]
		[(llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		(list v0 v1)
	]
		[(llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		(list v0 v1)
	]
		[(llvm-zext_dsl v0 size_i size_o)
		(list v0)
	]
		[(scalar_splat_dsl v0 size_i size_o)
		(list v0)
	]
	[(pimXorScalar_v16384_e16__v16384_e16__v16384_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 0)); pimXorScalar_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 0)); pimXorScalar_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 0)); pimXorScalar_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 0)); pimXorScalar_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)); pimXorScalar_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)); pimXorScalar_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 0)); pimXorScalar_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0)); pimXorScalar_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 0)); pimXorScalar_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0)); pimXorScalar_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0)); pimXorScalar_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0)); pimXorScalar_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 0)); pimXorScalar_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0)); pimXorScalar_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 0)); pimXorScalar_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 0)); pimXorScalar_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0)); pimXorScalar_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0)); pimXorScalar_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 0)); pimXorScalar_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 0)); pimXorScalar_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0)); pimXorScalar_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)); pimXorScalar_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 0)); pimXorScalar_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0)); pimXorScalar_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 0)); pimXorScalar_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 0)); pimXorScalar_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); pimXorScalar_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0)); pimXorScalar_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 0)); pimXorScalar_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 0)); pimXorScalar_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 0)); pimXorScalar_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 0)); pimXorScalar_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)); pimXorScalar_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 0)); pimXorScalar_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 0)); pimXorScalar_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 0)); pimXorScalar_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimXorScalar_v16384_e16__v16384_e16__v16384_e16")]
)

	]
	[(pimOrScalar_v8192_e8__v8192_e8__v8192_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 0)); pimOrScalar_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)); pimOrScalar_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0)); pimOrScalar_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0)); pimOrScalar_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0)); pimOrScalar_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 0)); pimOrScalar_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0)); pimOrScalar_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 0)); pimOrScalar_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0)); pimOrScalar_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 0)); pimOrScalar_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 0)); pimOrScalar_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 0)); pimOrScalar_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 0)); pimOrScalar_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 0)); pimOrScalar_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0)); pimOrScalar_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0)); pimOrScalar_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0)); pimOrScalar_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)); pimOrScalar_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)); pimOrScalar_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 0)); pimOrScalar_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 0)); pimOrScalar_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 0)); pimOrScalar_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)); pimOrScalar_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 0)); pimOrScalar_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); pimOrScalar_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 0)); pimOrScalar_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 0)); pimOrScalar_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 0)); pimOrScalar_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 0)); pimOrScalar_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 0)); pimOrScalar_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 0)); pimOrScalar_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0)); pimOrScalar_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0)); pimOrScalar_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 0)); pimOrScalar_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 0)); pimOrScalar_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 0)); pimOrScalar_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimOrScalar_v8192_e8__v8192_e8__v8192_e8")]
)

	]
	[(pimSub_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSub_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSub_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSub_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSub_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSub_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSub_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSub_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSub_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSub_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSub_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSub_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSub_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSub_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSub_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSub_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSub_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSub_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSub_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSub_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSub_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSub_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSub_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSub_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSub_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSub_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSub_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSub_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSub_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSub_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSub_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSub_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSub_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSub_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSub_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSub_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSub_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimSub_v8192_e16__v8192_e16__v8192_e16")]
)

	]
	[(pimMinScalar_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMinScalar_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimMinScalar_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(pimOr_v4096_e32__v4096_e32__v4096_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 0)); pimOr_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 0)); pimOr_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 0)); pimOr_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 0)); pimOr_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0)); pimOr_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 0)); pimOr_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0)); pimOr_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0)); pimOr_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)); pimOr_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 0)); pimOr_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); pimOr_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 0)); pimOr_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0)); pimOr_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 0)); pimOr_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 0)); pimOr_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0)); pimOr_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 0)); pimOr_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)); pimOr_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)); pimOr_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 0)); pimOr_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 0)); pimOr_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 0)); pimOr_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 0)); pimOr_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0)); pimOr_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 0)); pimOr_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0)); pimOr_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 0)); pimOr_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 0)); pimOr_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0)); pimOr_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 0)); pimOr_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0)); pimOr_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 0)); pimOr_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)); pimOr_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0)); pimOr_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 0)); pimOr_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 0)); pimOr_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimOr_v4096_e32__v4096_e32__v4096_e32")]
)

	]
	[(pimAnd_v32_e32__v32_e32__v32_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0)); pimAnd_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0)); pimAnd_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 0)); pimAnd_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0)); pimAnd_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 0)); pimAnd_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 0)); pimAnd_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 0)); pimAnd_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0)); pimAnd_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0)); pimAnd_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0)); pimAnd_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 0)); pimAnd_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 0)); pimAnd_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 0)); pimAnd_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 0)); pimAnd_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); pimAnd_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 0)); pimAnd_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 0)); pimAnd_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 0)); pimAnd_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 0)); pimAnd_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 0)); pimAnd_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 0)); pimAnd_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)); pimAnd_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 0)); pimAnd_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 0)); pimAnd_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)); pimAnd_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0)); pimAnd_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)); pimAnd_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 0)); pimAnd_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 0)); pimAnd_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0)); pimAnd_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)); pimAnd_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 0)); pimAnd_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0)); pimAnd_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 0)); pimAnd_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0)); pimAnd_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 0)); pimAnd_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimAnd_v32_e32__v32_e32__v32_e32")]
)

	]
	[(pimDiv_v4096_e8__v4096_e8__v4096_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); pimDiv_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); pimDiv_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); pimDiv_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); pimDiv_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); pimDiv_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); pimDiv_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); pimDiv_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); pimDiv_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); pimDiv_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); pimDiv_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); pimDiv_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)); pimDiv_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimDiv_v4096_e8__v4096_e8__v4096_e8")]
)

	]
	[(pimMin_v64_e32__v64_e32__v64_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMin_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMin_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMin_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMin_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMin_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMin_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMin_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMin_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMin_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMin_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMin_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMin_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMin_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMin_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMin_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMin_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMin_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMin_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMin_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMin_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMin_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMin_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMin_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMin_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMin_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMin_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMin_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMin_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMin_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMin_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMin_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMin_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMin_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMin_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMin_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMin_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimMin_v64_e32__v64_e32__v64_e32")]
)

	]
	[(pimSubScalar_v2048_e8__v2048_e8__v2048_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimSubScalar_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimSubScalar_v2048_e8__v2048_e8__v2048_e8")]
)

	]
	[(pimMulScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 0)); pimMulScalar_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0)); pimMulScalar_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0)); pimMulScalar_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 0)); pimMulScalar_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 0)); pimMulScalar_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); pimMulScalar_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0)); pimMulScalar_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0)); pimMulScalar_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)); pimMulScalar_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 0)); pimMulScalar_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 0)); pimMulScalar_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 0)); pimMulScalar_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 0)); pimMulScalar_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 0)); pimMulScalar_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 0)); pimMulScalar_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0)); pimMulScalar_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0)); pimMulScalar_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 0)); pimMulScalar_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)); pimMulScalar_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 0)); pimMulScalar_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0)); pimMulScalar_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 0)); pimMulScalar_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 0)); pimMulScalar_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 0)); pimMulScalar_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 0)); pimMulScalar_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 0)); pimMulScalar_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 0)); pimMulScalar_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0)); pimMulScalar_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 0)); pimMulScalar_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)); pimMulScalar_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)); pimMulScalar_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 0)); pimMulScalar_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 0)); pimMulScalar_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0)); pimMulScalar_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 0)); pimMulScalar_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0)); pimMulScalar_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimMulScalar_v256_e32__v256_e32__v256_e32")]
)

	]
	[(pimMax_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMax_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMax_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMax_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMax_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMax_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMax_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMax_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMax_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMax_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMax_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMax_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMax_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMax_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMax_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMax_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMax_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMax_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMax_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMax_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMax_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMax_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMax_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMax_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMax_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMax_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMax_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMax_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMax_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMax_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMax_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMax_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMax_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMax_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMax_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMax_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMax_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimMax_v8192_e16__v8192_e16__v8192_e16")]
)

	]
	[(pimDiv_v4096_e32__v4096_e32__v4096_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)); pimDiv_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)); pimDiv_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)); pimDiv_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)); pimDiv_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)); pimDiv_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)); pimDiv_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)); pimDiv_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)); pimDiv_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)); pimDiv_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)); pimDiv_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)); pimDiv_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)); pimDiv_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimDiv_v4096_e32__v4096_e32__v4096_e32")]
)

	]
	[(pimAndScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 0)); pimAndScalar_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 0)); pimAndScalar_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)); pimAndScalar_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 0)); pimAndScalar_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 0)); pimAndScalar_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 0)); pimAndScalar_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 0)); pimAndScalar_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0)); pimAndScalar_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 0)); pimAndScalar_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 0)); pimAndScalar_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 0)); pimAndScalar_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0)); pimAndScalar_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 0)); pimAndScalar_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0)); pimAndScalar_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 0)); pimAndScalar_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 0)); pimAndScalar_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 0)); pimAndScalar_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0)); pimAndScalar_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 0)); pimAndScalar_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0)); pimAndScalar_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)); pimAndScalar_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 0)); pimAndScalar_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0)); pimAndScalar_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 0)); pimAndScalar_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)); pimAndScalar_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 0)); pimAndScalar_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0)); pimAndScalar_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0)); pimAndScalar_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); pimAndScalar_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 0)); pimAndScalar_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 0)); pimAndScalar_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 0)); pimAndScalar_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0)); pimAndScalar_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)); pimAndScalar_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0)); pimAndScalar_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 0)); pimAndScalar_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimAndScalar_v256_e32__v256_e32__v256_e32")]
)

	]
	[(pimXor_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 0)); pimXor_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 0)); pimXor_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 0)); pimXor_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 0)); pimXor_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0)); pimXor_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0)); pimXor_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 0)); pimXor_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0)); pimXor_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0)); pimXor_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0)); pimXor_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 0)); pimXor_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 0)); pimXor_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 0)); pimXor_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0)); pimXor_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 0)); pimXor_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 0)); pimXor_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 0)); pimXor_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 0)); pimXor_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 0)); pimXor_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0)); pimXor_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)); pimXor_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0)); pimXor_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 0)); pimXor_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 0)); pimXor_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 0)); pimXor_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 0)); pimXor_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0)); pimXor_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)); pimXor_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 0)); pimXor_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 0)); pimXor_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)); pimXor_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0)); pimXor_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)); pimXor_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)); pimXor_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 0)); pimXor_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 0)); pimXor_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimXor_v8192_e16__v8192_e16__v8192_e16")]
)

	]
	[(pimBroadCast_v1024_e16__v16_e16_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)); pimBroadCast_v1024_e16__v16_e16
 
  (list v0)]
		[(and  (equal? size_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)); pimBroadCast_v512_e32__v32_e32
 
  (list v0)]
		[(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 131072) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)); pimBroadCast_v16384_e8__v8_e8
 
  (list v0)]
		[(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)); pimBroadCast_v1024_e8__v8_e8
 
  (list v0)]
		[(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)); pimBroadCast_v512_e8__v8_e8
 
  (list v0)]
		[(and  (equal? size_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)); pimBroadCast_v512_e16__v16_e16
 
  (list v0)]
		[(and  (equal? size_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)); pimBroadCast_v1024_e32__v32_e32
 
  (list v0)]
		[else (error "Unable to get ops  for pimBroadCast_v1024_e16__v16_e16")]
)

	]
	[(pimEQ_v512_e16__v512_e16__v512_e16_dsl vc_0 v1 vc_2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(cond 
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 0)); pimEQ_v512_e16__v512_e16__v512_e16
 
  (list v1 v3)]
		[(and  (equal? size_i_o 131072) (equal? num_5 131072) (equal? num_6 0) (equal? num_7 131072) (equal? prec_i_o 8) (equal? num_9 0)); pimEQ_v16384_e8__v16384_e8__v16384_e8
 
  (list v1 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 0)); pimEQ_v1024_e32__v1024_e32__v1024_e32
 
  (list v1 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 0)); pimEQ_v1024_e8__v1024_e8__v1024_e8
 
  (list v1 v3)]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 0)); pimEQ_v512_e32__v512_e32__v512_e32
 
  (list v1 v3)]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 0)); pimEQ_v512_e8__v512_e8__v512_e8
 
  (list v1 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 0)); pimEQ_v1024_e16__v1024_e16__v1024_e16
 
  (list v1 v3)]
		[else (error "Unable to get ops  for pimEQ_v512_e16__v512_e16__v512_e16")]
)

	]
	[(pimMaxScalar_v256_e32__v256_e32__v256_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimMaxScalar_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimMaxScalar_v256_e32__v256_e32__v256_e32")]
)

	]
	[(pimGT_v16384_e8__v16384_e8__v16384_e8_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_5 131072) (equal? num_6 0) (equal? num_7 131072) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)); pimGT_v16384_e8__v16384_e8__v16384_e8
 
  (list v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0)); pimGT_v1024_e32__v1024_e32__v1024_e32
 
  (list v2 v3)]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0)); pimGT_v512_e32__v512_e32__v512_e32
 
  (list v2 v3)]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0)); pimGT_v512_e16__v512_e16__v512_e16
 
  (list v2 v3)]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0)); pimLT_v512_e16__v512_e16__v512_e16
 
  (list v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0)); pimLT_v1024_e16__v1024_e16__v1024_e16
 
  (list v2 v3)]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)); pimGT_v512_e8__v512_e8__v512_e8
 
  (list v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)); pimGT_v1024_e8__v1024_e8__v1024_e8
 
  (list v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0)); pimLT_v1024_e32__v1024_e32__v1024_e32
 
  (list v2 v3)]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0)); pimLT_v512_e32__v512_e32__v512_e32
 
  (list v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0)); pimGT_v1024_e16__v1024_e16__v1024_e16
 
  (list v2 v3)]
		[(and  (equal? size_i_o 131072) (equal? num_5 131072) (equal? num_6 0) (equal? num_7 131072) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)); pimLT_v16384_e8__v16384_e8__v16384_e8
 
  (list v2 v3)]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)); pimLT_v1024_e8__v1024_e8__v1024_e8
 
  (list v2 v3)]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)); pimLT_v512_e8__v512_e8__v512_e8
 
  (list v2 v3)]
		[else (error "Unable to get ops  for pimGT_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(pimAddScalar_v8_e16__v8_e16__v8_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAddScalar_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimAddScalar_v8_e16__v8_e16__v8_e16")]
)

	]
	[(pimDiv_v8192_e16__v8192_e16__v8192_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); pimDiv_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); pimDiv_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); pimDiv_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); pimDiv_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); pimDiv_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); pimDiv_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); pimDiv_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); pimDiv_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); pimDiv_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); pimDiv_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); pimDiv_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)); pimDiv_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimDiv_v8192_e16__v8192_e16__v8192_e16")]
)

	]
	[(pimScaledAdd_v256_e8__v256_e8__v256_e8_dsl v0 v1 v2 size_i_o num_4 num_5 num_6 prec_i_o num_8 num_9)
		(cond 
		[(and  (equal? size_i_o 2048) (equal? num_4 2048) (equal? num_5 0) (equal? num_6 2048) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v256_e8__v256_e8__v256_e8
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 262144) (equal? num_4 262144) (equal? num_5 0) (equal? num_6 262144) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 8192) (equal? num_4 8192) (equal? num_5 0) (equal? num_6 8192) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v256_e32__v256_e32__v256_e32
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v128_e8__v128_e8__v128_e8
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 524288) (equal? num_4 524288) (equal? num_5 0) (equal? num_6 524288) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 65536) (equal? num_4 65536) (equal? num_5 0) (equal? num_6 65536) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 32768) (equal? num_4 32768) (equal? num_5 0) (equal? num_6 32768) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 512) (equal? num_4 512) (equal? num_5 0) (equal? num_6 512) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v16_e32__v16_e32__v16_e32
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 131072) (equal? num_4 131072) (equal? num_5 0) (equal? num_6 131072) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 8192) (equal? num_4 8192) (equal? num_5 0) (equal? num_6 8192) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 256) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v32_e8__v32_e8__v32_e8
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v64_e16__v64_e16__v64_e16
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 512) (equal? num_4 512) (equal? num_5 0) (equal? num_6 512) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v32_e16__v32_e16__v32_e16
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 64) (equal? num_4 64) (equal? num_5 0) (equal? num_6 64) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v8_e8__v8_e8__v8_e8
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 2048) (equal? num_4 2048) (equal? num_5 0) (equal? num_6 2048) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v64_e32__v64_e32__v64_e32
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 256) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v16_e16__v16_e16__v16_e16
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 131072) (equal? num_4 131072) (equal? num_5 0) (equal? num_6 131072) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 8192) (equal? num_4 8192) (equal? num_5 0) (equal? num_6 8192) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v512_e16__v512_e16__v512_e16
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 256) (equal? num_4 256) (equal? num_5 0) (equal? num_6 256) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v8_e32__v8_e32__v8_e32
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 131072) (equal? num_4 131072) (equal? num_5 0) (equal? num_6 131072) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 4098) (equal? num_4 4098) (equal? num_5 0) (equal? num_6 4096) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v256_e16__v256_e16__v256_e16
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 1024) (equal? num_4 1024) (equal? num_5 0) (equal? num_6 1024) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v32_e32__v32_e32__v32_e32
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 65536) (equal? num_4 65536) (equal? num_5 0) (equal? num_6 65536) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 2048) (equal? num_4 2048) (equal? num_5 0) (equal? num_6 2048) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v128_e16__v128_e16__v128_e16
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v16_e8__v16_e8__v16_e8
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 16384) (equal? num_4 16384) (equal? num_5 0) (equal? num_6 16384) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v512_e32__v512_e32__v512_e32
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 4098) (equal? num_4 4098) (equal? num_5 0) (equal? num_6 4096) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v128_e32__v128_e32__v128_e32
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 512) (equal? num_4 512) (equal? num_5 0) (equal? num_6 512) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v64_e8__v64_e8__v64_e8
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 128) (equal? num_4 128) (equal? num_5 0) (equal? num_6 128) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v8_e16__v8_e16__v8_e16
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 16384) (equal? num_4 16384) (equal? num_5 0) (equal? num_6 16384) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 65536) (equal? num_4 65536) (equal? num_5 0) (equal? num_6 65536) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 262144) (equal? num_4 262144) (equal? num_5 0) (equal? num_6 262144) (equal? prec_i_o 32) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 32768) (equal? num_4 32768) (equal? num_5 0) (equal? num_6 32768) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 32768) (equal? num_4 32768) (equal? num_5 0) (equal? num_6 32768) (equal? prec_i_o 16) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 16384) (equal? num_4 16384) (equal? num_5 0) (equal? num_6 16384) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1 v2)]
		[(and  (equal? size_i_o 4098) (equal? num_4 4098) (equal? num_5 0) (equal? num_6 4096) (equal? prec_i_o 8) (equal? num_8 -1) (equal? num_9 0)); pimScaledAdd_v512_e8__v512_e8__v512_e8
 
  (list v0 v1 v2)]
		[else (error "Unable to get ops  for pimScaledAdd_v256_e8__v256_e8__v256_e8")]
)

	]
	[(pimAdd_v1024_e32__v1024_e32__v1024_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)); pimAdd_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimAdd_v1024_e32__v1024_e32__v1024_e32")]
)

	]
	[(pimMul_v512_e8__v512_e8__v512_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)); pimMul_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)); pimMul_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)); pimMul_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)); pimMul_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)); pimMul_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)); pimMul_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)); pimMul_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)); pimMul_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)); pimMul_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)); pimMul_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)); pimMul_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)); pimMul_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)); pimMul_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)); pimMul_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)); pimMul_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)); pimMul_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)); pimMul_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)); pimMul_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)); pimMul_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)); pimMul_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)); pimMul_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)); pimMul_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)); pimMul_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)); pimMul_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)); pimMul_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)); pimMul_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)); pimMul_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)); pimMul_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)); pimMul_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)); pimMul_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)); pimMul_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)); pimMul_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)); pimMul_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)); pimMul_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)); pimMul_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)); pimMul_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimMul_v512_e8__v512_e8__v512_e8")]
)

	]
	[(pimDivScalar_v32_e16__v32_e16__v32_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v32_e16__v32_e16__v32_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v8192_e16__v8192_e16__v8192_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v2048_e8__v2048_e8__v2048_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v512_e16__v512_e16__v512_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v256_e32__v256_e32__v256_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v2048_e32__v2048_e32__v2048_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v64_e16__v64_e16__v64_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v8_e16__v8_e16__v8_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v16_e16__v16_e16__v16_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v8_e8__v8_e8__v8_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v128_e16__v128_e16__v128_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v128_e8__v128_e8__v128_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v8192_e32__v8192_e32__v8192_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v32_e8__v32_e8__v32_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v512_e32__v512_e32__v512_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v256_e16__v256_e16__v256_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v16384_e16__v16384_e16__v16384_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v8192_e8__v8192_e8__v8192_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v16384_e32__v16384_e32__v16384_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v32_e32__v32_e32__v32_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v64_e8__v64_e8__v64_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v16_e32__v16_e32__v16_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v4096_e32__v4096_e32__v4096_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v8_e32__v8_e32__v8_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v2048_e16__v2048_e16__v2048_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v256_e8__v256_e8__v256_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v64_e32__v64_e32__v64_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v1024_e32__v1024_e32__v1024_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v512_e8__v512_e8__v512_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v4096_e8__v4096_e8__v4096_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v16_e8__v16_e8__v16_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v128_e32__v128_e32__v128_e32
 
  (list v0 v1)]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v16384_e8__v16384_e8__v16384_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v1024_e16__v1024_e16__v1024_e16
 
  (list v0 v1)]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v1024_e8__v1024_e8__v1024_e8
 
  (list v0 v1)]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)); pimDivScalar_v4096_e16__v4096_e16__v4096_e16
 
  (list v0 v1)]
		[else (error "Unable to get ops  for pimDivScalar_v32_e16__v32_e16__v32_e16")]
)

	]
 )
)
;; ================================================================================

