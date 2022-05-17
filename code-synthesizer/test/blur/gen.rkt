#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)


(current-solver (boolector))
(current-bitwidth 8)



(custodian-limit-memory (current-custodian) (* 22000 1024 1024))


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

(displayln "Running automatically generated file ... ")
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
  (define %8.high.idx (- %arg0 1)) ;; (- 32 1)  = 31
  (define %8.low.idx (- %8.high.idx %elemsize -1 )) ;; (- 31 16 -1) = 16
  (define %8 (extract  (- %elemsize 1) 0 %7)) ;; extracts bits from 16 to 31
  ;(define %8 (extract  %8.high.idx %8.low.idx %7)) ;; extracts bits from 16 to 31
  %8
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


;; ================================================================================

;; ================================================================================
;;                                Struct Definitions
;; ================================================================================
(struct reg (id) #:transparent #:mutable)
(struct lit (val) #:transparent)
(struct idx-i (id) #:transparent #:mutable)
(struct idx-j (id) #:transparent #:mutable)
(struct dim-x (id) #:transparent #:mutable)
(struct dim-y (id) #:transparent #:mutable)
(struct nop (v1) #:transparent)
(struct idx-add ([i1 #:mutable] [i2 #:mutable] ) #:transparent )
(struct idx-mul ([i1 #:mutable] [i2 #:mutable] ) #:transparent )
(struct vector-choose_dsl (num_elems) #:transparent)
(struct vector-load_dsl ([v0 #:mutable] lane_size num_2 num_3 prec_i_o) #:transparent)
(struct vector-two-input-swizzle_dsl ([v0 #:mutable] [v1 #:mutable] num_2 prec_i_o num_4 lane_size num_6 num_7 num_8) #:transparent)
(struct _mm_mulhi_pi16_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8) #:transparent)
(struct _mm256_cvtepi64_epi8_dsl ([v0 #:mutable] size_i_o lane_size num_3 prec_o num_5 prec_i) #:transparent)
(struct _m_paddw_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm256_max_epi8_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm512_div_epi64_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6 num_7) #:transparent)
(struct _mm_cvtepi16_epi64_dsl ([v0 #:mutable] size_i_o lane_size num_3 prec_i num_5 prec_o) #:transparent)
(struct _mm512_min_epu64_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm512_min_epi8_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _m_pmaxub_dsl ([v0 #:mutable] [v1 #:mutable] size_i_o lane_size num_4 prec_i_o num_6) #:transparent)
(struct _mm256_broadcastq_epi64_dsl ([v0 #:mutable] size_o lane_size num_3 prec_i_o num_5 num_6) #:transparent)
;; ================================================================================

;; ================================================================================
;;                                DSL Interpreter
;; ================================================================================
(define (interpret prog env)
 (destruct prog
	[(dim-x id) (vector-ref env (- (vector-length env) 2))]
	[(dim-y id) (vector-ref env (- (vector-length env) 1))]
	[(idx-i id) (vector-ref env (- (vector-length env) 4))]
	[(idx-j id) (vector-ref env (- (vector-length env) 3))]
	[(reg id) (vector-ref env id)]
	[(lit v) v]
	[(nop v1) (interpret v1 env)]
	[(idx-add i1 i2) (+ (interpret i1 env) (interpret i2 env))]
	[(idx-mul i1 i2) (* (interpret i1 env) (interpret i2 env))]
	
	[ (vector-choose_dsl  num_elems)
        (define random-regs (for/list ([i (range (vector-length env))])  (reg i)))
        (apply concat
         (for/list ([i (range num_elems)])
                  (interpret (apply choose* random-regs) env)
            )
         )
	]
	[ (vector-load_dsl v0 size_i_o num_2 num_3 prec_i_o)
		(assert (equal? size_i_o (get-length v0 env)))
		(vector-load (interpret v0 env) (interpret size_i_o env) (interpret num_2 env) 
		 (interpret num_3 env) (interpret prec_i_o env))
	]
	[ (vector-two-input-swizzle_dsl v0 v1 num_2 prec_i_o num_4 lane_size num_6 num_7 num_8)
		(vector-two-input-swizzle (interpret v0 env) (interpret v1 env) (interpret num_2 env) 
		 (interpret prec_i_o env) (interpret num_4 env) (interpret lane_size env) 
		 (interpret num_6 env) (interpret num_7 env) (interpret num_8 env))
	]
	[ (_mm_mulhi_pi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8)
		(assert (equal? (get-length v0 env) (get-length v1 env)))
		(assert (equal? size_i_o (get-length v0 env)))
		(assert (equal? size_i_o (get-length v1 env)))
		(_mm_mulhi_pi16 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env) (interpret num_7 env) (interpret num_8 env))
	]
	[ (_mm256_cvtepi64_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i)
		(_mm256_cvtepi64_epi8 (interpret v0 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_3 env) (interpret prec_o env) (interpret num_5 env) 
		 (interpret prec_i env))
	]
	[ (_m_paddw_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(assert (equal? (get-length v0 env) (get-length v1 env)))
		(assert (equal? size_i_o (get-length v0 env)))
		(assert (equal? size_i_o (get-length v1 env)))
		(_m_paddw (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm256_max_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_mm256_max_epi8 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm512_div_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
		(assert (equal? (get-length v0 env) (get-length v1 env)))
		(assert (equal? size_i_o (get-length v0 env)))
		(assert (equal? size_i_o (get-length v1 env)))
		(_mm512_div_epi64 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env) (interpret num_7 env))
	]
	[ (_mm_cvtepi16_epi64_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o)
		(_mm_cvtepi16_epi64 (interpret v0 env) (interpret size_i_o env) (interpret lane_size env) 
		 (interpret num_3 env) (interpret prec_i env) (interpret num_5 env) 
		 (interpret prec_o env))
	]
	[ (_mm512_min_epu64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_mm512_min_epu64 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm512_min_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_mm512_min_epi8 (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_m_pmaxub_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(_m_pmaxub (interpret v0 env) (interpret v1 env) (interpret size_i_o env) 
		 (interpret lane_size env) (interpret num_4 env) (interpret prec_i_o env) 
		 (interpret num_6 env))
	]
	[ (_mm256_broadcastq_epi64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6)
		(_mm256_broadcastq_epi64 (interpret v0 env) (interpret size_o env) (interpret lane_size env) 
		 (interpret num_3 env) (interpret prec_i_o env) (interpret num_5 env) 
		 (interpret num_6 env))
	]
	[v v]
 )
)
;; ================================================================================

;; ================================================================================
;;                                DSL Cost Model
;; ================================================================================
(define cost__mm256_cvtepi64_epi8_dsl 4)
(define cost__m_paddw_dsl 1)
(define cost__mm256_max_epi8_dsl 1)
(define cost__mm512_div_epi64_dsl 1)
(define cost__mm_cvtepi16_epi64_dsl 1)
(define cost__mm512_min_epu64_dsl 3)
(define cost__mm512_min_epi8_dsl 1)
(define cost__m_pmaxub_dsl 1)
(define cost__mm256_broadcastq_epi64_dsl 3)
(define cost__mm_mulhi_pi16_dsl 5)

(define (cost prog)
 (destruct prog
	[(idx-i id) 1]
	[(idx-j id) 1]
	[(reg id) 1]
	[(lit v) 1 ]
	[(nop v1) (+ 1 (cost v1))]
	[(dim-x id) 1]
	[(dim-y id) 1]
	[(idx-add i1 i2) (+ 1 (cost i1) (cost i2))]
	[(idx-mul i1 i2) (+ 1 (cost i1) (cost i2))]
	[(vector-choose_dsl n ) n]
	[ (_mm_mulhi_pi16_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7 num_8)
		(+ cost__mm_mulhi_pi16_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6) (cost  num_7) (cost  num_8))
	]
	[ (_mm256_cvtepi64_epi8_dsl v0 size_i_o lane_size num_3 prec_o num_5 prec_i)
		(+ cost__mm256_cvtepi64_epi8_dsl (cost  v0) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_3) (cost  prec_o) (cost  num_5) 
		 (cost  prec_i))
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
	[ (_mm512_div_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
		(+ cost__mm512_div_epi64_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6) (cost  num_7))
	]
	[ (_mm_cvtepi16_epi64_dsl v0 size_i_o lane_size num_3 prec_i num_5 prec_o)
		(+ cost__mm_cvtepi16_epi64_dsl (cost  v0) (cost  size_i_o) (cost  lane_size) 
		 (cost  num_3) (cost  prec_i) (cost  num_5) 
		 (cost  prec_o))
	]
	[ (_mm512_min_epu64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__mm512_min_epu64_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm512_min_epi8_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__mm512_min_epi8_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_m_pmaxub_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
		(+ cost__m_pmaxub_dsl (cost  v0) (cost  v1) (cost  size_i_o) 
		 (cost  lane_size) (cost  num_4) (cost  prec_i_o) 
		 (cost  num_6))
	]
	[ (_mm256_broadcastq_epi64_dsl v0 size_o lane_size num_3 prec_i_o num_5 num_6)
		(+ cost__mm256_broadcastq_epi64_dsl (cost  v0) (cost  size_o) (cost  lane_size) 
		 (cost  num_3) (cost  prec_i_o) (cost  num_5) 
		 (cost  num_6))
	]
	[_ 1]
 )
)


;;

;; Factor to scale values down by during synthesis
(define scale_factor 1)


(define (get-length prog env)
 (destruct prog
	[(idx-i id) 1]
	[(idx-j id) 1]
	[(reg id) (bvlength (vector-ref env id))]
	[(lit v) (bvlength v) ]
	[(nop v1)  (get-length v1 env)]
	[(dim-x id) 1]
	[(dim-y id) 1]
	[(idx-add i1 i2) 1]
	[(idx-mul i1 i2) 1]
	[ (_m_paddw_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6)
     size_i_o
	]
	[ (_mm512_div_epi64_dsl v0 v1 size_i_o lane_size num_4 prec_i_o num_6 num_7)
     size_i_o
	]

	[ (vector-load_dsl v0 lane_size num_2 num_3 prec_i_o)
     (* num_3 prec_i_o)
	]
	[_ 1]
 )
)
;; ================================================================================

(displayln "Creating Grammar ...")

;; ================================================================================
;;                                DSL Grammar
;; ================================================================================

(define (mem vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
    [(choose* #t #f)
     (lit (?? (bitvector (/ 128 scale_factor ))))
     ]
    [(choose* #t #f)
     (vector-load_dsl (apply choose* vars) (/ 384 scale_factor) 0 8 (/ 16 scale_factor) )
     ]
    [(choose* #t #f)

     (vector-load_dsl (apply choose* vars) (/ 384 scale_factor) 8 8 (/ 16 scale_factor) )
     ]
    [else
     (vector-load_dsl (apply choose* vars) (/ 384 scale_factor) 16 8 (/ 16 scale_factor) )
     ]
	;[else
	;(lit (?? (bitvector 128)))
	;]
	)
)

(define (shuffle vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(shuffle vars #:depth (- k 1)) ;; 640-bit Bitvector operand
		(shuffle vars #:depth (- k 1)) ;; 640-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(shuffle vars #:depth (- k 1)) ;; 640-bit Bitvector operand
		(shuffle vars #:depth (- k 1)) ;; 640-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(shuffle vars #:depth (- k 1)) ;; 640-bit Bitvector operand
		(shuffle vars #:depth (- k 1)) ;; 640-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		2				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		vector-two-input-swizzle_dsl
		(shuffle vars #:depth (- k 1)) ;; 640-bit Bitvector operand
		(shuffle vars #:depth (- k 1)) ;; 640-bit Bitvector operand
		8				;; Integer Operand 
		16				;; Precision Operand 
		0				;; Integer Operand 
		8				;; Lane Size 
		4				;; Integer Operand 
		1				;; Integer Operand 
		0				;; Integer Operand 
	)]
	[else
	(mem vars #:depth k)
	]
	)
)

(define (operations vars #:depth k)
	(assert (> k 0))
	(cond
	[(choose* #t #f) (apply choose* vars)]
    [(choose* #t #f) 
     
     (nop
		(operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
       )
     ]
	[(choose* #t #f)
	(
		_m_paddw_dsl
		(operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(/ 128 scale_factor)				;; Integer Operand 
		(/ 128 scale_factor)			;; Lane Size 
		(/ 128 scale_factor)				;; Integer Operand 
		(/ 16 scale_factor)				;; Precision Operand 
		0				;; Integer Operand 
	)]
	[(choose* #t #f)
	(
		_mm512_div_epi64_dsl
		(operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
		(/ 128 scale_factor)				;; Integer Operand 
		(/ 128 scale_factor)				;; Lane Size 
		(/ 128 scale_factor)				;; Integer Operand 
		(/ 16 scale_factor)				;; Precision Operand 
		0				;; Integer Operand 
		(/ 32 scale_factor)				;; Integer Operand 
	)]
	;[(choose* #t #f)
	;(
	;	_mm_mulhi_pi16_dsl
	;	(operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
	;	(operations vars #:depth (- k 1)) ;; 128-bit Bitvector operand
	;	128				;; Integer Operand 
	;	128				;; Lane Size 
	;	128				;; Integer Operand 
	;	16				;; Precision Operand 
    ;		0				;; Integer Operand 
    ;    16
	;	32				;; Integer Operand 
	;)]
	[else
	(shuffle vars #:depth k)
	]
	)
)


;; Assuming row major matricies
(define (ext-matrix-row mat rows cols row_idx type-size)
  (define row_size (* cols type-size))
  (assume (>= row_idx 0))
  (assume (< row_idx rows))
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

;; Scalar implementation for tiled blur-x
(define (blur-x img)
  (define i_bound 3)
  (define rows 3)
  (define cols 8)
  (define ip (/ 16 scale_factor)) 
  (define op (/ 32 scale_factor))
  (define img-size (* rows cols ip))

  (define three (apply concat (for/list ([k (range cols)]) (bv 3 (bitvector ip)) ) ) )
  (apply concat 
         (for/list ([i (range 1)])
                   (define reduce
                     (apply concat (for/list ([j (reverse (range cols))])
                                             (bvadd
                                               ;; i,j
                                               (ext-bv img (+ (* i  cols) j) ip)
                                               ;; i,j+1
                                               (ext-bv img (+ (* (+ i 1)  cols) j ) ip)
                                               ;; i,j+2
                                               (ext-bv img (+ (* (+ i 2)  cols) j ) ip)
                                               )
                                             )

                            )



                     )

                   (define divide (apply concat (for/list ([k (reverse (range cols))])
                                                          (define divide-res 
                                                            (bvsdiv 
                                                                (sign-extend (ext-bv reduce k ip) (bitvector op) )
                                                                (sign-extend (ext-bv three k ip) (bitvector op) )
                                                            )
                                                          )
                                                          (extract (- ip 1) 0 divide-res )
                                            ))
                   )
                   divide
                   )
         )
  )


(define (blur-x-subexpr-load_row1 img)
  (define i_bound 3)
  (define rows 3)
  (define cols 8)
  (define ip (/ 16 scale_factor)) 
  (define op (/ 32 scale_factor))
  (define img-size (* rows cols ip))

  (define three (apply concat (for/list ([k (range cols)]) (bv 3 (bitvector ip)) ) ) )


  (apply concat 
         (for/list ([i (range 1)])
                   (define reduce
                     (apply concat (for/list ([j (reverse (range cols))])
                                               (ext-bv img (+ (* (+ i 2)  cols) j ) ip)
                                              )
                                             ))
                   reduce
                   ))
  )


(define (blur-x-subexpr-load_row2 img)
  (define i_bound 3)
  (define rows 3)
  (define cols 8)
  (define ip (/ 16 scale_factor)) 
  (define op (/ 32 scale_factor))
  (define img-size (* rows cols ip))

  (define three (apply concat (for/list ([k (range cols)]) (bv 3 (bitvector ip)) ) ) )


  (apply concat 
         (for/list ([i (range 1)])
                   (define reduce
                     (apply concat (for/list ([j (reverse (range cols))])
                                               (ext-bv img (+ (* (+ i 1)  cols) j ) ip)
                                              )
                                             ))
                   reduce
                   
                   
                   
                   ))
  )

(define (blur-x-subexpr-load_row3 img)
  (define i_bound 3)
  (define rows 3)
  (define cols 8)
  (define ip (/ 16 scale_factor)) 
  (define op (/ 32 scale_factor))
  (define img-size (* rows cols ip))

  (define three (apply concat (for/list ([k (range cols)]) (bv 3 (bitvector ip)) ) ) )


  (apply concat 
         (for/list ([i (range 1)])
                   (define reduce
                     (apply concat (for/list ([j (reverse (range cols))])
                                               (ext-bv img (+ (* (+ i 0)  cols) j ) ip)
                                              )
                                             ))
                   
                   reduce
                   ))
  )


(define (blur-x-subexpr-add2 expr1 expr2)
  (define i_bound 3)
  (define rows 3)
  (define cols 8)
  (define ip (/ 16 scale_factor)) 
  (define op (/ 32 scale_factor))
  (define img-size (* rows cols ip))

  (define three (apply concat (for/list ([k (range cols)]) (bv 3 (bitvector ip)) ) ) )


  (apply concat 
         (for/list ([i (range 1)])
                   (define reduce
                     (apply concat (for/list ([j (reverse (range cols))])
                                             (bvadd
                                               ;; i,j
                                               (ext-bv expr1  j ip)
                                               ;; i,j+1
                                               (ext-bv expr2  j  ip)
                                               
                                              )
                                             )))
                   reduce

                   ))
  )


(define (blur-x-subexpr-div3 expr1)
  (define i_bound 3)
  (define rows 3)
  (define cols 8)
  (define ip (/ 16 scale_factor)) 
  (define op (/ 32 scale_factor))
  (define img-size (* rows cols ip))

  (define three (apply concat (for/list ([k (range cols)]) (bv 3 (bitvector ip)) ) ) )


  (apply concat 
         (for/list ([i (range 1)])
                   (define reduce
                     (apply concat (for/list ([j (reverse (range cols))])
                                             (bvsdiv
                                               ;; i,j
                                               (ext-bv expr1  j ip)
                                               ;; i,j+1
                                               (ext-bv three  j  ip)
                                               
                                              )
                                             )))
                   reduce
                   
                   
                   ))
  )

(define (blur-x-sub img)
  (define row1 (blur-x-subexpr-load_row1 img)) ;; subexpr1
  (define row2 (blur-x-subexpr-load_row2 img)) ;; subexpr2
  (define row3 (blur-x-subexpr-load_row3 img)) ;; subexpr3

  (define add_1_2 (blur-x-subexpr-add2 row1 row2)) ;; subexpr4
  (define add_1_3 (blur-x-subexpr-add2 add_1_2 row3)) ;; subexpr5

  (define res (blur-x-subexpr-div3 add_1_3)) ;; subexpr6

  res

  )

(define (create-tensor rows cols precision)
  (apply concat
         (for/list ([i (range (* rows cols))])
                   (bv i (bitvector precision))
                   ))
  
  )

(define test-image (create-tensor 3 8 (/ 16 scale_factor)))


(displayln "Input Image")
(print-mat test-image 3 8 (/ 16 scale_factor))

(define result (blur-x test-image))
(displayln "Blurred Image")
(print-mat result 1 8 (/ 16 scale_factor))


(define result_sub (blur-x-sub test-image))
(displayln "Blurred Image Computed using sub expressions")
(print-mat result_sub 1 8 (/ 16 scale_factor))



;; Manual solution
(define load_row_0 (vector-load_dsl (reg 0) (/ 384 scale_factor) 0 8 (/ 16 scale_factor)))
(define load_row_1 (vector-load_dsl (reg 0) (/ 384 scale_factor) 8 8 (/ 16 scale_factor)))
(define load_row_2 (vector-load_dsl (reg 0) (/ 384 scale_factor) 16 8 (/ 16 scale_factor)))

(define add_0_1 (_m_paddw_dsl load_row_0 load_row_1 (/ 128 scale_factor) (/ 128 scale_factor) (/ 128 scale_factor) (/ 16 scale_factor) 0))
(define add_0_2 (_m_paddw_dsl add_0_1 load_row_2 (/ 128 scale_factor) (/ 128 scale_factor) (/ 128 scale_factor) (/ 16 scale_factor) 0))

(define three_vector (lit (apply concat (for/list ([k (range 8)]) (bv 3 (bitvector (/ 16 scale_factor ))) ) )))

(define div_3 (_mm512_div_epi64_dsl add_0_2 three_vector (/ 128 scale_factor) (/ 128 scale_factor) (/ 128 scale_factor) (/ 16 scale_factor) 0 (/ 32 scale_factor)))

(displayln "Manual Blurred Image")
(print-mat (interpret div_3 (vector test-image 0 0 1 8)) 1 8 (/ 16 scale_factor))

;; 
;(displayln "Verifying Current implementation")

;(define-symbolic cex_sym (bitvector (/ 384 scale_factor)))

;(define cex 
;  (verify 
;    (begin
;      ;(assert (equal? (interpret div_3 (vector cex_sym 0 0 1 8)) (blur-x cex_sym)  ))
;      (assert (equal? (blur-x-sub cex_sym) (blur-x cex_sym)  ))
;      )
;    ))


;(assert (sat? cex) "Verification Passed!")
;(define cex_v0 (evaluate cex_sym cex))
;(display "cex_v0 ")
;(displayln cex_v0)


(displayln "Beginning Synthesis ...")
;; ================================================================================
;;                                Synthesis Query
;; ================================================================================

;; Synthesizing each sub-expression seperately:


(define synth_depth 2)


;; ========= Sub expression 1 ========
(clear-vc!)
(define-symbolic sym_subexpr1 (bitvector (/ 384 scale_factor)))
(define subexpr1_env_i0_j0 (vector sym_subexpr1 0 0 1 8))


(define blur_x_subexpr1_grammar (operations (list (reg 0)) #:depth synth_depth ))

(define start_time (current-seconds))
(define subexpr1_sol
(synthesize 
 #:forall (list (symbolics subexpr1_env_i0_j0) )
 #:guarantee 

	(begin
		(assert (equal? (interpret blur_x_subexpr1_grammar subexpr1_env_i0_j0) (vector-load (blur-x-subexpr-load_row1  sym_subexpr1) (/ 128 scale_factor) 0 8 (/ 16 scale_factor))))
		)
)
)


(assert (sat? subexpr1_sol) "Unsatisfiable")
(define synth_subexpr1 (evaluate blur_x_subexpr1_grammar subexpr1_sol))
(displayln "Synthesized Subexpression 1:")
(pretty-print synth_subexpr1)
(displayln "Cost:")
(println (cost synth_subexpr1))


;; ========= Sub expression 2 ========
(clear-vc!)
(define-symbolic sym_subexpr2 (bitvector (/ 384 scale_factor)))
(define subexpr2_env_i0_j0 (vector sym_subexpr2 0 0 1 8))


(define blur_x_subexpr2_grammar (operations (list (reg 0)) #:depth synth_depth ))

(define subexpr2_sol
(synthesize 
 #:forall (list (symbolics subexpr2_env_i0_j0) )
 #:guarantee 

	(begin
		(assert (equal? (interpret blur_x_subexpr2_grammar subexpr2_env_i0_j0) (vector-load (blur-x-subexpr-load_row2  sym_subexpr2) (/ 128 scale_factor) 0 8 (/ 16 scale_factor))))
		)
)
)


(assert (sat? subexpr2_sol) "Unsatisfiable")
(define synth_subexpr2 (evaluate blur_x_subexpr2_grammar subexpr2_sol))
(displayln "Synthesized Subexpression 2:")
(pretty-print synth_subexpr2)
(displayln "Cost:")
(println (cost synth_subexpr2))




;; ========= Sub expression 3 ========
(clear-vc!)
(define-symbolic sym_subexpr3 (bitvector (/ 384 scale_factor)))
(define subexpr3_env_i0_j0 (vector sym_subexpr3 0 0 1 8))


(define blur_x_subexpr3_grammar (operations (list (reg 0)) #:depth synth_depth ))

(define subexpr3_sol
(synthesize 
 #:forall (list (symbolics subexpr3_env_i0_j0) )
 #:guarantee 

	(begin
		(assert (equal? (interpret blur_x_subexpr3_grammar subexpr3_env_i0_j0) (vector-load (blur-x-subexpr-load_row3  sym_subexpr3) (/ 128 scale_factor) 0 8 (/ 16 scale_factor))))
		)
)
)


(assert (sat? subexpr3_sol) "Unsatisfiable")
(define synth_subexpr3 (evaluate blur_x_subexpr3_grammar subexpr3_sol))
(displayln "Synthesized Subexpression 3:")
(pretty-print synth_subexpr3)
(displayln "Cost:")
(println (cost synth_subexpr3))


;; ========= Sub expression 4 ========
(clear-vc!)
(define-symbolic sym_subexpr4_0 (bitvector (/ 128 scale_factor)))
(define-symbolic sym_subexpr4_1 (bitvector (/ 128 scale_factor)))
(define subexpr4_env_i0_j0 (vector sym_subexpr4_0 sym_subexpr4_1 0 0 1 8))


(define blur_x_subexpr4_grammar (operations (list (reg 0) (reg 1) ) #:depth synth_depth ))

(define subexpr4_sol
(synthesize 
 #:forall (list (symbolics subexpr4_env_i0_j0) )
 #:guarantee 

	(begin
		(assert (equal? (interpret blur_x_subexpr4_grammar subexpr4_env_i0_j0) (vector-load (blur-x-subexpr-add2  sym_subexpr4_0 sym_subexpr4_1) (/ 128 scale_factor) 0 8 (/ 16 scale_factor))))
		)
)
)


(assert (sat? subexpr4_sol) "Unsatisfiable")
(define synth_subexpr4 (evaluate blur_x_subexpr4_grammar subexpr4_sol))
(displayln "Synthesized Subexpression 4:")
(pretty-print synth_subexpr4)
(displayln "Cost:")
(println (cost synth_subexpr4))

;; ========= Sub expression 5 ========
(clear-vc!)
(displayln "Subexpression 5 is identical to sub-expression 4 ...")


;; ========= Sub expression 6 ========
(clear-vc!)
(define-symbolic sym_subexpr6_0 (bitvector (/ 128 scale_factor)))
(define subexpr6_env_i0_j0 (vector sym_subexpr6_0  0 0 1 8))


(define blur_x_subexpr6_grammar (operations (list (reg 0) (reg 1) ) #:depth synth_depth ))

(define subexpr6_sol
(synthesize 
 #:forall (list (symbolics subexpr6_env_i0_j0) )
 #:guarantee 

	(begin
		(assert (equal? (interpret blur_x_subexpr6_grammar subexpr6_env_i0_j0) (vector-load (blur-x-subexpr-div3  sym_subexpr6_0 ) (/ 128 scale_factor) 0 8 (/ 16 scale_factor))))
		)
)
)


(assert (sat? subexpr6_sol) "Unsatisfiable")
(define synth_subexpr6 (evaluate blur_x_subexpr6_grammar subexpr6_sol))
(displayln "Synthesized Subexpression 6:")
(pretty-print synth_subexpr6)
(displayln "Cost:")
(println (cost synth_subexpr6))

(define end_time (current-seconds))


(define elapsed_time (- end_time start_time))
(display "Synthesis Completed in ")
(display elapsed_time )
(displayln " seconds ...")
