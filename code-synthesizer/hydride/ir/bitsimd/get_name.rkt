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

(require hydride/utils/bvops)
(require hydride/utils/misc)


(require hydride/ir/hydride/definition)
(require hydride/ir/bitsimd/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Get Names
;; ================================================================================
(define (bitsimd:get-target-name prog)
 (destruct prog
	[(reg id) '()]
	[(lit v) '()]
		[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		 (append (list  "two_input_swizzle_N6_T8_LO0_L3_G3_D1_R0") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))
	]
		[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		 (append (list  "interleave-vectors-128-16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))
	]
		[(interleave-vector_dsl v0 size_i_o prec_i_o)
		 (append (list  "interleave-vector-128-16") (bitsimd:get-target-name v0))
	]
		[(deinterleave-vector_dsl v0 size_i_o prec_i_o)
		 (append (list  "deinterleave-vector-128-16") (bitsimd:get-target-name v0))
	]
		[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		 (append (list  "shuffle-vector-128-16-128") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1) (bitsimd:get-target-name v4))
	]
		[(llvm-vect-add_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-add-128-16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))
	]
		[(llvm-vect-sub_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-sub-128-16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))
	]
		[(llvm-vect-mul_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-mul-128-16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))
	]
		[(llvm-vect-sdiv_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-sdiv-128-16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))
	]
		[(llvm-vect-udiv_dsl v0 v1 num_2 prec_i_o)
		 (append (list  "llvm-vect-udiv-128-16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))
	]
		[(llvm-zext_dsl v0 size_i size_o)
		 (append (list  "llvm-zext-8-32") (bitsimd:get-target-name v0))
	]
		[(scalar_splat_dsl v0 size_i size_o)
		 (append (list  "llvm-splat-8-32") (bitsimd:get-target-name v0))
	]
	[(pimMax_v2048_e8__v2048_e8__v2048_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v2048_e8__v2048_e8__v2048_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v2048_e32__v2048_e32__v2048_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v8192_e16__v8192_e16__v8192_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v8192_e32__v8192_e32__v8192_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v128_e16__v128_e16__v128_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v64_e8__v64_e8__v64_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v256_e8__v256_e8__v256_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v4096_e8__v4096_e8__v4096_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v256_e16__v256_e16__v256_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v512_e8__v512_e8__v512_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v8_e16__v8_e16__v8_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v128_e32__v128_e32__v128_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v2048_e16__v2048_e16__v2048_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v256_e32__v256_e32__v256_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v1024_e16__v1024_e16__v1024_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v512_e16__v512_e16__v512_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v16_e16__v16_e16__v16_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v8_e8__v8_e8__v8_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v4096_e16__v4096_e16__v4096_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v8192_e8__v8192_e8__v8192_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v512_e32__v512_e32__v512_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v1024_e8__v1024_e8__v1024_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v64_e16__v64_e16__v64_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v4096_e32__v4096_e32__v4096_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v128_e8__v128_e8__v128_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v16_e8__v16_e8__v16_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v16384_e8__v16384_e8__v16384_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v32_e8__v32_e8__v32_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v32_e16__v32_e16__v32_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v32_e32__v32_e32__v32_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v16384_e16__v16384_e16__v16384_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v16384_e32__v16384_e32__v16384_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v16_e32__v16_e32__v16_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v8_e32__v8_e32__v8_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v64_e32__v64_e32__v64_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMax_v1024_e32__v1024_e32__v1024_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[else (error "Unable to get name  for pimMax_v2048_e8__v2048_e8__v2048_e8")]
)

	]
	[(pimOr_v2048_e32__v2048_e32__v2048_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimOr_v2048_e32__v2048_e32__v2048_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimOr_v32_e8__v32_e8__v32_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimOr_v2048_e8__v2048_e8__v2048_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimOr_v4096_e32__v4096_e32__v4096_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimOr_v512_e8__v512_e8__v512_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimOr_v512_e16__v512_e16__v512_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimOr_v64_e16__v64_e16__v64_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimOr_v32_e32__v32_e32__v32_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimOr_v4096_e16__v4096_e16__v4096_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimOr_v8_e8__v8_e8__v8_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimOr_v8_e16__v8_e16__v8_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimOr_v256_e32__v256_e32__v256_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimOr_v8192_e16__v8192_e16__v8192_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimOr_v1024_e16__v1024_e16__v1024_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimOr_v16384_e32__v16384_e32__v16384_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimOr_v16_e32__v16_e32__v16_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimOr_v256_e16__v256_e16__v256_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimOr_v1024_e32__v1024_e32__v1024_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimOr_v512_e32__v512_e32__v512_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimOr_v128_e8__v128_e8__v128_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimOr_v64_e32__v64_e32__v64_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimOr_v16384_e16__v16384_e16__v16384_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimOr_v8_e32__v8_e32__v8_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimOr_v64_e8__v64_e8__v64_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimOr_v8192_e32__v8192_e32__v8192_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimOr_v1024_e8__v1024_e8__v1024_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimOr_v4096_e8__v4096_e8__v4096_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimOr_v32_e16__v32_e16__v32_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimOr_v8192_e8__v8192_e8__v8192_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimOr_v256_e8__v256_e8__v256_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimOr_v2048_e16__v2048_e16__v2048_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimOr_v16_e16__v16_e16__v16_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimOr_v16384_e8__v16384_e8__v16384_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimOr_v128_e32__v128_e32__v128_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimOr_v16_e8__v16_e8__v16_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimOr_v128_e16__v128_e16__v128_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[else (error "Unable to get name  for pimOr_v2048_e32__v2048_e32__v2048_e32")]
)

	]
	[(pimAnd_v32_e8__v32_e8__v32_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimAnd_v32_e8__v32_e8__v32_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimAnd_v512_e32__v512_e32__v512_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimAnd_v128_e16__v128_e16__v128_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimAnd_v32_e16__v32_e16__v32_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimAnd_v256_e32__v256_e32__v256_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimAnd_v512_e16__v512_e16__v512_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimAnd_v8192_e32__v8192_e32__v8192_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimAnd_v64_e32__v64_e32__v64_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimAnd_v16384_e16__v16384_e16__v16384_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimAnd_v1024_e8__v1024_e8__v1024_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimAnd_v8_e32__v8_e32__v8_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimAnd_v4096_e32__v4096_e32__v4096_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimAnd_v8192_e8__v8192_e8__v8192_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimAnd_v64_e16__v64_e16__v64_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimAnd_v4096_e16__v4096_e16__v4096_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimAnd_v512_e8__v512_e8__v512_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimAnd_v2048_e32__v2048_e32__v2048_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimAnd_v64_e8__v64_e8__v64_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimAnd_v16384_e8__v16384_e8__v16384_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimAnd_v2048_e16__v2048_e16__v2048_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimAnd_v8_e8__v8_e8__v8_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimAnd_v2048_e8__v2048_e8__v2048_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimAnd_v1024_e32__v1024_e32__v1024_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimAnd_v256_e16__v256_e16__v256_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimAnd_v128_e8__v128_e8__v128_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimAnd_v4096_e8__v4096_e8__v4096_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimAnd_v16384_e32__v16384_e32__v16384_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimAnd_v1024_e16__v1024_e16__v1024_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimAnd_v128_e32__v128_e32__v128_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimAnd_v32_e32__v32_e32__v32_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimAnd_v16_e32__v16_e32__v16_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimAnd_v16_e8__v16_e8__v16_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimAnd_v8192_e16__v8192_e16__v8192_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimAnd_v256_e8__v256_e8__v256_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimAnd_v16_e16__v16_e16__v16_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimAnd_v8_e16__v8_e16__v8_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[else (error "Unable to get name  for pimAnd_v32_e8__v32_e8__v32_e8")]
)

	]
	[(pimGT_v512_e32__v512_e32__v512_e32_dsl vc_0 vc_1 v2 v3 size_i_o num_5 num_6 num_7 prec_i_o num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimGT_v512_e32__v512_e32__v512_e32") (bitsimd:get-target-name v2) (bitsimd:get-target-name v3))]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimLT_v512_e16__v512_e16__v512_e16") (bitsimd:get-target-name v2) (bitsimd:get-target-name v3))]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimLT_v512_e32__v512_e32__v512_e32") (bitsimd:get-target-name v2) (bitsimd:get-target-name v3))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimGT_v1024_e8__v1024_e8__v1024_e8") (bitsimd:get-target-name v2) (bitsimd:get-target-name v3))]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimGT_v512_e8__v512_e8__v512_e8") (bitsimd:get-target-name v2) (bitsimd:get-target-name v3))]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimGT_v512_e16__v512_e16__v512_e16") (bitsimd:get-target-name v2) (bitsimd:get-target-name v3))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimLT_v1024_e32__v1024_e32__v1024_e32") (bitsimd:get-target-name v2) (bitsimd:get-target-name v3))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimGT_v1024_e16__v1024_e16__v1024_e16") (bitsimd:get-target-name v2) (bitsimd:get-target-name v3))]
		[(and  (equal? size_i_o 131072) (equal? num_5 131072) (equal? num_6 0) (equal? num_7 131072) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimGT_v16384_e8__v16384_e8__v16384_e8") (bitsimd:get-target-name v2) (bitsimd:get-target-name v3))]
		[(and  (equal? size_i_o 131072) (equal? num_5 131072) (equal? num_6 0) (equal? num_7 131072) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimLT_v16384_e8__v16384_e8__v16384_e8") (bitsimd:get-target-name v2) (bitsimd:get-target-name v3))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimGT_v1024_e32__v1024_e32__v1024_e32") (bitsimd:get-target-name v2) (bitsimd:get-target-name v3))]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimLT_v512_e8__v512_e8__v512_e8") (bitsimd:get-target-name v2) (bitsimd:get-target-name v3))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimLT_v1024_e16__v1024_e16__v1024_e16") (bitsimd:get-target-name v2) (bitsimd:get-target-name v3))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimLT_v1024_e8__v1024_e8__v1024_e8") (bitsimd:get-target-name v2) (bitsimd:get-target-name v3))]
		[else (error "Unable to get name  for pimGT_v512_e32__v512_e32__v512_e32")]
)

	]
	[(pimEQ_v512_e32__v512_e32__v512_e32_dsl v0 vc_1 v2 vc_3 size_i_o num_5 num_6 num_7 prec_i_o num_9)
		(cond 
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 32) (equal? num_9 0)) 
   (append (list  "pimEQ_v512_e32__v512_e32__v512_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v2))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 32) (equal? num_9 0)) 
   (append (list  "pimEQ_v1024_e32__v1024_e32__v1024_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v2))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 16) (equal? num_9 0)) 
   (append (list  "pimEQ_v1024_e16__v1024_e16__v1024_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v2))]
		[(and  (equal? size_i_o 131072) (equal? num_5 131072) (equal? num_6 0) (equal? num_7 131072) (equal? prec_i_o 8) (equal? num_9 0)) 
   (append (list  "pimEQ_v16384_e8__v16384_e8__v16384_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v2))]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 8) (equal? num_9 0)) 
   (append (list  "pimEQ_v512_e8__v512_e8__v512_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v2))]
		[(and  (equal? size_i_o 1024) (equal? num_5 1024) (equal? num_6 0) (equal? num_7 1024) (equal? prec_i_o 8) (equal? num_9 0)) 
   (append (list  "pimEQ_v1024_e8__v1024_e8__v1024_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v2))]
		[(and  (equal? size_i_o 512) (equal? num_5 512) (equal? num_6 0) (equal? num_7 512) (equal? prec_i_o 16) (equal? num_9 0)) 
   (append (list  "pimEQ_v512_e16__v512_e16__v512_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v2))]
		[else (error "Unable to get name  for pimEQ_v512_e32__v512_e32__v512_e32")]
)

	]
	[(pimMin_v8192_e8__v8192_e8__v8192_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v8192_e8__v8192_e8__v8192_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v1024_e32__v1024_e32__v1024_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v256_e8__v256_e8__v256_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v1024_e8__v1024_e8__v1024_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v16_e16__v16_e16__v16_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v2048_e32__v2048_e32__v2048_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v1024_e16__v1024_e16__v1024_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v512_e8__v512_e8__v512_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v128_e16__v128_e16__v128_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v8192_e16__v8192_e16__v8192_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v256_e32__v256_e32__v256_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v64_e32__v64_e32__v64_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v128_e8__v128_e8__v128_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v2048_e16__v2048_e16__v2048_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v16384_e8__v16384_e8__v16384_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v128_e32__v128_e32__v128_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v256_e16__v256_e16__v256_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v8_e16__v8_e16__v8_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v64_e16__v64_e16__v64_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v16384_e32__v16384_e32__v16384_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v4096_e8__v4096_e8__v4096_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v4096_e32__v4096_e32__v4096_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v32_e32__v32_e32__v32_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v32_e8__v32_e8__v32_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v32_e16__v32_e16__v32_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v16_e8__v16_e8__v16_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v8192_e32__v8192_e32__v8192_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v64_e8__v64_e8__v64_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v2048_e8__v2048_e8__v2048_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v512_e16__v512_e16__v512_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v8_e32__v8_e32__v8_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v16384_e16__v16384_e16__v16384_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v512_e32__v512_e32__v512_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v16_e32__v16_e32__v16_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v8_e8__v8_e8__v8_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 0)) 
   (append (list  "pimMin_v4096_e16__v4096_e16__v4096_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[else (error "Unable to get name  for pimMin_v8192_e8__v8192_e8__v8192_e8")]
)

	]
	[(pimDiv_v2048_e16__v2048_e16__v2048_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
   (append (list  "pimDiv_v2048_e16__v2048_e16__v2048_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
   (append (list  "pimDiv_v32_e16__v32_e16__v32_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
   (append (list  "pimDiv_v1024_e16__v1024_e16__v1024_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
   (append (list  "pimDiv_v128_e16__v128_e16__v128_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
   (append (list  "pimDiv_v4096_e16__v4096_e16__v4096_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
   (append (list  "pimDiv_v256_e16__v256_e16__v256_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
   (append (list  "pimDiv_v8_e16__v8_e16__v8_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
   (append (list  "pimDiv_v8192_e16__v8192_e16__v8192_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
   (append (list  "pimDiv_v16_e16__v16_e16__v16_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
   (append (list  "pimDiv_v512_e16__v512_e16__v512_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
   (append (list  "pimDiv_v16384_e16__v16384_e16__v16384_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 1) (equal? num_9 32) (equal? num_10 1) (equal? num_11 32) (equal? num_12 0)) 
   (append (list  "pimDiv_v64_e16__v64_e16__v64_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[else (error "Unable to get name  for pimDiv_v2048_e16__v2048_e16__v2048_e16")]
)

	]
	[(pimBroadCast_v512_e32__v32_e32_dsl v0 size_o num_2 num_3 num_4 prec_i_o num_6 num_7)
		(cond 
		[(and  (equal? size_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 
   (append (list  "pimBroadCast_v512_e32__v32_e32") (bitsimd:get-target-name v0))]
		[(and  (equal? size_o 16) (equal? num_2 16) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 
   (append (list  "pimBroadCast_v1024_e16__v16_e16") (bitsimd:get-target-name v0))]
		[(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 
   (append (list  "pimBroadCast_v1024_e8__v8_e8") (bitsimd:get-target-name v0))]
		[(and  (equal? size_o 32) (equal? num_2 32) (equal? num_3 0) (equal? num_4 1024) (equal? prec_i_o 32) (equal? num_6 0) (equal? num_7 0)) 
   (append (list  "pimBroadCast_v1024_e32__v32_e32") (bitsimd:get-target-name v0))]
		[(and  (equal? size_o 512) (equal? num_2 512) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 16) (equal? num_6 0) (equal? num_7 0)) 
   (append (list  "pimBroadCast_v512_e16__v16_e16") (bitsimd:get-target-name v0))]
		[(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 131072) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 
   (append (list  "pimBroadCast_v16384_e8__v8_e8") (bitsimd:get-target-name v0))]
		[(and  (equal? size_o 8) (equal? num_2 8) (equal? num_3 0) (equal? num_4 512) (equal? prec_i_o 8) (equal? num_6 0) (equal? num_7 0)) 
   (append (list  "pimBroadCast_v512_e8__v8_e8") (bitsimd:get-target-name v0))]
		[else (error "Unable to get name  for pimBroadCast_v512_e32__v32_e32")]
)

	]
	[(pimDiv_v2048_e32__v2048_e32__v2048_e32_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
   (append (list  "pimDiv_v2048_e32__v2048_e32__v2048_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
   (append (list  "pimDiv_v4096_e32__v4096_e32__v4096_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
   (append (list  "pimDiv_v16_e32__v16_e32__v16_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
   (append (list  "pimDiv_v32_e32__v32_e32__v32_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
   (append (list  "pimDiv_v128_e32__v128_e32__v128_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
   (append (list  "pimDiv_v64_e32__v64_e32__v64_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
   (append (list  "pimDiv_v8192_e32__v8192_e32__v8192_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
   (append (list  "pimDiv_v256_e32__v256_e32__v256_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
   (append (list  "pimDiv_v16384_e32__v16384_e32__v16384_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
   (append (list  "pimDiv_v512_e32__v512_e32__v512_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
   (append (list  "pimDiv_v8_e32__v8_e32__v8_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 1) (equal? num_9 64) (equal? num_10 1) (equal? num_11 64) (equal? num_12 0)) 
   (append (list  "pimDiv_v1024_e32__v1024_e32__v1024_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[else (error "Unable to get name  for pimDiv_v2048_e32__v2048_e32__v2048_e32")]
)

	]
	[(pimDiv_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10 num_11 num_12)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
   (append (list  "pimDiv_v16384_e8__v16384_e8__v16384_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
   (append (list  "pimDiv_v256_e8__v256_e8__v256_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
   (append (list  "pimDiv_v32_e8__v32_e8__v32_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
   (append (list  "pimDiv_v8192_e8__v8192_e8__v8192_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
   (append (list  "pimDiv_v16_e8__v16_e8__v16_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
   (append (list  "pimDiv_v1024_e8__v1024_e8__v1024_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
   (append (list  "pimDiv_v64_e8__v64_e8__v64_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
   (append (list  "pimDiv_v128_e8__v128_e8__v128_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
   (append (list  "pimDiv_v2048_e8__v2048_e8__v2048_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
   (append (list  "pimDiv_v4096_e8__v4096_e8__v4096_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
   (append (list  "pimDiv_v8_e8__v8_e8__v8_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 1) (equal? num_9 16) (equal? num_10 1) (equal? num_11 16) (equal? num_12 0)) 
   (append (list  "pimDiv_v512_e8__v512_e8__v512_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[else (error "Unable to get name  for pimDiv_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(pimAdd_v16384_e8__v16384_e8__v16384_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v16384_e8__v16384_e8__v16384_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v256_e32__v256_e32__v256_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v128_e16__v128_e16__v128_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v32_e16__v32_e16__v32_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v512_e8__v512_e8__v512_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v2048_e16__v2048_e16__v2048_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v8192_e8__v8192_e8__v8192_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v8192_e32__v8192_e32__v8192_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v32_e32__v32_e32__v32_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v1024_e8__v1024_e8__v1024_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v4096_e32__v4096_e32__v4096_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v16_e16__v16_e16__v16_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v64_e32__v64_e32__v64_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v16384_e16__v16384_e16__v16384_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v8_e32__v8_e32__v8_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v8_e16__v8_e16__v8_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v128_e32__v128_e32__v128_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v32_e8__v32_e8__v32_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v1024_e32__v1024_e32__v1024_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v2048_e8__v2048_e8__v2048_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v512_e32__v512_e32__v512_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v4096_e16__v4096_e16__v4096_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v1024_e16__v1024_e16__v1024_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v128_e8__v128_e8__v128_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v64_e16__v64_e16__v64_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v16_e8__v16_e8__v16_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v256_e16__v256_e16__v256_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v64_e8__v64_e8__v64_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v512_e16__v512_e16__v512_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v4096_e8__v4096_e8__v4096_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v16_e32__v16_e32__v16_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v2048_e32__v2048_e32__v2048_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v16384_e32__v16384_e32__v16384_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v8_e8__v8_e8__v8_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v8192_e16__v8192_e16__v8192_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimAdd_v256_e8__v256_e8__v256_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[else (error "Unable to get name  for pimAdd_v16384_e8__v16384_e8__v16384_e8")]
)

	]
	[(pimSub_v256_e16__v256_e16__v256_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8)
		(cond 
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v256_e16__v256_e16__v256_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v64_e16__v64_e16__v64_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v32_e16__v32_e16__v32_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v64_e8__v64_e8__v64_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v4096_e32__v4096_e32__v4096_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v2048_e8__v2048_e8__v2048_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v16384_e8__v16384_e8__v16384_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v128_e32__v128_e32__v128_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v16384_e32__v16384_e32__v16384_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v1024_e32__v1024_e32__v1024_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v32_e8__v32_e8__v32_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v8_e16__v8_e16__v8_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v512_e8__v512_e8__v512_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v256_e32__v256_e32__v256_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v16_e16__v16_e16__v16_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v512_e16__v512_e16__v512_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v4096_e8__v4096_e8__v4096_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v64_e32__v64_e32__v64_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v8192_e8__v8192_e8__v8192_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v16384_e16__v16384_e16__v16384_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v256_e8__v256_e8__v256_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v8192_e32__v8192_e32__v8192_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v32_e32__v32_e32__v32_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v16_e8__v16_e8__v16_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v4096_e16__v4096_e16__v4096_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v2048_e16__v2048_e16__v2048_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v2048_e32__v2048_e32__v2048_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v8_e32__v8_e32__v8_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v8_e8__v8_e8__v8_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v1024_e16__v1024_e16__v1024_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v512_e32__v512_e32__v512_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v1024_e8__v1024_e8__v1024_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v16_e32__v16_e32__v16_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v128_e16__v128_e16__v128_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v8192_e16__v8192_e16__v8192_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 -1) (equal? num_8 0)) 
   (append (list  "pimSub_v128_e8__v128_e8__v128_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[else (error "Unable to get name  for pimSub_v256_e16__v256_e16__v256_e16")]
)

	]
	[(pimMul_v16_e8__v16_e8__v16_e8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v16_e8__v16_e8__v16_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v512_e16__v512_e16__v512_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v1024_e8__v1024_e8__v1024_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v1024_e16__v1024_e16__v1024_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v2048_e8__v2048_e8__v2048_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v128_e8__v128_e8__v128_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v8_e32__v8_e32__v8_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v32_e16__v32_e16__v32_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v4096_e32__v4096_e32__v4096_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v128_e32__v128_e32__v128_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v4096_e16__v4096_e16__v4096_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v16384_e8__v16384_e8__v16384_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v32_e8__v32_e8__v32_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v8_e8__v8_e8__v8_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v64_e8__v64_e8__v64_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v8192_e8__v8192_e8__v8192_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v64_e32__v64_e32__v64_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v16384_e32__v16384_e32__v16384_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v8192_e32__v8192_e32__v8192_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v4096_e8__v4096_e8__v4096_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v8192_e16__v8192_e16__v8192_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v32_e32__v32_e32__v32_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v8_e16__v8_e16__v8_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v16384_e16__v16384_e16__v16384_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v2048_e32__v2048_e32__v2048_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v512_e32__v512_e32__v512_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v512_e8__v512_e8__v512_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v128_e16__v128_e16__v128_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v1024_e32__v1024_e32__v1024_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v16_e32__v16_e32__v16_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 1) (equal? num_8 16) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v256_e8__v256_e8__v256_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v2048_e16__v2048_e16__v2048_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v256_e16__v256_e16__v256_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v64_e16__v64_e16__v64_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 1) (equal? num_8 64) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v256_e32__v256_e32__v256_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 1) (equal? num_8 32) (equal? num_9 1) (equal? num_10 0)) 
   (append (list  "pimMul_v16_e16__v16_e16__v16_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[else (error "Unable to get name  for pimMul_v16_e8__v16_e8__v16_e8")]
)

	]
	[(pimXor_v8_e16__v8_e16__v8_e16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimXor_v8_e16__v8_e16__v8_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimXor_v8_e8__v8_e8__v8_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimXor_v8192_e32__v8192_e32__v8192_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimXor_v16_e16__v16_e16__v16_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimXor_v2048_e32__v2048_e32__v2048_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimXor_v1024_e16__v1024_e16__v1024_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimXor_v32_e8__v32_e8__v32_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimXor_v256_e8__v256_e8__v256_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimXor_v128_e8__v128_e8__v128_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimXor_v16_e32__v16_e32__v16_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimXor_v512_e16__v512_e16__v512_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimXor_v32_e32__v32_e32__v32_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimXor_v4096_e16__v4096_e16__v4096_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 262144) (equal? num_3 262144) (equal? num_4 0) (equal? num_5 262144) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimXor_v16384_e16__v16384_e16__v16384_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 65536) (equal? num_3 65536) (equal? num_4 0) (equal? num_5 65536) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimXor_v8192_e8__v8192_e8__v8192_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 256) (equal? num_3 256) (equal? num_4 0) (equal? num_5 256) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimXor_v8_e32__v8_e32__v8_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimXor_v4096_e32__v4096_e32__v4096_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimXor_v16384_e8__v16384_e8__v16384_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimXor_v512_e8__v512_e8__v512_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 131072) (equal? num_3 131072) (equal? num_4 0) (equal? num_5 131072) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimXor_v8192_e16__v8192_e16__v8192_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimXor_v512_e32__v512_e32__v512_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimXor_v256_e32__v256_e32__v256_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimXor_v128_e16__v128_e16__v128_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 2048) (equal? num_3 2048) (equal? num_4 0) (equal? num_5 2048) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimXor_v64_e32__v64_e32__v64_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimXor_v1024_e32__v1024_e32__v1024_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimXor_v32_e16__v32_e16__v32_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimXor_v16_e8__v16_e8__v16_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimXor_v4096_e8__v4096_e8__v4096_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 16384) (equal? num_3 16384) (equal? num_4 0) (equal? num_5 16384) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimXor_v2048_e8__v2048_e8__v2048_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 32768) (equal? num_3 32768) (equal? num_4 0) (equal? num_5 32768) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimXor_v2048_e16__v2048_e16__v2048_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 512) (equal? num_3 512) (equal? num_4 0) (equal? num_5 512) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimXor_v64_e8__v64_e8__v64_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 1024) (equal? num_3 1024) (equal? num_4 0) (equal? num_5 1024) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimXor_v64_e16__v64_e16__v64_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimXor_v128_e32__v128_e32__v128_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 524288) (equal? num_3 524288) (equal? num_4 0) (equal? num_5 524288) (equal? prec_i_o 32) (equal? num_7 0)) 
   (append (list  "pimXor_v16384_e32__v16384_e32__v16384_e32") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 8192) (equal? num_3 8192) (equal? num_4 0) (equal? num_5 8192) (equal? prec_i_o 8) (equal? num_7 0)) 
   (append (list  "pimXor_v1024_e8__v1024_e8__v1024_e8") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[(and  (equal? size_i_o 4098) (equal? num_3 4098) (equal? num_4 0) (equal? num_5 4096) (equal? prec_i_o 16) (equal? num_7 0)) 
   (append (list  "pimXor_v256_e16__v256_e16__v256_e16") (bitsimd:get-target-name v0) (bitsimd:get-target-name v1))]
		[else (error "Unable to get name  for pimXor_v8_e16__v8_e16__v8_e16")]
)

	]
 )
)
;; ================================================================================

