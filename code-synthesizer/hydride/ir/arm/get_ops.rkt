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
(require hydride/ir/arm/definition)


(provide (all-defined-out))
;; ================================================================================
;;                                DSL Get Ops
;; ================================================================================
(define (arm:get-bv-ops prog)
 (destruct prog
	[(reg id) '()]
	[(lit v) '()]
		[(vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 num_5 num_6 num_7 num_8)
		(remove-duplicates (append (list  'if) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))
	]
		[(interleave-vectors_dsl v0 v1 size_i_o prec_i_o)
		(remove-duplicates (append (list  ) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))
	]
		[(interleave-vector_dsl v0 size_i_o prec_i_o)
		(remove-duplicates (append (list  'cond) (arm:get-bv-ops v0)))
	]
		[(deinterleave-vector_dsl v0 size_i_o prec_i_o)
		(remove-duplicates (append (list  'cond) (arm:get-bv-ops v0)))
	]
		[(llvm_shuffle_vectors_dsl v0 v1 num_2 prec_i_o v4 num_5)
		(remove-duplicates (append (list  'if) (arm:get-bv-ops v0) (arm:get-bv-ops v1) (arm:get-bv-ops v4)))
	]
	[(vpmin_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(cond 
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)); vpmin_u16
 
  (remove-duplicates (append (list  'bvumin 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)); vpminq_u16
 
  (remove-duplicates (append (list  'bvumin 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)); vpmin_s8
 
  (remove-duplicates (append (list  'bvsmin 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)); vpminq_u8
 
  (remove-duplicates (append (list  'bvumin 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)); vpminq_u32
 
  (remove-duplicates (append (list  'bvumin 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)); vpminq_s16
 
  (remove-duplicates (append (list  'bvsmin 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)); vpminq_s32
 
  (remove-duplicates (append (list  'bvsmin 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)); vpmin_u32
 
  (remove-duplicates (append (list  'bvumin 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)); vpminq_s8
 
  (remove-duplicates (append (list  'bvsmin 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)); vpmin_s16
 
  (remove-duplicates (append (list  'bvsmin 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)); vpmin_u8
 
  (remove-duplicates (append (list  'bvumin 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)); vpmin_s32
 
  (remove-duplicates (append (list  'bvsmin 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[else (error "Unable to get ops  for vpmin_u16")]
)

	]
	[(vpmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_o num_7 num_8 num_9 num_10 num_11 num_12 num_13 num_14 prec_i num_16)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)); vpmaxq_u16
 
  (remove-duplicates (append (list  'bvumax 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)); vpmax_u32
 
  (remove-duplicates (append (list  'bvumax 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)); vpmax_s16
 
  (remove-duplicates (append (list  'bvsmax 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 0) (equal? prec_i 32) (equal? num_16 2)); vpmaxq_u32
 
  (remove-duplicates (append (list  'bvumax 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)); vpmax_s8
 
  (remove-duplicates (append (list  'bvsmax 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)); vpmaxq_u8
 
  (remove-duplicates (append (list  'bvumax 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)); vpmaxq_s32
 
  (remove-duplicates (append (list  'bvsmax 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 0) (equal? prec_i 16) (equal? num_16 2)); vpmax_u16
 
  (remove-duplicates (append (list  'bvumax 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 1) (equal? prec_i 8) (equal? num_16 2)); vpmaxq_s8
 
  (remove-duplicates (append (list  'bvsmax 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 8) (equal? num_11 8) (equal? num_12 1) (equal? num_13 4) (equal? num_14 0) (equal? prec_i 8) (equal? num_16 2)); vpmax_u8
 
  (remove-duplicates (append (list  'bvumax 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 16) (equal? num_11 16) (equal? num_12 1) (equal? num_13 8) (equal? num_14 1) (equal? prec_i 16) (equal? num_16 2)); vpmaxq_s16
 
  (remove-duplicates (append (list  'bvsmax 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 32) (equal? num_11 32) (equal? num_12 1) (equal? num_13 16) (equal? num_14 1) (equal? prec_i 32) (equal? num_16 2)); vpmax_s32
 
  (remove-duplicates (append (list  'bvsmax 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[else (error "Unable to get ops  for vpmaxq_u16")]
)

	]
	[(vmaxq_u16_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmaxq_u16
 
  (remove-duplicates (append (list  'bvumax 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmaxq_s16
 
  (remove-duplicates (append (list  'bvsmax 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmax_u32
 
  (remove-duplicates (append (list  'bvumax 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmax_s16
 
  (remove-duplicates (append (list  'bvsmax 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmax_u16
 
  (remove-duplicates (append (list  'bvumax 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmax_u8
 
  (remove-duplicates (append (list  'bvumax 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmaxq_u8
 
  (remove-duplicates (append (list  'bvumax 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmaxq_s8
 
  (remove-duplicates (append (list  'bvsmax 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmaxq_u32
 
  (remove-duplicates (append (list  'bvumax 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmaxq_s32
 
  (remove-duplicates (append (list  'bvsmax 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmax_s32
 
  (remove-duplicates (append (list  'bvsmax 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmax_s8
 
  (remove-duplicates (append (list  'bvsmax 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[else (error "Unable to get ops  for vmaxq_u16")]
)

	]
	[(vminq_s8_dsl v0 v1 size_i_o num_3 num_4 num_5 prec_i_o num_7 num_8 num_9 num_10)
		(cond 
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vminq_s8
 
  (remove-duplicates (append (list  'bvsmin 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmin_s8
 
  (remove-duplicates (append (list  'bvsmin 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmin_u16
 
  (remove-duplicates (append (list  'bvumin 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmin_s32
 
  (remove-duplicates (append (list  'bvsmin 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vminq_u32
 
  (remove-duplicates (append (list  'bvumin 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vminq_u16
 
  (remove-duplicates (append (list  'bvumin 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmin_u32
 
  (remove-duplicates (append (list  'bvumin 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vmin_s16
 
  (remove-duplicates (append (list  'bvsmin 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 32) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vminq_s32
 
  (remove-duplicates (append (list  'bvsmin 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 64) (equal? num_3 64) (equal? num_4 0) (equal? num_5 64) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vmin_u8
 
  (remove-duplicates (append (list  'bvumin 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 16) (equal? num_7 0) (equal? num_8 1) (equal? num_9 1) (equal? num_10 1)); vminq_s16
 
  (remove-duplicates (append (list  'bvsmin 'sign-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[(and  (equal? size_i_o 128) (equal? num_3 128) (equal? num_4 0) (equal? num_5 128) (equal? prec_i_o 8) (equal? num_7 0) (equal? num_8 0) (equal? num_9 0) (equal? num_10 0)); vminq_u8
 
  (remove-duplicates (append (list  'bvumin 'zero-extend) (arm:get-bv-ops v0) (arm:get-bv-ops v1)))]
		[else (error "Unable to get ops  for vminq_s8")]
)

	]
 )
)
;; ================================================================================

