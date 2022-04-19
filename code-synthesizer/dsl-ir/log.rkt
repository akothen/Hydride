#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)


(current-solver (boolector))
(current-bitwidth 16)


(custodian-limit-memory (current-custodian) (* 10000 1024 1024))

;; Some uility functions
(define (ext-bv x i type-size)
  (define var (extract (+ (* i type-size) (- type-size 1)) (* i type-size) x))
  var)

(define (sign-ext-bv x i type-size target-size)
  (define var (sign-extend (ext-bv x i type-size) (bitvector target-size)))
  var)

(define (zero-ext-bv x i type-size target-size)
  (define var (zero-extend (ext-bv x i type-size) (bitvector target-size)))
  var)

(define (no-op a) a)

(custodian-limit-memory (current-custodian) (* 10000 1024 1024))



(define (swizzle idx group_size dis_size rot_factor)
  (define (rotate rot_fact n i)
      ;; Note that Rosette's notation of indexing bitvectors is from right to left
     (modulo (- i rot_fact) n)
  )
  (define (displace dis_factor n i)
       (modulo (+ (* i dis_factor) (floor (/ i (/ n (gcd dis_factor n))))) n)
  )
  (define (group gs group_idx i)
      (+ (* (floor (/ i gs)) gs) group_idx)
  )
  (define result (group group_size (rotate rot_factor group_size (displace dis_size group_size (modulo idx group_size))) idx))

  result
 )


;; General version of swizzle with single input vector
(define (vector-single-input-swizzle v num_elems type_size group_size dis_size rot_factor)
(define result
       (apply
        concat
        (for/list ([i (reverse (range num_elems))])
          (define swizzled-index (swizzle (- (- num_elems 1) i) group_size dis_size rot_factor))
          (ext-bv v (- (- num_elems 1) swizzled-index) type_size)
         )
        )
    )
    result
)

;; General version of swizzle with two input vectors
(define (vector-two-input-swizzle v1 v2 num_elems type_size lane_offset lane_size group_size dis_size rot_factor)
  (define high_lane_offset (+ group_size lane_offset))
  (define result
    (apply
     concat
     (for/list ([i (range 0 num_elems lane_size)])
        (apply
          concat
          (for/list ([j (range lane_offset (* 2 high_lane_offset))])
            (define raw-index (- j lane_offset))
            (define swizzled-index (swizzle raw-index (* 2 group_size) dis_size rot_factor))
            (if (< swizzled-index group_size)
             (begin
              (define adjusted-swizzled-index (- (- num_elems  1) (+ i lane_offset swizzled-index)))
              (ext-bv v1 adjusted-swizzled-index type_size)
             )
             (begin
              (define adjusted-swizzled-index (- (- num_elems  1) (- (+ i lane_offset swizzled-index) group_size)))
              (ext-bv v2 adjusted-swizzled-index type_size)
             )
            )
          )
        )
      )
     )
    )
  result
)

(define (bvumaxval bitwidth)
  (apply 
  concat
    (for/list ([idx (range 0 bitwidth)])
      (bv #b1 1)
    )
  )
)

(define (bvsmaxval bitwidth)
  (define end (- bitwidth 1))
  (define res
  (apply 
  concat
    (for/list ([idx (range 0 end)])
      (bv #b1 1)
    )
  )
  )
  (concat (bv #b0 1) res)
)

(define (bvuminval bitwidth)
  (apply 
  concat
    (for/list ([idx (range 0 bitwidth)])
      (bv #b0 1)
    )
  )
)

(define (bvsminval bitwidth)
  (define end (- bitwidth 1))
  (define res
  (apply 
  concat
    (for/list ([idx (range 0 end)])
      (bv #b0 1)
    )
  )
  )
  (concat (bv #b1 1) res)
)

(define (bvssat vect bitwidth sat_size)
  (if (> bitwidth sat_size)
  (begin
    (cond
    [(bvslt vect (bvsminval bitwidth)) (bvsminval sat_size)]
    [(bvsgt vect (bvsmaxval bitwidth)) (bvsmaxval bitwidth)]
    [else (extract (- sat_size 1) 0 vect)])
  )
  (begin
   vect
  )
 )
 ;;(bvsmin (bvsmax vect (bvsminval bitwidth)) (bvsmaxval bitwidth))
)

(define (bvusat vect bitwidth sat_size)
  (if (bvugt vect (bvumaxval bitwidth)) 
    (begin
      (bvumaxval bitwidth)
    )
    (begin
      (extract (- sat_size 1) 0 vect)
    )
  )
  ;;(bvumin (bvumax vect (bvuminval bitwidth)) (bvumaxval bitwidth))
)

(define (bvaddnsw a b bitwidth)
  (define zerobv (bv 0 (bitvector bitwidth)))
  (define result
  (cond
    [(and (bvsgt a zerobv) (bvsgt b zerobv) 
          (bvsgt a (bvsub (bvsmaxval bitwidth) b))) 
          (bvsmaxval bitwidth)]
    [(and (bvslt a zerobv) (bvslt b zerobv) 
          (bvslt a (bvsub (bvsminval bitwidth) b))) 
          (bvsmaxval bitwidth)]
    [else (bvadd a b)]
  )
  )
  result
)

(define (bvaddnuw a b bitwidth)
  (define result 
  (if (bvugt a (bvsub (bvumaxval bitwidth) b))
    (begin 
      (bvumaxval bitwidth)
    )
    (begin
      (bvadd a b)
    )
  )
  )
  result
)

(define (bvsubnsw a b bitwidth)
  (define zerobv (bv 0 (bitvector bitwidth)))
  (define result
  (cond
    [(and (bvsgt a zerobv) (bvsgt (bvneg b) zerobv) 
          (bvsgt a (bvsub (bvsmaxval bitwidth) (bvneg b)))) 
          (bvsmaxval bitwidth)]
    [(and (bvslt a zerobv) (bvslt (bvneg b) zerobv) 
          (bvslt a (bvsub (bvsminval bitwidth) (bvneg b)))) 
          (bvsmaxval bitwidth)]
    [else (bvsub a b)]
  )
  )
  result
)

(define (bvsubnuw a b bitwidth)
  (define result 
  (if (bvugt a (bvsub (bvumaxval bitwidth) (bvneg b)))
    (begin 
      (bvumaxval bitwidth)
    )
    (begin
      (bvsub a b)
    )
  )
  )
  result
)

(define (bvmulnsw a b bitwidth)
  (define minusonebv (bv -1 (bitvector bitwidth)))
  (define result
  (cond
    [(and (bveq a minusonebv) (bveq b (bvsminval bitwidth)))
          (bvsmaxval bitwidth)]
      [(and (bveq b minusonebv) (bveq a (bvsminval bitwidth)))
          (bvsmaxval bitwidth)]
    [(and (bvsgt a (bvsdiv (bvsmaxval bitwidth) b))) 
          (bvsmaxval bitwidth)]
    [(and (bvslt a (bvsdiv (bvsminval bitwidth) b)))
          (bvsmaxval bitwidth)]
    [else (bvmul a b)]
  )
  )
  result
)

(define (bvmulnuw a b bitwidth)
  (define result 
  (if (bvugt a (bvudiv (bvumaxval bitwidth) b))
    (begin
      (bvumaxval bitwidth)
    )
    (begin
      (bvmul a b)
    )
  )
  )
  result
)

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

;; ================================================================================
;;                                DSL Semantics
;; ================================================================================

(define (scalar-load mem mem_size index type_size)
(define total_num_elems (/ mem_size type_size))
(define result
(ext-bv mem (- (- total_num_elems  1) index) type_size))
result
)
(define (vector-load mem mem_size start num_elems type_size)
(define result
(apply
  concat
(for/list ([i (range num_elems)])
(scalar-load mem mem_size (+ i start) type_size))
))
result
)
(define (_mm512_mask_testn_epi64_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 %arg4 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg4))
   (define %lastidx0 (-  %arg4  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvand  %3  %5))
   (define %7 (bveq  %6  %arg3))
   (define %8 (if (equal? %7 #t) %arg1 %arg2))
   %8
   )
   (begin
   (define %9 (extract  j0 j0 %arg0))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm512_maskz_mulhi_epu16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %3 (+  j0.new  %lastidx0))
   (define %4 (extract  %3 j0.new a))
   (define %6 (extract  %3 j0.new b))
   (define %7 (zero-extend  %4 (bitvector %arg2)))
   (define %8 (zero-extend  %6 (bitvector %arg2)))
   (define %9 (bvmul  %7  %8))
   (define %lastidx1 (-  %elemsize  1))
   (define %highidx0 (+  %lastidx1  %arg1))
   (define %10 (extract  (- (- %arg2 1) %arg1) (- (- %arg2 1) %highidx0) %9))
   %10
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %13 (+  j0.new  %lastidx2))
   (define %14 (extract  %13 j0.new %arg0))
   %14
   )
  )
 )
 )
)
)
)

(define (_mm_cmpge_epi16_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvsge  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm512_mask_cmpge_epu8_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvuge  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm512_dpbusd_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define %11.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1.new0 (+  j0.new  iterator.0.new))
  (define %lastidx2 (-  %elemsize  1))
  (define %2 (+  %1.new0  %lastidx2))
  (define %3 (extract  %2 %1.new0 a))
  (define %4 (zero-extend  %3 (bitvector %arg0)))
  (define %8 (extract  %2 %1.new0 b))
  (define %9 (sign-extend  %8 (bitvector %arg0)))
  (define %10 (bvmul  %4  %9))
  (define %11 (sign-extend  %10 (bitvector %lanesize1)))
  %11
 )
))
 (define %lastidx1 (-  %lanesize1  1))
 (define %62.clone.4 (+  j0.new  %lastidx1))
 (define %11.ext0 (extract  %62.clone.4 j0.new dst))
 (define %11.acc0 (bvadd %11.red %11.ext0))
 %11.acc0
)
)
)

(define (_mm512_maskz_broadcast_i64x2  %arg0 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %3 (extract  j0.new.div j0.new.div k))
  (if (equal? %3 (bv #b1 1))
   (begin
   (define j0.new.div.copy.3 (/  j0.new  %elemsize))
   (define %1.copy.0 (modulo  j0.new.div.copy.3  %arg1))
   (define %2.copy.0 (*  %1.copy.0  %elemsize))
   (define %lastidx1 (-  %elemsize  1))
   (define %5 (+  %2.copy.0  %lastidx1))
   (define %6 (extract  %5 %2.copy.0 a))
   %6
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %9 (+  j0.new  %lastidx2))
   (define %10 (extract  %9 j0.new %arg0))
   %10
   )
  )
 )
 )
)
)
)

(define (_mm256_blend_epi16  a b imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (modulo  j0.new.div  %arg0))
  (define %2 (extract  %1 %1 imm8))
  (if (equal? %2 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %4 (+  j0.new  %lastidx0))
   (define %5 (extract  %4 j0.new b))
   %5
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %8 (+  j0.new  %lastidx1))
   (define %9 (extract  %8 j0.new a))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm_maddubs_pi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %factor0 (/  %arg0  %elemsize))
  (define %0.new0 (*  j0.new  %factor0))
  (define %1 (+  %0.new0  %arg1))
  (define %lastidx0 (-  %arg0  1))
  (define %2 (+  %0.new0  %lastidx0))
  (define %3 (extract  %2 %1 a))
  (define %6 (extract  %2 %1 b))
  (define %7 (zero-extend  %3 (bitvector %arg0)))
  (define %8 (sign-extend  %6 (bitvector %arg0)))
  (define %9 (bvmul  %7  %8))
  (define %lastidx1 (-  %elemsize  1))
  (define %10 (+  %0.new0  %lastidx1))
  (define %11 (extract  %10 %0.new0 a))
  (define %13 (extract  %10 %0.new0 b))
  (define %14 (zero-extend  %11 (bitvector %arg0)))
  (define %15 (sign-extend  %13 (bitvector %arg0)))
  (define %16 (bvmul  %14  %15))
  (define %17 (bvaddnsw  %9  %16 %arg0))
  %17
 )
 )
)
)
)

(define (_mm256_mask_min_epi16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvsmin  %3  %5))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %9 (+  j0.new  %lastidx1))
   (define %10 (extract  %9 j0.new src))
   %10
   )
  )
 )
 )
)
)
)

(define (_mm256_avg_epu16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %2 (+  j0.new  %lastidx0))
  (define %3 (extract  %2 j0.new a))
  (define %5 (extract  %2 j0.new b))
  (define %6 (bvadd  %3  %5))
  (define %7 (bvadd  %6  %arg1))
  (define %8 (bvashr  %7  %arg0))
  %8
 )
 )
)
)
)

(define (_mm256_mask_cmpgt_epi16_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvsgt  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm512_maskz_dpbusd_epi32  %arg0 k src a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg1 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define j0.new.div (/  j0.new  %lanesize1))
 (define %0 (extract  j0.new.div j0.new.div k))
 (if (equal? %0 (bv #b1 1))
  (begin
  (define %12.red
(apply
  bvadd
  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %2.new0 (+  j0.new  iterator.0.new))
   (define %lastidx2 (-  %elemsize  1))
   (define %3 (+  %2.new0  %lastidx2))
   (define %4 (extract  %3 %2.new0 a))
   (define %5 (zero-extend  %4 (bitvector %arg1)))
   (define %9 (extract  %3 %2.new0 b))
   (define %10 (sign-extend  %9 (bitvector %arg1)))
   (define %11 (bvmul  %5  %10))
   (define %12 (sign-extend  %11 (bitvector %lanesize1)))
   %12
  )
))
  (define %lastidx1 (-  %lanesize1  1))
  (define %63.clone.4 (+  j0.new  %lastidx1))
  (define %12.ext0 (extract  %63.clone.4 j0.new dst))
  (define %12.acc0 (bvadd %12.red %12.ext0))
  %12.acc0
  )
  (begin
  (apply
  concat
  (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %lastidx3 (-  %lanesize1  1))
   (define %65 (+  j0.new  %lastidx3))
   (define %66 (extract  %65 j0.new %arg0))
   %66
  )
  )
  )
 )
)
)
)

(define (_mm512_mask_cvtsepi32_epi16  src k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %2 (extract  j0.new.div j0.new.div k))
  (if (equal? %2 (bv #b1 1))
   (begin
   (define %factor0 (/  %arg0  %elemsize))
   (define %0.copy.0.new0 (*  j0.new  %factor0))
   (define %lastidx1 (-  %arg0  1))
   (define %3 (+  %0.copy.0.new0  %lastidx1))
   (define %4 (extract  %3 %0.copy.0.new0 a))
   (define %5 (bvssat %4 %arg0 %elemsize ))
   %5
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %8 (+  j0.new  %lastidx2))
   (define %9 (extract  %8 j0.new src))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm_mul_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %factor0 (/  %arg0  %elemsize))
  (define %0.new0 (*  j0.new  %factor0))
  (define %lastidx1 (-  %elemsize  1))
  (define %2 (+  %0.new0  %lastidx1))
  (define %3 (extract  %2 %0.new0 a))
  (define %4 (sign-extend  %3 (bitvector %arg0)))
  (define %6 (extract  %2 %0.new0 b))
  (define %7 (sign-extend  %6 (bitvector %arg0)))
  (define %8 (bvmul  %4  %7))
  %8
 )
 )
)
)
)

(define (_mm_maskz_sub_epi16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %5 (+  j0.new  %lastidx0))
   (define %6 (extract  %5 j0.new a))
   (define %8 (extract  %5 j0.new b))
   (define %9 (bvsub  %6  %8))
   %9
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx1))
   (define %13 (extract  %12 j0.new %arg0))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm512_mask_div_epu32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (zero-extend  %3 (bitvector %arg0)))
   (define %7 (zero-extend  %5 (bitvector %arg0)))
   (define %8 (bvudiv  %6  %7))
   (define %9.high.idx (- %arg0 1))
   (define %9.low.idx (- %9.high.idx %elemsize -1 ))
   (define %9 (extract  %9.high.idx %9.low.idx %8))
   %9
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx1))
   (define %13 (extract  %12 j0.new src))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm512_sub_epi8  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %4 (+  j0.new  %lastidx0))
  (define %5 (extract  %4 j0.new a))
  (define %7 (extract  %4 j0.new b))
  (define %8 (bvsub  %5  %7))
  %8
 )
 )
)
)
)

(define (_mm512_madd52hi_epu64  a b c %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %0 (*  j0.new.div  %arg0))
  (define %lastidx2 (-  %elemsize  1))
  (define %1 (+  %0  %lastidx2))
  (define %2 (extract  %1 %0 b))
  (define %5 (extract  %1 %0 c))
  (define %7 (zero-extend  %2 (bitvector %arg3)))
  (define %8 (zero-extend  %5 (bitvector %arg3)))
  (define %9 (bvmul  %7  %8))
  (define %lastidx0 (-  %arg0  1))
  (define %12 (+  %0  %lastidx0))
  (define %13 (extract  %12 %0 a))
  (define %lastidx1 (-  %arg1  1))
  (define %highidx0 (+  %lastidx1  %arg2))
  (define %14 (extract  (- (- %arg3 1) %arg2) (- (- %arg3 1) %highidx0) %9))
  (define %15 (zero-extend  %14 (bitvector %arg0)))
  (define %16 (bvadd  %13  %15))
  %16
 )
 )
)
)
)

(define (_mm256_cvtepi64_epi8  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %factor0 (/  %arg0  %elemsize))
  (define %0.new0 (*  j0.new  %factor0))
  (define %lastidx1 (-  %arg0  1))
  (define %2 (+  %0.new0  %lastidx1))
  (define %3 (extract  %2 %0.new0 a))
  (define %4.high.idx (- %arg0 1))
  (define %4.low.idx (- %4.high.idx %elemsize -1 ))
  (define %4 (extract  %4.high.idx %4.low.idx %3))
  %4
 )
 )
)
)
)

(define (_mm512_mullo_epi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %3 (sign-extend  %2 (bitvector %arg1)))
  (define %5 (extract  %1 j0.new b))
  (define %6 (sign-extend  %5 (bitvector %arg1)))
  (define %7 (bvmul  %3  %6))
  (define %lastidx1 (-  %elemsize  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %8 (extract  (- (- %arg1 1) %arg0) (- (- %arg1 1) %highidx0) %7))
  %8
 )
 )
)
)
)

(define (_mm256_mask_cmpneq_epu32_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (not (bveq  %3  %5 )))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm512_mask_reduce_add_epi64  %arg0 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (define %offset0 (+  %arg1  %elemsize))
 (define %lastidx0 (-  %offset0  1))
 (define %7 (extract  %lastidx0 %arg1 %arg0))
 (define dst %7)
 (define %5.red
(apply
 bvadd
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx3 (-  %elemsize  1))
   (define %4 (+  j0.new  %lastidx3))
   (define %5 (extract  %4 j0.new a))
   %5
   )
   (begin
   (define %offset2 (+  %arg1  %elemsize))
   (define %lastidx2 (-  %offset2  1))
   (define %8 (extract  %lastidx2 %arg1 %arg0))
   %8
   )
  )
 )
))
 (define %offset1 (+  %arg1  %elemsize))
 (define %lastidx1 (-  %offset1  1))
 (define %3 (extract  %lastidx1 %arg1 dst))
 (define %6 (bvadd %5.red %3))
 %6
)
)
)

(define (_mm512_subr_epi32  v2 v3 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %4 (+  j0.new  %lastidx0))
  (define %5 (extract  %4 j0.new v3))
  (define %7 (extract  %4 j0.new v2))
  (define %8 (bvsub  %5  %7))
  %8
 )
 )
)
)
)

(define (_mm256_subs_epu8  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvsubnuw  %2  %4 %elemsize))
  %5
 )
 )
)
)
)

(define (_mm512_abs_epi64  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %3 (integer->bitvector (abs (bitvector->integer %2)) (bitvector %elemsize)))
  %3
 )
 )
)
)
)

(define (_mm_urem_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvsrem  %2  %4))
  %5
 )
 )
)
)
)

(define (_mm512_mask_cmple_epi32_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvsle  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm_cmpeq_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %2 (+  j0.new  %lastidx0))
  (define %3 (extract  %2 j0.new a))
  (define %5 (extract  %2 j0.new b))
  (define %6 (bveq  %3  %5))
  (define %7 (if (equal? %6 #t) %arg0 %arg1))
  %7
 )
 )
)
)
)

(define (_mm_maskz_adds_epu16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvaddnuw  %3  %5 %elemsize))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %10 (+  j0.new  %lastidx1))
   (define %11 (extract  %10 j0.new %arg0))
   %11
   )
  )
 )
 )
)
)
)

(define (_mm_maskz_dpbusds_epi32  %arg0 k src a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg1 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define j0.new.div (/  j0.new  %lanesize1))
 (define %0 (extract  j0.new.div j0.new.div k))
 (if (equal? %0 (bv #b1 1))
  (begin
  (define %12.red
(apply
  bvadd
  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %2.new0 (+  j0.new  iterator.0.new))
   (define %lastidx2 (-  %elemsize  1))
   (define %3 (+  %2.new0  %lastidx2))
   (define %4 (extract  %3 %2.new0 a))
   (define %5 (zero-extend  %4 (bitvector %arg1)))
   (define %9 (extract  %3 %2.new0 b))
   (define %10 (sign-extend  %9 (bitvector %arg1)))
   (define %11 (bvmul  %5  %10))
   (define %12 (sign-extend  %11 (bitvector %lanesize1)))
   %12
  )
))
  (define %lastidx1 (-  %lanesize1  1))
  (define %64.clone.4 (+  j0.new  %lastidx1))
  (define %12.ext0 (extract  %64.clone.4 j0.new dst))
  (define %12.acc0 (bvaddnsw %12.red %12.ext0 %lanesize1))
  %12.acc0
  )
  (begin
  (apply
  concat
  (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %lastidx3 (-  %lanesize1  1))
   (define %66 (+  j0.new  %lastidx3))
   (define %67 (extract  %66 j0.new %arg0))
   %67
  )
  )
  )
 )
)
)
)

(define (_mm256_maskz_andnot_epi32  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %3 (+  j0.new  %lastidx0))
   (define %4 (extract  %3 j0.new a))
   (define %5 (bvnot  %4))
   (define %7 (extract  %3 j0.new b))
   (define %8 (bvand  %5  %7))
   %8
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %11 (+  j0.new  %lastidx1))
   (define %12 (extract  %11 j0.new %arg0))
   %12
   )
  )
 )
 )
)
)
)

(define (_mm256_maskz_cvtepu32_epi64  %arg0 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %2 (extract  j0.new.div j0.new.div k))
  (if (equal? %2 (bv #b1 1))
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %3 (+  j0.new  %lastidx1))
   (define %4 (extract  %3 j0.new a))
   (define %5 (zero-extend  %4 (bitvector %arg1)))
   %5
   )
   (begin
   (define %factor1 (/  %arg1  %elemsize))
   (define %0.copy.2.new0 (*  j0.new  %factor1))
   (define %lastidx2 (-  %arg1  1))
   (define %8 (+  %0.copy.2.new0  %lastidx2))
   (define %9 (extract  %8 %0.copy.2.new0 %arg0))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm256_mask_xor_epi64  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %5 (+  j0.new  %lastidx0))
   (define %6 (extract  %5 j0.new a))
   (define %8 (extract  %5 j0.new b))
   (define %9 (bvxor  %6  %8))
   %9
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx1))
   (define %13 (extract  %12 j0.new src))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm512_mask_rem_epu32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvsrem  %3  %5))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %9 (+  j0.new  %lastidx1))
   (define %10 (extract  %9 j0.new src))
   %10
   )
  )
 )
 )
)
)
)

(define (_mm_mask_cvtepi32_epi64  src k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %2 (extract  j0.new.div j0.new.div k))
  (if (equal? %2 (bv #b1 1))
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %3 (+  j0.new  %lastidx1))
   (define %4 (extract  %3 j0.new a))
   (define %5 (sign-extend  %4 (bitvector %arg0)))
   %5
   )
   (begin
   (define %factor1 (/  %arg0  %elemsize))
   (define %0.copy.2.new0 (*  j0.new  %factor1))
   (define %lastidx2 (-  %arg0  1))
   (define %8 (+  %0.copy.2.new0  %lastidx2))
   (define %9 (extract  %8 %0.copy.2.new0 src))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm512_testn_epi32_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg3))
  (define %lastidx0 (-  %arg3  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvand  %2  %4))
  (define %6 (bveq  %5  %arg2))
  (define %7 (if (equal? %6 #t) %arg0 %arg1))
  %7
 )
 )
)
)
)

(define (_mm512_reduce_add_epi64  %arg0 a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (define %offset0 (+  %arg1  %elemsize))
 (define %lastidx0 (-  %offset0  1))
 (define %6 (extract  %lastidx0 %arg1 %arg0))
 (define dst %6)
 (define %4.red
(apply
 bvadd
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx2 (-  %elemsize  1))
  (define %3 (+  j0.new  %lastidx2))
  (define %4 (extract  %3 j0.new a))
  %4
 )
))
 (define %offset1 (+  %arg1  %elemsize))
 (define %lastidx1 (-  %offset1  1))
 (define %2 (extract  %lastidx1 %arg1 dst))
 (define %5 (bvadd %4.red %2))
 %5
)
)
)

(define (_mm256_blendv_epi8  a b mask %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 %1 mask))
  (if (equal? %2 (bv #b1 1))
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %4 (+  j0.new  %lastidx1))
   (define %5 (extract  %4 j0.new b))
   %5
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %8 (+  j0.new  %lastidx2))
   (define %9 (extract  %8 j0.new a))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm512_maskz_and_epi64  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %5 (+  j0.new  %lastidx0))
   (define %6 (extract  %5 j0.new a))
   (define %8 (extract  %5 j0.new b))
   (define %9 (bvand  %6  %8))
   %9
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx1))
   (define %13 (extract  %12 j0.new %arg0))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm_mask_cmplt_epi64_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvslt  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm_maskz_dpwssds_epi32  %arg0 k src a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define j0.new.div (/  j0.new  %lanesize1))
 (define %0 (extract  j0.new.div j0.new.div k))
 (if (equal? %0 (bv #b1 1))
  (begin
  (define %11.red
(apply
  bvadd
  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %2.new0 (+  j0.new  iterator.0.new))
   (define %lastidx2 (-  %elemsize  1))
   (define %3 (+  %2.new0  %lastidx2))
   (define %4 (extract  %3 %2.new0 a))
   (define %5 (sign-extend  %4 (bitvector %lanesize1)))
   (define %9 (extract  %3 %2.new0 b))
   (define %10 (sign-extend  %9 (bitvector %lanesize1)))
   (define %11 (bvmul  %5  %10))
   %11
  )
))
  (define %lastidx1 (-  %lanesize1  1))
  (define %32.clone.2 (+  j0.new  %lastidx1))
  (define %11.ext0 (extract  %32.clone.2 j0.new dst))
  (define %11.acc0 (bvaddnsw %11.red %11.ext0 %lanesize1))
  %11.acc0
  )
  (begin
  (apply
  concat
  (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %lastidx3 (-  %lanesize1  1))
   (define %34 (+  j0.new  %lastidx3))
   (define %35 (extract  %34 j0.new %arg0))
   %35
  )
  )
  )
 )
)
)
)

(define (_mm512_andnot_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %2 (+  j0.new  %lastidx0))
  (define %3 (extract  %2 j0.new a))
  (define %4 (bvnot  %3))
  (define %6 (extract  %2 j0.new b))
  (define %7 (bvand  %4  %6))
  %7
 )
 )
)
)
)

(define (_mm512_reduce_and_epi64  %arg0 a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (define %offset0 (+  %arg1  %elemsize))
 (define %lastidx0 (-  %offset0  1))
 (define %6 (extract  %lastidx0 %arg1 %arg0))
 (define dst %6)
 (define %4.red
(apply
 bvand
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx2 (-  %elemsize  1))
  (define %3 (+  j0.new  %lastidx2))
  (define %4 (extract  %3 j0.new a))
  %4
 )
))
 (define %offset1 (+  %arg1  %elemsize))
 (define %lastidx1 (-  %offset1  1))
 (define %2 (extract  %lastidx1 %arg1 dst))
 (define %5 (bvand %4.red %2))
 %5
)
)
)

(define (_m_paddw  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %4 (+  j0.new  %lastidx0))
  (define %5 (extract  %4 j0.new a))
  (define %7 (extract  %4 j0.new b))
  (define %8 (bvadd  %5  %7))
  %8
 )
 )
)
)
)

(define (_mm256_max_epi8  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvsmax  %2  %4))
  %5
 )
 )
)
)
)

(define (_mm256_mask_dpbusds_epi32  src k a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define j0.new.div (/  j0.new  %lanesize1))
 (define %0 (extract  j0.new.div j0.new.div k))
 (if (equal? %0 (bv #b1 1))
  (begin
  (define %12.red
(apply
  bvadd
  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %2.new0 (+  j0.new  iterator.0.new))
   (define %lastidx2 (-  %elemsize  1))
   (define %3 (+  %2.new0  %lastidx2))
   (define %4 (extract  %3 %2.new0 a))
   (define %5 (zero-extend  %4 (bitvector %arg0)))
   (define %9 (extract  %3 %2.new0 b))
   (define %10 (sign-extend  %9 (bitvector %arg0)))
   (define %11 (bvmul  %5  %10))
   (define %12 (sign-extend  %11 (bitvector %lanesize1)))
   %12
  )
))
  (define %lastidx1 (-  %lanesize1  1))
  (define %64.clone.4 (+  j0.new  %lastidx1))
  (define %12.ext0 (extract  %64.clone.4 j0.new dst))
  (define %12.acc0 (bvaddnsw %12.red %12.ext0 %lanesize1))
  %12.acc0
  )
  (begin
  (apply
  concat
  (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %lastidx3 (-  %lanesize1  1))
   (define %66 (+  j0.new  %lastidx3))
   (define %67 (extract  %66 j0.new src))
   %67
  )
  )
  )
 )
)
)
)

(define (_mm256_mask_madd52lo_epu64  a k b c %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define j0.new.div.copy.2 (/  j0.new  %elemsize))
   (define %0.copy.0 (*  j0.new.div.copy.2  %arg0))
   (define %lastidx2 (-  %elemsize  1))
   (define %2 (+  %0.copy.0  %lastidx2))
   (define %3 (extract  %2 %0.copy.0 b))
   (define %6 (extract  %2 %0.copy.0 c))
   (define %8 (zero-extend  %3 (bitvector %arg3)))
   (define %9 (zero-extend  %6 (bitvector %arg3)))
   (define %10 (bvmul  %8  %9))
   (define %lastidx0 (-  %arg0  1))
   (define %13 (+  %0.copy.0  %lastidx0))
   (define %14 (extract  %13 %0.copy.0 a))
   (define %lastidx1 (-  %arg1  1))
   (define %highidx0 (+  %lastidx1  %arg2))
   (define %15 (extract  (- (- %arg3 1) %arg2) (- (- %arg3 1) %highidx0) %10))
   (define %16 (zero-extend  %15 (bitvector %arg0)))
   (define %17 (bvadd  %14  %16))
   %17
   )
   (begin
   (define j0.new.div.copy.8 (/  j0.new  %elemsize))
   (define %0.copy.6 (*  j0.new.div.copy.8  %arg0))
   (define %lastidx3 (-  %arg0  1))
   (define %20 (+  %0.copy.6  %lastidx3))
   (define %21 (extract  %20 %0.copy.6 a))
   %21
   )
  )
 )
 )
)
)
)

(define (_mm256_test_epi8_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg3))
  (define %lastidx0 (-  %arg3  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvand  %2  %4))
  (define %6 (not (bveq  %5  %arg2 )))
  (define %7 (if (equal? %6 #t) %arg0 %arg1))
  %7
 )
 )
)
)
)

(define (_mm256_xor_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %4 (+  j0.new  %lastidx0))
  (define %5 (extract  %4 j0.new a))
  (define %7 (extract  %4 j0.new b))
  (define %8 (bvxor  %5  %7))
  %8
 )
 )
)
)
)

(define (_mm512_cmpeq_epi64_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bveq  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm512_maskz_subs_epi8  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvsubnsw  %3  %5 %elemsize))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %10 (+  j0.new  %lastidx1))
   (define %11 (extract  %10 j0.new %arg0))
   %11
   )
  )
 )
 )
)
)
)

(define (_mm_cmple_epu32_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvule  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm_maskz_mul_epi32  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %factor0 (/  %arg1  %elemsize))
   (define %0.copy.0.new0 (*  j0.new  %factor0))
   (define %lastidx1 (-  %elemsize  1))
   (define %3 (+  %0.copy.0.new0  %lastidx1))
   (define %4 (extract  %3 %0.copy.0.new0 a))
   (define %5 (sign-extend  %4 (bitvector %arg1)))
   (define %7 (extract  %3 %0.copy.0.new0 b))
   (define %8 (sign-extend  %7 (bitvector %arg1)))
   (define %9 (bvmul  %5  %8))
   %9
   )
   (begin
   (define %factor1 (/  %arg1  %elemsize))
   (define %0.copy.5.new0 (*  j0.new  %factor1))
   (define %lastidx2 (-  %arg1  1))
   (define %12 (+  %0.copy.5.new0  %lastidx2))
   (define %13 (extract  %12 %0.copy.5.new0 %arg0))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm_mulhi_pi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %3 (sign-extend  %2 (bitvector %arg1)))
  (define %5 (extract  %1 j0.new b))
  (define %6 (sign-extend  %5 (bitvector %arg1)))
  (define %7 (bvmul  %3  %6))
  (define %lastidx1 (-  %elemsize  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %8 (extract  (- (- %arg1 1) %arg0) (- (- %arg1 1) %highidx0) %7))
  %8
 )
 )
)
)
)

(define (_mm512_mask_cmpgt_epu32_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvugt  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm256_maskz_min_epu16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvumin  %3  %5))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %9 (+  j0.new  %lastidx1))
   (define %10 (extract  %9 j0.new %arg0))
   %10
   )
  )
 )
 )
)
)
)

(define (_mm_mask_dpwssd_epi32  src k a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define j0.new.div (/  j0.new  %lanesize1))
 (define %0 (extract  j0.new.div j0.new.div k))
 (if (equal? %0 (bv #b1 1))
  (begin
  (define %11.red
(apply
  bvadd
  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %2.new0 (+  j0.new  iterator.0.new))
   (define %lastidx2 (-  %elemsize  1))
   (define %3 (+  %2.new0  %lastidx2))
   (define %4 (extract  %3 %2.new0 a))
   (define %5 (sign-extend  %4 (bitvector %lanesize1)))
   (define %9 (extract  %3 %2.new0 b))
   (define %10 (sign-extend  %9 (bitvector %lanesize1)))
   (define %11 (bvmul  %5  %10))
   %11
  )
))
  (define %lastidx1 (-  %lanesize1  1))
  (define %31.clone.2 (+  j0.new  %lastidx1))
  (define %11.ext0 (extract  %31.clone.2 j0.new dst))
  (define %11.acc0 (bvadd %11.red %11.ext0))
  %11.acc0
  )
  (begin
  (apply
  concat
  (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %lastidx3 (-  %lanesize1  1))
   (define %33 (+  j0.new  %lastidx3))
   (define %34 (extract  %33 j0.new src))
   %34
  )
  )
  )
 )
)
)
)

(define (_mm256_adds_epi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvaddnsw  %2  %4 %elemsize))
  %5
 )
 )
)
)
)

(define (_mm_dpbusds_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define %11.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1.new0 (+  j0.new  iterator.0.new))
  (define %lastidx2 (-  %elemsize  1))
  (define %2 (+  %1.new0  %lastidx2))
  (define %3 (extract  %2 %1.new0 a))
  (define %4 (zero-extend  %3 (bitvector %arg0)))
  (define %8 (extract  %2 %1.new0 b))
  (define %9 (sign-extend  %8 (bitvector %arg0)))
  (define %10 (bvmul  %4  %9))
  (define %11 (sign-extend  %10 (bitvector %lanesize1)))
  %11
 )
))
 (define %lastidx1 (-  %lanesize1  1))
 (define %63.clone.4 (+  j0.new  %lastidx1))
 (define %11.ext0 (extract  %63.clone.4 j0.new dst))
 (define %11.acc0 (bvaddnsw %11.red %11.ext0 %lanesize1))
 %11.acc0
)
)
)

(define (_mm256_cmpneq_epi8_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (not (bveq  %2  %4 )))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_m_pmovmskb  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg0))
  (define %lastidx0 (-  %arg0  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %1 a))
  %2
 )
 )
)
)
)

(define (_mm512_div_epi64  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (sign-extend  %2 (bitvector %arg0)))
  (define %6 (sign-extend  %4 (bitvector %arg0)))
  (define %7 (bvsdiv  %5  %6))
  (define %8.high.idx (- %arg0 1))
  (define %8.low.idx (- %8.high.idx %elemsize -1 ))
  (define %8 (extract  %8.high.idx %8.low.idx %7))
  %8
 )
 )
)
)
)

(define (_mm512_mask_cvtepi32_epi8  src k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %2 (extract  j0.new.div j0.new.div k))
  (if (equal? %2 (bv #b1 1))
   (begin
   (define %factor0 (/  %arg0  %elemsize))
   (define %0.copy.0.new0 (*  j0.new  %factor0))
   (define %lastidx1 (-  %arg0  1))
   (define %3 (+  %0.copy.0.new0  %lastidx1))
   (define %4 (extract  %3 %0.copy.0.new0 a))
   (define %5.high.idx (- %arg0 1))
   (define %5.low.idx (- %5.high.idx %elemsize -1 ))
   (define %5 (extract  %5.high.idx %5.low.idx %4))
   %5
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %8 (+  j0.new  %lastidx2))
   (define %9 (extract  %8 j0.new src))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm_mask_mul_epu32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %factor0 (/  %arg0  %elemsize))
   (define %0.copy.0.new0 (*  j0.new  %factor0))
   (define %lastidx1 (-  %elemsize  1))
   (define %3 (+  %0.copy.0.new0  %lastidx1))
   (define %4 (extract  %3 %0.copy.0.new0 a))
   (define %6 (extract  %3 %0.copy.0.new0 b))
   (define %7 (zero-extend  %4 (bitvector %arg0)))
   (define %8 (zero-extend  %6 (bitvector %arg0)))
   (define %9 (bvmul  %7  %8))
   %9
   )
   (begin
   (define %factor1 (/  %arg0  %elemsize))
   (define %0.copy.5.new0 (*  j0.new  %factor1))
   (define %lastidx2 (-  %arg0  1))
   (define %12 (+  %0.copy.5.new0  %lastidx2))
   (define %13 (extract  %12 %0.copy.5.new0 src))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm_cmpgt_epi8_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvsgt  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm512_mask_cmplt_epu64_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvult  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm512_mask_reduce_and_epi64  %arg0 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (define %offset0 (+  %arg1  %elemsize))
 (define %lastidx0 (-  %offset0  1))
 (define %7 (extract  %lastidx0 %arg1 %arg0))
 (define dst %7)
 (define %5.red
(apply
 bvand
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx3 (-  %elemsize  1))
   (define %4 (+  j0.new  %lastidx3))
   (define %5 (extract  %4 j0.new a))
   %5
   )
   (begin
   (define %offset2 (+  %arg1  %elemsize))
   (define %lastidx2 (-  %offset2  1))
   (define %8 (extract  %lastidx2 %arg1 %arg0))
   %8
   )
  )
 )
))
 (define %offset1 (+  %arg1  %elemsize))
 (define %lastidx1 (-  %offset1  1))
 (define %3 (extract  %lastidx1 %arg1 dst))
 (define %6 (bvand %5.red %3))
 %6
)
)
)

(define (_mm256_mask_dpwssds_epi32  src k a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define j0.new.div (/  j0.new  %lanesize1))
 (define %0 (extract  j0.new.div j0.new.div k))
 (if (equal? %0 (bv #b1 1))
  (begin
  (define %11.red
(apply
  bvadd
  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %2.new0 (+  j0.new  iterator.0.new))
   (define %lastidx2 (-  %elemsize  1))
   (define %3 (+  %2.new0  %lastidx2))
   (define %4 (extract  %3 %2.new0 a))
   (define %5 (sign-extend  %4 (bitvector %lanesize1)))
   (define %9 (extract  %3 %2.new0 b))
   (define %10 (sign-extend  %9 (bitvector %lanesize1)))
   (define %11 (bvmul  %5  %10))
   %11
  )
))
  (define %lastidx1 (-  %lanesize1  1))
  (define %32.clone.2 (+  j0.new  %lastidx1))
  (define %11.ext0 (extract  %32.clone.2 j0.new dst))
  (define %11.acc0 (bvaddnsw %11.red %11.ext0 %lanesize1))
  %11.acc0
  )
  (begin
  (apply
  concat
  (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %lastidx3 (-  %lanesize1  1))
   (define %34 (+  j0.new  %lastidx3))
   (define %35 (extract  %34 j0.new src))
   %35
  )
  )
  )
 )
)
)
)

(define (_mm_cvtepi16_epi64  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx1 (-  %elemsize  1))
  (define %2 (+  j0.new  %lastidx1))
  (define %3 (extract  %2 j0.new a))
  (define %4 (sign-extend  %3 (bitvector %arg0)))
  %4
 )
 )
)
)
)

(define (_mm_mask_blend_epi64  k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %3 (+  j0.new  %lastidx0))
   (define %4 (extract  %3 j0.new b))
   %4
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %7 (+  j0.new  %lastidx1))
   (define %8 (extract  %7 j0.new a))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm256_mask_cmple_epu32_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvule  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm512_maskz_mov_epi64  %arg0 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %3 (+  j0.new  %lastidx0))
   (define %4 (extract  %3 j0.new a))
   %4
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %7 (+  j0.new  %lastidx1))
   (define %8 (extract  %7 j0.new %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm_cvtepu16_epi32  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx1 (-  %elemsize  1))
  (define %2 (+  j0.new  %lastidx1))
  (define %3 (extract  %2 j0.new a))
  (define %4 (zero-extend  %3 (bitvector %arg0)))
  %4
 )
 )
)
)
)

(define (_mm256_broadcastmw_epi32  k %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx1 (-  %elemsize  1))
  (define %highidx0 (+  %lastidx1  %arg1))
  (define %1 (extract  %highidx0 %arg1 k))
  (define %2 (zero-extend  %1 (bitvector %arg0)))
  %2
 )
 )
)
)
)

(define (_mm512_mask_div_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (sign-extend  %3 (bitvector %arg0)))
   (define %7 (sign-extend  %5 (bitvector %arg0)))
   (define %8 (bvsdiv  %6  %7))
   (define %9.high.idx (- %arg0 1))
   (define %9.low.idx (- %9.high.idx %elemsize -1 ))
   (define %9 (extract  %9.high.idx %9.low.idx %8))
   %9
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx1))
   (define %13 (extract  %12 j0.new src))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm512_maskz_maddubs_epi16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %factor0 (/  %arg1  %elemsize))
   (define %0.copy.0.new0 (*  j0.new  %factor0))
   (define %2 (+  %0.copy.0.new0  %arg2))
   (define %lastidx0 (-  %arg1  1))
   (define %3 (+  %0.copy.0.new0  %lastidx0))
   (define %4 (extract  %3 %2 a))
   (define %7 (extract  %3 %2 b))
   (define %8 (zero-extend  %4 (bitvector %arg1)))
   (define %9 (sign-extend  %7 (bitvector %arg1)))
   (define %10 (bvmul  %8  %9))
   (define %lastidx1 (-  %elemsize  1))
   (define %11 (+  %0.copy.0.new0  %lastidx1))
   (define %12 (extract  %11 %0.copy.0.new0 a))
   (define %14 (extract  %11 %0.copy.0.new0 b))
   (define %15 (zero-extend  %12 (bitvector %arg1)))
   (define %16 (sign-extend  %14 (bitvector %arg1)))
   (define %17 (bvmul  %15  %16))
   (define %18 (bvaddnsw  %10  %17 %arg1))
   %18
   )
   (begin
   (define %factor1 (/  %arg1  %elemsize))
   (define %0.copy.6.new0 (*  j0.new  %factor1))
   (define %lastidx2 (-  %arg1  1))
   (define %22 (+  %0.copy.6.new0  %lastidx2))
   (define %23 (extract  %22 %0.copy.6.new0 %arg0))
   %23
   )
  )
 )
 )
)
)
)

(define (_mm256_maskz_dpwssd_epi32  %arg0 k src a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define j0.new.div (/  j0.new  %lanesize1))
 (define %0 (extract  j0.new.div j0.new.div k))
 (if (equal? %0 (bv #b1 1))
  (begin
  (define %11.red
(apply
  bvadd
  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %2.new0 (+  j0.new  iterator.0.new))
   (define %lastidx2 (-  %elemsize  1))
   (define %3 (+  %2.new0  %lastidx2))
   (define %4 (extract  %3 %2.new0 a))
   (define %5 (sign-extend  %4 (bitvector %lanesize1)))
   (define %9 (extract  %3 %2.new0 b))
   (define %10 (sign-extend  %9 (bitvector %lanesize1)))
   (define %11 (bvmul  %5  %10))
   %11
  )
))
  (define %lastidx1 (-  %lanesize1  1))
  (define %31.clone.2 (+  j0.new  %lastidx1))
  (define %11.ext0 (extract  %31.clone.2 j0.new dst))
  (define %11.acc0 (bvadd %11.red %11.ext0))
  %11.acc0
  )
  (begin
  (apply
  concat
  (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %lastidx3 (-  %lanesize1  1))
   (define %33 (+  j0.new  %lastidx3))
   (define %34 (extract  %33 j0.new %arg0))
   %34
  )
  )
  )
 )
)
)
)

(define (_mm_cmplt_epi32_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvslt  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm512_mask_cmpge_epi16_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvsge  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm_dpwssds_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define %10.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1.new0 (+  j0.new  iterator.0.new))
  (define %lastidx2 (-  %elemsize  1))
  (define %2 (+  %1.new0  %lastidx2))
  (define %3 (extract  %2 %1.new0 a))
  (define %4 (sign-extend  %3 (bitvector %lanesize1)))
  (define %8 (extract  %2 %1.new0 b))
  (define %9 (sign-extend  %8 (bitvector %lanesize1)))
  (define %10 (bvmul  %4  %9))
  %10
 )
))
 (define %lastidx1 (-  %lanesize1  1))
 (define %31.clone.2 (+  j0.new  %lastidx1))
 (define %10.ext0 (extract  %31.clone.2 j0.new dst))
 (define %10.acc0 (bvaddnsw %10.red %10.ext0 %lanesize1))
 %10.acc0
)
)
)

(define (_mm_or_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %4 (+  j0.new  %lastidx0))
  (define %5 (extract  %4 j0.new a))
  (define %7 (extract  %4 j0.new b))
  (define %8 (bvor  %5  %7))
  %8
 )
 )
)
)
)

(define (_mm_dpwssd_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define %10.red
(apply
 bvadd
 (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1.new0 (+  j0.new  iterator.0.new))
  (define %lastidx2 (-  %elemsize  1))
  (define %2 (+  %1.new0  %lastidx2))
  (define %3 (extract  %2 %1.new0 a))
  (define %4 (sign-extend  %3 (bitvector %lanesize1)))
  (define %8 (extract  %2 %1.new0 b))
  (define %9 (sign-extend  %8 (bitvector %lanesize1)))
  (define %10 (bvmul  %4  %9))
  %10
 )
))
 (define %lastidx1 (-  %lanesize1  1))
 (define %30.clone.2 (+  j0.new  %lastidx1))
 (define %10.ext0 (extract  %30.clone.2 j0.new dst))
 (define %10.acc0 (bvadd %10.red %10.ext0))
 %10.acc0
)
)
)

(define (_mm256_maskz_mulhrs_epi16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 %arg4 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %4 (sign-extend  %3 (bitvector %arg4)))
   (define %6 (extract  %2 j0.new b))
   (define %7 (sign-extend  %6 (bitvector %arg4)))
   (define %8 (bvmul  %4  %7))
   (define %9 (bvashr  %8  %arg3))
   (define %10 (bvadd  %9  %arg2))
   (define %lastidx1 (-  %elemsize  1))
   (define %highidx0 (+  %lastidx1  %arg1))
   (define %11 (extract  (- (- %arg4 1) %arg1) (- (- %arg4 1) %highidx0) %10))
   %11
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %14 (+  j0.new  %lastidx2))
   (define %15 (extract  %14 j0.new %arg0))
   %15
   )
  )
 )
 )
)
)
)

(define (_mm512_subs_epi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvsubnsw  %2  %4 %elemsize))
  %5
 )
 )
)
)
)

(define (_mm256_mul_epu32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %factor0 (/  %arg0  %elemsize))
  (define %0.new0 (*  j0.new  %factor0))
  (define %lastidx1 (-  %elemsize  1))
  (define %2 (+  %0.new0  %lastidx1))
  (define %3 (extract  %2 %0.new0 a))
  (define %5 (extract  %2 %0.new0 b))
  (define %6 (zero-extend  %3 (bitvector %arg0)))
  (define %7 (zero-extend  %5 (bitvector %arg0)))
  (define %8 (bvmul  %6  %7))
  %8
 )
 )
)
)
)

(define (_mm512_min_epu64  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvumin  %2  %4))
  %5
 )
 )
)
)
)

(define (_mm512_mask_reduce_or_epi64  %arg0 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (define %offset0 (+  %arg1  %elemsize))
 (define %lastidx0 (-  %offset0  1))
 (define %7 (extract  %lastidx0 %arg1 %arg0))
 (define dst %7)
 (define %5.red
(apply
 bvor
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx3 (-  %elemsize  1))
   (define %4 (+  j0.new  %lastidx3))
   (define %5 (extract  %4 j0.new a))
   %5
   )
   (begin
   (define %offset2 (+  %arg1  %elemsize))
   (define %lastidx2 (-  %offset2  1))
   (define %8 (extract  %lastidx2 %arg1 %arg0))
   %8
   )
  )
 )
))
 (define %offset1 (+  %arg1  %elemsize))
 (define %lastidx1 (-  %offset1  1))
 (define %3 (extract  %lastidx1 %arg1 dst))
 (define %6 (bvor %5.red %3))
 %6
)
)
)

(define (_mm256_cmpgt_epi8  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %2 (+  j0.new  %lastidx0))
  (define %3 (extract  %2 j0.new a))
  (define %5 (extract  %2 j0.new b))
  (define %6 (bvsgt  %3  %5))
  (define %7 (if (equal? %6 #t) %arg0 %arg1))
  %7
 )
 )
)
)
)

(define (_mm256_cmplt_epu16_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvult  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm256_mulhrs_epi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %3 (sign-extend  %2 (bitvector %arg3)))
  (define %5 (extract  %1 j0.new b))
  (define %6 (sign-extend  %5 (bitvector %arg3)))
  (define %7 (bvmul  %3  %6))
  (define %8 (bvashr  %7  %arg2))
  (define %9 (bvadd  %8  %arg1))
  (define %lastidx1 (-  %elemsize  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %10 (extract  (- (- %arg3 1) %arg0) (- (- %arg3 1) %highidx0) %9))
  %10
 )
 )
)
)
)

(define (_mm512_min_epi8  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvsmin  %2  %4))
  %5
 )
 )
)
)
)

(define (_mm_cvtusepi64_epi32  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %factor0 (/  %arg0  %elemsize))
  (define %0.new0 (*  j0.new  %factor0))
  (define %lastidx1 (-  %arg0  1))
  (define %2 (+  %0.new0  %lastidx1))
  (define %3 (extract  %2 %0.new0 a))
  (define %4 (bvusat %3 %arg0 %elemsize ))
  %4
 )
 )
)
)
)

(define (_mm512_reduce_or_epi64  %arg0 a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (define %offset0 (+  %arg1  %elemsize))
 (define %lastidx0 (-  %offset0  1))
 (define %6 (extract  %lastidx0 %arg1 %arg0))
 (define dst %6)
 (define %4.red
(apply
 bvor
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx2 (-  %elemsize  1))
  (define %3 (+  j0.new  %lastidx2))
  (define %4 (extract  %3 j0.new a))
  %4
 )
))
 (define %offset1 (+  %arg1  %elemsize))
 (define %lastidx1 (-  %offset1  1))
 (define %2 (extract  %lastidx1 %arg1 dst))
 (define %5 (bvor %4.red %2))
 %5
)
)
)

(define (_mm_blend_epi16  a b imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div imm8))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %3 (+  j0.new  %lastidx0))
   (define %4 (extract  %3 j0.new b))
   %4
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %7 (+  j0.new  %lastidx1))
   (define %8 (extract  %7 j0.new a))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm256_movm_epi64  k %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   %arg0
   )
   (begin
   %arg1
   )
  )
 )
 )
)
)
)

(define (_mm256_maskz_madd_epi16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %factor0 (/  %arg1  %elemsize))
   (define %0.copy.0.new0 (*  j0.new  %factor0))
   (define %3 (+  %0.copy.0.new0  %arg2))
   (define %lastidx0 (-  %arg1  1))
   (define %4 (+  %0.copy.0.new0  %lastidx0))
   (define %5 (extract  %4 %3 a))
   (define %8 (extract  %4 %3 b))
   (define %9 (sign-extend  %5 (bitvector %arg1)))
   (define %10 (sign-extend  %8 (bitvector %arg1)))
   (define %11 (bvmul  %9  %10))
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  %0.copy.0.new0  %lastidx1))
   (define %13 (extract  %12 %0.copy.0.new0 a))
   (define %15 (extract  %12 %0.copy.0.new0 b))
   (define %16 (sign-extend  %13 (bitvector %arg1)))
   (define %17 (sign-extend  %15 (bitvector %arg1)))
   (define %18 (bvmul  %16  %17))
   (define %19 (bvadd  %11  %18))
   %19
   )
   (begin
   (define %factor1 (/  %arg1  %elemsize))
   (define %0.copy.6.new0 (*  j0.new  %factor1))
   (define %lastidx2 (-  %arg1  1))
   (define %22 (+  %0.copy.6.new0  %lastidx2))
   (define %23 (extract  %22 %0.copy.6.new0 %arg0))
   %23
   )
  )
 )
 )
)
)
)

(define (_mm512_mask_adds_epi16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvaddnsw  %3  %5 %elemsize))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %10 (+  j0.new  %lastidx1))
   (define %11 (extract  %10 j0.new src))
   %11
   )
  )
 )
 )
)
)
)

(define (_mm_maskz_avg_epu16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %3 (+  j0.new  %lastidx0))
   (define %4 (extract  %3 j0.new a))
   (define %6 (extract  %3 j0.new b))
   (define %7 (bvadd  %4  %6))
   (define %8 (bvadd  %7  %arg2))
   (define %9 (bvashr  %8  %arg1))
   %9
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx1))
   (define %13 (extract  %12 j0.new %arg0))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm_mask_or_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %5 (+  j0.new  %lastidx0))
   (define %6 (extract  %5 j0.new a))
   (define %8 (extract  %5 j0.new b))
   (define %9 (bvor  %6  %8))
   %9
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx1))
   (define %13 (extract  %12 j0.new src))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm_maskz_abs_epi16  %arg0 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %4 (integer->bitvector (abs (bitvector->integer %3)) (bitvector %elemsize)))
   %4
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %7 (+  j0.new  %lastidx1))
   (define %8 (extract  %7 j0.new %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm512_and_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %4 (+  j0.new  %lastidx0))
  (define %5 (extract  %4 j0.new a))
  (define %7 (extract  %4 j0.new b))
  (define %8 (bvand  %5  %7))
  %8
 )
 )
)
)
)

(define (_mm256_cmpgt_epu32_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvugt  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm_cmpge_epu64_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvuge  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm512_mask_subs_epu16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvsubnuw  %3  %5 %elemsize))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %10 (+  j0.new  %lastidx1))
   (define %11 (extract  %10 j0.new src))
   %11
   )
  )
 )
 )
)
)
)

(define (_mm_cmplt_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %2 (+  j0.new  %lastidx0))
  (define %3 (extract  %2 j0.new a))
  (define %5 (extract  %2 j0.new b))
  (define %6 (bvslt  %3  %5))
  (define %7 (if (equal? %6 #t) %arg0 %arg1))
  %7
 )
 )
)
)
)

(define (_mm256_maskz_set1_epi8  %arg0 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %highidx0 (+  %lastidx1  %arg1))
   (define %2 (extract  %highidx0 %arg1 a))
   %2
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %5 (+  j0.new  %lastidx2))
   (define %6 (extract  %5 j0.new %arg0))
   %6
   )
  )
 )
 )
)
)
)

(define (_mm_adds_pu16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvaddnuw  %2  %4 %elemsize))
  %5
 )
 )
)
)
)

(define (_mm256_mask_cmpeq_epi32_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg3))
   (define %lastidx0 (-  %arg3  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bveq  %3  %5))
   (define %7 (if (equal? %6 #t) %arg1 %arg2))
   %7
   )
   (begin
   (define %8 (extract  j0 j0 %arg0))
   %8
   )
  )
 )
 )
)
)
)

(define (_mm_maskz_add_epi16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %5 (+  j0.new  %lastidx0))
   (define %6 (extract  %5 j0.new a))
   (define %8 (extract  %5 j0.new b))
   (define %9 (bvadd  %6  %8))
   %9
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx1))
   (define %13 (extract  %12 j0.new %arg0))
   %13
   )
  )
 )
 )
)
)
)

(define (_mm256_maskz_mulhi_epi16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %4 (sign-extend  %3 (bitvector %arg2)))
   (define %6 (extract  %2 j0.new b))
   (define %7 (sign-extend  %6 (bitvector %arg2)))
   (define %8 (bvmul  %4  %7))
   (define %lastidx1 (-  %elemsize  1))
   (define %highidx0 (+  %lastidx1  %arg1))
   (define %9 (extract  (- (- %arg2 1) %arg1) (- (- %arg2 1) %highidx0) %8))
   %9
   )
   (begin
   (define %lastidx2 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx2))
   (define %13 (extract  %12 j0.new %arg0))
   %13
   )
  )
 )
 )
)
)
)

(define (_m_pmaxub  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (bvumax  %2  %4))
  %5
 )
 )
)
)
)

(define (_mm_udiv_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx0 (-  %elemsize  1))
  (define %1 (+  j0.new  %lastidx0))
  (define %2 (extract  %1 j0.new a))
  (define %4 (extract  %1 j0.new b))
  (define %5 (zero-extend  %2 (bitvector %arg0)))
  (define %6 (zero-extend  %4 (bitvector %arg0)))
  (define %7 (bvudiv  %5  %6))
  (define %8.high.idx (- %arg0 1))
  (define %8.low.idx (- %8.high.idx %elemsize -1 ))
  (define %8 (extract  %8.high.idx %8.low.idx %7))
  %8
 )
 )
)
)
)

(define (_mm512_broadcast_i64x2  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (modulo  j0.new.div  %arg0))
  (define %2 (*  %1  %elemsize))
  (define %lastidx1 (-  %elemsize  1))
  (define %4 (+  %2  %lastidx1))
  (define %5 (extract  %4 %2 a))
  %5
 )
 )
)
)
)

(define (_mm512_cmple_epi32_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg2))
  (define %lastidx0 (-  %arg2  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %0 a))
  (define %4 (extract  %1 %0 b))
  (define %5 (bvsle  %2  %4))
  (define %6 (if (equal? %5 #t) %arg0 %arg1))
  %6
 )
 )
)
)
)

(define (_mm256_maskz_max_epu16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvumax  %3  %5))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %9 (+  j0.new  %lastidx1))
   (define %10 (extract  %9 j0.new %arg0))
   %10
   )
  )
 )
 )
)
)
)

(define (_mm512_maskz_madd52lo_epu64  %arg0 k a b c %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 %arg4 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define j0.new.div.copy.2 (/  j0.new  %elemsize))
   (define %0.copy.0 (*  j0.new.div.copy.2  %arg1))
   (define %lastidx2 (-  %elemsize  1))
   (define %2 (+  %0.copy.0  %lastidx2))
   (define %3 (extract  %2 %0.copy.0 b))
   (define %6 (extract  %2 %0.copy.0 c))
   (define %8 (zero-extend  %3 (bitvector %arg4)))
   (define %9 (zero-extend  %6 (bitvector %arg4)))
   (define %10 (bvmul  %8  %9))
   (define %lastidx0 (-  %arg1  1))
   (define %13 (+  %0.copy.0  %lastidx0))
   (define %14 (extract  %13 %0.copy.0 a))
   (define %lastidx1 (-  %arg2  1))
   (define %highidx0 (+  %lastidx1  %arg3))
   (define %15 (extract  (- (- %arg4 1) %arg3) (- (- %arg4 1) %highidx0) %10))
   (define %16 (zero-extend  %15 (bitvector %arg1)))
   (define %17 (bvadd  %14  %16))
   %17
   )
   (begin
   (define j0.new.div.copy.8 (/  j0.new  %elemsize))
   (define %0.copy.6 (*  j0.new.div.copy.8  %arg1))
   (define %lastidx3 (-  %arg1  1))
   (define %20 (+  %0.copy.6  %lastidx3))
   (define %21 (extract  %20 %0.copy.6 %arg0))
   %21
   )
  )
 )
 )
)
)
)

(define (_mm_mask_dpbusd_epi32  src k a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 )
(define dst src)
(apply
concat
(for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
 (define j0.new.div (/  j0.new  %lanesize1))
 (define %0 (extract  j0.new.div j0.new.div k))
 (if (equal? %0 (bv #b1 1))
  (begin
  (define %12.red
(apply
  bvadd
  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
   (define %2.new0 (+  j0.new  iterator.0.new))
   (define %lastidx2 (-  %elemsize  1))
   (define %3 (+  %2.new0  %lastidx2))
   (define %4 (extract  %3 %2.new0 a))
   (define %5 (zero-extend  %4 (bitvector %arg0)))
   (define %9 (extract  %3 %2.new0 b))
   (define %10 (sign-extend  %9 (bitvector %arg0)))
   (define %11 (bvmul  %5  %10))
   (define %12 (sign-extend  %11 (bitvector %lanesize1)))
   %12
  )
))
  (define %lastidx1 (-  %lanesize1  1))
  (define %63.clone.4 (+  j0.new  %lastidx1))
  (define %12.ext0 (extract  %63.clone.4 j0.new dst))
  (define %12.acc0 (bvadd %12.red %12.ext0))
  %12.acc0
  )
  (begin
  (apply
  concat
  (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
   (define %lastidx3 (-  %lanesize1  1))
   (define %65 (+  j0.new  %lastidx3))
   (define %66 (extract  %65 j0.new src))
   %66
  )
  )
  )
 )
)
)
)

(define (_mm256_broadcastq_epi64  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %lastidx1 (-  %elemsize  1))
  (define %highidx0 (+  %lastidx1  %arg0))
  (define %1 (extract  %highidx0 %arg0 a))
  %1
 )
 )
)
)
)

(define (_mm_movepi16_mask  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %0 (*  j0  %arg0))
  (define %lastidx0 (-  %arg0  1))
  (define %1 (+  %0  %lastidx0))
  (define %2 (extract  %1 %1 a))
  (if (equal? %2 (bv #b1 1))
   (begin
   %arg1
   )
   (begin
   %arg2
   )
  )
 )
 )
)
)
)

(define (_mm256_mask_test_epi16_mask  %arg0 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 %arg2 %arg3 %arg4 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %1 (extract  j0 j0 k1))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %0.copy.0 (*  j0  %arg4))
   (define %lastidx0 (-  %arg4  1))
   (define %2 (+  %0.copy.0  %lastidx0))
   (define %3 (extract  %2 %0.copy.0 a))
   (define %5 (extract  %2 %0.copy.0 b))
   (define %6 (bvand  %3  %5))
   (define %7 (not (bveq  %6  %arg3 )))
   (define %8 (if (equal? %7 #t) %arg1 %arg2))
   %8
   )
   (begin
   (define %9 (extract  j0 j0 %arg0))
   %9
   )
  )
 )
 )
)
)
)

(define (_mm256_mask_max_epi8  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %2 (+  j0.new  %lastidx0))
   (define %3 (extract  %2 j0.new a))
   (define %5 (extract  %2 j0.new b))
   (define %6 (bvsmax  %3  %5))
   %6
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %9 (+  j0.new  %lastidx1))
   (define %10 (extract  %9 j0.new src))
   %10
   )
  )
 )
 )
)
)
)

(define (_mm_madd_epi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define %factor0 (/  %arg0  %elemsize))
  (define %0.new0 (*  j0.new  %factor0))
  (define %2 (+  %0.new0  %arg1))
  (define %lastidx0 (-  %arg0  1))
  (define %3 (+  %0.new0  %lastidx0))
  (define %4 (extract  %3 %2 a))
  (define %7 (extract  %3 %2 b))
  (define %8 (sign-extend  %4 (bitvector %arg0)))
  (define %9 (sign-extend  %7 (bitvector %arg0)))
  (define %10 (bvmul  %8  %9))
  (define %lastidx1 (-  %elemsize  1))
  (define %11 (+  %0.new0  %lastidx1))
  (define %12 (extract  %11 %0.new0 a))
  (define %14 (extract  %11 %0.new0 b))
  (define %15 (sign-extend  %12 (bitvector %arg0)))
  (define %16 (sign-extend  %14 (bitvector %arg0)))
  (define %17 (bvmul  %15  %16))
  (define %18 (bvadd  %10  %17))
  %18
 )
 )
)
)
)

(define (_mm512_mask_subr_epi32  src k v2 v3 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset )
(apply
concat
(for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
 (apply
 concat
 (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  (define j0.new.div (/  j0.new  %elemsize))
  (define %1 (extract  j0.new.div j0.new.div k))
  (if (equal? %1 (bv #b1 1))
   (begin
   (define %lastidx0 (-  %elemsize  1))
   (define %5 (+  j0.new  %lastidx0))
   (define %6 (extract  %5 j0.new v3))
   (define %8 (extract  %5 j0.new v2))
   (define %9 (bvsub  %6  %8))
   %9
   )
   (begin
   (define %lastidx1 (-  %elemsize  1))
   (define %12 (+  j0.new  %lastidx1))
   (define %13 (extract  %12 j0.new src))
   %13
   )
  )
 )
 )
)
)
)


;; ================================================================================

;; ================================================================================
;;                                Struct Definitions
;; ================================================================================
(struct reg (id) #:transparent #:mutable)
(struct lit (val) #:transparent)
(struct idx-i (id) #:transparent)
(struct idx-j (id) #:transparent)
(struct nop (v1) #:transparent)
(struct idx-add ([i1 #:mutable] [i2 #:mutable] ) #:transparent )
(struct idx-mul ([i1 #:mutable] [i2 #:mutable] ) #:transparent )
(struct vector-load_dsl ([v0 #:mutable] lane_size num_2 num_3 prec_i_o) #:transparent)
(struct _mm512_mask_testn_epi64_mask_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_o num_8 [vc_9 #:mutable] [vc_10 #:mutable] [vc_11 #:mutable] prec_i) #:transparent)
(struct _mm512_maskz_mulhi_epu16_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10) #:transparent)
(struct _mm_cmpge_epi16_mask_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_o num_6 [vc_7 #:mutable] [vc_8 #:mutable] prec_i) #:transparent)
(struct _mm512_mask_cmpge_epu8_mask_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_o num_8 [vc_9 #:mutable] [vc_10 #:mutable] prec_i) #:transparent)
(struct _mm512_dpbusd_epi32_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i lane_size num_5 prec_i num_7 num_8) #:transparent)
(struct _mm512_maskz_broadcast_i64x2_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i_o lane_size num_5 prec_i_o num_7 num_8) #:transparent)
(struct _mm256_blend_epi16_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i_o lane_size num_5 prec_i_o num_7 num_8) #:transparent)
(struct _mm_maddubs_pi16_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i num_6 prec_o num_8) #:transparent)
(struct _mm256_mask_min_epi16_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8) #:transparent)
(struct _mm256_avg_epu16_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6 [vc_7 #:mutable] [vc_8 #:mutable]) #:transparent)
(struct _mm256_mask_cmpgt_epi16_mask_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_o num_8 [vc_9 #:mutable] [vc_10 #:mutable] prec_i) #:transparent)
(struct _mm512_maskz_dpbusd_epi32_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] [v4 #:mutable] size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13) #:transparent)
(struct _mm512_mask_cvtsepi32_epi16_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i_o lane_size num_5 prec_i_o num_7 num_8) #:transparent)
(struct _mm_mul_epi32_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i num_6 prec_o) #:transparent)
(struct _mm_maskz_sub_epi16_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8) #:transparent)
(struct _mm512_mask_div_epu32_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8 num_9) #:transparent)
(struct _mm512_sub_epi8_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm512_madd52hi_epu64_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i_o lane_size num_5 prec_i num_7 prec_o num_9 num_10 num_11) #:transparent)
(struct _mm256_cvtepi64_epi8_dsl ([v0 #:mutable] size_i_o lane_size num_3 prec_o num_5 prec_i) #:transparent)
(struct _mm512_mullo_epi16_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8) #:transparent)
(struct _mm256_mask_cmpneq_epu32_mask_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_o num_8 [vc_9 #:mutable] [vc_10 #:mutable] prec_i) #:transparent)
(struct _mm512_mask_reduce_add_epi64_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i_o lane_size num_5 prec_i_o num_7 num_8) #:transparent)
(struct _mm512_subr_epi32_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm256_subs_epu8_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm512_abs_epi64_dsl ([v0 #:mutable] size_i_o lane_size num_3 prec_i_o num_5) #:transparent)
(struct _mm_urem_epi32_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm512_mask_cmple_epi32_mask_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_o num_8 [vc_9 #:mutable] [vc_10 #:mutable] prec_i) #:transparent)
(struct _mm_cmpeq_epi32_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6 [vc_7 #:mutable] [vc_8 #:mutable]) #:transparent)
(struct _mm_maskz_adds_epu16_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8) #:transparent)
(struct _mm_maskz_dpbusds_epi32_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] [v4 #:mutable] size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13) #:transparent)
(struct _mm256_maskz_andnot_epi32_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8) #:transparent)
(struct _mm256_maskz_cvtepu32_epi64_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i_o lane_size num_5 num_6 num_7 prec_i_o) #:transparent)
(struct _mm256_mask_xor_epi64_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8) #:transparent)
(struct _mm512_mask_rem_epu32_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8) #:transparent)
(struct _mm_mask_cvtepi32_epi64_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i_o lane_size num_5 num_6 num_7 prec_i_o) #:transparent)
(struct _mm512_testn_epi32_mask_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_o num_6 [vc_7 #:mutable] [vc_8 #:mutable] [vc_9 #:mutable] prec_i) #:transparent)
(struct _mm512_reduce_add_epi64_dsl ([vc_0 #:mutable] [v1 #:mutable] size_i lane_size num_4 prec_i_o num_6 num_7) #:transparent)
(struct _mm256_blendv_epi8_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i_o lane_size num_5 prec_i_o num_7) #:transparent)
(struct _mm512_maskz_and_epi64_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8) #:transparent)
(struct _mm_mask_cmplt_epi64_mask_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_o num_8 [vc_9 #:mutable] [vc_10 #:mutable] prec_i) #:transparent)
(struct _mm_maskz_dpwssds_epi32_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] [v4 #:mutable] size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12) #:transparent)
(struct _mm512_andnot_epi32_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm512_reduce_and_epi64_dsl ([vc_0 #:mutable] [v1 #:mutable] size_i lane_size num_4 prec_i_o num_6 num_7) #:transparent)
(struct _m_paddw_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm256_max_epi8_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm256_mask_dpbusds_epi32_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12) #:transparent)
(struct _mm256_mask_madd52lo_epu64_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10 num_11 num_12) #:transparent)
(struct _mm256_test_epi8_mask_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_o num_6 [vc_7 #:mutable] [vc_8 #:mutable] [vc_9 #:mutable] prec_i) #:transparent)
(struct _mm256_xor_epi32_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm512_cmpeq_epi64_mask_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_o num_6 [vc_7 #:mutable] [vc_8 #:mutable] prec_i) #:transparent)
(struct _mm512_maskz_subs_epi8_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8) #:transparent)
(struct _mm_cmple_epu32_mask_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_o num_6 [vc_7 #:mutable] [vc_8 #:mutable] prec_i) #:transparent)
(struct _mm_maskz_mul_epi32_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 num_7 num_8 prec_i_o) #:transparent)
(struct _mm_mulhi_pi16_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8) #:transparent)
(struct _mm512_mask_cmpgt_epu32_mask_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_o num_8 [vc_9 #:mutable] [vc_10 #:mutable] prec_i) #:transparent)
(struct _mm256_maskz_min_epu16_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8) #:transparent)
(struct _mm_mask_dpwssd_epi32_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11) #:transparent)
(struct _mm256_adds_epi16_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm_dpbusds_epi32_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i lane_size num_5 prec_i num_7 num_8) #:transparent)
(struct _mm256_cmpneq_epi8_mask_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_o num_6 [vc_7 #:mutable] [vc_8 #:mutable] prec_i) #:transparent)
(struct _m_pmovmskb_dsl ([v0 #:mutable] size_o lane_size num_3 prec_o num_5 num_6) #:transparent)
(struct _mm512_div_epi64_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6 num_7) #:transparent)
(struct _mm512_mask_cvtepi32_epi8_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i_o lane_size num_5 prec_i_o num_7 num_8) #:transparent)
(struct _mm_mask_mul_epu32_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 num_7 num_8 prec_i_o) #:transparent)
(struct _mm_cmpgt_epi8_mask_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_o num_6 [vc_7 #:mutable] [vc_8 #:mutable] prec_i) #:transparent)
(struct _mm512_mask_cmplt_epu64_mask_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_o num_8 [vc_9 #:mutable] [vc_10 #:mutable] prec_i) #:transparent)
(struct _mm512_mask_reduce_and_epi64_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i_o lane_size num_5 prec_i_o num_7 num_8) #:transparent)
(struct _mm256_mask_dpwssds_epi32_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11) #:transparent)
(struct _mm_cvtepi16_epi64_dsl ([v0 #:mutable] size_i_o lane_size num_3 prec_i num_5 prec_o) #:transparent)
(struct _mm_mask_blend_epi64_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i_o lane_size num_5 prec_i_o num_7) #:transparent)
(struct _mm256_mask_cmple_epu32_mask_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_o num_8 [vc_9 #:mutable] [vc_10 #:mutable] prec_i) #:transparent)
(struct _mm512_maskz_mov_epi64_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i_o lane_size num_5 prec_i_o num_7) #:transparent)
(struct _mm_cvtepu16_epi32_dsl ([v0 #:mutable] size_i_o lane_size num_3 prec_i num_5 prec_o) #:transparent)
(struct _mm256_broadcastmw_epi32_dsl ([v0 #:mutable] size_o lane_size num_3 prec_i num_5 prec_o num_7) #:transparent)
(struct _mm512_mask_div_epi32_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8 num_9) #:transparent)
(struct _mm512_maskz_maddubs_epi16_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10) #:transparent)
(struct _mm256_maskz_dpwssd_epi32_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] [v4 #:mutable] size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12) #:transparent)
(struct _mm_cmplt_epi32_mask_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_o num_6 [vc_7 #:mutable] [vc_8 #:mutable] prec_i) #:transparent)
(struct _mm512_mask_cmpge_epi16_mask_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_o num_8 [vc_9 #:mutable] [vc_10 #:mutable] prec_i) #:transparent)
(struct _mm_dpwssds_epi32_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i lane_size num_5 prec_i num_7) #:transparent)
(struct _mm_or_epi32_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm_dpwssd_epi32_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i lane_size num_5 prec_i num_7) #:transparent)
(struct _mm256_maskz_mulhrs_epi16_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8 num_9 [vc_10 #:mutable] [vc_11 #:mutable] num_12) #:transparent)
(struct _mm512_subs_epi16_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm256_mul_epu32_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i num_6 prec_o) #:transparent)
(struct _mm512_min_epu64_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm512_mask_reduce_or_epi64_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i_o lane_size num_5 prec_i_o num_7 num_8) #:transparent)
(struct _mm256_cmpgt_epi8_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6 [vc_7 #:mutable] [vc_8 #:mutable]) #:transparent)
(struct _mm256_cmplt_epu16_mask_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_o num_6 [vc_7 #:mutable] [vc_8 #:mutable] prec_i) #:transparent)
(struct _mm256_mulhrs_epi16_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6 num_7 [vc_8 #:mutable] [vc_9 #:mutable] num_10) #:transparent)
(struct _mm512_min_epi8_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm_cvtusepi64_epi32_dsl ([v0 #:mutable] size_i_o lane_size num_3 prec_o num_5 prec_i) #:transparent)
(struct _mm512_reduce_or_epi64_dsl ([vc_0 #:mutable] [v1 #:mutable] size_i lane_size num_4 prec_i_o num_6 num_7) #:transparent)
(struct _mm_blend_epi16_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i_o lane_size num_5 prec_i_o num_7) #:transparent)
(struct _mm256_movm_epi64_dsl ([v0 #:mutable] size_o lane_size num_3 prec_o num_5 [vc_6 #:mutable] [vc_7 #:mutable]) #:transparent)
(struct _mm256_maskz_madd_epi16_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10) #:transparent)
(struct _mm512_mask_adds_epi16_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8) #:transparent)
(struct _mm_maskz_avg_epu16_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8 [vc_9 #:mutable] [vc_10 #:mutable]) #:transparent)
(struct _mm_mask_or_epi32_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8) #:transparent)
(struct _mm_maskz_abs_epi16_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i_o lane_size num_5 prec_i_o num_7) #:transparent)
(struct _mm512_and_epi32_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm256_cmpgt_epu32_mask_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_o num_6 [vc_7 #:mutable] [vc_8 #:mutable] prec_i) #:transparent)
(struct _mm_cmpge_epu64_mask_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_o num_6 [vc_7 #:mutable] [vc_8 #:mutable] prec_i) #:transparent)
(struct _mm512_mask_subs_epu16_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8) #:transparent)
(struct _mm_cmplt_epi32_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6 [vc_7 #:mutable] [vc_8 #:mutable]) #:transparent)
(struct _mm256_maskz_set1_epi8_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] size_i_o lane_size num_5 prec_i_o num_7 num_8) #:transparent)
(struct _mm_adds_pu16_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm256_mask_cmpeq_epi32_mask_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_o num_8 [vc_9 #:mutable] [vc_10 #:mutable] prec_i) #:transparent)
(struct _mm_maskz_add_epi16_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8) #:transparent)
(struct _mm256_maskz_mulhi_epi16_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10) #:transparent)
(struct _m_pmaxub_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm_udiv_epi32_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6 num_7) #:transparent)
(struct _mm512_broadcast_i64x2_dsl ([v0 #:mutable] size_i_o lane_size num_3 prec_i_o num_5 num_6) #:transparent)
(struct _mm512_cmple_epi32_mask_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_o num_6 [vc_7 #:mutable] [vc_8 #:mutable] prec_i) #:transparent)
(struct _mm256_maskz_max_epu16_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8) #:transparent)
(struct _mm512_maskz_madd52lo_epu64_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] [v4 #:mutable] size_i_o lane_size num_7 num_8 num_9 prec_i_o num_11 num_12 num_13) #:transparent)
(struct _mm_mask_dpbusd_epi32_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12) #:transparent)
(struct _mm256_broadcastq_epi64_dsl ([v0 #:mutable] size_o lane_size num_3 prec_i_o num_5 num_6) #:transparent)
(struct _mm_movepi16_mask_dsl ([v0 #:mutable] size_o lane_size num_3 prec_o num_5 num_6 [vc_7 #:mutable] [vc_8 #:mutable]) #:transparent)
(struct _mm256_mask_test_epi16_mask_dsl ([vc_0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_o num_8 [vc_9 #:mutable] [vc_10 #:mutable] [vc_11 #:mutable] prec_i) #:transparent)
(struct _mm256_mask_max_epi8_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8) #:transparent)
(struct _mm_madd_epi16_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i num_6 prec_o num_8) #:transparent)
(struct _mm512_mask_subr_epi32_dsl ([v0 #:mutable] [v1 #:mutable] [v2 #:mutable] [v3 #:mutable] size_i_o lane_size num_6 prec_i_o num_8) #:transparent)
;; ================================================================================

;; ================================================================================
;;                                DSL Interpreter
;; ================================================================================
(define (interpret prog env)
 (destruct prog
	[(idx-i id) (vector-ref env (- (vector-length env) 2))]
	[(idx-j id) (vector-ref env (- (vector-length env) 1))]
	[(reg id) (vector-ref env id)]
	[(lit v) v]
	[(nop v1) (interpret v1 env)]
	[(idx-add i1 i2) (+ (interpret i1 env) (interpret i2 env))]
	[(idx-mul i1 i2) (* (interpret i1 env) (interpret i2 env))]
	[ (vector-load_dsl v0 lane_size num_2 num_3 prec_i_o)
		(vector-load (interpret v0 env) (interpret lane_size env) (interpret num_2 env) 
		 (interpret num_3 env) (interpret prec_i_o env))
	]
	[ (_mm512_mask_testn_epi64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 vc_11 prec_i)
		(_mm512_mask_testn_epi64_mask (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_o env) (interpret num_8 env) 
		 (interpret vc_9 env) (interpret vc_10 env) (interpret vc_11 env) 
		 (interpret prec_i env))
	]
	[ (_mm512_maskz_mulhi_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10)
		(_mm512_maskz_mulhi_epu16 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env) 
		 (interpret num_9 env) (interpret num_10 env))
	]
	[ (_mm_cmpge_epi16_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(_mm_cmpge_epi16_mask (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_o env) 
		 (interpret num_6 env) (interpret vc_7 env) (interpret vc_8 env) 
		 (interpret prec_i env))
	]
	[ (_mm512_mask_cmpge_epu8_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(_mm512_mask_cmpge_epu8_mask (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_o env) (interpret num_8 env) 
		 (interpret vc_9 env) (interpret vc_10 env) (interpret prec_i env))
	]
	[ (_mm512_dpbusd_epi32_dsl v0 v1 v2 size_i lane_size num_5 prec_i num_7 num_8)
		(_mm512_dpbusd_epi32 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i env) (interpret num_7 env) (interpret num_8 env))
	]
	[ (_mm512_maskz_broadcast_i64x2_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(_mm512_maskz_broadcast_i64x2 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i_o env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i_o env) (interpret num_7 env) (interpret num_8 env))
	]
	[ (_mm256_blend_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(_mm256_blend_epi16 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i_o env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i_o env) (interpret num_7 env) (interpret num_8 env))
	]
	[ (_mm_maddubs_pi16_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o num_8)
		(_mm_maddubs_pi16 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i env) 
		 (interpret num_6 env) (interpret prec_o env) (interpret num_8 env))
	]
	[ (_mm256_mask_min_epi16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(_mm256_mask_min_epi16 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env))
	]
	[ (_mm256_avg_epu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8)
		(_mm256_avg_epu16 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env) (interpret vc_7 env) (interpret vc_8 env))
	]
	[ (_mm256_mask_cmpgt_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(_mm256_mask_cmpgt_epi16_mask (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_o env) (interpret num_8 env) 
		 (interpret vc_9 env) (interpret vc_10 env) (interpret prec_i env))
	]
	[ (_mm512_maskz_dpbusd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13)
		(_mm512_maskz_dpbusd_epi32 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret v4 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_7 env) (interpret num_8 env) 
		 (interpret num_9 env) (interpret num_10 env) (interpret num_11 env) 
		 (interpret num_12 env) (interpret num_13 env))
	]
	[ (_mm512_mask_cvtsepi32_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(_mm512_mask_cvtsepi32_epi16 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i_o env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i_o env) (interpret num_7 env) (interpret num_8 env))
	]
	[ (_mm_mul_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o)
		(_mm_mul_epi32 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i env) 
		 (interpret num_6 env) (interpret prec_o env))
	]
	[ (_mm_maskz_sub_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(_mm_maskz_sub_epi16 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env))
	]
	[ (_mm512_mask_div_epu32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
		(_mm512_mask_div_epu32 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env) 
		 (interpret num_9 env))
	]
	[ (_mm512_sub_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_mm512_sub_epi8 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm512_madd52hi_epu64_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(_mm512_madd52hi_epu64 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i_o env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i env) (interpret num_7 env) (interpret prec_o env) 
		 (interpret num_9 env) (interpret num_10 env) (interpret num_11 env))
	]
	[ (_mm256_cvtepi64_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i)
		(_mm256_cvtepi64_epi8 (interpret v0 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_3 env) (interpret prec_o env) (interpret num_5 env) 
		 (interpret prec_i env))
	]
	[ (_mm512_mullo_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8)
		(_mm512_mullo_epi16 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env) (interpret num_7 env) (interpret num_8 env))
	]
	[ (_mm256_mask_cmpneq_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(_mm256_mask_cmpneq_epu32_mask (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_o env) (interpret num_8 env) 
		 (interpret vc_9 env) (interpret vc_10 env) (interpret prec_i env))
	]
	[ (_mm512_mask_reduce_add_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(_mm512_mask_reduce_add_epi64 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i_o env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i_o env) (interpret num_7 env) (interpret num_8 env))
	]
	[ (_mm512_subr_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_mm512_subr_epi32 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm256_subs_epu8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_mm256_subs_epu8 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm512_abs_epi64_dsl v0 size_i_o lane_size num_3 prec_i_o num_5)
		(_mm512_abs_epi64 (interpret v0 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_3 env) (interpret prec_i_o env) (interpret num_5 env))
	]
	[ (_mm_urem_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_mm_urem_epi32 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm512_mask_cmple_epi32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(_mm512_mask_cmple_epi32_mask (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_o env) (interpret num_8 env) 
		 (interpret vc_9 env) (interpret vc_10 env) (interpret prec_i env))
	]
	[ (_mm_cmpeq_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8)
		(_mm_cmpeq_epi32 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env) (interpret vc_7 env) (interpret vc_8 env))
	]
	[ (_mm_maskz_adds_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(_mm_maskz_adds_epu16 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env))
	]
	[ (_mm_maskz_dpbusds_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13)
		(_mm_maskz_dpbusds_epi32 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret v4 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_7 env) (interpret num_8 env) 
		 (interpret num_9 env) (interpret num_10 env) (interpret num_11 env) 
		 (interpret num_12 env) (interpret num_13 env))
	]
	[ (_mm256_maskz_andnot_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(_mm256_maskz_andnot_epi32 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env))
	]
	[ (_mm256_maskz_cvtepu32_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 prec_i_o)
		(_mm256_maskz_cvtepu32_epi64 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i_o env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret num_6 env) (interpret num_7 env) (interpret prec_i_o env))
	]
	[ (_mm256_mask_xor_epi64_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(_mm256_mask_xor_epi64 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env))
	]
	[ (_mm512_mask_rem_epu32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(_mm512_mask_rem_epu32 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env))
	]
	[ (_mm_mask_cvtepi32_epi64_dsl v0 v1 v2 size_i_o lane_size num_5 num_6 num_7 prec_i_o)
		(_mm_mask_cvtepi32_epi64 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i_o env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret num_6 env) (interpret num_7 env) (interpret prec_i_o env))
	]
	[ (_mm512_testn_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 vc_9 prec_i)
		(_mm512_testn_epi32_mask (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_o env) 
		 (interpret num_6 env) (interpret vc_7 env) (interpret vc_8 env) 
		 (interpret vc_9 env) (interpret prec_i env))
	]
	[ (_mm512_reduce_add_epi64_dsl vc_0 v1 size_i lane_size num_4 prec_i_o num_6 num_7)
		(_mm512_reduce_add_epi64 (interpret vc_0 env) (interpret v1 env) (interpret size_i env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env) (interpret num_7 env))
	]
	[ (_mm256_blendv_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		(_mm256_blendv_epi8 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i_o env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i_o env) (interpret num_7 env))
	]
	[ (_mm512_maskz_and_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(_mm512_maskz_and_epi64 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env))
	]
	[ (_mm_mask_cmplt_epi64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(_mm_mask_cmplt_epi64_mask (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_o env) (interpret num_8 env) 
		 (interpret vc_9 env) (interpret vc_10 env) (interpret prec_i env))
	]
	[ (_mm_maskz_dpwssds_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12)
		(_mm_maskz_dpwssds_epi32 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret v4 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_7 env) (interpret num_8 env) 
		 (interpret num_9 env) (interpret num_10 env) (interpret num_11 env) 
		 (interpret num_12 env))
	]
	[ (_mm512_andnot_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_mm512_andnot_epi32 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm512_reduce_and_epi64_dsl vc_0 v1 size_i lane_size num_4 prec_i_o num_6 num_7)
		(_mm512_reduce_and_epi64 (interpret vc_0 env) (interpret v1 env) (interpret size_i env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env) (interpret num_7 env))
	]
	[ (_m_paddw_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_m_paddw (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm256_max_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_mm256_max_epi8 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm256_mask_dpbusds_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12)
		(_mm256_mask_dpbusds_epi32 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret num_7 env) (interpret num_8 env) 
		 (interpret num_9 env) (interpret num_10 env) (interpret num_11 env) 
		 (interpret num_12 env))
	]
	[ (_mm256_mask_madd52lo_epu64_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(_mm256_mask_madd52lo_epu64 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret num_7 env) (interpret num_8 env) 
		 (interpret prec_i_o env) (interpret num_10 env) (interpret num_11 env) 
		 (interpret num_12 env))
	]
	[ (_mm256_test_epi8_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 vc_9 prec_i)
		(_mm256_test_epi8_mask (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_o env) 
		 (interpret num_6 env) (interpret vc_7 env) (interpret vc_8 env) 
		 (interpret vc_9 env) (interpret prec_i env))
	]
	[ (_mm256_xor_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_mm256_xor_epi32 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm512_cmpeq_epi64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(_mm512_cmpeq_epi64_mask (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_o env) 
		 (interpret num_6 env) (interpret vc_7 env) (interpret vc_8 env) 
		 (interpret prec_i env))
	]
	[ (_mm512_maskz_subs_epi8_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(_mm512_maskz_subs_epi8 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env))
	]
	[ (_mm_cmple_epu32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(_mm_cmple_epu32_mask (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_o env) 
		 (interpret num_6 env) (interpret vc_7 env) (interpret vc_8 env) 
		 (interpret prec_i env))
	]
	[ (_mm_maskz_mul_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o)
		(_mm_maskz_mul_epi32 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret num_7 env) (interpret num_8 env) 
		 (interpret prec_i_o env))
	]
	[ (_mm_mulhi_pi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8)
		(_mm_mulhi_pi16 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env) (interpret num_7 env) (interpret num_8 env))
	]
	[ (_mm512_mask_cmpgt_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(_mm512_mask_cmpgt_epu32_mask (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_o env) (interpret num_8 env) 
		 (interpret vc_9 env) (interpret vc_10 env) (interpret prec_i env))
	]
	[ (_mm256_maskz_min_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(_mm256_maskz_min_epu16 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env))
	]
	[ (_mm_mask_dpwssd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11)
		(_mm_mask_dpwssd_epi32 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret num_7 env) (interpret num_8 env) 
		 (interpret num_9 env) (interpret num_10 env) (interpret num_11 env))
	]
	[ (_mm256_adds_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_mm256_adds_epi16 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm_dpbusds_epi32_dsl v0 v1 v2 size_i lane_size num_5 prec_i num_7 num_8)
		(_mm_dpbusds_epi32 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i env) (interpret num_7 env) (interpret num_8 env))
	]
	[ (_mm256_cmpneq_epi8_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(_mm256_cmpneq_epi8_mask (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_o env) 
		 (interpret num_6 env) (interpret vc_7 env) (interpret vc_8 env) 
		 (interpret prec_i env))
	]
	[ (_m_pmovmskb_dsl v0 size_o lane_size num_3 prec_o num_5 num_6)
		(_m_pmovmskb (interpret v0 env) (interpret size_o env) (interpret lane_size env) 
		 (interpret num_3 env) (interpret prec_o env) (interpret num_5 env) 
		 (interpret num_6 env))
	]
	[ (_mm512_div_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
		(_mm512_div_epi64 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env) (interpret num_7 env))
	]
	[ (_mm512_mask_cvtepi32_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(_mm512_mask_cvtepi32_epi8 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i_o env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i_o env) (interpret num_7 env) (interpret num_8 env))
	]
	[ (_mm_mask_mul_epu32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o)
		(_mm_mask_mul_epu32 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret num_7 env) (interpret num_8 env) 
		 (interpret prec_i_o env))
	]
	[ (_mm_cmpgt_epi8_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(_mm_cmpgt_epi8_mask (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_o env) 
		 (interpret num_6 env) (interpret vc_7 env) (interpret vc_8 env) 
		 (interpret prec_i env))
	]
	[ (_mm512_mask_cmplt_epu64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(_mm512_mask_cmplt_epu64_mask (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_o env) (interpret num_8 env) 
		 (interpret vc_9 env) (interpret vc_10 env) (interpret prec_i env))
	]
	[ (_mm512_mask_reduce_and_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(_mm512_mask_reduce_and_epi64 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i_o env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i_o env) (interpret num_7 env) (interpret num_8 env))
	]
	[ (_mm256_mask_dpwssds_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11)
		(_mm256_mask_dpwssds_epi32 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret num_7 env) (interpret num_8 env) 
		 (interpret num_9 env) (interpret num_10 env) (interpret num_11 env))
	]
	[ (_mm_cvtepi16_epi64_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o)
		(_mm_cvtepi16_epi64 (interpret v0 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_3 env) (interpret prec_i env) (interpret num_5 env) 
		 (interpret prec_o env))
	]
	[ (_mm_mask_blend_epi64_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		(_mm_mask_blend_epi64 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i_o env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i_o env) (interpret num_7 env))
	]
	[ (_mm256_mask_cmple_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(_mm256_mask_cmple_epu32_mask (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_o env) (interpret num_8 env) 
		 (interpret vc_9 env) (interpret vc_10 env) (interpret prec_i env))
	]
	[ (_mm512_maskz_mov_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		(_mm512_maskz_mov_epi64 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i_o env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i_o env) (interpret num_7 env))
	]
	[ (_mm_cvtepu16_epi32_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o)
		(_mm_cvtepu16_epi32 (interpret v0 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_3 env) (interpret prec_i env) (interpret num_5 env) 
		 (interpret prec_o env))
	]
	[ (_mm256_broadcastmw_epi32_dsl v0 size_o lane_size num_3 prec_i num_5 prec_o num_7)
		(_mm256_broadcastmw_epi32 (interpret v0 env) (interpret size_o env) (interpret lane_size env) 
		 (interpret num_3 env) (interpret prec_i env) (interpret num_5 env) 
		 (interpret prec_o env) (interpret num_7 env))
	]
	[ (_mm512_mask_div_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
		(_mm512_mask_div_epi32 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env) 
		 (interpret num_9 env))
	]
	[ (_mm512_maskz_maddubs_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10)
		(_mm512_maskz_maddubs_epi16 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret num_7 env) (interpret num_8 env) 
		 (interpret prec_i_o env) (interpret num_10 env))
	]
	[ (_mm256_maskz_dpwssd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12)
		(_mm256_maskz_dpwssd_epi32 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret v4 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_7 env) (interpret num_8 env) 
		 (interpret num_9 env) (interpret num_10 env) (interpret num_11 env) 
		 (interpret num_12 env))
	]
	[ (_mm_cmplt_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(_mm_cmplt_epi32_mask (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_o env) 
		 (interpret num_6 env) (interpret vc_7 env) (interpret vc_8 env) 
		 (interpret prec_i env))
	]
	[ (_mm512_mask_cmpge_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(_mm512_mask_cmpge_epi16_mask (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_o env) (interpret num_8 env) 
		 (interpret vc_9 env) (interpret vc_10 env) (interpret prec_i env))
	]
	[ (_mm_dpwssds_epi32_dsl v0 v1 v2 size_i lane_size num_5 prec_i num_7)
		(_mm_dpwssds_epi32 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i env) (interpret num_7 env))
	]
	[ (_mm_or_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_mm_or_epi32 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm_dpwssd_epi32_dsl v0 v1 v2 size_i lane_size num_5 prec_i num_7)
		(_mm_dpwssd_epi32 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i env) (interpret num_7 env))
	]
	[ (_mm256_maskz_mulhrs_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 vc_10 vc_11 num_12)
		(_mm256_maskz_mulhrs_epi16 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env) 
		 (interpret num_9 env) (interpret vc_10 env) (interpret vc_11 env) 
		 (interpret num_12 env))
	]
	[ (_mm512_subs_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_mm512_subs_epi16 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm256_mul_epu32_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o)
		(_mm256_mul_epu32 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i env) 
		 (interpret num_6 env) (interpret prec_o env))
	]
	[ (_mm512_min_epu64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_mm512_min_epu64 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm512_mask_reduce_or_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(_mm512_mask_reduce_or_epi64 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i_o env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i_o env) (interpret num_7 env) (interpret num_8 env))
	]
	[ (_mm256_cmpgt_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8)
		(_mm256_cmpgt_epi8 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env) (interpret vc_7 env) (interpret vc_8 env))
	]
	[ (_mm256_cmplt_epu16_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(_mm256_cmplt_epu16_mask (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_o env) 
		 (interpret num_6 env) (interpret vc_7 env) (interpret vc_8 env) 
		 (interpret prec_i env))
	]
	[ (_mm256_mulhrs_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 vc_8 vc_9 num_10)
		(_mm256_mulhrs_epi16 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env) (interpret num_7 env) (interpret vc_8 env) 
		 (interpret vc_9 env) (interpret num_10 env))
	]
	[ (_mm512_min_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_mm512_min_epi8 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm_cvtusepi64_epi32_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i)
		(_mm_cvtusepi64_epi32 (interpret v0 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_3 env) (interpret prec_o env) (interpret num_5 env) 
		 (interpret prec_i env))
	]
	[ (_mm512_reduce_or_epi64_dsl vc_0 v1 size_i lane_size num_4 prec_i_o num_6 num_7)
		(_mm512_reduce_or_epi64 (interpret vc_0 env) (interpret v1 env) (interpret size_i env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env) (interpret num_7 env))
	]
	[ (_mm_blend_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		(_mm_blend_epi16 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i_o env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i_o env) (interpret num_7 env))
	]
	[ (_mm256_movm_epi64_dsl v0 size_o lane_size num_3 prec_o num_5 vc_6 vc_7)
		(_mm256_movm_epi64 (interpret v0 env) (interpret size_o env) (interpret lane_size env) 
		 (interpret num_3 env) (interpret prec_o env) (interpret num_5 env) 
		 (interpret vc_6 env) (interpret vc_7 env))
	]
	[ (_mm256_maskz_madd_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10)
		(_mm256_maskz_madd_epi16 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret num_7 env) (interpret num_8 env) 
		 (interpret prec_i_o env) (interpret num_10 env))
	]
	[ (_mm512_mask_adds_epi16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(_mm512_mask_adds_epi16 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env))
	]
	[ (_mm_maskz_avg_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 vc_10)
		(_mm_maskz_avg_epu16 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env) 
		 (interpret vc_9 env) (interpret vc_10 env))
	]
	[ (_mm_mask_or_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(_mm_mask_or_epi32 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env))
	]
	[ (_mm_maskz_abs_epi16_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		(_mm_maskz_abs_epi16 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i_o env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i_o env) (interpret num_7 env))
	]
	[ (_mm512_and_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_mm512_and_epi32 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm256_cmpgt_epu32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(_mm256_cmpgt_epu32_mask (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_o env) 
		 (interpret num_6 env) (interpret vc_7 env) (interpret vc_8 env) 
		 (interpret prec_i env))
	]
	[ (_mm_cmpge_epu64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(_mm_cmpge_epu64_mask (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_o env) 
		 (interpret num_6 env) (interpret vc_7 env) (interpret vc_8 env) 
		 (interpret prec_i env))
	]
	[ (_mm512_mask_subs_epu16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(_mm512_mask_subs_epu16 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env))
	]
	[ (_mm_cmplt_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8)
		(_mm_cmplt_epi32 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env) (interpret vc_7 env) (interpret vc_8 env))
	]
	[ (_mm256_maskz_set1_epi8_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(_mm256_maskz_set1_epi8 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret size_i_o env) (interpret lane_size env) (interpret num_5 env) 
		 (interpret prec_i_o env) (interpret num_7 env) (interpret num_8 env))
	]
	[ (_mm_adds_pu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_mm_adds_pu16 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm256_mask_cmpeq_epi32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(_mm256_mask_cmpeq_epi32_mask (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_o env) (interpret num_8 env) 
		 (interpret vc_9 env) (interpret vc_10 env) (interpret prec_i env))
	]
	[ (_mm_maskz_add_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(_mm_maskz_add_epi16 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env))
	]
	[ (_mm256_maskz_mulhi_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10)
		(_mm256_maskz_mulhi_epi16 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env) 
		 (interpret num_9 env) (interpret num_10 env))
	]
	[ (_m_pmaxub_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_m_pmaxub (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm_udiv_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
		(_mm_udiv_epi32 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env) (interpret num_7 env))
	]
	[ (_mm512_broadcast_i64x2_dsl v0 size_i_o lane_size num_3 prec_i_o num_5 num_6)
		(_mm512_broadcast_i64x2 (interpret v0 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_3 env) (interpret prec_i_o env) (interpret num_5 env) 
		 (interpret num_6 env))
	]
	[ (_mm512_cmple_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(_mm512_cmple_epi32_mask (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_o env) 
		 (interpret num_6 env) (interpret vc_7 env) (interpret vc_8 env) 
		 (interpret prec_i env))
	]
	[ (_mm256_maskz_max_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(_mm256_maskz_max_epu16 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env))
	]
	[ (_mm512_maskz_madd52lo_epu64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 prec_i_o num_11 num_12 num_13)
		(_mm512_maskz_madd52lo_epu64 (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret v4 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_7 env) (interpret num_8 env) 
		 (interpret num_9 env) (interpret prec_i_o env) (interpret num_11 env) 
		 (interpret num_12 env) (interpret num_13 env))
	]
	[ (_mm_mask_dpbusd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12)
		(_mm_mask_dpbusd_epi32 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret num_7 env) (interpret num_8 env) 
		 (interpret num_9 env) (interpret num_10 env) (interpret num_11 env) 
		 (interpret num_12 env))
	]
	[ (_mm256_broadcastq_epi64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6)
		(_mm256_broadcastq_epi64 (interpret v0 env) (interpret size_o env) (interpret lane_size env) 
		 (interpret num_3 env) (interpret prec_i_o env) (interpret num_5 env) 
		 (interpret num_6 env))
	]
	[ (_mm_movepi16_mask_dsl v0 size_o lane_size num_3 prec_o num_5 num_6 vc_7 vc_8)
		(_mm_movepi16_mask (interpret v0 env) (interpret size_o env) (interpret lane_size env) 
		 (interpret num_3 env) (interpret prec_o env) (interpret num_5 env) 
		 (interpret num_6 env) (interpret vc_7 env) (interpret vc_8 env))
	]
	[ (_mm256_mask_test_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 vc_11 prec_i)
		(_mm256_mask_test_epi16_mask (interpret vc_0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_o env) (interpret num_8 env) 
		 (interpret vc_9 env) (interpret vc_10 env) (interpret vc_11 env) 
		 (interpret prec_i env))
	]
	[ (_mm256_mask_max_epi8_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(_mm256_mask_max_epi8 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env))
	]
	[ (_mm_madd_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o num_8)
		(_mm_madd_epi16 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i env) 
		 (interpret num_6 env) (interpret prec_o env) (interpret num_8 env))
	]
	[ (_mm512_mask_subr_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(_mm512_mask_subr_epi32 (interpret v0 env) (interpret v1 env) (interpret v2 env) 
		 (interpret v3 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret prec_i_o env) (interpret num_8 env))
	]
	[v v]
 )
)
;; ================================================================================

;; ================================================================================
;;                                DSL Cost Model
;; ================================================================================
(define cost__mm512_mask_testn_epi64_mask_dsl 3)
(define cost__mm512_maskz_mulhi_epu16_dsl 5)
(define cost__mm_cmpge_epi16_mask_dsl 3)
(define cost__mm512_mask_cmpge_epu8_mask_dsl 3)
(define cost__mm512_dpbusd_epi32_dsl 1)
(define cost__mm512_maskz_broadcast_i64x2_dsl 8)
(define cost__mm256_blend_epi16_dsl 1)
(define cost__mm_maddubs_pi16_dsl 4)
(define cost__mm256_mask_min_epi16_dsl 1)
(define cost__mm256_avg_epu16_dsl 1)
(define cost__mm256_mask_cmpgt_epi16_mask_dsl 3)
(define cost__mm512_maskz_dpbusd_epi32_dsl 1)
(define cost__mm512_mask_cvtsepi32_epi16_dsl 4)
(define cost__mm_mul_epi32_dsl 5)
(define cost__mm_maskz_sub_epi16_dsl 1)
(define cost__mm512_mask_div_epu32_dsl 1)
(define cost__mm512_sub_epi8_dsl 1)
(define cost__mm512_madd52hi_epu64_dsl 1)
(define cost__mm256_cvtepi64_epi8_dsl 4)
(define cost__mm512_mullo_epi16_dsl 5)
(define cost__mm256_mask_cmpneq_epu32_mask_dsl 3)
(define cost__mm512_mask_reduce_add_epi64_dsl 1)
(define cost__mm512_subr_epi32_dsl 1)
(define cost__mm256_subs_epu8_dsl 1)
(define cost__mm512_abs_epi64_dsl 1)
(define cost__mm_urem_epi32_dsl 1)
(define cost__mm512_mask_cmple_epi32_mask_dsl 3)
(define cost__mm_cmpeq_epi32_dsl 1)
(define cost__mm_maskz_adds_epu16_dsl 1)
(define cost__mm_maskz_dpbusds_epi32_dsl 1)
(define cost__mm256_maskz_andnot_epi32_dsl 1)
(define cost__mm256_maskz_cvtepu32_epi64_dsl 3)
(define cost__mm256_mask_xor_epi64_dsl 1)
(define cost__mm512_mask_rem_epu32_dsl 1)
(define cost__mm_mask_cvtepi32_epi64_dsl 3)
(define cost__mm512_testn_epi32_mask_dsl 3)
(define cost__mm512_reduce_add_epi64_dsl 1)
(define cost__mm256_blendv_epi8_dsl 2)
(define cost__mm512_maskz_and_epi64_dsl 1)
(define cost__mm_mask_cmplt_epi64_mask_dsl 3)
(define cost__mm_maskz_dpwssds_epi32_dsl 1)
(define cost__mm512_andnot_epi32_dsl 1)
(define cost__mm512_reduce_and_epi64_dsl 1)
(define cost__m_paddw_dsl 1)
(define cost__mm256_max_epi8_dsl 1)
(define cost__mm256_mask_dpbusds_epi32_dsl 1)
(define cost__mm256_mask_madd52lo_epu64_dsl 1)
(define cost__mm256_test_epi8_mask_dsl 3)
(define cost__mm256_xor_epi32_dsl 1)
(define cost__mm512_cmpeq_epi64_mask_dsl 3)
(define cost__mm512_maskz_subs_epi8_dsl 1)
(define cost__mm_cmple_epu32_mask_dsl 3)
(define cost__mm_maskz_mul_epi32_dsl 5)
(define cost__mm_mulhi_pi16_dsl 5)
(define cost__mm512_mask_cmpgt_epu32_mask_dsl 3)
(define cost__mm256_maskz_min_epu16_dsl 1)
(define cost__mm_mask_dpwssd_epi32_dsl 1)
(define cost__mm256_adds_epi16_dsl 1)
(define cost__mm_dpbusds_epi32_dsl 1)
(define cost__mm256_cmpneq_epi8_mask_dsl 3)
(define cost__m_pmovmskb_dsl 2)
(define cost__mm512_div_epi64_dsl 1)
(define cost__mm512_mask_cvtepi32_epi8_dsl 4)
(define cost__mm_mask_mul_epu32_dsl 5)
(define cost__mm_cmpgt_epi8_mask_dsl 3)
(define cost__mm512_mask_cmplt_epu64_mask_dsl 3)
(define cost__mm512_mask_reduce_and_epi64_dsl 1)
(define cost__mm256_mask_dpwssds_epi32_dsl 1)
(define cost__mm_cvtepi16_epi64_dsl 1)
(define cost__mm_mask_blend_epi64_dsl 1)
(define cost__mm256_mask_cmple_epu32_mask_dsl 3)
(define cost__mm512_maskz_mov_epi64_dsl 1)
(define cost__mm_cvtepu16_epi32_dsl 1)
(define cost__mm256_broadcastmw_epi32_dsl 1)
(define cost__mm512_mask_div_epi32_dsl 1)
(define cost__mm512_maskz_maddubs_epi16_dsl 5)
(define cost__mm256_maskz_dpwssd_epi32_dsl 1)
(define cost__mm_cmplt_epi32_mask_dsl 3)
(define cost__mm512_mask_cmpge_epi16_mask_dsl 3)
(define cost__mm_dpwssds_epi32_dsl 1)
(define cost__mm_or_epi32_dsl 1)
(define cost__mm_dpwssd_epi32_dsl 1)
(define cost__mm256_maskz_mulhrs_epi16_dsl 5)
(define cost__mm512_subs_epi16_dsl 1)
(define cost__mm256_mul_epu32_dsl 5)
(define cost__mm512_min_epu64_dsl 3)
(define cost__mm512_mask_reduce_or_epi64_dsl 1)
(define cost__mm256_cmpgt_epi8_dsl 1)
(define cost__mm256_cmplt_epu16_mask_dsl 3)
(define cost__mm256_mulhrs_epi16_dsl 5)
(define cost__mm512_min_epi8_dsl 1)
(define cost__mm_cvtusepi64_epi32_dsl 4)
(define cost__mm512_reduce_or_epi64_dsl 1)
(define cost__mm_blend_epi16_dsl 1)
(define cost__mm256_movm_epi64_dsl 1)
(define cost__mm256_maskz_madd_epi16_dsl 5)
(define cost__mm512_mask_adds_epi16_dsl 1)
(define cost__mm_maskz_avg_epu16_dsl 1)
(define cost__mm_mask_or_epi32_dsl 1)
(define cost__mm_maskz_abs_epi16_dsl 1)
(define cost__mm512_and_epi32_dsl 1)
(define cost__mm256_cmpgt_epu32_mask_dsl 3)
(define cost__mm_cmpge_epu64_mask_dsl 3)
(define cost__mm512_mask_subs_epu16_dsl 1)
(define cost__mm_cmplt_epi32_dsl 1)
(define cost__mm256_maskz_set1_epi8_dsl 3)
(define cost__mm_adds_pu16_dsl 1)
(define cost__mm256_mask_cmpeq_epi32_mask_dsl 3)
(define cost__mm_maskz_add_epi16_dsl 1)
(define cost__mm256_maskz_mulhi_epi16_dsl 5)
(define cost__m_pmaxub_dsl 1)
(define cost__mm_udiv_epi32_dsl 1)
(define cost__mm512_broadcast_i64x2_dsl 8)
(define cost__mm512_cmple_epi32_mask_dsl 3)
(define cost__mm256_maskz_max_epu16_dsl 1)
(define cost__mm512_maskz_madd52lo_epu64_dsl 1)
(define cost__mm_mask_dpbusd_epi32_dsl 1)
(define cost__mm256_broadcastq_epi64_dsl 3)
(define cost__mm_movepi16_mask_dsl 1)
(define cost__mm256_mask_test_epi16_mask_dsl 3)
(define cost__mm256_mask_max_epi8_dsl 1)
(define cost__mm_madd_epi16_dsl 5)
(define cost__mm512_mask_subr_epi32_dsl 1)

(define (cost prog)
 (destruct prog
	[(idx-i id) 1]
	[(idx-j id) 1]
	[(reg id) 1]
	[(lit v) 1 ]
	[(nop v1) (+ 1 (cost v1))]
	[ (_mm512_mask_testn_epi64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 vc_11 prec_i)
		(+ cost__mm512_mask_testn_epi64_mask_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_o) (cost  num_8) 
		 (cost  vc_9) (cost  vc_10) (cost  vc_11) 
		 (cost  prec_i))
	]
	[ (_mm512_maskz_mulhi_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10)
		(+ cost__mm512_maskz_mulhi_epu16_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8) 
		 (cost  num_9) (cost  num_10))
	]
	[ (_mm_cmpge_epi16_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(+ cost__mm_cmpge_epi16_mask_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_o) 
		 (cost  num_6) (cost  vc_7) (cost  vc_8) 
		 (cost  prec_i))
	]
	[ (_mm512_mask_cmpge_epu8_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(+ cost__mm512_mask_cmpge_epu8_mask_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_o) (cost  num_8) 
		 (cost  vc_9) (cost  vc_10) (cost  prec_i))
	]
	[ (_mm512_dpbusd_epi32_dsl v0 v1 v2 size_i lane_size num_5 prec_i num_7 num_8)
		(+ cost__mm512_dpbusd_epi32_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  size_i) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i) (cost  num_7) (cost  num_8))
	]
	[ (_mm512_maskz_broadcast_i64x2_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(+ cost__mm512_maskz_broadcast_i64x2_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  size_i_o) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i_o) (cost  num_7) (cost  num_8))
	]
	[ (_mm256_blend_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(+ cost__mm256_blend_epi16_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  size_i_o) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i_o) (cost  num_7) (cost  num_8))
	]
	[ (_mm_maddubs_pi16_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o num_8)
		(+ cost__mm_maddubs_pi16_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i) 
		 (cost  num_6) (cost  prec_o) (cost  num_8))
	]
	[ (_mm256_mask_min_epi16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(+ cost__mm256_mask_min_epi16_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8))
	]
	[ (_mm256_avg_epu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8)
		(+ cost__mm256_avg_epu16_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6) (cost  vc_7) (cost  vc_8))
	]
	[ (_mm256_mask_cmpgt_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(+ cost__mm256_mask_cmpgt_epi16_mask_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_o) (cost  num_8) 
		 (cost  vc_9) (cost  vc_10) (cost  prec_i))
	]
	[ (_mm512_maskz_dpbusd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost__mm512_maskz_dpbusd_epi32_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  v4) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_7) (cost  num_8) 
		 (cost  num_9) (cost  num_10) (cost  num_11) 
		 (cost  num_12) (cost  num_13))
	]
	[ (_mm512_mask_cvtsepi32_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(+ cost__mm512_mask_cvtsepi32_epi16_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  size_i_o) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i_o) (cost  num_7) (cost  num_8))
	]
	[ (_mm_mul_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o)
		(+ cost__mm_mul_epi32_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i) 
		 (cost  num_6) (cost  prec_o))
	]
	[ (_mm_maskz_sub_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(+ cost__mm_maskz_sub_epi16_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8))
	]
	[ (_mm512_mask_div_epu32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
		(+ cost__mm512_mask_div_epu32_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8) 
		 (cost  num_9))
	]
	[ (_mm512_sub_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__mm512_sub_epi8_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm512_madd52hi_epu64_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i num_7 prec_o num_9 num_10 num_11)
		(+ cost__mm512_madd52hi_epu64_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  size_i_o) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i) (cost  num_7) (cost  prec_o) 
		 (cost  num_9) (cost  num_10) (cost  num_11))
	]
	[ (_mm256_cvtepi64_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i)
		(+ cost__mm256_cvtepi64_epi8_dsl (cost  v0) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_3) (cost  prec_o) (cost  num_5) 
		 (cost  prec_i))
	]
	[ (_mm512_mullo_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8)
		(+ cost__mm512_mullo_epi16_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6) (cost  num_7) (cost  num_8))
	]
	[ (_mm256_mask_cmpneq_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(+ cost__mm256_mask_cmpneq_epu32_mask_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_o) (cost  num_8) 
		 (cost  vc_9) (cost  vc_10) (cost  prec_i))
	]
	[ (_mm512_mask_reduce_add_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(+ cost__mm512_mask_reduce_add_epi64_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  size_i_o) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i_o) (cost  num_7) (cost  num_8))
	]
	[ (_mm512_subr_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__mm512_subr_epi32_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm256_subs_epu8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__mm256_subs_epu8_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm512_abs_epi64_dsl v0 size_i_o lane_size num_3 prec_i_o num_5)
		(+ cost__mm512_abs_epi64_dsl (cost  v0) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_3) (cost  prec_i_o) (cost  num_5))
	]
	[ (_mm_urem_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__mm_urem_epi32_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm512_mask_cmple_epi32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(+ cost__mm512_mask_cmple_epi32_mask_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_o) (cost  num_8) 
		 (cost  vc_9) (cost  vc_10) (cost  prec_i))
	]
	[ (_mm_cmpeq_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8)
		(+ cost__mm_cmpeq_epi32_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6) (cost  vc_7) (cost  vc_8))
	]
	[ (_mm_maskz_adds_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(+ cost__mm_maskz_adds_epu16_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8))
	]
	[ (_mm_maskz_dpbusds_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12 num_13)
		(+ cost__mm_maskz_dpbusds_epi32_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  v4) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_7) (cost  num_8) 
		 (cost  num_9) (cost  num_10) (cost  num_11) 
		 (cost  num_12) (cost  num_13))
	]
	[ (_mm256_maskz_andnot_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(+ cost__mm256_maskz_andnot_epi32_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8))
	]
	[ (_mm256_maskz_cvtepu32_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 num_6 num_7 prec_i_o)
		(+ cost__mm256_maskz_cvtepu32_epi64_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  size_i_o) (cost  lane_size) (cost  num_5) 
		 (cost  num_6) (cost  num_7) (cost  prec_i_o))
	]
	[ (_mm256_mask_xor_epi64_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(+ cost__mm256_mask_xor_epi64_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8))
	]
	[ (_mm512_mask_rem_epu32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(+ cost__mm512_mask_rem_epu32_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8))
	]
	[ (_mm_mask_cvtepi32_epi64_dsl v0 v1 v2 size_i_o lane_size num_5 num_6 num_7 prec_i_o)
		(+ cost__mm_mask_cvtepi32_epi64_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  size_i_o) (cost  lane_size) (cost  num_5) 
		 (cost  num_6) (cost  num_7) (cost  prec_i_o))
	]
	[ (_mm512_testn_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 vc_9 prec_i)
		(+ cost__mm512_testn_epi32_mask_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_o) 
		 (cost  num_6) (cost  vc_7) (cost  vc_8) 
		 (cost  vc_9) (cost  prec_i))
	]
	[ (_mm512_reduce_add_epi64_dsl vc_0 v1 size_i lane_size num_4 prec_i_o num_6 num_7)
		(+ cost__mm512_reduce_add_epi64_dsl (cost  vc_0) (cost  v1) (cost  size_i) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6) (cost  num_7))
	]
	[ (_mm256_blendv_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		(+ cost__mm256_blendv_epi8_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  size_i_o) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i_o) (cost  num_7))
	]
	[ (_mm512_maskz_and_epi64_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(+ cost__mm512_maskz_and_epi64_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8))
	]
	[ (_mm_mask_cmplt_epi64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(+ cost__mm_mask_cmplt_epi64_mask_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_o) (cost  num_8) 
		 (cost  vc_9) (cost  vc_10) (cost  prec_i))
	]
	[ (_mm_maskz_dpwssds_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost__mm_maskz_dpwssds_epi32_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  v4) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_7) (cost  num_8) 
		 (cost  num_9) (cost  num_10) (cost  num_11) 
		 (cost  num_12))
	]
	[ (_mm512_andnot_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__mm512_andnot_epi32_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm512_reduce_and_epi64_dsl vc_0 v1 size_i lane_size num_4 prec_i_o num_6 num_7)
		(+ cost__mm512_reduce_and_epi64_dsl (cost  vc_0) (cost  v1) (cost  size_i) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6) (cost  num_7))
	]
	[ (_m_paddw_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__m_paddw_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm256_max_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__mm256_max_epi8_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm256_mask_dpbusds_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost__mm256_mask_dpbusds_epi32_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  num_7) (cost  num_8) 
		 (cost  num_9) (cost  num_10) (cost  num_11) 
		 (cost  num_12))
	]
	[ (_mm256_mask_madd52lo_epu64_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10 num_11 num_12)
		(+ cost__mm256_mask_madd52lo_epu64_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  num_7) (cost  num_8) 
		 (cost  prec_i_o) (cost  num_10) (cost  num_11) 
		 (cost  num_12))
	]
	[ (_mm256_test_epi8_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 vc_9 prec_i)
		(+ cost__mm256_test_epi8_mask_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_o) 
		 (cost  num_6) (cost  vc_7) (cost  vc_8) 
		 (cost  vc_9) (cost  prec_i))
	]
	[ (_mm256_xor_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__mm256_xor_epi32_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm512_cmpeq_epi64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(+ cost__mm512_cmpeq_epi64_mask_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_o) 
		 (cost  num_6) (cost  vc_7) (cost  vc_8) 
		 (cost  prec_i))
	]
	[ (_mm512_maskz_subs_epi8_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(+ cost__mm512_maskz_subs_epi8_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8))
	]
	[ (_mm_cmple_epu32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(+ cost__mm_cmple_epu32_mask_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_o) 
		 (cost  num_6) (cost  vc_7) (cost  vc_8) 
		 (cost  prec_i))
	]
	[ (_mm_maskz_mul_epi32_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o)
		(+ cost__mm_maskz_mul_epi32_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  num_7) (cost  num_8) 
		 (cost  prec_i_o))
	]
	[ (_mm_mulhi_pi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8)
		(+ cost__mm_mulhi_pi16_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6) (cost  num_7) (cost  num_8))
	]
	[ (_mm512_mask_cmpgt_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(+ cost__mm512_mask_cmpgt_epu32_mask_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_o) (cost  num_8) 
		 (cost  vc_9) (cost  vc_10) (cost  prec_i))
	]
	[ (_mm256_maskz_min_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(+ cost__mm256_maskz_min_epu16_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8))
	]
	[ (_mm_mask_dpwssd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11)
		(+ cost__mm_mask_dpwssd_epi32_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  num_7) (cost  num_8) 
		 (cost  num_9) (cost  num_10) (cost  num_11))
	]
	[ (_mm256_adds_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__mm256_adds_epi16_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm_dpbusds_epi32_dsl v0 v1 v2 size_i lane_size num_5 prec_i num_7 num_8)
		(+ cost__mm_dpbusds_epi32_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  size_i) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i) (cost  num_7) (cost  num_8))
	]
	[ (_mm256_cmpneq_epi8_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(+ cost__mm256_cmpneq_epi8_mask_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_o) 
		 (cost  num_6) (cost  vc_7) (cost  vc_8) 
		 (cost  prec_i))
	]
	[ (_m_pmovmskb_dsl v0 size_o lane_size num_3 prec_o num_5 num_6)
		(+ cost__m_pmovmskb_dsl (cost  v0) (cost  size_o) (cost  lane_size) 
		 (cost  num_3) (cost  prec_o) (cost  num_5) 
		 (cost  num_6))
	]
	[ (_mm512_div_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
		(+ cost__mm512_div_epi64_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6) (cost  num_7))
	]
	[ (_mm512_mask_cvtepi32_epi8_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(+ cost__mm512_mask_cvtepi32_epi8_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  size_i_o) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i_o) (cost  num_7) (cost  num_8))
	]
	[ (_mm_mask_mul_epu32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o)
		(+ cost__mm_mask_mul_epu32_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  num_7) (cost  num_8) 
		 (cost  prec_i_o))
	]
	[ (_mm_cmpgt_epi8_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(+ cost__mm_cmpgt_epi8_mask_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_o) 
		 (cost  num_6) (cost  vc_7) (cost  vc_8) 
		 (cost  prec_i))
	]
	[ (_mm512_mask_cmplt_epu64_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(+ cost__mm512_mask_cmplt_epu64_mask_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_o) (cost  num_8) 
		 (cost  vc_9) (cost  vc_10) (cost  prec_i))
	]
	[ (_mm512_mask_reduce_and_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(+ cost__mm512_mask_reduce_and_epi64_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  size_i_o) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i_o) (cost  num_7) (cost  num_8))
	]
	[ (_mm256_mask_dpwssds_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11)
		(+ cost__mm256_mask_dpwssds_epi32_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  num_7) (cost  num_8) 
		 (cost  num_9) (cost  num_10) (cost  num_11))
	]
	[ (_mm_cvtepi16_epi64_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o)
		(+ cost__mm_cvtepi16_epi64_dsl (cost  v0) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_3) (cost  prec_i) (cost  num_5) 
		 (cost  prec_o))
	]
	[ (_mm_mask_blend_epi64_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		(+ cost__mm_mask_blend_epi64_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  size_i_o) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i_o) (cost  num_7))
	]
	[ (_mm256_mask_cmple_epu32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(+ cost__mm256_mask_cmple_epu32_mask_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_o) (cost  num_8) 
		 (cost  vc_9) (cost  vc_10) (cost  prec_i))
	]
	[ (_mm512_maskz_mov_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		(+ cost__mm512_maskz_mov_epi64_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  size_i_o) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i_o) (cost  num_7))
	]
	[ (_mm_cvtepu16_epi32_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o)
		(+ cost__mm_cvtepu16_epi32_dsl (cost  v0) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_3) (cost  prec_i) (cost  num_5) 
		 (cost  prec_o))
	]
	[ (_mm256_broadcastmw_epi32_dsl v0 size_o lane_size num_3 prec_i num_5 prec_o num_7)
		(+ cost__mm256_broadcastmw_epi32_dsl (cost  v0) (cost  size_o) (cost  lane_size) 
		 (cost  num_3) (cost  prec_i) (cost  num_5) 
		 (cost  prec_o) (cost  num_7))
	]
	[ (_mm512_mask_div_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9)
		(+ cost__mm512_mask_div_epi32_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8) 
		 (cost  num_9))
	]
	[ (_mm512_maskz_maddubs_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10)
		(+ cost__mm512_maskz_maddubs_epi16_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  num_7) (cost  num_8) 
		 (cost  prec_i_o) (cost  num_10))
	]
	[ (_mm256_maskz_dpwssd_epi32_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost__mm256_maskz_dpwssd_epi32_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  v4) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_7) (cost  num_8) 
		 (cost  num_9) (cost  num_10) (cost  num_11) 
		 (cost  num_12))
	]
	[ (_mm_cmplt_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(+ cost__mm_cmplt_epi32_mask_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_o) 
		 (cost  num_6) (cost  vc_7) (cost  vc_8) 
		 (cost  prec_i))
	]
	[ (_mm512_mask_cmpge_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(+ cost__mm512_mask_cmpge_epi16_mask_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_o) (cost  num_8) 
		 (cost  vc_9) (cost  vc_10) (cost  prec_i))
	]
	[ (_mm_dpwssds_epi32_dsl v0 v1 v2 size_i lane_size num_5 prec_i num_7)
		(+ cost__mm_dpwssds_epi32_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  size_i) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i) (cost  num_7))
	]
	[ (_mm_or_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__mm_or_epi32_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm_dpwssd_epi32_dsl v0 v1 v2 size_i lane_size num_5 prec_i num_7)
		(+ cost__mm_dpwssd_epi32_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  size_i) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i) (cost  num_7))
	]
	[ (_mm256_maskz_mulhrs_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 vc_10 vc_11 num_12)
		(+ cost__mm256_maskz_mulhrs_epi16_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8) 
		 (cost  num_9) (cost  vc_10) (cost  vc_11) 
		 (cost  num_12))
	]
	[ (_mm512_subs_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__mm512_subs_epi16_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm256_mul_epu32_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o)
		(+ cost__mm256_mul_epu32_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i) 
		 (cost  num_6) (cost  prec_o))
	]
	[ (_mm512_min_epu64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__mm512_min_epu64_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm512_mask_reduce_or_epi64_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(+ cost__mm512_mask_reduce_or_epi64_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  size_i_o) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i_o) (cost  num_7) (cost  num_8))
	]
	[ (_mm256_cmpgt_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8)
		(+ cost__mm256_cmpgt_epi8_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6) (cost  vc_7) (cost  vc_8))
	]
	[ (_mm256_cmplt_epu16_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(+ cost__mm256_cmplt_epu16_mask_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_o) 
		 (cost  num_6) (cost  vc_7) (cost  vc_8) 
		 (cost  prec_i))
	]
	[ (_mm256_mulhrs_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 vc_8 vc_9 num_10)
		(+ cost__mm256_mulhrs_epi16_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6) (cost  num_7) (cost  vc_8) 
		 (cost  vc_9) (cost  num_10))
	]
	[ (_mm512_min_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__mm512_min_epi8_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm_cvtusepi64_epi32_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i)
		(+ cost__mm_cvtusepi64_epi32_dsl (cost  v0) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_3) (cost  prec_o) (cost  num_5) 
		 (cost  prec_i))
	]
	[ (_mm512_reduce_or_epi64_dsl vc_0 v1 size_i lane_size num_4 prec_i_o num_6 num_7)
		(+ cost__mm512_reduce_or_epi64_dsl (cost  vc_0) (cost  v1) (cost  size_i) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6) (cost  num_7))
	]
	[ (_mm_blend_epi16_dsl v0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		(+ cost__mm_blend_epi16_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  size_i_o) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i_o) (cost  num_7))
	]
	[ (_mm256_movm_epi64_dsl v0 size_o lane_size num_3 prec_o num_5 vc_6 vc_7)
		(+ cost__mm256_movm_epi64_dsl (cost  v0) (cost  size_o) (cost  lane_size) 
		 (cost  num_3) (cost  prec_o) (cost  num_5) 
		 (cost  vc_6) (cost  vc_7))
	]
	[ (_mm256_maskz_madd_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 prec_i_o num_10)
		(+ cost__mm256_maskz_madd_epi16_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  num_7) (cost  num_8) 
		 (cost  prec_i_o) (cost  num_10))
	]
	[ (_mm512_mask_adds_epi16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(+ cost__mm512_mask_adds_epi16_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8))
	]
	[ (_mm_maskz_avg_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 vc_9 vc_10)
		(+ cost__mm_maskz_avg_epu16_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8) 
		 (cost  vc_9) (cost  vc_10))
	]
	[ (_mm_mask_or_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(+ cost__mm_mask_or_epi32_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8))
	]
	[ (_mm_maskz_abs_epi16_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7)
		(+ cost__mm_maskz_abs_epi16_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  size_i_o) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i_o) (cost  num_7))
	]
	[ (_mm512_and_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__mm512_and_epi32_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm256_cmpgt_epu32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(+ cost__mm256_cmpgt_epu32_mask_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_o) 
		 (cost  num_6) (cost  vc_7) (cost  vc_8) 
		 (cost  prec_i))
	]
	[ (_mm_cmpge_epu64_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(+ cost__mm_cmpge_epu64_mask_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_o) 
		 (cost  num_6) (cost  vc_7) (cost  vc_8) 
		 (cost  prec_i))
	]
	[ (_mm512_mask_subs_epu16_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(+ cost__mm512_mask_subs_epu16_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8))
	]
	[ (_mm_cmplt_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 vc_7 vc_8)
		(+ cost__mm_cmplt_epi32_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6) (cost  vc_7) (cost  vc_8))
	]
	[ (_mm256_maskz_set1_epi8_dsl vc_0 v1 v2 size_i_o lane_size num_5 prec_i_o num_7 num_8)
		(+ cost__mm256_maskz_set1_epi8_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  size_i_o) (cost  lane_size) (cost  num_5) 
		 (cost  prec_i_o) (cost  num_7) (cost  num_8))
	]
	[ (_mm_adds_pu16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__mm_adds_pu16_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm256_mask_cmpeq_epi32_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 prec_i)
		(+ cost__mm256_mask_cmpeq_epi32_mask_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_o) (cost  num_8) 
		 (cost  vc_9) (cost  vc_10) (cost  prec_i))
	]
	[ (_mm_maskz_add_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(+ cost__mm_maskz_add_epi16_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8))
	]
	[ (_mm256_maskz_mulhi_epi16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8 num_9 num_10)
		(+ cost__mm256_maskz_mulhi_epi16_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8) 
		 (cost  num_9) (cost  num_10))
	]
	[ (_m_pmaxub_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__m_pmaxub_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm_udiv_epi32_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
		(+ cost__mm_udiv_epi32_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6) (cost  num_7))
	]
	[ (_mm512_broadcast_i64x2_dsl v0 size_i_o lane_size num_3 prec_i_o num_5 num_6)
		(+ cost__mm512_broadcast_i64x2_dsl (cost  v0) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_3) (cost  prec_i_o) (cost  num_5) 
		 (cost  num_6))
	]
	[ (_mm512_cmple_epi32_mask_dsl v0 v1 size_i_o lane_size num_4 prec_o num_6 vc_7 vc_8 prec_i)
		(+ cost__mm512_cmple_epi32_mask_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_o) 
		 (cost  num_6) (cost  vc_7) (cost  vc_8) 
		 (cost  prec_i))
	]
	[ (_mm256_maskz_max_epu16_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(+ cost__mm256_maskz_max_epu16_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8))
	]
	[ (_mm512_maskz_madd52lo_epu64_dsl vc_0 v1 v2 v3 v4 size_i_o lane_size num_7 num_8 num_9 prec_i_o num_11 num_12 num_13)
		(+ cost__mm512_maskz_madd52lo_epu64_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  v4) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_7) (cost  num_8) 
		 (cost  num_9) (cost  prec_i_o) (cost  num_11) 
		 (cost  num_12) (cost  num_13))
	]
	[ (_mm_mask_dpbusd_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 num_7 num_8 num_9 num_10 num_11 num_12)
		(+ cost__mm_mask_dpbusd_epi32_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  num_7) (cost  num_8) 
		 (cost  num_9) (cost  num_10) (cost  num_11) 
		 (cost  num_12))
	]
	[ (_mm256_broadcastq_epi64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6)
		(+ cost__mm256_broadcastq_epi64_dsl (cost  v0) (cost  size_o) (cost  lane_size) 
		 (cost  num_3) (cost  prec_i_o) (cost  num_5) 
		 (cost  num_6))
	]
	[ (_mm_movepi16_mask_dsl v0 size_o lane_size num_3 prec_o num_5 num_6 vc_7 vc_8)
		(+ cost__mm_movepi16_mask_dsl (cost  v0) (cost  size_o) (cost  lane_size) 
		 (cost  num_3) (cost  prec_o) (cost  num_5) 
		 (cost  num_6) (cost  vc_7) (cost  vc_8))
	]
	[ (_mm256_mask_test_epi16_mask_dsl vc_0 v1 v2 v3 size_i_o lane_size num_6 prec_o num_8 vc_9 vc_10 vc_11 prec_i)
		(+ cost__mm256_mask_test_epi16_mask_dsl (cost  vc_0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_o) (cost  num_8) 
		 (cost  vc_9) (cost  vc_10) (cost  vc_11) 
		 (cost  prec_i))
	]
	[ (_mm256_mask_max_epi8_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(+ cost__mm256_mask_max_epi8_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8))
	]
	[ (_mm_madd_epi16_dsl v0 v1 size_i_o lane_size num_4 prec_i num_6 prec_o num_8)
		(+ cost__mm_madd_epi16_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i) 
		 (cost  num_6) (cost  prec_o) (cost  num_8))
	]
	[ (_mm512_mask_subr_epi32_dsl v0 v1 v2 v3 size_i_o lane_size num_6 prec_i_o num_8)
		(+ cost__mm512_mask_subr_epi32_dsl (cost  v0) (cost  v1) (cost  v2) 
		 (cost  v3) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_6) (cost  prec_i_o) (cost  num_8))
	]
	[_ 1]
 )
)
;; ================================================================================

;; ================================================================================
;;                                DSL Grammar
;; ================================================================================

(define (mem vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[(choose* #t #f)
	(
		vector-load_dsl
		(mem vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		512				;; Lane Size 
		(idx-add (idx-mul (idx-i 0) 8)	(idx-j 0))			;; Loop Index Variable 
		2				;; Integer Operand 
		8				;; Precision Operand 
	)]
	[(choose* #t #f)
	(
		vector-load_dsl
		(reg 0) ;; 512-bit Bitvector operand
		512				;; Lane Size 
		(idx-add (idx-mul (idx-i 0) 8)	(idx-j 0))			;; Loop Index Variable 
		4				;; Integer Operand 
		8				;; Precision Operand 
	)]
	[(choose* #t #f)
	(
		vector-load_dsl
		(reg 1) ;; 512-bit Bitvector operand
		512				;; Lane Size 
		(idx-add (idx-mul (idx-i 0) 8)	(idx-j 0))			;; Loop Index Variable 
		4				;; Integer Operand 
		8				;; Precision Operand 
	)]
	[(choose* #t #f)
	(
		vector-load_dsl
		(mem vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		512				;; Lane Size 
		(idx-add (idx-mul (idx-i 0) 8)	(idx-j 0))			;; Loop Index Variable 
		6				;; Integer Operand 
		8				;; Precision Operand 
	)]
	[else
	(
		vector-load_dsl
		(mem vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		512				;; Lane Size 
		(idx-add (idx-mul (idx-i 0) 8)	(idx-j 0))			;; Loop Index Variable 
		8				;; Integer Operand 
		8				;; Precision Operand 
	)]
	)
)

(define (operations vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[(choose* #t #f)
	(
		_mm256_mask_min_epi16_dsl
		(operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 32-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		256				;; Integer Operand 
		256				;; Lane Size 
		256				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_cvtepi64_epi8_dsl
		(operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		32				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
		64				;; Precision Operand 
	)]
	[(choose* #t #f)
	(
		_m_paddw_dsl
		(operations vars #:depth (- k 1)) ;; 64-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 64-bit Bitvector operand
		32				;; Integer Operand 
		32				;; Lane Size 
		32				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
	)
    ]
	[(choose* #t #f)
	(
		_mm256_max_epi8_dsl
		(operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		256				;; Integer Operand 
		256				;; Lane Size 
		256				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_maskz_min_epu16_dsl
		(operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 64-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		512				;; Integer Operand 
		512				;; Lane Size 
		512				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_mask_cvtepi32_epi8_dsl
		(operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 16-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
		32				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm_mask_blend_epi64_dsl
		(operations vars #:depth (- k 1)) ;; 32-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		256				;; Integer Operand 
		256				;; Lane Size 
		256				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_maskz_mov_epi64_dsl
		(lit (bv #b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 128)))				;; 128-bit Constant Bitvector operand
		(operations vars #:depth (- k 1)) ;; 16-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_min_epu64_dsl
		(operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		256				;; Integer Operand 
		256				;; Lane Size 
		256				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_min_epi8_dsl
		(operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 512-bit Bitvector operand
		512				;; Integer Operand 
		512				;; Lane Size 
		512				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_maskz_set1_epi8_dsl
		(lit (bv #b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 256)))				;; 256-bit Constant Bitvector operand
		(operations vars #:depth (- k 1)) ;; 32-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 8-bit Bitvector operand
		256				;; Integer Operand 
		256				;; Lane Size 
		256				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm_maskz_add_epi16_dsl
		(lit (bv #b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 (bitvector 128)))				;; 128-bit Constant Bitvector operand
		(operations vars #:depth (- k 1)) ;; 16-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		128				;; Integer Operand 
		128				;; Lane Size 
		128				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_m_pmaxub_dsl
		(operations vars #:depth (- k 1)) ;; 64-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 64-bit Bitvector operand
		64				;; Integer Operand 
		64				;; Lane Size 
		64				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_maskz_max_epu16_dsl
		(operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 32-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		256				;; Integer Operand 
		256				;; Lane Size 
		256				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm256_mask_max_epi8_dsl
		(operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 32-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 256-bit Bitvector operand
		256				;; Integer Operand 
		256				;; Lane Size 
		256				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[else
	(mem vars #:depth (- k 1))
	]
	)
)

(define tensor_add_grammar (operations (list (reg 0) (reg 1)) #:depth 3 ))

;; ================================================================================

;; ================================================================================
;;                                Reference Specification
;; ================================================================================
(define (tensor-add v1 v2 row col prec)
(apply concat
 (for/list ([i (range row)])
(apply concat
(for/list ([j (range col)])
       (define left_offset (+ (* i col ) j))
       (define right_offset (- (* row col) left_offset))
       (define offset (- right_offset 1))

(bvadd
(extract (+ (* offset prec) (- prec 1)) (* offset prec) v1)
(extract (+ (* offset prec) (- prec 1)) (* offset prec) v2)
    )
 ) 
)
 )
 )
 )
;; ================================================================================

;; ================================================================================
;;                                Synthesis Query
;; ================================================================================
(define cex_0_0 (bv #x00201112020201220111101120221212222100010021210000122020021222221010121020122102122200011120112120100201201101002101211102011011 (bitvector 512)))
(define cex_0_1 (bv #x01222110211010221201101021210121012120022211100212011100000001211112212102211000121101201221011122221001022211100002122022201111 (bitvector 512)))
(define env_0_i0_j0 (vector cex_0_0 cex_0_1 0 0))
(define env_0_i0_j4 (vector cex_0_0 cex_0_1 0 4))
(define env_0_i1_j0 (vector cex_0_0 cex_0_1 1 0))
(define env_0_i1_j4 (vector cex_0_0 cex_0_1 1 4))
(define env_0_i2_j0 (vector cex_0_0 cex_0_1 2 0))
(define env_0_i2_j4 (vector cex_0_0 cex_0_1 2 4))
(define env_0_i3_j0 (vector cex_0_0 cex_0_1 3 0))
(define env_0_i3_j4 (vector cex_0_0 cex_0_1 3 4))
(define env_0_i4_j0 (vector cex_0_0 cex_0_1 4 0))
(define env_0_i4_j4 (vector cex_0_0 cex_0_1 4 4))
(define env_0_i5_j0 (vector cex_0_0 cex_0_1 5 0))
(define env_0_i5_j4 (vector cex_0_0 cex_0_1 5 4))
(define env_0_i6_j0 (vector cex_0_0 cex_0_1 6 0))
(define env_0_i6_j4 (vector cex_0_0 cex_0_1 6 4))
(define env_0_i7_j0 (vector cex_0_0 cex_0_1 7 0))
(define env_0_i7_j4 (vector cex_0_0 cex_0_1 7 4))


;; Assuming row major matricies
(define (ext-matrix-row mat rows cols row_idx type-size)
  (define row_size (* cols type-size))
  (ext-bv mat row_idx row_size)
  )

(define (print-vector vec len precision)
  (for/list ( [i (reverse (range len))] )
            (define ith_val (ext-bv vec i precision))
            (print (bitvector->integer ith_val))
            (display " ")
            )
  (displayln "")
  )

(define (print-mat mat rows cols precision)
  (for/list ( [i (reverse (range rows))] )
            (define row (ext-matrix-row mat rows cols i precision))
            (print-vector row cols precision)
            )
  mat
  )

(displayln "Left Operand")
(print-mat cex_0_0 8 8 8)


(displayln "Right Operand")
(print-mat cex_0_1 8 8 8)

(displayln "Result")

(print-mat (tensor-add cex_0_0 cex_0_1 8 8 8) 8 8 8)

(define left_op (vector-load_dsl
		(reg 0 ) ;; 512-bit Bitvector operand
		512				;; Lane Size 
		(idx-add (idx-mul (idx-i 0) 8)	(idx-j 0))			;; Loop Index Variable 
		4				;; Integer Operand 
		8				;; Precision Operand 
))

(define right_op (vector-load_dsl
		(reg 1 ) ;; 512-bit Bitvector operand
		512				;; Lane Size 
		(idx-add (idx-mul (idx-i 0) 8)	(idx-j 0))			;; Loop Index Variable 
		4				;; Integer Operand 
		8				;; Precision Operand 
))

(define result 
	(
		_m_paddw_dsl
		left_op  ;; 64-bit Bitvector operand
		right_op ;; 64-bit Bitvector operand
		32				;; Integer Operand 
		32				;; Lane Size 
		32				;; Integer Operand 
		8				;; Precision Operand 
		0				;; Integer Operand 
	)
)

(displayln "Sketch Slice")
(println (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 0 4 8))

(displayln "DSL Slice")
(println (interpret result env_0_i0_j0))

(displayln "Sketch Slice")
(println (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 4 4 8))

(displayln "DSL Slice")
(println (interpret result env_0_i0_j4))

(define (synthesis-res a b) 
(apply concat
 (for/list ([i (range 8)])
(apply concat
(for/list ([j (in-range 0 8 4)])
          (interpret result (vector a b i j))
  )
)
)
 )
)

(displayln "Looped Result")
(print-mat (synthesis-res cex_0_0 cex_0_1) 8 8 8)

(displayln "Are Equal?")
(println (equal?  (synthesis-res cex_0_0 cex_0_1) (tensor-add cex_0_0 cex_0_1 8 8 8) ) )


(displayln "Beginning Synthesis")
(define sol
(synthesize 
 #:forall (list cex_0_0 cex_0_1 )
 #:guarantee 
	(begin

		(assert (equal? (interpret tensor_add_grammar env_0_i0_j0) (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 0 4 8)))
		(assert (equal? (interpret tensor_add_grammar env_0_i0_j4) (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 4 4 8)))
		(assert (equal? (interpret tensor_add_grammar env_0_i1_j0) (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 8 4 8)))
		(assert (equal? (interpret tensor_add_grammar env_0_i1_j4) (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 12 4 8)))
		(assert (equal? (interpret tensor_add_grammar env_0_i2_j0) (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 16 4 8)))
		(assert (equal? (interpret tensor_add_grammar env_0_i2_j4) (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 20 4 8)))
		(assert (equal? (interpret tensor_add_grammar env_0_i3_j0) (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 24 4 8)))
		(assert (equal? (interpret tensor_add_grammar env_0_i3_j4) (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 28 4 8)))
		(assert (equal? (interpret tensor_add_grammar env_0_i4_j0) (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 32 4 8)))
		(assert (equal? (interpret tensor_add_grammar env_0_i4_j4) (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 36 4 8)))
		(assert (equal? (interpret tensor_add_grammar env_0_i5_j0) (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 40 4 8)))
		(assert (equal? (interpret tensor_add_grammar env_0_i5_j4) (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 44 4 8)))
		(assert (equal? (interpret tensor_add_grammar env_0_i6_j0) (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 48 4 8)))
		(assert (equal? (interpret tensor_add_grammar env_0_i6_j4) (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 52 4 8)))
		(assert (equal? (interpret tensor_add_grammar env_0_i7_j0) (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 56 4 8)))
		(assert (equal? (interpret tensor_add_grammar env_0_i7_j4) (vector-load (tensor-add cex_0_0 cex_0_1 8 8 8) 512 60 4 8)))
		))
)
;; ================================================================================


(assert (sat? sol) "Unsatisfiable")
(define synth_res (evaluate tensor_add_grammar sol))
(pretty-print synth_res)
(display "synth cost: ")
(println (cost synth_res))
