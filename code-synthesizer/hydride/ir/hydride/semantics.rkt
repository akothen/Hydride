#lang rosette
(require rosette/lib/synthax)
(require rosette/lib/angelic)
(require racket/pretty)
(require data/bit-vector)
(require rosette/lib/destruct)
(require rosette/solver/smt/boolector)

(require hydride/utils/bvops)
(require hydride/utils/misc)


(provide (all-defined-out))

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


(define (_mm512_mulhi_epi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
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
                            (define %8 (extract  %highidx0 %arg0 %7))
                            %8
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_m_from_int  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %0 (extract  %highidx1 %arg1 a))
                            %0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_hsubs_pi16  a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                              (define %factor0 (/  %elemsize  %elemsize))
                              (define %low.cofactor0 (*  iterator.0  %factor0))
                              (define %lastidx2 (-  %elemsize  1))
                              (define %high.offset0 (+  %low.cofactor0  %lastidx2))
                              (define %0 (extract  %high.offset0 %low.cofactor0 a))
                              (define %low.offset0 (+  %low.cofactor0  %arg0))
                              (define %lastidx1 (-  %elemsize  1))
                              (define %high.offset1 (+  %low.offset0  %lastidx1))
                              (define %1 (extract  %high.offset1 %low.offset0 a))
                              (define %2 (bvsubnsw  %0  %1 %elemsize))
                              %2
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
                              (define %low.cofactor2 (*  iterator.1  %arg3))
                              (define %low.offset1.new0 (-  %low.cofactor2  %arg2))
                              (define %lastidx5 (-  %elemsize1  1))
                              (define %high.offset3 (+  %low.offset1.new0  %lastidx5))
                              (define %8 (extract  %high.offset3 %low.offset1.new0 b))
                              (define %low.offset2.new0 (-  %low.cofactor2  %arg1))
                              (define %lastidx4 (-  %elemsize1  1))
                              (define %high.offset4 (+  %low.offset2.new0  %lastidx4))
                              (define %9 (extract  %high.offset4 %low.offset2.new0 b))
                              (define %10 (bvsubnsw  %8  %9 %elemsize1))
                              %10
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm256_maskz_sllv_epi32  %arg3 %arg2 k a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg4 )
  (define dst
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
                                (define %3 (extract  %2 j0.new count))
                                (define %4 (bvult  %3  %arg0))
                                (if (equal? %4 #t)
                                  (begin
                                    (define %lastidx1 (-  %arg1  1))
                                    (define %5 (+  j0.new  %lastidx1))
                                    (define %6 (extract  %5 j0.new a))
                                    (define %8 (extract  %5 j0.new count))
                                    (define %9 (bvlshr  %6  %8))
                                    %9
                                    )
                                  (begin
                                    (define %lastidx2 (-  %arg1  1))
                                    (define %12 (+  j0.new  %lastidx2))
                                    (define %15 (extract  %12 j0.new %arg2))
                                    %15
                                    )
                                  )
                                )
                              (begin
                                (define %lastidx3 (-  %arg1  1))
                                (define %14 (+  j0.new  %lastidx3))
                                (define %16 (extract  %14 j0.new %arg3))
                                %16
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm256_mask_dpbusd_epi32  src k a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
                (define j0.new.div (/  j0.new  %lanesize1))
                (define %0 (extract  j0.new.div j0.new.div k))
                (if (equal? %0 (bv #b1 1))
                  (begin
                    (apply
                      concat
                      (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                                (define %2.new0 (+  j0.new  iterator.0.new))
                                (define %lastidx1 (-  %elemsize  1))
                                (define %3 (+  %2.new0  %lastidx1))
                                (define %4 (extract  %3 %2.new0 a))
                                (define %5 (zero-extend  %4 (bitvector %arg0)))
                                (define %9 (extract  %3 %2.new0 b))
                                (define %10 (sign-extend  %9 (bitvector %arg0)))
                                (define %11 (bvmul  %5  %10))
                                (define %12 (sign-extend  %11 (bitvector %lanesize1)))
                                (define %lastidx0 (-  %lanesize1  1))
                                (define %63.clone.4 (+  j0.new  %lastidx0))
                                (define %12.ext0 (extract  %63.clone.4 j0.new src))
                                (define %12.acc0 (bvadd  %12.ext0  %12))
                                %12.acc0
                                )
                      )
                    )
                  (begin
                    (apply
                      concat
                      (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
                                (define %lastidx2 (-  %lanesize1  1))
                                (define %65 (+  j0.new  %lastidx2))
                                (define %66 (extract  %65 j0.new src))
                                %66
                                )
                      )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm256_maskz_sra_epi32  %arg8 k a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg9 )
  (define dst
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
                                (define %lastidx0 (-  %arg1  1))
                                (define %highidx0 (+  %lastidx0  %arg2))
                                (define %2 (extract  %highidx0 %arg2 count))
                                (define %3 (bvugt  %2  %arg0))
                                (if (equal? %3 #t)
                                  (begin
                                    (define %lastidx1 (-  %arg3  1))
                                    (define %5 (+  j0.new  %lastidx1))
                                    (define %6 (extract  %5 %5 a))
                                    (define %7 (if (equal? %6 (bv #b1 1))
                                                 %arg4 %arg5))
                                    %7
                                    )
                                  (begin
                                    (define %lastidx2 (-  %arg3  1))
                                    (define %9 (+  j0.new  %lastidx2))
                                    (define %10 (extract  %9 j0.new a))
                                    (define %lastidx3 (-  %arg6  1))
                                    (define %highidx1 (+  %lastidx3  %arg7))
                                    (define %11 (extract  %highidx1 %arg7 count))
                                    (define %12 (zero-extend  %10 (bitvector %arg6)))
                                    (define %13 (bvashr  %12  %11))
                                    (define %15.high.idx (- %arg6 1))
                                    (define %15.low.idx (+ (- %15.high.idx %arg3) 1) )
                                    (define %15 (extract  %15.high.idx %15.low.idx %13))
                                    %15
                                    )
                                  )
                                )
                              (begin
                                (define %lastidx4 (-  %arg3  1))
                                (define %17 (+  j0.new  %lastidx4))
                                (define %18 (extract  %17 j0.new %arg8))
                                %18
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg9)
  )

(define (_mm512_xor_epi64  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm512_broadcast_i64x4  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
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
  (bvpadhighbits  dst %arg1)
  )

(define (_mm512_and_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm512_subs_epu16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm256_maskz_packus_epi16  %arg5 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg6 )
0 ;; TEMP

)

(define (_mm512_maskz_packus_epi32  %arg3 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
0 ;; TEMP
    )

(define (_mm512_maskz_srl_epi64  %arg5 %arg3 k a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 %arg6 )
  (define dst
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
                                (define %highidx0 (+  %lastidx0  %arg1))
                                (define %2 (extract  %highidx0 %arg1 count))
                                (define %3 (bvugt  %2  %arg0))
                                (if (equal? %3 #t)
                                  (begin
                                    (define %lastidx1 (-  %arg2  1))
                                    (define %5 (+  j0.new  %lastidx1))
                                    (define %13 (extract  %5 j0.new %arg3))
                                    %13
                                    )
                                  (begin
                                    (define %lastidx2 (-  %arg2  1))
                                    (define %6 (+  j0.new  %lastidx2))
                                    (define %7 (extract  %6 j0.new a))
                                    (define %lastidx3 (-  %arg2  1))
                                    (define %highidx1 (+  %lastidx3  %arg4))
                                    (define %8 (extract  %highidx1 %arg4 count))
                                    (define %9 (bvashr  %7  %8))
                                    %9
                                    )
                                  )
                                )
                              (begin
                                (define %lastidx4 (-  %arg2  1))
                                (define %12 (+  j0.new  %lastidx4))
                                (define %14 (extract  %12 j0.new %arg5))
                                %14
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg6)
  )

(define (_mm_maskz_packus_epi32  %arg3 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
0
  )

(define (_mm256_maskz_adds_epu16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
  (define dst
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
  (bvpadhighbits  dst %arg1)
  )

(define (_mm512_maskz_packs_epi16  %arg3 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
  0

    )

(define (_mm_maskz_xor_epi64  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
  (define dst
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
                                (define %13 (extract  %12 j0.new %arg0))
                                %13
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm256_min_epi8  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm256_cvtepi16_epi8  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
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
                            (define %4.high.idx (- %elemsize 1))
                            (define %4.low.idx 0)
                            (define %4 (extract  %4.high.idx %4.low.idx %3))
                            %4
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_extract_epi32  a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx3 (-  %arg3  1))
                            (define %highidx3 (+  %lastidx3  %arg7))
                            (define %0 (extract  %highidx3 %arg7 a))
                            (define %lastidx2 (-  %elemsize  1))
                            (define %highidx2 (+  %lastidx2  %arg6))
                            (define %1 (extract  %highidx2 %arg6 imm8))
                            (define %2 (zero-extend  %1 (bitvector %arg5)))
                            (define %3 (bvmul  %2  %arg4))
                            (define %4 (zero-extend  %3 (bitvector %arg3)))
                            (define %5 (bvashr  %0  %4))
                            (define %lastidx1 (-  %arg0  1))
                            (define %highidx1 (+  %lastidx1  %arg2))
                            (define %6 (extract  %highidx1 %arg2 %5))
                            %6
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg8)
  )

(define (_mm256_hsub_epi32  a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
  (define dst
    (apply
      concat
      (for/list ([iterator.lane (reverse (range 0 %vectsize %lanesize1))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                              (define %low.cofactor0 (*  iterator.0  %arg1))
                              (define %low.scaled.it0 (+  iterator.lane  %low.cofactor0))
                              (define %lastidx2 (-  %elemsize  1))
                              (define %high.offset0 (+  %low.scaled.it0  %lastidx2))
                              (define %0 (extract  %high.offset0 %low.scaled.it0 a))
                              (define %low.offset0 (+  %low.scaled.it0  %arg0))
                              (define %lastidx1 (-  %elemsize  1))
                              (define %high.offset1 (+  %low.offset0  %lastidx1))
                              (define %1 (extract  %high.offset1 %low.offset0 a))
                              (define %2 (bvsub  %0  %1))
                              %2
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
                              (define %low.cofactor2 (*  iterator.1  %arg4))
                              (define %low.scaled.it3 (+  iterator.lane  %low.cofactor2))
                              (define %low.offset1.new0 (-  %low.scaled.it3  %arg3))
                              (define %lastidx5 (-  %elemsize1  1))
                              (define %high.offset3 (+  %low.offset1.new0  %lastidx5))
                              (define %6 (extract  %high.offset3 %low.offset1.new0 b))
                              (define %low.offset2.new0 (-  %low.scaled.it3  %arg2))
                              (define %lastidx4 (-  %elemsize1  1))
                              (define %high.offset4 (+  %low.offset2.new0  %lastidx4))
                              (define %7 (extract  %high.offset4 %low.offset2.new0 b))
                              (define %8 (bvsub  %6  %7))
                              %8
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg5)
  )

(define (_mm_maskz_packs_epi32  %arg3 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
0
  )

(define (_mm256_maskz_packus_epi32  %arg5 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg6 )

  0
  
  )

(define (_m_psrldi  %arg3 a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 %arg5 %arg6 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx0 (-  %elemsize  1))
                            (define %highidx0 (+  %lastidx0  %arg1))
                            (define %1 (extract  %highidx0 %arg1 imm8))
                            (define %2 (bvugt  %1  %arg0))
                            (if (equal? %2 #t)
                              (begin
                                (define %factor0 (/  %arg2  %elemsize))
                                (define %0.copy.0.new0 (*  j0.new  %factor0))
                                (define %lastidx1 (-  %arg2  1))
                                (define %4 (+  %0.copy.0.new0  %lastidx1))
                                (define %11 (extract  %4 %0.copy.0.new0 %arg3))
                                %11
                                )
                              (begin
                                (define %factor1 (/  %arg2  %elemsize))
                                (define %0.copy.2.new0 (*  j0.new  %factor1))
                                (define %lastidx2 (-  %arg2  1))
                                (define %5 (+  %0.copy.2.new0  %lastidx2))
                                (define %6 (extract  %5 %0.copy.2.new0 a))
                                (define %lastidx3 (-  %arg4  1))
                                (define %highidx1 (+  %lastidx3  %arg5))
                                (define %7 (extract  %highidx1 %arg5 imm8))
                                (define %8 (zero-extend  %7 (bitvector %arg2)))
                                (define %9 (bvashr  %6  %8))
                                %9
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg6)
  )

(define (_mm256_mask_slli_epi64  %arg3 src k a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 %arg5 %arg6 )
  (define dst
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
                                (define %highidx0 (+  %lastidx0  %arg1))
                                (define %2 (extract  %highidx0 %arg1 imm8))
                                (define %3 (bvugt  %2  %arg0))
                                (if (equal? %3 #t)
                                  (begin
                                    (define %factor0 (/  %arg2  %elemsize))
                                    (define %0.copy.0.new0 (*  j0.new  %factor0))
                                    (define %lastidx1 (-  %arg2  1))
                                    (define %5 (+  %0.copy.0.new0  %lastidx1))
                                    (define %16 (extract  %5 %0.copy.0.new0 %arg3))
                                    %16
                                    )
                                  (begin
                                    (define %factor1 (/  %arg2  %elemsize))
                                    (define %0.copy.2.new0 (*  j0.new  %factor1))
                                    (define %lastidx2 (-  %arg2  1))
                                    (define %6 (+  %0.copy.2.new0  %lastidx2))
                                    (define %7 (extract  %6 %0.copy.2.new0 a))
                                    (define %lastidx3 (-  %arg4  1))
                                    (define %highidx1 (+  %lastidx3  %arg5))
                                    (define %8 (extract  %highidx1 %arg5 imm8))
                                    (define %9 (zero-extend  %8 (bitvector %arg2)))
                                    (define %10 (bvlshr  %7  %9))
                                    %10
                                    )
                                  )
                                )
                              (begin
                                (define %factor2 (/  %arg2  %elemsize))
                                (define %0.copy.5.new0 (*  j0.new  %factor2))
                                (define %lastidx4 (-  %arg2  1))
                                (define %13 (+  %0.copy.5.new0  %lastidx4))
                                (define %14 (extract  %13 %0.copy.5.new0 src))
                                %14
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg6)
  )

(define (_mm512_xor_si512  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx2 (-  %elemsize  1))
                            (define %highidx2 (+  %lastidx2  %arg2))
                            (define %0 (extract  %highidx2 %arg2 a))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %1 (extract  %highidx1 %arg1 b))
                            (define %2 (bvxor  %0  %1))
                            %2
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm256_srl_epi16  %arg4 a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg5 %arg6 %arg7 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx0 (-  %arg1  1))
                            (define %highidx0 (+  %lastidx0  %arg2))
                            (define %1 (extract  %highidx0 %arg2 count))
                            (define %2 (bvugt  %1  %arg0))
                            (if (equal? %2 #t)
                              (begin
                                (define %lastidx1 (-  %arg3  1))
                                (define %4 (+  j0.new  %lastidx1))
                                (define %12 (extract  %4 j0.new %arg4))
                                %12
                                )
                              (begin
                                (define %lastidx2 (-  %arg3  1))
                                (define %5 (+  j0.new  %lastidx2))
                                (define %6 (extract  %5 j0.new a))
                                (define %lastidx3 (-  %arg5  1))
                                (define %highidx1 (+  %lastidx3  %arg6))
                                (define %7 (extract  %highidx1 %arg6 count))
                                (define %8 (zero-extend  %6 (bitvector %arg5)))
                                (define %9 (bvashr  %8  %7))
                                (define %11.high.idx (- %arg5 1))
                                (define %11.low.idx (+ (- %11.high.idx %arg3) 1) )
                                (define %11 (extract  %11.high.idx %11.low.idx %9))
                                %11
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg7)
  )

(define (_mm_maskz_cvtepu8_epi64  %arg1 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg2 )
  (define dst
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
                                (define %5 (zero-extend  %4 (bitvector %arg0)))
                                %5
                                )
                              (begin
                                (define %factor1 (/  %arg0  %elemsize))
                                (define %0.copy.2.new0 (*  j0.new  %factor1))
                                (define %lastidx2 (-  %arg0  1))
                                (define %8 (+  %0.copy.2.new0  %lastidx2))
                                (define %9 (extract  %8 %0.copy.2.new0 %arg1))
                                %9
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm512_srai_epi64  a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx0 (-  %elemsize  1))
                            (define %highidx0 (+  %lastidx0  %arg1))
                            (define %1 (extract  %highidx0 %arg1 imm8))
                            (define %2 (bvugt  %1  %arg0))
                            (if (equal? %2 #t)
                              (begin
                                (define %factor0 (/  %arg2  %elemsize))
                                (define %0.copy.0.new0 (*  j0.new  %factor0))
                                (define %lastidx1 (-  %arg2  1))
                                (define %4 (+  %0.copy.0.new0  %lastidx1))
                                (define %5 (extract  %4 %4 a))
                                (define %6 (if (equal? %5 (bv #b1 1))
                                             %arg3 %arg4))
                                %6
                                )
                              (begin
                                (define %factor1 (/  %arg2  %elemsize))
                                (define %0.copy.2.new0 (*  j0.new  %factor1))
                                (define %lastidx2 (-  %arg2  1))
                                (define %8 (+  %0.copy.2.new0  %lastidx2))
                                (define %9 (extract  %8 %0.copy.2.new0 a))
                                (define %lastidx3 (-  %arg5  1))
                                (define %highidx1 (+  %lastidx3  %arg6))
                                (define %10 (extract  %highidx1 %arg6 imm8))
                                (define %11 (zero-extend  %10 (bitvector %arg2)))
                                (define %12 (bvashr  %9  %11))
                                %12
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg7)
  )

(define (_m_paddd  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm512_subr_epi32  v2 v3 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm256_cvtsepi32_epi8  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
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
                            (define %4 (bvssat %3 %arg0 %elemsize ))
                            %4
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm512_mulhi_epu32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
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
                            (define %6 (zero-extend  %3 (bitvector %arg1)))
                            (define %7 (zero-extend  %5 (bitvector %arg1)))
                            (define %8 (bvmul  %6  %7))
                            (define %9 (bvashr  %8  %arg0))
                            (define %11.high.idx (- %arg1 1))
                            (define %11.low.idx (+ (- %11.high.idx %elemsize) 1) )
                            (define %11 (extract  %11.high.idx %11.low.idx %9))
                            %11
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm256_mask_srav_epi16  src k a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
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
                                (define %3 (extract  %2 j0.new count))
                                (define %4 (bvult  %3  %arg0))
                                (if (equal? %4 #t)
                                  (begin
                                    (define %lastidx1 (-  %arg1  1))
                                    (define %5 (+  j0.new  %lastidx1))
                                    (define %6 (extract  %5 j0.new a))
                                    (define %8 (extract  %5 j0.new count))
                                    (define %9 (bvashr  %6  %8))
                                    %9
                                    )
                                  (begin
                                    (define %lastidx2 (-  %arg1  1))
                                    (define %12 (+  j0.new  %lastidx2))
                                    (define %13 (extract  %12 %12 a))
                                    (define %14 (if (equal? %13 (bv #b1 1))
                                                  %arg2 %arg3))
                                    %14
                                    )
                                  )
                                )
                              (begin
                                (define %lastidx3 (-  %arg1  1))
                                (define %17 (+  j0.new  %lastidx3))
                                (define %18 (extract  %17 j0.new src))
                                %18
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm512_mask3_fmadd_epi32  a b c k %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
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
                                (define %7 (zero-extend  %4 (bitvector %arg0)))
                                (define %8 (zero-extend  %6 (bitvector %arg0)))
                                (define %9 (bvmul  %7  %8))
                                (define %11 (extract  %3 j0.new c))
                                (define %12 (zero-extend  %11 (bitvector %arg0)))
                                (define %13 (bvadd  %9  %12))
                                (define %15.high.idx (- %arg0 1))
                                (define %15.low.idx (+ (- %15.high.idx %elemsize) 1) )
                                (define %15 (extract  %15.high.idx %15.low.idx %13))
                                %15
                                )
                              (begin
                                (define %lastidx1 (-  %elemsize  1))
                                (define %17 (+  j0.new  %lastidx1))
                                (define %18 (extract  %17 j0.new c))
                                %18
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_mask_sra_epi64  src k a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
  (define dst
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
                                (define %highidx0 (+  %lastidx0  %arg1))
                                (define %2 (extract  %highidx0 %arg1 count))
                                (define %3 (bvugt  %2  %arg0))
                                (if (equal? %3 #t)
                                  (begin
                                    (define %lastidx1 (-  %arg2  1))
                                    (define %5 (+  j0.new  %lastidx1))
                                    (define %6 (extract  %5 %5 a))
                                    (define %7 (if (equal? %6 (bv #b1 1))
                                                 %arg3 %arg4))
                                    %7
                                    )
                                  (begin
                                    (define %lastidx2 (-  %arg2  1))
                                    (define %9 (+  j0.new  %lastidx2))
                                    (define %10 (extract  %9 j0.new a))
                                    (define %lastidx3 (-  %arg2  1))
                                    (define %highidx1 (+  %lastidx3  %arg5))
                                    (define %11 (extract  %highidx1 %arg5 count))
                                    (define %12 (bvashr  %10  %11))
                                    %12
                                    )
                                  )
                                )
                              (begin
                                (define %lastidx4 (-  %arg2  1))
                                (define %15 (+  j0.new  %lastidx4))
                                (define %16 (extract  %15 j0.new src))
                                %16
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg6)
  )

(define (_mm_srav_epi64  a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx0 (-  %elemsize  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new count))
                            (define %3 (bvult  %2  %arg0))
                            (if (equal? %3 #t)
                              (begin
                                (define %lastidx1 (-  %arg1  1))
                                (define %4 (+  j0.new  %lastidx1))
                                (define %5 (extract  %4 j0.new a))
                                (define %7 (extract  %4 j0.new count))
                                (define %8 (bvashr  %5  %7))
                                %8
                                )
                              (begin
                                (define %lastidx2 (-  %arg1  1))
                                (define %11 (+  j0.new  %lastidx2))
                                (define %12 (extract  %11 %11 a))
                                (define %13 (if (equal? %12 (bv #b1 1))
                                              %arg2 %arg3))
                                %13
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm_mask_min_epi8  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm_mask_min_epu16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
                                (define %10 (extract  %9 j0.new src))
                                %10
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg0)
  )

(define (_m_punpckhdq  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx3 (-  %elemsize  1))
                            (define %highidx3 (+  %lastidx3  %arg3))
                            (define %0 (extract  %highidx3 %arg3 a))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %1 (extract  %highidx1 %arg1 b))
                            (concat %1 %0)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm256_maskz_packs_epi16  %arg5 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg6 )
0
    )

(define (_mm_cmplt_epu16_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %factor0 (/  %arg2  %elemsize))
                            (define %0 (*  j0  %factor0))
                            (define %lastidx1 (-  %arg2  1))
                            (define %1 (+  %0  %lastidx1))
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
  (bvpadhighbits  k %arg3)
  )

(define (_mm512_mask_srl_epi32  %arg4 src k a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg5 %arg6 %arg7 )
  (define dst
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
                                (define %lastidx0 (-  %arg1  1))
                                (define %highidx0 (+  %lastidx0  %arg2))
                                (define %2 (extract  %highidx0 %arg2 count))
                                (define %3 (bvugt  %2  %arg0))
                                (if (equal? %3 #t)
                                  (begin
                                    (define %lastidx1 (-  %arg3  1))
                                    (define %5 (+  j0.new  %lastidx1))
                                    (define %17 (extract  %5 j0.new %arg4))
                                    %17
                                    )
                                  (begin
                                    (define %lastidx2 (-  %arg3  1))
                                    (define %6 (+  j0.new  %lastidx2))
                                    (define %7 (extract  %6 j0.new a))
                                    (define %lastidx3 (-  %arg5  1))
                                    (define %highidx1 (+  %lastidx3  %arg6))
                                    (define %8 (extract  %highidx1 %arg6 count))
                                    (define %9 (zero-extend  %7 (bitvector %arg5)))
                                    (define %10 (bvashr  %9  %8))
                                    (define %12.high.idx (- %arg5 1))
                                    (define %12.low.idx (+ (- %12.high.idx %arg3) 1) )
                                    (define %12 (extract  %12.high.idx %12.low.idx %10))
                                    %12
                                    )
                                  )
                                )
                              (begin
                                (define %lastidx4 (-  %arg3  1))
                                (define %14 (+  j0.new  %lastidx4))
                                (define %15 (extract  %14 j0.new src))
                                %15
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg7)
  )

(define (_mm256_mask_cvtepi32_epi8  src k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
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
                                (define %5.high.idx (- %elemsize 1))
                                (define %5.low.idx 0)
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
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_mask_cmpeq_epi8_mask  %arg3 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %1 (extract  j0 j0 k1))
                            (if (equal? %1 (bv #b1 1))
                              (begin
                                (define %factor0 (/  %arg2  %elemsize))
                                (define %0.copy.0 (*  j0  %factor0))
                                (define %lastidx1 (-  %arg2  1))
                                (define %2 (+  %0.copy.0  %lastidx1))
                                (define %3 (extract  %2 %0.copy.0 a))
                                (define %5 (extract  %2 %0.copy.0 b))
                                (define %6 (bveq  %3  %5))
                                (define %7 (if (equal? %6 #t) %arg0 %arg1))
                                %7
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %highidx1 (+  j0  %lastidx2))
                                (define %8 (extract  %highidx1 j0 %arg3))
                                %8
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k %arg4)
  )

(define (_mm256_adds_epu16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm_maskz_mulhi_epi16  %arg2 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg3 )
  (define dst
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
                                (define %4 (sign-extend  %3 (bitvector %arg1)))
                                (define %6 (extract  %2 j0.new b))
                                (define %7 (sign-extend  %6 (bitvector %arg1)))
                                (define %8 (bvmul  %4  %7))
                                (define %lastidx1 (-  %elemsize  1))
                                (define %highidx0 (+  %lastidx1  %arg0))
                                (define %9 (extract  %highidx0 %arg0 %8))
                                %9
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %12 (+  j0.new  %lastidx2))
                                (define %13 (extract  %12 j0.new %arg2))
                                %13
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm256_mul_epu32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
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
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_maskz_dpwssd_epi32  %arg0 k src a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
                (define j0.new.div (/  j0.new  %lanesize1))
                (define %0 (extract  j0.new.div j0.new.div k))
                (if (equal? %0 (bv #b1 1))
                  (begin
                    (apply
                      concat
                      (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                                (define %2.new0 (+  j0.new  iterator.0.new))
                                (define %lastidx1 (-  %elemsize  1))
                                (define %3 (+  %2.new0  %lastidx1))
                                (define %4 (extract  %3 %2.new0 a))
                                (define %5 (sign-extend  %4 (bitvector %lanesize1)))
                                (define %9 (extract  %3 %2.new0 b))
                                (define %10 (sign-extend  %9 (bitvector %lanesize1)))
                                (define %11 (bvmul  %5  %10))
                                (define %lastidx0 (-  %lanesize1  1))
                                (define %31.clone.2 (+  j0.new  %lastidx0))
                                (define %11.ext0 (extract  %31.clone.2 j0.new src))
                                (define %11.acc0 (bvadd  %11.ext0  %11))
                                %11.acc0
                                )
                      )
                    )
                  (begin
                    (apply
                      concat
                      (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
                                (define %lastidx2 (-  %lanesize1  1))
                                (define %33 (+  j0.new  %lastidx2))
                                (define %34 (extract  %33 j0.new %arg0))
                                %34
                                )
                      )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm512_mask_cmpgt_epi8_mask  %arg3 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %1 (extract  j0 j0 k1))
                            (if (equal? %1 (bv #b1 1))
                              (begin
                                (define %factor0 (/  %arg2  %elemsize))
                                (define %0.copy.0 (*  j0  %factor0))
                                (define %lastidx1 (-  %arg2  1))
                                (define %2 (+  %0.copy.0  %lastidx1))
                                (define %3 (extract  %2 %0.copy.0 a))
                                (define %5 (extract  %2 %0.copy.0 b))
                                (define %6 (bvsgt  %3  %5))
                                (define %7 (if (equal? %6 #t) %arg0 %arg1))
                                %7
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %highidx1 (+  j0  %lastidx2))
                                (define %8 (extract  %highidx1 j0 %arg3))
                                %8
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k %arg4)
  )

(define (_mm256_mask_blend_epi32  k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm512_srlv_epi64  %arg2 a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg3 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx0 (-  %elemsize  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new count))
                            (define %3 (bvult  %2  %arg0))
                            (if (equal? %3 #t)
                              (begin
                                (define %lastidx1 (-  %arg1  1))
                                (define %4 (+  j0.new  %lastidx1))
                                (define %5 (extract  %4 j0.new a))
                                (define %7 (extract  %4 j0.new count))
                                (define %8 (bvlshr  %5  %7))
                                %8
                                )
                              (begin
                                (define %lastidx2 (-  %arg1  1))
                                (define %11 (+  j0.new  %lastidx2))
                                (define %12 (extract  %11 j0.new %arg2))
                                %12
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm256_hsubs_epi16  a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
  (define dst
    (apply
      concat
      (for/list ([iterator.lane (reverse (range 0 %vectsize %lanesize1))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                              (define %low.cofactor0 (*  iterator.0  %arg1))
                              (define %low.scaled.it0 (+  iterator.lane  %low.cofactor0))
                              (define %lastidx2 (-  %elemsize  1))
                              (define %high.offset0 (+  %low.scaled.it0  %lastidx2))
                              (define %0 (extract  %high.offset0 %low.scaled.it0 a))
                              (define %low.offset0 (+  %low.scaled.it0  %arg0))
                              (define %lastidx1 (-  %elemsize  1))
                              (define %high.offset1 (+  %low.offset0  %lastidx1))
                              (define %1 (extract  %high.offset1 %low.offset0 a))
                              (define %2 (bvsubnsw  %0  %1 %elemsize))
                              %2
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
                              (define %low.cofactor2 (*  iterator.1  %arg4))
                              (define %low.scaled.it3 (+  iterator.lane  %low.cofactor2))
                              (define %low.offset1.new0 (-  %low.scaled.it3  %arg3))
                              (define %lastidx5 (-  %elemsize1  1))
                              (define %high.offset3 (+  %low.offset1.new0  %lastidx5))
                              (define %16 (extract  %high.offset3 %low.offset1.new0 b))
                              (define %low.offset2.new0 (-  %low.scaled.it3  %arg2))
                              (define %lastidx4 (-  %elemsize1  1))
                              (define %high.offset4 (+  %low.offset2.new0  %lastidx4))
                              (define %17 (extract  %high.offset4 %low.offset2.new0 b))
                              (define %18 (bvsubnsw  %16  %17 %elemsize1))
                              %18
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg5)
  )

(define (_mm512_or_si512  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx2 (-  %elemsize  1))
                            (define %highidx2 (+  %lastidx2  %arg2))
                            (define %0 (extract  %highidx2 %arg2 a))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %1 (extract  %highidx1 %arg1 b))
                            (define %2 (bvor  %0  %1))
                            %2
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm_broadcastmb_epi64  k %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
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
  (bvpadhighbits  dst %arg2)
  )

(define (_mm512_maskz_cvtusepi16_epi8  %arg1 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg2 )
  (define dst
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
                                (define %5 (bvusat %4 %arg0 %elemsize ))
                                %5
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %8 (+  j0.new  %lastidx2))
                                (define %9 (extract  %8 j0.new %arg1))
                                %9
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm512_maskz_srli_epi64  %arg6 %arg3 k a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 %arg5 %arg7 )
  (define dst
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
                                (define %highidx0 (+  %lastidx0  %arg1))
                                (define %2 (extract  %highidx0 %arg1 imm8))
                                (define %3 (bvugt  %2  %arg0))
                                (if (equal? %3 #t)
                                  (begin
                                    (define %factor0 (/  %arg2  %elemsize))
                                    (define %0.copy.0.new0 (*  j0.new  %factor0))
                                    (define %lastidx1 (-  %arg2  1))
                                    (define %5 (+  %0.copy.0.new0  %lastidx1))
                                    (define %14 (extract  %5 %0.copy.0.new0 %arg3))
                                    %14
                                    )
                                  (begin
                                    (define %factor1 (/  %arg2  %elemsize))
                                    (define %0.copy.2.new0 (*  j0.new  %factor1))
                                    (define %lastidx2 (-  %arg2  1))
                                    (define %6 (+  %0.copy.2.new0  %lastidx2))
                                    (define %7 (extract  %6 %0.copy.2.new0 a))
                                    (define %lastidx3 (-  %arg4  1))
                                    (define %highidx1 (+  %lastidx3  %arg5))
                                    (define %8 (extract  %highidx1 %arg5 imm8))
                                    (define %9 (zero-extend  %8 (bitvector %arg2)))
                                    (define %10 (bvashr  %7  %9))
                                    %10
                                    )
                                  )
                                )
                              (begin
                                (define %factor2 (/  %arg2  %elemsize))
                                (define %0.copy.5.new0 (*  j0.new  %factor2))
                                (define %lastidx4 (-  %arg2  1))
                                (define %13 (+  %0.copy.5.new0  %lastidx4))
                                (define %15 (extract  %13 %0.copy.5.new0 %arg6))
                                %15
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg7)
  )

(define (_mm_extract_epi8  a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx3 (-  %arg3  1))
                            (define %highidx3 (+  %lastidx3  %arg6))
                            (define %0 (extract  %highidx3 %arg6 a))
                            (define %lastidx2 (-  %elemsize  1))
                            (define %highidx2 (+  %lastidx2  %arg5))
                            (define %1 (extract  %highidx2 %arg5 imm8))
                            (define %2 (bvmul  %1  %arg4))
                            (define %3 (zero-extend  %2 (bitvector %arg3)))
                            (define %4 (bvashr  %0  %3))
                            (define %lastidx1 (-  %arg0  1))
                            (define %highidx1 (+  %lastidx1  %arg2))
                            (define %5 (extract  %highidx1 %arg2 %4))
                            %5
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg7)
  )

(define (_mm_cmpeq_epu8_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %factor0 (/  %arg2  %elemsize))
                            (define %0 (*  j0  %factor0))
                            (define %lastidx1 (-  %arg2  1))
                            (define %1 (+  %0  %lastidx1))
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
  (bvpadhighbits  k %arg3)
  )

(define (_mm_maskz_srlv_epi32  %arg3 %arg2 k a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg4 )
  (define dst
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
                                (define %3 (extract  %2 j0.new count))
                                (define %4 (bvult  %3  %arg0))
                                (if (equal? %4 #t)
                                  (begin
                                    (define %lastidx1 (-  %arg1  1))
                                    (define %5 (+  j0.new  %lastidx1))
                                    (define %6 (extract  %5 j0.new a))
                                    (define %8 (extract  %5 j0.new count))
                                    (define %9 (bvashr  %6  %8))
                                    %9
                                    )
                                  (begin
                                    (define %lastidx2 (-  %arg1  1))
                                    (define %12 (+  j0.new  %lastidx2))
                                    (define %15 (extract  %12 j0.new %arg2))
                                    %15
                                    )
                                  )
                                )
                              (begin
                                (define %lastidx3 (-  %arg1  1))
                                (define %14 (+  j0.new  %lastidx3))
                                (define %16 (extract  %14 j0.new %arg3))
                                %16
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm512_max_epu32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm_maskz_dpwssds_epi32  %arg0 k src a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
                (define j0.new.div (/  j0.new  %lanesize1))
                (define %0 (extract  j0.new.div j0.new.div k))
                (if (equal? %0 (bv #b1 1))
                  (begin
                    (apply
                      concat
                      (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                                (define %2.new0 (+  j0.new  iterator.0.new))
                                (define %lastidx1 (-  %elemsize  1))
                                (define %3 (+  %2.new0  %lastidx1))
                                (define %4 (extract  %3 %2.new0 a))
                                (define %5 (sign-extend  %4 (bitvector %lanesize1)))
                                (define %9 (extract  %3 %2.new0 b))
                                (define %10 (sign-extend  %9 (bitvector %lanesize1)))
                                (define %11 (bvmul  %5  %10))
                                (define %lastidx0 (-  %lanesize1  1))
                                (define %32.clone.2 (+  j0.new  %lastidx0))
                                (define %11.ext0 (extract  %32.clone.2 j0.new src))
                                (define %11.acc0 (bvaddnsw  %11.ext0  %11 %lanesize1))
                                %11.acc0
                                )
                      )
                    )
                  (begin
                    (apply
                      concat
                      (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
                                (define %lastidx2 (-  %lanesize1  1))
                                (define %34 (+  j0.new  %lastidx2))
                                (define %35 (extract  %34 j0.new %arg0))
                                %35
                                )
                      )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_maskz_sll_epi64  %arg5 %arg3 k a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 %arg6 )
  (define dst
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
                                (define %highidx0 (+  %lastidx0  %arg1))
                                (define %2 (extract  %highidx0 %arg1 count))
                                (define %3 (bvugt  %2  %arg0))
                                (if (equal? %3 #t)
                                  (begin
                                    (define %lastidx1 (-  %arg2  1))
                                    (define %5 (+  j0.new  %lastidx1))
                                    (define %13 (extract  %5 j0.new %arg3))
                                    %13
                                    )
                                  (begin
                                    (define %lastidx2 (-  %arg2  1))
                                    (define %6 (+  j0.new  %lastidx2))
                                    (define %7 (extract  %6 j0.new a))
                                    (define %lastidx3 (-  %arg2  1))
                                    (define %highidx1 (+  %lastidx3  %arg4))
                                    (define %8 (extract  %highidx1 %arg4 count))
                                    (define %9 (bvlshr  %7  %8))
                                    %9
                                    )
                                  )
                                )
                              (begin
                                (define %lastidx4 (-  %arg2  1))
                                (define %12 (+  j0.new  %lastidx4))
                                (define %14 (extract  %12 j0.new %arg5))
                                %14
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg6)
  )

(define (_mm_movpi64_epi64  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %0 (extract  %highidx1 %arg1 a))
                            %0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm256_mask_packus_epi16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
  0
  )

(define (_mm512_fmadd_epi32  a b c %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
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
                            (define %6 (zero-extend  %3 (bitvector %arg0)))
                            (define %7 (zero-extend  %5 (bitvector %arg0)))
                            (define %8 (bvmul  %6  %7))
                            (define %10 (extract  %2 j0.new c))
                            (define %11 (zero-extend  %10 (bitvector %arg0)))
                            (define %12 (bvadd  %8  %11))
                            (define %14.high.idx (- %arg0 1))
                            (define %14.low.idx (+ (- %14.high.idx %elemsize) 1) )
                            (define %14 (extract  %14.high.idx %14.low.idx %12))
                            %14
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_mask_add_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
                                (define %13 (extract  %12 j0.new src))
                                %13
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg0)
  )

(define (_mm_mul_su32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx2 (-  %elemsize  1))
                            (define %highidx2 (+  %lastidx2  %arg3))
                            (define %0 (extract  %highidx2 %arg3 a))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg2))
                            (define %1 (extract  %highidx1 %arg2 b))
                            (define %2 (zero-extend  %0 (bitvector %arg0)))
                            (define %3 (zero-extend  %1 (bitvector %arg0)))
                            (define %4 (bvmul  %2  %3))
                            %4
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm_mask_cmpge_epi64_mask  %arg3 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %1 (extract  j0 j0 k1))
                            (if (equal? %1 (bv #b1 1))
                              (begin
                                (define %factor0 (/  %arg2  %elemsize))
                                (define %0.copy.0 (*  j0  %factor0))
                                (define %lastidx1 (-  %arg2  1))
                                (define %2 (+  %0.copy.0  %lastidx1))
                                (define %3 (extract  %2 %0.copy.0 a))
                                (define %5 (extract  %2 %0.copy.0 b))
                                (define %6 (bvsge  %3  %5))
                                (define %7 (if (equal? %6 #t) %arg0 %arg1))
                                %7
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %highidx1 (+  j0  %lastidx2))
                                (define %8 (extract  %highidx1 j0 %arg3))
                                %8
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k %arg4)
  )

(define (_mm256_cmple_epu32_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %factor0 (/  %arg2  %elemsize))
                            (define %0 (*  j0  %factor0))
                            (define %lastidx1 (-  %arg2  1))
                            (define %1 (+  %0  %lastidx1))
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
  (bvpadhighbits  k %arg3)
  )

(define (_mm512_test_epi32_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %factor0 (/  %arg3  %elemsize))
                            (define %0 (*  j0  %factor0))
                            (define %lastidx1 (-  %arg3  1))
                            (define %1 (+  %0  %lastidx1))
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
  (bvpadhighbits  k %arg4)
  )

(define (_m_packuswb  a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                              (define %factor0 (/  %arg0  %elemsize))
                              (define %low.cofactor0 (*  iterator.0  %factor0))
                              (define %lastidx1 (-  %arg0  1))
                              (define %high.offset0 (+  %low.cofactor0  %lastidx1))
                              (define %0 (extract  %high.offset0 %low.cofactor0 a))
                              (define %1 (bvusat %0 %arg0 %elemsize ))
                              %1
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
                              (define %low.cofactor1 (*  iterator.1  %arg3))
                              (define %low.offset0.new0 (-  %low.cofactor1  %arg2))
                              (define %lastidx3 (-  %arg1  1))
                              (define %high.offset2 (+  %low.offset0.new0  %lastidx3))
                              (define %8 (extract  %high.offset2 %low.offset0.new0 b))
                              (define %9 (bvusat %8 %arg1 %elemsize1 ))
                              %9
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm_hsub_pi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx5 (-  %elemsize  1))
                            (define %highidx5 (+  %lastidx5  %arg5))
                            (define %0 (extract  %highidx5 %arg5 a))
                            (define %lastidx4 (-  %elemsize  1))
                            (define %highidx4 (+  %lastidx4  %arg4))
                            (define %1 (extract  %highidx4 %arg4 a))
                            (define %2 (bvsub  %0  %1))
                            (define %lastidx2 (-  %elemsize  1))
                            (define %highidx2 (+  %lastidx2  %arg2))
                            (define %3 (extract  %highidx2 %arg2 b))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %4 (extract  %highidx1 %arg1 b))
                            (define %5 (bvsub  %3  %4))
                            (concat %5 %2)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg6)
  )

(define (_mm_maskz_subs_epu8  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
  (define dst
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
                                (define %11 (extract  %10 j0.new %arg0))
                                %11
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_subs_pi8  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm512_mask_srli_epi64  %arg3 src k a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 %arg5 %arg6 )
  (define dst
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
                                (define %highidx0 (+  %lastidx0  %arg1))
                                (define %2 (extract  %highidx0 %arg1 imm8))
                                (define %3 (bvugt  %2  %arg0))
                                (if (equal? %3 #t)
                                  (begin
                                    (define %factor0 (/  %arg2  %elemsize))
                                    (define %0.copy.0.new0 (*  j0.new  %factor0))
                                    (define %lastidx1 (-  %arg2  1))
                                    (define %5 (+  %0.copy.0.new0  %lastidx1))
                                    (define %16 (extract  %5 %0.copy.0.new0 %arg3))
                                    %16
                                    )
                                  (begin
                                    (define %factor1 (/  %arg2  %elemsize))
                                    (define %0.copy.2.new0 (*  j0.new  %factor1))
                                    (define %lastidx2 (-  %arg2  1))
                                    (define %6 (+  %0.copy.2.new0  %lastidx2))
                                    (define %7 (extract  %6 %0.copy.2.new0 a))
                                    (define %lastidx3 (-  %arg4  1))
                                    (define %highidx1 (+  %lastidx3  %arg5))
                                    (define %8 (extract  %highidx1 %arg5 imm8))
                                    (define %9 (zero-extend  %8 (bitvector %arg2)))
                                    (define %10 (bvashr  %7  %9))
                                    %10
                                    )
                                  )
                                )
                              (begin
                                (define %factor2 (/  %arg2  %elemsize))
                                (define %0.copy.5.new0 (*  j0.new  %factor2))
                                (define %lastidx4 (-  %arg2  1))
                                (define %13 (+  %0.copy.5.new0  %lastidx4))
                                (define %14 (extract  %13 %0.copy.5.new0 src))
                                %14
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg6)
  )

(define (_mm256_cmpgt_epu64_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %factor0 (/  %arg2  %elemsize))
                            (define %0 (*  j0  %factor0))
                            (define %lastidx1 (-  %arg2  1))
                            (define %1 (+  %0  %lastidx1))
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
  (bvpadhighbits  k %arg3)
  )

(define (_mm_cmpeq_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
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
  (bvpadhighbits  dst %arg2)
  )

(define (_mm256_mask_sll_epi64  %arg3 src k a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 %arg5 )
  (define dst
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
                                (define %highidx0 (+  %lastidx0  %arg1))
                                (define %2 (extract  %highidx0 %arg1 count))
                                (define %3 (bvugt  %2  %arg0))
                                (if (equal? %3 #t)
                                  (begin
                                    (define %lastidx1 (-  %arg2  1))
                                    (define %5 (+  j0.new  %lastidx1))
                                    (define %15 (extract  %5 j0.new %arg3))
                                    %15
                                    )
                                  (begin
                                    (define %lastidx2 (-  %arg2  1))
                                    (define %6 (+  j0.new  %lastidx2))
                                    (define %7 (extract  %6 j0.new a))
                                    (define %lastidx3 (-  %arg2  1))
                                    (define %highidx1 (+  %lastidx3  %arg4))
                                    (define %8 (extract  %highidx1 %arg4 count))
                                    (define %9 (bvlshr  %7  %8))
                                    %9
                                    )
                                  )
                                )
                              (begin
                                (define %lastidx4 (-  %arg2  1))
                                (define %12 (+  j0.new  %lastidx4))
                                (define %13 (extract  %12 j0.new src))
                                %13
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg5)
  )

(define (_mm_maskz_packs_epi16  %arg3 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
0
  )

(define (_mm256_mask_cvtepi16_epi64  src k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
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
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_cvtsi64_si128  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %0 (extract  %highidx1 %arg1 a))
                            %0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_rorv_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
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
                            (define %0.site0 (bvsmod  %4  %arg1))
                            (define %1.site0 (bvashr  %2  %0.site0))
                            (define %2.site0 (bvsub  %arg0  %0.site0))
                            (define %3.site0 (bvlshr  %2  %2.site0))
                            (define %4.site0 (bvor  %1.site0  %3.site0))
                            %4.site0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm512_sra_epi64  a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx0 (-  %elemsize  1))
                            (define %highidx0 (+  %lastidx0  %arg1))
                            (define %1 (extract  %highidx0 %arg1 count))
                            (define %2 (bvugt  %1  %arg0))
                            (if (equal? %2 #t)
                              (begin
                                (define %lastidx1 (-  %arg2  1))
                                (define %4 (+  j0.new  %lastidx1))
                                (define %5 (extract  %4 %4 a))
                                (define %6 (if (equal? %5 (bv #b1 1))
                                             %arg3 %arg4))
                                %6
                                )
                              (begin
                                (define %lastidx2 (-  %arg2  1))
                                (define %8 (+  j0.new  %lastidx2))
                                (define %9 (extract  %8 j0.new a))
                                (define %lastidx3 (-  %arg2  1))
                                (define %highidx1 (+  %lastidx3  %arg5))
                                (define %10 (extract  %highidx1 %arg5 count))
                                (define %11 (bvashr  %9  %10))
                                %11
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg6)
  )

(define (_mm_mask_cvtsepi16_epi8  src k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
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
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_maskz_dpbusds_epi32  %arg1 k src a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
                (define j0.new.div (/  j0.new  %lanesize1))
                (define %0 (extract  j0.new.div j0.new.div k))
                (if (equal? %0 (bv #b1 1))
                  (begin
                    (apply
                      concat
                      (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                                (define %2.new0 (+  j0.new  iterator.0.new))
                                (define %lastidx1 (-  %elemsize  1))
                                (define %3 (+  %2.new0  %lastidx1))
                                (define %4 (extract  %3 %2.new0 a))
                                (define %5 (zero-extend  %4 (bitvector %arg0)))
                                (define %9 (extract  %3 %2.new0 b))
                                (define %10 (sign-extend  %9 (bitvector %arg0)))
                                (define %11 (bvmul  %5  %10))
                                (define %12 (sign-extend  %11 (bitvector %lanesize1)))
                                (define %lastidx0 (-  %lanesize1  1))
                                (define %64.clone.4 (+  j0.new  %lastidx0))
                                (define %12.ext0 (extract  %64.clone.4 j0.new src))
                                (define %12.acc0 (bvaddnsw  %12.ext0  %12 %lanesize1))
                                %12.acc0
                                )
                      )
                    )
                  (begin
                    (apply
                      concat
                      (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
                                (define %lastidx2 (-  %lanesize1  1))
                                (define %66 (+  j0.new  %lastidx2))
                                (define %67 (extract  %66 j0.new %arg1))
                                %67
                                )
                      )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm512_min_epu64  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm_mask_max_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm256_mask_packs_epi16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
  0
  )

(define (_mm256_mask_srl_epi64  %arg3 src k a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 %arg5 )
  (define dst
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
                                (define %highidx0 (+  %lastidx0  %arg1))
                                (define %2 (extract  %highidx0 %arg1 count))
                                (define %3 (bvugt  %2  %arg0))
                                (if (equal? %3 #t)
                                  (begin
                                    (define %lastidx1 (-  %arg2  1))
                                    (define %5 (+  j0.new  %lastidx1))
                                    (define %15 (extract  %5 j0.new %arg3))
                                    %15
                                    )
                                  (begin
                                    (define %lastidx2 (-  %arg2  1))
                                    (define %6 (+  j0.new  %lastidx2))
                                    (define %7 (extract  %6 j0.new a))
                                    (define %lastidx3 (-  %arg2  1))
                                    (define %highidx1 (+  %lastidx3  %arg4))
                                    (define %8 (extract  %highidx1 %arg4 count))
                                    (define %9 (bvashr  %7  %8))
                                    %9
                                    )
                                  )
                                )
                              (begin
                                (define %lastidx4 (-  %arg2  1))
                                (define %12 (+  j0.new  %lastidx4))
                                (define %13 (extract  %12 j0.new src))
                                %13
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg5)
  )

(define (_mm256_mulhrs_epi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
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
                            (define %10 (extract  %highidx0 %arg0 %9))
                            %10
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm_cvtm64_si64  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %0 (extract  %highidx1 %arg1 a))
                            %0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_extract_epi16  a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx3 (-  %arg3  1))
                            (define %highidx3 (+  %lastidx3  %arg7))
                            (define %0 (extract  %highidx3 %arg7 a))
                            (define %lastidx2 (-  %elemsize  1))
                            (define %highidx2 (+  %lastidx2  %arg6))
                            (define %1 (extract  %highidx2 %arg6 imm8))
                            (define %2 (zero-extend  %1 (bitvector %arg5)))
                            (define %3 (bvmul  %2  %arg4))
                            (define %4 (zero-extend  %3 (bitvector %arg3)))
                            (define %5 (bvashr  %0  %4))
                            (define %lastidx1 (-  %arg0  1))
                            (define %highidx1 (+  %lastidx1  %arg2))
                            (define %6 (extract  %highidx1 %arg2 %5))
                            %6
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg8)
  )

(define (_mm256_cvtepu8_epi16  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
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
  (bvpadhighbits  dst %arg1)
  )

(define (_mm256_mask_srlv_epi64  %arg2 src k a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg3 )
  (define dst
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
                                (define %3 (extract  %2 j0.new count))
                                (define %4 (bvult  %3  %arg0))
                                (if (equal? %4 #t)
                                  (begin
                                    (define %lastidx1 (-  %arg1  1))
                                    (define %5 (+  j0.new  %lastidx1))
                                    (define %6 (extract  %5 j0.new a))
                                    (define %8 (extract  %5 j0.new count))
                                    (define %9 (bvashr  %6  %8))
                                    %9
                                    )
                                  (begin
                                    (define %lastidx2 (-  %arg1  1))
                                    (define %12 (+  j0.new  %lastidx2))
                                    (define %17 (extract  %12 j0.new %arg2))
                                    %17
                                    )
                                  )
                                )
                              (begin
                                (define %lastidx3 (-  %arg1  1))
                                (define %14 (+  j0.new  %lastidx3))
                                (define %15 (extract  %14 j0.new src))
                                %15
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm_hsub_pi16  a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                              (define %factor0 (/  %elemsize  %elemsize))
                              (define %low.cofactor0 (*  iterator.0  %factor0))
                              (define %lastidx2 (-  %elemsize  1))
                              (define %high.offset0 (+  %low.cofactor0  %lastidx2))
                              (define %0 (extract  %high.offset0 %low.cofactor0 a))
                              (define %low.offset0 (+  %low.cofactor0  %arg0))
                              (define %lastidx1 (-  %elemsize  1))
                              (define %high.offset1 (+  %low.offset0  %lastidx1))
                              (define %1 (extract  %high.offset1 %low.offset0 a))
                              (define %2 (bvsub  %0  %1))
                              %2
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
                              (define %low.cofactor2 (*  iterator.1  %arg3))
                              (define %low.offset1.new0 (-  %low.cofactor2  %arg2))
                              (define %lastidx5 (-  %elemsize1  1))
                              (define %high.offset3 (+  %low.offset1.new0  %lastidx5))
                              (define %6 (extract  %high.offset3 %low.offset1.new0 b))
                              (define %low.offset2.new0 (-  %low.cofactor2  %arg1))
                              (define %lastidx4 (-  %elemsize1  1))
                              (define %high.offset4 (+  %low.offset2.new0  %lastidx4))
                              (define %7 (extract  %high.offset4 %low.offset2.new0 b))
                              (define %8 (bvsub  %6  %7))
                              %8
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm512_maskz_rorv_epi64  %arg2 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg3 )
  (define dst
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
                                (define %0.site0 (bvsmod  %5  %arg1))
                                (define %1.site0 (bvashr  %3  %0.site0))
                                (define %2.site0 (bvsub  %arg0  %0.site0))
                                (define %3.site0 (bvlshr  %3  %2.site0))
                                (define %4.site0 (bvor  %1.site0  %3.site0))
                                %4.site0
                                )
                              (begin
                                (define %lastidx1 (-  %elemsize  1))
                                (define %9 (+  j0.new  %lastidx1))
                                (define %10 (extract  %9 j0.new %arg2))
                                %10
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm256_mask_test_epi64_mask  %arg4 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg5 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %1 (extract  j0 j0 k1))
                            (if (equal? %1 (bv #b1 1))
                              (begin
                                (define %factor0 (/  %arg3  %elemsize))
                                (define %0.copy.0 (*  j0  %factor0))
                                (define %lastidx1 (-  %arg3  1))
                                (define %2 (+  %0.copy.0  %lastidx1))
                                (define %3 (extract  %2 %0.copy.0 a))
                                (define %5 (extract  %2 %0.copy.0 b))
                                (define %6 (bvand  %3  %5))
                                (define %7 (not (bveq  %6  %arg2 )))
                                (define %8 (if (equal? %7 #t) %arg0 %arg1))
                                %8
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %highidx1 (+  j0  %lastidx2))
                                (define %9 (extract  %highidx1 j0 %arg4))
                                %9
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k %arg5)
  )

(define (_mm_maskz_avg_epu8  %arg2 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg3 )
  (define dst
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
                                (define %8 (bvadd  %7  %arg1))
                                (define %9 (bvashr  %8  %arg0))
                                %9
                                )
                              (begin
                                (define %lastidx1 (-  %elemsize  1))
                                (define %12 (+  j0.new  %lastidx1))
                                (define %13 (extract  %12 j0.new %arg2))
                                %13
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm512_ror_epi64  a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %factor0 (/  %arg0  %elemsize))
                            (define %0.new0 (*  j0.new  %factor0))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  %0.new0  %lastidx0))
                            (define %2 (extract  %1 %0.new0 a))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx0 (+  %lastidx1  %arg3))
                            (define %3 (extract  %highidx0 %arg3 imm8))
                            (define %0.site0 (bvsmod  %3  %arg2))
                            (define %1.site0 (zero-extend  %0.site0 (bitvector %arg0)))
                            (define %2.site0 (bvashr  %2  %1.site0))
                            (define %3.site0 (bvsub  %arg1  %0.site0))
                            (define %4.site0 (zero-extend  %3.site0 (bitvector %arg0)))
                            (define %5.site0 (bvlshr  %2  %4.site0))
                            (define %6.site0 (bvor  %2.site0  %5.site0))
                            %6.site0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm512_mask_packus_epi16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  0
  )

(define (_mm_mask_sub_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
                                (define %13 (extract  %12 j0.new src))
                                %13
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg0)
  )

(define (_mm_mask_packs_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
0
  )

(define (_mm256_mask_cmplt_epu64_mask  %arg3 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %1 (extract  j0 j0 k1))
                            (if (equal? %1 (bv #b1 1))
                              (begin
                                (define %factor0 (/  %arg2  %elemsize))
                                (define %0.copy.0 (*  j0  %factor0))
                                (define %lastidx1 (-  %arg2  1))
                                (define %2 (+  %0.copy.0  %lastidx1))
                                (define %3 (extract  %2 %0.copy.0 a))
                                (define %5 (extract  %2 %0.copy.0 b))
                                (define %6 (bvult  %3  %5))
                                (define %7 (if (equal? %6 #t) %arg0 %arg1))
                                %7
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %highidx1 (+  j0  %lastidx2))
                                (define %8 (extract  %highidx1 j0 %arg3))
                                %8
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k %arg4)
  )

(define (_mm256_maskz_packs_epi32  %arg5 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg6 )
0
  )

(define (_m_psllwi  %arg3 a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 %arg5 %arg6 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx0 (-  %elemsize  1))
                            (define %highidx0 (+  %lastidx0  %arg1))
                            (define %1 (extract  %highidx0 %arg1 imm8))
                            (define %2 (bvugt  %1  %arg0))
                            (if (equal? %2 #t)
                              (begin
                                (define %factor0 (/  %arg2  %elemsize))
                                (define %0.copy.0.new0 (*  j0.new  %factor0))
                                (define %lastidx1 (-  %arg2  1))
                                (define %4 (+  %0.copy.0.new0  %lastidx1))
                                (define %11 (extract  %4 %0.copy.0.new0 %arg3))
                                %11
                                )
                              (begin
                                (define %factor1 (/  %arg2  %elemsize))
                                (define %0.copy.2.new0 (*  j0.new  %factor1))
                                (define %lastidx2 (-  %arg2  1))
                                (define %5 (+  %0.copy.2.new0  %lastidx2))
                                (define %6 (extract  %5 %0.copy.2.new0 a))
                                (define %lastidx3 (-  %arg4  1))
                                (define %highidx1 (+  %lastidx3  %arg5))
                                (define %7 (extract  %highidx1 %arg5 imm8))
                                (define %8 (zero-extend  %7 (bitvector %arg2)))
                                (define %9 (bvshl  %6  %8))
                                %9
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg6)
  )

(define (_mm256_max_epi64  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm_sub_epi8  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm_cvtsi32_si64  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %0 (extract  %highidx1 %arg1 a))
                            %0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_maskz_adds_epi16  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
  (define dst
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
                                (define %11 (extract  %10 j0.new %arg0))
                                %11
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_unpackhi_pi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx3 (-  %elemsize  1))
                            (define %highidx3 (+  %lastidx3  %arg3))
                            (define %0 (extract  %highidx3 %arg3 a))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %1 (extract  %highidx1 %arg1 b))
                            (concat %1 %0)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm256_mask_cmple_epu32_mask  %arg3 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %1 (extract  j0 j0 k1))
                            (if (equal? %1 (bv #b1 1))
                              (begin
                                (define %factor0 (/  %arg2  %elemsize))
                                (define %0.copy.0 (*  j0  %factor0))
                                (define %lastidx1 (-  %arg2  1))
                                (define %2 (+  %0.copy.0  %lastidx1))
                                (define %3 (extract  %2 %0.copy.0 a))
                                (define %5 (extract  %2 %0.copy.0 b))
                                (define %6 (bvule  %3  %5))
                                (define %7 (if (equal? %6 #t) %arg0 %arg1))
                                %7
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %highidx1 (+  j0  %lastidx2))
                                (define %8 (extract  %highidx1 j0 %arg3))
                                %8
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k %arg4)
  )

(define (_mm512_andnot_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

  ; (define (_mm512_dpwssd_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  ;(define dst
  ;  (apply
  ;    concat
  ;    (for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
  ;              (apply
  ;                concat
  ;                (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
  ;                          (define %1.new0 (+  j0.new  iterator.0.new))
  ;                          (define %lastidx1 (-  %elemsize  1))
  ;                          (define %2 (+  %1.new0  %lastidx1))
  ;                          (define %3 (extract  %2 %1.new0 a))
  ;                          (define %4 (sign-extend  %3 (bitvector %lanesize1)))
  ;                          (define %8 (extract  %2 %1.new0 b))
  ;                          (define %9 (sign-extend  %8 (bitvector %lanesize1)))
  ;                          (define %10 (bvmul  %4  %9))
  ;                          (define %lastidx0 (-  %lanesize1  1))
  ;                          (define %30.clone.2 (+  j0.new  %lastidx0))
  ;                          (define %10.ext0 (extract  %30.clone.2 j0.new src))
  ;                          (define %10.acc0 (bvadd  %10.ext0  %10))
  ;                          %10.acc0
  ;                          )
  ;                )
  ;              )
  ;    )
  ;  )
  ;(bvpadhighbits  dst %arg0)
  ;)


(define (_mm512_dpwssd_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  ;(printf "Invoked _mm512_dpwssd_epi32 with arguments ~a ~a ~a ~a ~a ~a ~a ~a ~a\n" src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0)
(define dst src)
(define res (apply
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
))

  (bvpadhighbits  res %arg0)
)

(define (_mm_mask_packs_epi16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
0
  )

(define (_mm512_mask_mulhi_epu32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
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
                                (define %7 (zero-extend  %4 (bitvector %arg1)))
                                (define %8 (zero-extend  %6 (bitvector %arg1)))
                                (define %9 (bvmul  %7  %8))
                                (define %10 (bvashr  %9  %arg0))
                                (define %12.high.idx (- %arg1 1))
                                (define %12.low.idx (+ (- %12.high.idx %elemsize) 1) )
                                (define %12 (extract  %12.high.idx %12.low.idx %10))
                                %12
                                )
                              (begin
                                (define %lastidx1 (-  %elemsize  1))
                                (define %14 (+  j0.new  %lastidx1))
                                (define %15 (extract  %14 j0.new src))
                                %15
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_abs_epi8  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm512_mask_packus_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  0
    )

(define (_mm512_mask_packs_epi16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  0
  )

(define (_mm256_sll_epi64  %arg3 a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 %arg5 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx0 (-  %elemsize  1))
                            (define %highidx0 (+  %lastidx0  %arg1))
                            (define %1 (extract  %highidx0 %arg1 count))
                            (define %2 (bvugt  %1  %arg0))
                            (if (equal? %2 #t)
                              (begin
                                (define %lastidx1 (-  %arg2  1))
                                (define %4 (+  j0.new  %lastidx1))
                                (define %10 (extract  %4 j0.new %arg3))
                                %10
                                )
                              (begin
                                (define %lastidx2 (-  %arg2  1))
                                (define %5 (+  j0.new  %lastidx2))
                                (define %6 (extract  %5 j0.new a))
                                (define %lastidx3 (-  %arg2  1))
                                (define %highidx1 (+  %lastidx3  %arg4))
                                (define %7 (extract  %highidx1 %arg4 count))
                                (define %8 (bvlshr  %6  %7))
                                %8
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg5)
  )

(define (_mm256_cvtepi8_epi16  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
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
  (bvpadhighbits  dst %arg1)
  )

(define (_mm256_mask_testn_epi16_mask  %arg4 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg5 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %1 (extract  j0 j0 k1))
                            (if (equal? %1 (bv #b1 1))
                              (begin
                                (define %factor0 (/  %arg3  %elemsize))
                                (define %0.copy.0 (*  j0  %factor0))
                                (define %lastidx1 (-  %arg3  1))
                                (define %2 (+  %0.copy.0  %lastidx1))
                                (define %3 (extract  %2 %0.copy.0 a))
                                (define %5 (extract  %2 %0.copy.0 b))
                                (define %6 (bvand  %3  %5))
                                (define %7 (bveq  %6  %arg2))
                                (define %8 (if (equal? %7 #t) %arg0 %arg1))
                                %8
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %highidx1 (+  j0  %lastidx2))
                                (define %9 (extract  %highidx1 j0 %arg4))
                                %9
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k %arg5)
  )

(define (_mm512_cmpgt_epi32_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %factor0 (/  %arg2  %elemsize))
                            (define %0 (*  j0  %factor0))
                            (define %lastidx1 (-  %arg2  1))
                            (define %1 (+  %0  %lastidx1))
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
  (bvpadhighbits  k %arg3)
  )

(define (_mm512_mul_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
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
  (bvpadhighbits  dst %arg1)
  )

(define (_mm256_mask_cmple_epi32_mask  %arg3 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %1 (extract  j0 j0 k1))
                            (if (equal? %1 (bv #b1 1))
                              (begin
                                (define %factor0 (/  %arg2  %elemsize))
                                (define %0.copy.0 (*  j0  %factor0))
                                (define %lastidx1 (-  %arg2  1))
                                (define %2 (+  %0.copy.0  %lastidx1))
                                (define %3 (extract  %2 %0.copy.0 a))
                                (define %5 (extract  %2 %0.copy.0 b))
                                (define %6 (bvsle  %3  %5))
                                (define %7 (if (equal? %6 #t) %arg0 %arg1))
                                %7
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %highidx1 (+  j0  %lastidx2))
                                (define %8 (extract  %highidx1 j0 %arg3))
                                %8
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k %arg4)
  )

(define (_mm_maskz_dpbusd_epi32  %arg1 k src a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
                (define j0.new.div (/  j0.new  %lanesize1))
                (define %0 (extract  j0.new.div j0.new.div k))
                (if (equal? %0 (bv #b1 1))
                  (begin
                    (apply
                      concat
                      (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                                (define %2.new0 (+  j0.new  iterator.0.new))
                                (define %lastidx1 (-  %elemsize  1))
                                (define %3 (+  %2.new0  %lastidx1))
                                (define %4 (extract  %3 %2.new0 a))
                                (define %5 (zero-extend  %4 (bitvector %arg0)))
                                (define %9 (extract  %3 %2.new0 b))
                                (define %10 (sign-extend  %9 (bitvector %arg0)))
                                (define %11 (bvmul  %5  %10))
                                (define %12 (sign-extend  %11 (bitvector %lanesize1)))
                                (define %lastidx0 (-  %lanesize1  1))
                                (define %63.clone.4 (+  j0.new  %lastidx0))
                                (define %12.ext0 (extract  %63.clone.4 j0.new src))
                                (define %12.acc0 (bvadd  %12.ext0  %12))
                                %12.acc0
                                )
                      )
                    )
                  (begin
                    (apply
                      concat
                      (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
                                (define %lastidx2 (-  %lanesize1  1))
                                (define %65 (+  j0.new  %lastidx2))
                                (define %66 (extract  %65 j0.new %arg1))
                                %66
                                )
                      )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_movm_epi8  %arg1 %arg0 k %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg2 )
  (define dst
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
                                (define %6 (extract  %3 j0.new %arg0))
                                %6
                                )
                              (begin
                                (define %lastidx1 (-  %elemsize  1))
                                (define %5 (+  j0.new  %lastidx1))
                                (define %7 (extract  %5 j0.new %arg1))
                                %7
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_sub_si64  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx2 (-  %elemsize  1))
                            (define %highidx2 (+  %lastidx2  %arg2))
                            (define %0 (extract  %highidx2 %arg2 a))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %1 (extract  %highidx1 %arg1 b))
                            (define %2 (bvsub  %0  %1))
                            %2
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm512_maskz_srai_epi16  %arg7 k a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg8 )
  (define dst
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
                                (define %highidx0 (+  %lastidx0  %arg1))
                                (define %2 (extract  %highidx0 %arg1 imm8))
                                (define %3 (bvugt  %2  %arg0))
                                (if (equal? %3 #t)
                                  (begin
                                    (define %factor0 (/  %arg2  %elemsize))
                                    (define %0.copy.0.new0 (*  j0.new  %factor0))
                                    (define %lastidx1 (-  %arg2  1))
                                    (define %5 (+  %0.copy.0.new0  %lastidx1))
                                    (define %6 (extract  %5 %5 a))
                                    (define %7 (if (equal? %6 (bv #b1 1))
                                                 %arg3 %arg4))
                                    %7
                                    )
                                  (begin
                                    (define %factor1 (/  %arg2  %elemsize))
                                    (define %0.copy.2.new0 (*  j0.new  %factor1))
                                    (define %lastidx2 (-  %arg2  1))
                                    (define %9 (+  %0.copy.2.new0  %lastidx2))
                                    (define %10 (extract  %9 %0.copy.2.new0 a))
                                    (define %lastidx3 (-  %arg5  1))
                                    (define %highidx1 (+  %lastidx3  %arg6))
                                    (define %11 (extract  %highidx1 %arg6 imm8))
                                    (define %12 (zero-extend  %11 (bitvector %arg2)))
                                    (define %13 (bvashr  %10  %12))
                                    %13
                                    )
                                  )
                                )
                              (begin
                                (define %factor2 (/  %arg2  %elemsize))
                                (define %0.copy.5.new0 (*  j0.new  %factor2))
                                (define %lastidx4 (-  %arg2  1))
                                (define %16 (+  %0.copy.5.new0  %lastidx4))
                                (define %17 (extract  %16 %0.copy.5.new0 %arg7))
                                %17
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg8)
  )

(define (_mm512_maskz_and_epi64  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
  (define dst
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
  (bvpadhighbits  dst %arg1)
  )

(define (_mm256_mask_abs_epi16  src k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
                                (define %8 (extract  %7 j0.new src))
                                %8
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg0)
  )

(define (_mm256_mask_rolv_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
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
                                (define %0.site0 (bvsmod  %5  %arg1))
                                (define %1.site0 (bvlshr  %3  %0.site0))
                                (define %2.site0 (bvsub  %arg0  %0.site0))
                                (define %3.site0 (bvashr  %3  %2.site0))
                                (define %4.site0 (bvor  %1.site0  %3.site0))
                                %4.site0
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
  (bvpadhighbits  dst %arg2)
  )

(define (_mm256_movepi16_mask  %arg2 %arg1 a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg3 )
  (define k
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
                                (define %lastidx1 (-  %elemsize  1))
                                (define %highidx0 (+  j0  %lastidx1))
                                (define %3 (extract  %highidx0 j0 %arg1))
                                %3
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %highidx1 (+  j0  %lastidx2))
                                (define %4 (extract  %highidx1 j0 %arg2))
                                %4
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k %arg3)
  )

(define (_mm512_mask_subr_epi32  src k v2 v3 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm_mask_dpwssd_epi32  src k a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
                (define j0.new.div (/  j0.new  %lanesize1))
                (define %0 (extract  j0.new.div j0.new.div k))
                (if (equal? %0 (bv #b1 1))
                  (begin
                    (apply
                      concat
                      (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                                (define %2.new0 (+  j0.new  iterator.0.new))
                                (define %lastidx1 (-  %elemsize  1))
                                (define %3 (+  %2.new0  %lastidx1))
                                (define %4 (extract  %3 %2.new0 a))
                                (define %5 (sign-extend  %4 (bitvector %lanesize1)))
                                (define %9 (extract  %3 %2.new0 b))
                                (define %10 (sign-extend  %9 (bitvector %lanesize1)))
                                (define %11 (bvmul  %5  %10))
                                (define %lastidx0 (-  %lanesize1  1))
                                (define %31.clone.2 (+  j0.new  %lastidx0))
                                (define %11.ext0 (extract  %31.clone.2 j0.new src))
                                (define %11.acc0 (bvadd  %11.ext0  %11))
                                %11.acc0
                                )
                      )
                    )
                  (begin
                    (apply
                      concat
                      (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
                                (define %lastidx2 (-  %lanesize1  1))
                                (define %33 (+  j0.new  %lastidx2))
                                (define %34 (extract  %33 j0.new src))
                                %34
                                )
                      )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg0)
  )

(define (_mm_movemask_epi8  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %0 (*  j0  %arg1))
                            (define %1 (+  %0  %arg0))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %1  %lastidx1))
                            (define %2 (extract  %highidx1 %1 a))
                            %2
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm512_mask_cmpge_epu32_mask  %arg3 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %1 (extract  j0 j0 k1))
                            (if (equal? %1 (bv #b1 1))
                              (begin
                                (define %factor0 (/  %arg2  %elemsize))
                                (define %0.copy.0 (*  j0  %factor0))
                                (define %lastidx1 (-  %arg2  1))
                                (define %2 (+  %0.copy.0  %lastidx1))
                                (define %3 (extract  %2 %0.copy.0 a))
                                (define %5 (extract  %2 %0.copy.0 b))
                                (define %6 (bvuge  %3  %5))
                                (define %7 (if (equal? %6 #t) %arg0 %arg1))
                                %7
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %highidx1 (+  j0  %lastidx2))
                                (define %8 (extract  %highidx1 j0 %arg3))
                                %8
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k %arg4)
  )

(define (_mm_cvtsi64x_si128  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %0 (extract  %highidx1 %arg1 a))
                            %0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_sllv_epi64  %arg2 a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg3 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx0 (-  %elemsize  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new count))
                            (define %3 (bvult  %2  %arg0))
                            (if (equal? %3 #t)
                              (begin
                                (define %lastidx1 (-  %arg1  1))
                                (define %4 (+  j0.new  %lastidx1))
                                (define %5 (extract  %4 j0.new a))
                                (define %7 (extract  %4 j0.new count))
                                (define %8 (bvshl  %5  %7)) ;; MODIFIED
                                %8
                                )
                              (begin
                                (define %lastidx2 (-  %arg1  1))
                                (define %11 (+  j0.new  %lastidx2))
                                (define %12 (extract  %11 j0.new %arg2))
                                %12
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm_extract_pi16  a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx3 (-  %arg3  1))
                            (define %highidx3 (+  %lastidx3  %arg7))
                            (define %0 (extract  %highidx3 %arg7 a))
                            (define %lastidx2 (-  %elemsize  1))
                            (define %highidx2 (+  %lastidx2  %arg6))
                            (define %1 (extract  %highidx2 %arg6 imm8))
                            (define %2 (zero-extend  %1 (bitvector %arg5)))
                            (define %3 (bvmul  %2  %arg4))
                            (define %4 (zero-extend  %3 (bitvector %arg3)))
                            (define %5 (bvashr  %0  %4))
                            (define %lastidx1 (-  %arg0  1))
                            (define %highidx1 (+  %lastidx1  %arg2))
                            (define %6 (extract  %highidx1 %arg2 %5))
                            %6
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg8)
  )

(define (_mm512_maskz_srl_epi16  %arg7 %arg4 k a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg5 %arg6 %arg8 )
  (define dst
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
                                (define %lastidx0 (-  %arg1  1))
                                (define %highidx0 (+  %lastidx0  %arg2))
                                (define %2 (extract  %highidx0 %arg2 count))
                                (define %3 (bvugt  %2  %arg0))
                                (if (equal? %3 #t)
                                  (begin
                                    (define %lastidx1 (-  %arg3  1))
                                    (define %5 (+  j0.new  %lastidx1))
                                    (define %15 (extract  %5 j0.new %arg4))
                                    %15
                                    )
                                  (begin
                                    (define %lastidx2 (-  %arg3  1))
                                    (define %6 (+  j0.new  %lastidx2))
                                    (define %7 (extract  %6 j0.new a))
                                    (define %lastidx3 (-  %arg5  1))
                                    (define %highidx1 (+  %lastidx3  %arg6))
                                    (define %8 (extract  %highidx1 %arg6 count))
                                    (define %9 (zero-extend  %7 (bitvector %arg5)))
                                    (define %10 (bvashr  %9  %8))
                                    (define %12.high.idx (- %arg5 1))
                                    (define %12.low.idx (+ (- %12.high.idx %arg3) 1) )
                                    (define %12 (extract  %12.high.idx %12.low.idx %10))
                                    %12
                                    )
                                  )
                                )
                              (begin
                                (define %lastidx4 (-  %arg3  1))
                                (define %14 (+  j0.new  %lastidx4))
                                (define %16 (extract  %14 j0.new %arg7))
                                %16
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg8)
  )

;(define (_mm_dpwssds_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
;  (define dst
;    (apply
;      concat
;      (for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
;                (apply
;                  concat
;                  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
;                            (define %1.new0 (+  j0.new  iterator.0.new))
;                            (define %lastidx1 (-  %elemsize  1))
;                            (define %2 (+  %1.new0  %lastidx1))
;                            (define %3 (extract  %2 %1.new0 a))
;                            (define %4 (sign-extend  %3 (bitvector %lanesize1)))
;                            (define %8 (extract  %2 %1.new0 b))
;                            (define %9 (sign-extend  %8 (bitvector %lanesize1)))
;                            (define %10 (bvmul  %4  %9))
;                            (define %lastidx0 (-  %lanesize1  1))
;                            (define %31.clone.2 (+  j0.new  %lastidx0))
;                            (define %10.ext0 (extract  %31.clone.2 j0.new src))
;                            (define %10.acc0 (bvaddnsw  %10.ext0  %10 %lanesize1))
;                            %10.acc0
;                            )
;                  )
;                )
;      )
;    )
;  (bvpadhighbits  dst %arg0)
;  )


(define (_mm_dpwssds_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
(define dst src)
(define res (apply
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
 (define %10.acc0 (bvaddnsw %10.red %10.ext0))
 %10.acc0
)
))

  (bvpadhighbits  res %arg0)
)

(define (_mm256_maskz_or_epi32  %arg0 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg1 )
  (define dst
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
                                (define %13 (extract  %12 j0.new %arg0))
                                %13
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_mask_packus_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  0
  )

(define (_mm256_rolv_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
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
                            (define %0.site0 (bvsmod  %4  %arg1))
                            (define %1.site0 (bvlshr  %2  %0.site0))
                            (define %2.site0 (bvsub  %arg0  %0.site0))
                            (define %3.site0 (bvashr  %2  %2.site0))
                            (define %4.site0 (bvor  %1.site0  %3.site0))
                            %4.site0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_blendv_epi8  a b mask %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm256_setr_m128i  lo hi %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx3 (-  %elemsize  1))
                            (define %highidx3 (+  %lastidx3  %arg3))
                            (define %0 (extract  %highidx3 %arg3 lo))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %1 (extract  %highidx1 %arg1 hi))
                            (concat %1 %0)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm256_mask_cmpneq_epi16_mask  %arg3 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %1 (extract  j0 j0 k1))
                            (if (equal? %1 (bv #b1 1))
                              (begin
                                (define %factor0 (/  %arg2  %elemsize))
                                (define %0.copy.0 (*  j0  %factor0))
                                (define %lastidx1 (-  %arg2  1))
                                (define %2 (+  %0.copy.0  %lastidx1))
                                (define %3 (extract  %2 %0.copy.0 a))
                                (define %5 (extract  %2 %0.copy.0 b))
                                (define %6 (not (bveq  %3  %5 )))
                                (define %7 (if (equal? %6 #t) %arg0 %arg1))
                                %7
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %highidx1 (+  j0  %lastidx2))
                                (define %8 (extract  %highidx1 j0 %arg3))
                                %8
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k %arg4)
  )

(define (_mm256_testn_epi32_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %factor0 (/  %arg3  %elemsize))
                            (define %0 (*  j0  %factor0))
                            (define %lastidx1 (-  %arg3  1))
                            (define %1 (+  %0  %lastidx1))
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
  (bvpadhighbits  k %arg4)
  )

(define (_mm256_blend_epi16  a b imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
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
  (bvpadhighbits  dst %arg1)
  )

(define (_mm256_maskz_rol_epi64  %arg4 k a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg5 )
  (define dst
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
                                (define %lastidx0 (-  %arg0  1))
                                (define %2 (+  %0.copy.0.new0  %lastidx0))
                                (define %3 (extract  %2 %0.copy.0.new0 a))
                                (define %lastidx1 (-  %elemsize  1))
                                (define %highidx0 (+  %lastidx1  %arg3))
                                (define %4 (extract  %highidx0 %arg3 imm8))
                                (define %0.site0 (bvsmod  %4  %arg2))
                                (define %1.site0 (zero-extend  %0.site0 (bitvector %arg0)))
                                (define %2.site0 (bvlshr  %3  %1.site0))
                                (define %3.site0 (bvsub  %arg1  %0.site0))
                                (define %4.site0 (zero-extend  %3.site0 (bitvector %arg0)))
                                (define %5.site0 (bvashr  %3  %4.site0))
                                (define %6.site0 (bvor  %2.site0  %5.site0))
                                %6.site0
                                )
                              (begin
                                (define %factor1 (/  %arg0  %elemsize))
                                (define %0.copy.3.new0 (*  j0.new  %factor1))
                                (define %lastidx2 (-  %arg0  1))
                                (define %8 (+  %0.copy.3.new0  %lastidx2))
                                (define %9 (extract  %8 %0.copy.3.new0 %arg4))
                                %9
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg5)
  )

(define (_mm256_mask_subs_epi8  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
                                (define %11 (extract  %10 j0.new src))
                                %11
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg0)
  )

(define (_mm256_or_epi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_m_packsswb  a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                              (define %factor0 (/  %arg0  %elemsize))
                              (define %low.cofactor0 (*  iterator.0  %factor0))
                              (define %lastidx1 (-  %arg0  1))
                              (define %high.offset0 (+  %low.cofactor0  %lastidx1))
                              (define %0 (extract  %high.offset0 %low.cofactor0 a))
                              (define %1 (bvssat %0 %arg0 %elemsize ))
                              %1
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
                              (define %low.cofactor1 (*  iterator.1  %arg3))
                              (define %low.offset0.new0 (-  %low.cofactor1  %arg2))
                              (define %lastidx3 (-  %arg1  1))
                              (define %high.offset2 (+  %low.offset0.new0  %lastidx3))
                              (define %8 (extract  %high.offset2 %low.offset0.new0 b))
                              (define %9 (bvssat %8 %arg1 %elemsize1 ))
                              %9
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm512_broadcastd_epi32  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))]) ; 0 512 512 => 1
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))]) ; 0 512 32 => 16
                            (define %lastidx1 (-  %elemsize  1)) ; 31
                            (define %highidx0 (+  %lastidx1  %arg0)) ; 31 + 0 = 1531
                            (define %1 (extract  %highidx0 %arg0 a)) ; 31 0 => first 31 bits
                            %1
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm512_and_si512  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx2 (-  %elemsize  1))
                            (define %highidx2 (+  %lastidx2  %arg2))
                            (define %0 (extract  %highidx2 %arg2 a))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %1 (extract  %highidx1 %arg1 b))
                            (define %2 (bvand  %0  %1))
                            %2
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm256_maskz_slli_epi16  %arg6 %arg3 k a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 %arg5 %arg7 )
  (define dst
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
                                (define %highidx0 (+  %lastidx0  %arg1))
                                (define %2 (extract  %highidx0 %arg1 imm8))
                                (define %3 (bvugt  %2  %arg0))
                                (if (equal? %3 #t)
                                  (begin
                                    (define %factor0 (/  %arg2  %elemsize))
                                    (define %0.copy.0.new0 (*  j0.new  %factor0))
                                    (define %lastidx1 (-  %arg2  1))
                                    (define %5 (+  %0.copy.0.new0  %lastidx1))
                                    (define %14 (extract  %5 %0.copy.0.new0 %arg3))
                                    %14
                                    )
                                  (begin
                                    (define %factor1 (/  %arg2  %elemsize))
                                    (define %0.copy.2.new0 (*  j0.new  %factor1))
                                    (define %lastidx2 (-  %arg2  1))
                                    (define %6 (+  %0.copy.2.new0  %lastidx2))
                                    (define %7 (extract  %6 %0.copy.2.new0 a))
                                    (define %lastidx3 (-  %arg4  1))
                                    (define %highidx1 (+  %lastidx3  %arg5))
                                    (define %8 (extract  %highidx1 %arg5 imm8))
                                    (define %9 (zero-extend  %8 (bitvector %arg2)))
                                    (define %10 (bvlshr  %7  %9))
                                    %10
                                    )
                                  )
                                )
                              (begin
                                (define %factor2 (/  %arg2  %elemsize))
                                (define %0.copy.5.new0 (*  j0.new  %factor2))
                                (define %lastidx4 (-  %arg2  1))
                                (define %13 (+  %0.copy.5.new0  %lastidx4))
                                (define %15 (extract  %13 %0.copy.5.new0 %arg6))
                                %15
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg7)
  )

(define (_mm512_cmplt_epi64_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %factor0 (/  %arg2  %elemsize))
                            (define %0 (*  j0  %factor0))
                            (define %lastidx1 (-  %arg2  1))
                            (define %1 (+  %0  %lastidx1))
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
  (bvpadhighbits  k %arg3)
  )

(define (_mm256_mask_packus_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
  0
  )

(define (_mm_cmpneq_epi32_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %factor0 (/  %arg2  %elemsize))
                            (define %0 (*  j0  %factor0))
                            (define %lastidx1 (-  %arg2  1))
                            (define %1 (+  %0  %lastidx1))
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
  (bvpadhighbits  k %arg3)
  )

(define (_mm256_mask_packs_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
  0
    )

(define (_mm_maskz_ror_epi32  %arg4 k a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg5 )
  (define dst
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
                                (define %lastidx0 (-  %arg0  1))
                                (define %2 (+  %0.copy.0.new0  %lastidx0))
                                (define %3 (extract  %2 %0.copy.0.new0 a))
                                (define %lastidx1 (-  %elemsize  1))
                                (define %highidx0 (+  %lastidx1  %arg3))
                                (define %4 (extract  %highidx0 %arg3 imm8))
                                (define %0.site0 (bvsmod  %4  %arg2))
                                (define %1.site0 (zero-extend  %0.site0 (bitvector %arg0)))
                                (define %2.site0 (bvashr  %3  %1.site0))
                                (define %3.site0 (bvsub  %arg1  %0.site0))
                                (define %4.site0 (zero-extend  %3.site0 (bitvector %arg0)))
                                (define %5.site0 (bvlshr  %3  %4.site0))
                                (define %6.site0 (bvor  %2.site0  %5.site0))
                                %6.site0
                                )
                              (begin
                                (define %factor1 (/  %arg0  %elemsize))
                                (define %0.copy.3.new0 (*  j0.new  %factor1))
                                (define %lastidx2 (-  %arg0  1))
                                (define %8 (+  %0.copy.3.new0  %lastidx2))
                                (define %9 (extract  %8 %0.copy.3.new0 %arg4))
                                %9
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg5)
  )

(define (_mm512_maskz_packs_epi32  %arg3 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
0
    )

(define (_mm512_cmpge_epu64_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %factor0 (/  %arg2  %elemsize))
                            (define %0 (*  j0  %factor0))
                            (define %lastidx1 (-  %arg2  1))
                            (define %1 (+  %0  %lastidx1))
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
  (bvpadhighbits  k %arg3)
  )

(define (_mm256_mask_dpbusds_epi32  src k a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
                (define j0.new.div (/  j0.new  %lanesize1))
                (define %0 (extract  j0.new.div j0.new.div k))
                (if (equal? %0 (bv #b1 1))
                  (begin
                    (apply
                      concat
                      (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                                (define %2.new0 (+  j0.new  iterator.0.new))
                                (define %lastidx1 (-  %elemsize  1))
                                (define %3 (+  %2.new0  %lastidx1))
                                (define %4 (extract  %3 %2.new0 a))
                                (define %5 (zero-extend  %4 (bitvector %arg0)))
                                (define %9 (extract  %3 %2.new0 b))
                                (define %10 (sign-extend  %9 (bitvector %arg0)))
                                (define %11 (bvmul  %5  %10))
                                (define %12 (sign-extend  %11 (bitvector %lanesize1)))
                                (define %lastidx0 (-  %lanesize1  1))
                                (define %64.clone.4 (+  j0.new  %lastidx0))
                                (define %12.ext0 (extract  %64.clone.4 j0.new src))
                                (define %12.acc0 (bvaddnsw  %12.ext0  %12 %lanesize1))
                                %12.acc0
                                )
                      )
                    )
                  (begin
                    (apply
                      concat
                      (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
                                (define %lastidx2 (-  %lanesize1  1))
                                (define %66 (+  j0.new  %lastidx2))
                                (define %67 (extract  %66 j0.new src))
                                %67
                                )
                      )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_cmplt_epi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
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
  (bvpadhighbits  dst %arg2)
  )

(define (_mm512_cvtusepi32_epi8  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
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
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_mask_sllv_epi64  %arg2 src k a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg3 )
  (define dst
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
                                (define %3 (extract  %2 j0.new count))
                                (define %4 (bvult  %3  %arg0))
                                (if (equal? %4 #t)
                                  (begin
                                    (define %lastidx1 (-  %arg1  1))
                                    (define %5 (+  j0.new  %lastidx1))
                                    (define %6 (extract  %5 j0.new a))
                                    (define %8 (extract  %5 j0.new count))
                                    (define %9 (bvlshr  %6  %8))
                                    %9
                                    )
                                  (begin
                                    (define %lastidx2 (-  %arg1  1))
                                    (define %12 (+  j0.new  %lastidx2))
                                    (define %17 (extract  %12 j0.new %arg2))
                                    %17
                                    )
                                  )
                                )
                              (begin
                                (define %lastidx3 (-  %arg1  1))
                                (define %14 (+  j0.new  %lastidx3))
                                (define %15 (extract  %14 j0.new src))
                                %15
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm256_cmpgt_epi64  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
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
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_cmpge_epi32_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %factor0 (/  %arg2  %elemsize))
                            (define %0 (*  j0  %factor0))
                            (define %lastidx1 (-  %arg2  1))
                            (define %1 (+  %0  %lastidx1))
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
  (bvpadhighbits  k %arg3)
  )

(define (_mm_mask_dpwssds_epi32  src k a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
                (define j0.new.div (/  j0.new  %lanesize1))
                (define %0 (extract  j0.new.div j0.new.div k))
                (if (equal? %0 (bv #b1 1))
                  (begin
                    (apply
                      concat
                      (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                                (define %2.new0 (+  j0.new  iterator.0.new))
                                (define %lastidx1 (-  %elemsize  1))
                                (define %3 (+  %2.new0  %lastidx1))
                                (define %4 (extract  %3 %2.new0 a))
                                (define %5 (sign-extend  %4 (bitvector %lanesize1)))
                                (define %9 (extract  %3 %2.new0 b))
                                (define %10 (sign-extend  %9 (bitvector %lanesize1)))
                                (define %11 (bvmul  %5  %10))
                                (define %lastidx0 (-  %lanesize1  1))
                                (define %32.clone.2 (+  j0.new  %lastidx0))
                                (define %11.ext0 (extract  %32.clone.2 j0.new src))
                                (define %11.acc0 (bvaddnsw  %11.ext0  %11 %lanesize1))
                                %11.acc0
                                )
                      )
                    )
                  (begin
                    (apply
                      concat
                      (for/list ([%outer.it (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
                                (define %lastidx2 (-  %lanesize1  1))
                                (define %34 (+  j0.new  %lastidx2))
                                (define %35 (extract  %34 j0.new src))
                                %35
                                )
                      )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg0)
  )

(define (_mm256_srl_epi64  %arg3 a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 %arg5 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx0 (-  %elemsize  1))
                            (define %highidx0 (+  %lastidx0  %arg1))
                            (define %1 (extract  %highidx0 %arg1 count))
                            (define %2 (bvugt  %1  %arg0))
                            (if (equal? %2 #t)
                              (begin
                                (define %lastidx1 (-  %arg2  1))
                                (define %4 (+  j0.new  %lastidx1))
                                (define %10 (extract  %4 j0.new %arg3))
                                %10
                                )
                              (begin
                                (define %lastidx2 (-  %arg2  1))
                                (define %5 (+  j0.new  %lastidx2))
                                (define %6 (extract  %5 j0.new a))
                                (define %lastidx3 (-  %arg2  1))
                                (define %highidx1 (+  %lastidx3  %arg4))
                                (define %7 (extract  %highidx1 %arg4 count))
                                (define %8 (bvashr  %6  %7))
                                %8
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg5)
  )

(define (_mm_maskz_packus_epi16  %arg3 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
0
  )

(define (_mm_avg_pu8  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
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
  (bvpadhighbits  dst %arg2)
  )

(define (_mm512_andnot_si512  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx2 (-  %elemsize  1))
                            (define %highidx2 (+  %lastidx2  %arg2))
                            (define %0 (extract  %highidx2 %arg2 a))
                            (define %1 (bvnot  %0))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %2 (extract  %highidx1 %arg1 b))
                            (define %3 (bvand  %1  %2))
                            %3
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm512_cmple_epi16_mask  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %factor0 (/  %arg2  %elemsize))
                            (define %0 (*  j0  %factor0))
                            (define %lastidx1 (-  %arg2  1))
                            (define %1 (+  %0  %lastidx1))
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
  (bvpadhighbits  k %arg3)
  )

(define (_mm256_mask_cmpgt_epu32_mask  %arg3 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %1 (extract  j0 j0 k1))
                            (if (equal? %1 (bv #b1 1))
                              (begin
                                (define %factor0 (/  %arg2  %elemsize))
                                (define %0.copy.0 (*  j0  %factor0))
                                (define %lastidx1 (-  %arg2  1))
                                (define %2 (+  %0.copy.0  %lastidx1))
                                (define %3 (extract  %2 %0.copy.0 a))
                                (define %5 (extract  %2 %0.copy.0 b))
                                (define %6 (bvugt  %3  %5))
                                (define %7 (if (equal? %6 #t) %arg0 %arg1))
                                %7
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %highidx1 (+  j0  %lastidx2))
                                (define %8 (extract  %highidx1 j0 %arg3))
                                %8
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k %arg4)
  )

(define (_mm512_maskz_mulhrs_epi16  %arg4 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg5 )
  (define dst
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
                                (define %4 (sign-extend  %3 (bitvector %arg3)))
                                (define %6 (extract  %2 j0.new b))
                                (define %7 (sign-extend  %6 (bitvector %arg3)))
                                (define %8 (bvmul  %4  %7))
                                (define %9 (bvashr  %8  %arg2))
                                (define %10 (bvadd  %9  %arg1))
                                (define %lastidx1 (-  %elemsize  1))
                                (define %highidx0 (+  %lastidx1  %arg0))
                                (define %11 (extract  %highidx0 %arg0 %10))
                                %11
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %14 (+  j0.new  %lastidx2))
                                (define %15 (extract  %14 j0.new %arg4))
                                %15
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg5)
  )

(define (_mm256_set_m128i  hi lo %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx3 (-  %elemsize  1))
                            (define %highidx3 (+  %lastidx3  %arg3))
                            (define %0 (extract  %highidx3 %arg3 lo))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %1 (extract  %highidx1 %arg1 hi))
                            (concat %1 %0)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm256_packs_epi16  a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
  (define dst
    (apply
      concat
      (for/list ([iterator.lane (reverse (range 0 %vectsize %lanesize1))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                              (define %low.cofactor0 (*  iterator.0  %arg1))
                              (define %low.scaled.it0 (+  iterator.lane  %low.cofactor0))
                              (define %lastidx1 (-  %arg0  1))
                              (define %high.offset0 (+  %low.scaled.it0  %lastidx1))
                              (define %0 (extract  %high.offset0 %low.scaled.it0 a))
                              (define %1 (bvssat %0 %arg0 %elemsize ))
                              %1
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
                              (define %low.cofactor1 (*  iterator.1  %arg4))
                              (define %low.scaled.it2 (+  iterator.lane  %low.cofactor1))
                              (define %low.offset0.new0 (-  %low.scaled.it2  %arg3))
                              (define %lastidx3 (-  %arg2  1))
                              (define %high.offset2 (+  %low.offset0.new0  %lastidx3))
                              (define %16 (extract  %high.offset2 %low.offset0.new0 b))
                              (define %17 (bvssat %16 %arg2 %elemsize1 ))
                              %17
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg5)
  )

(define (_mm_mask_packus_epi16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
0
  )

(define (_mm512_mask_fmadd_epi32  a k b c %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
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
                                (define %7 (zero-extend  %4 (bitvector %arg0)))
                                (define %8 (zero-extend  %6 (bitvector %arg0)))
                                (define %9 (bvmul  %7  %8))
                                (define %11 (extract  %3 j0.new c))
                                (define %12 (zero-extend  %11 (bitvector %arg0)))
                                (define %13 (bvadd  %9  %12))
                                (define %15.high.idx (- %arg0 1))
                                (define %15.low.idx (+ (- %15.high.idx %elemsize) 1) )
                                (define %15 (extract  %15.high.idx %15.low.idx %13))
                                %15
                                )
                              (begin
                                (define %lastidx1 (-  %elemsize  1))
                                (define %17 (+  j0.new  %lastidx1))
                                (define %18 (extract  %17 j0.new a))
                                %18
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm512_dpbusd_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %1.new0 (+  j0.new  iterator.0.new))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %2 (+  %1.new0  %lastidx1))
                            (define %3 (extract  %2 %1.new0 a))
                            (define %4 (zero-extend  %3 (bitvector %arg0)))
                            (define %8 (extract  %2 %1.new0 b))
                            (define %9 (sign-extend  %8 (bitvector %arg0)))
                            (define %10 (bvmul  %4  %9))
                            (define %11 (sign-extend  %10 (bitvector %lanesize1)))
                            (define %lastidx0 (-  %lanesize1  1))
                            (define %62.clone.4 (+  j0.new  %lastidx0))
                            (define %11.ext0 (extract  %62.clone.4 j0.new src))
                            (define %11.acc0 (bvadd  %11.ext0  %11))
                            %11.acc0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm256_mask_mul_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
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
                                (define %5 (sign-extend  %4 (bitvector %arg0)))
                                (define %7 (extract  %3 %0.copy.0.new0 b))
                                (define %8 (sign-extend  %7 (bitvector %arg0)))
                                (define %9 (bvmul  %5  %8))
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
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_unpacklo_pi32  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx3 (-  %elemsize  1))
                            (define %highidx3 (+  %lastidx3  %arg3))
                            (define %0 (extract  %highidx3 %arg3 a))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %1 (extract  %highidx1 %arg1 b))
                            (concat %1 %0)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm512_mask_max_epu16  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
                                (define %10 (extract  %9 j0.new src))
                                %10
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg0)
  )

(define (_mm512_mask_andnot_epi64  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
                                (define %12 (extract  %11 j0.new src))
                                %12
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg0)
  )

(define (_mm256_adds_epi16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm256_maskz_mullo_epi32  %arg2 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg3 )
  (define dst
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
                                (define %7 (zero-extend  %4 (bitvector %arg1)))
                                (define %8 (zero-extend  %6 (bitvector %arg1)))
                                (define %9 (bvmul  %7  %8))
                                (define %lastidx1 (-  %elemsize  1))
                                (define %highidx0 (+  %lastidx1  %arg0))
                                (define %10 (extract  %highidx0 %arg0 %9))
                                %10
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %13 (+  j0.new  %lastidx2))
                                (define %14 (extract  %13 j0.new %arg2))
                                %14
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm512_maskz_broadcast_i64x4  %arg1 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg2 )
  (define dst
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
                                (define %1.copy.0 (modulo  j0.new.div.copy.3  %arg0))
                                (define %2.copy.0 (*  %1.copy.0  %elemsize))
                                (define %lastidx1 (-  %elemsize  1))
                                (define %5 (+  %2.copy.0  %lastidx1))
                                (define %6 (extract  %5 %2.copy.0 a))
                                %6
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %9 (+  j0.new  %lastidx2))
                                (define %10 (extract  %9 j0.new %arg1))
                                %10
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_dpbusds_epi32  src a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([j0.new (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %1.new0 (+  j0.new  iterator.0.new))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %2 (+  %1.new0  %lastidx1))
                            (define %3 (extract  %2 %1.new0 a))
                            (define %4 (zero-extend  %3 (bitvector %arg0)))
                            (define %8 (extract  %2 %1.new0 b))
                            (define %9 (sign-extend  %8 (bitvector %arg0)))
                            (define %10 (bvmul  %4  %9))
                            (define %11 (sign-extend  %10 (bitvector %lanesize1)))
                            (define %lastidx0 (-  %lanesize1  1))
                            (define %63.clone.4 (+  j0.new  %lastidx0))
                            (define %11.ext0 (extract  %63.clone.4 j0.new src))
                            (define %11.acc0 (bvaddnsw  %11.ext0  %11 %lanesize1))
                            %11.acc0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_sign_pi8  %arg4 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg5 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx0 (-  %elemsize  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new b))
                            (define %3 (bvslt  %2  %arg0))
                            (if (equal? %3 #t)
                              (begin
                                (define %lastidx1 (-  %arg1  1))
                                (define %5 (+  j0.new  %lastidx1))
                                (define %6 (extract  %5 j0.new a))
                                (define %7 (bvneg  %6))
                                %7
                                )
                              (begin
                                (define %lastidx2 (-  %arg3  1))
                                (define %9 (+  j0.new  %lastidx2))
                                (define %10 (extract  %9 j0.new b))
                                (define %11 (bveq  %10  %arg2))
                                (if (equal? %11 #t)
                                  (begin
                                    (define %lastidx3 (-  %arg1  1))
                                    (define %13 (+  j0.new  %lastidx3))
                                    (define %18 (extract  %13 j0.new %arg4))
                                    %18
                                    )
                                  (begin
                                    (define %lastidx4 (-  %arg1  1))
                                    (define %15 (+  j0.new  %lastidx4))
                                    (define %16 (extract  %15 j0.new a))
                                    %16
                                    )
                                  )
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg5)
  )

(define (_mm_cvtsi32_si128  a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %0 (extract  %highidx1 %arg1 a))
                            %0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_mulhi_epu16  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 )
  (define dst
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
                            (define %6 (zero-extend  %3 (bitvector %arg1)))
                            (define %7 (zero-extend  %5 (bitvector %arg1)))
                            (define %8 (bvmul  %6  %7))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx0 (+  %lastidx1  %arg0))
                            (define %9 (extract  %highidx0 %arg0 %8))
                            %9
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_add_si64  a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx2 (-  %elemsize  1))
                            (define %highidx2 (+  %lastidx2  %arg2))
                            (define %0 (extract  %highidx2 %arg2 a))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx1 (+  %lastidx1  %arg1))
                            (define %1 (extract  %highidx1 %arg1 b))
                            (define %2 (bvadd  %0  %1))
                            %2
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm256_mask_mov_epi32  src k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 )
  (define dst
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
                                (define %8 (extract  %7 j0.new src))
                                %8
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg0)
  )

(define (_mm_extract_epi64  a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx3 (-  %arg3  1))
                            (define %highidx3 (+  %lastidx3  %arg6))
                            (define %0 (extract  %highidx3 %arg6 a))
                            (define %lastidx2 (-  %elemsize  1))
                            (define %highidx2 (+  0  %lastidx2))
                            (define %1 (extract  %highidx2 0 imm8))
                            (define %2 (zero-extend  %1 (bitvector %arg5)))
                            (define %3 (bvmul  %2  %arg4))
                            (define %4 (zero-extend  %3 (bitvector %arg3)))
                            (define %5 (bvashr  %0  %4))
                            (define %lastidx1 (-  %arg0  1))
                            (define %highidx1 (+  %lastidx1  %arg2))
                            (define %6 (extract  %highidx1 %arg2 %5))
                            %6
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg7)
  )

(define (_mm512_mask_packs_epi32  src k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 )
0
)


(define (_mm256_maskz_set1_epi16  %arg1 k a %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg2 )
  (define dst
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
                                (define %highidx0 (+  %lastidx1  %arg0))
                                (define %2 (extract  %highidx0 %arg0 a))
                                %2
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %5 (+  j0.new  %lastidx2))
                                (define %6 (extract  %5 j0.new %arg1))
                                %6
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_sra_pi32  a count %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx0 (-  %arg1  1))
                            (define %highidx0 (+  %lastidx0  %arg2))
                            (define %1 (extract  %highidx0 %arg2 count))
                            (define %2 (bvugt  %1  %arg0))
                            (if (equal? %2 #t)
                              (begin
                                (define %lastidx1 (-  %arg3  1))
                                (define %4 (+  j0.new  %lastidx1))
                                (define %5 (extract  %4 %4 a))
                                (define %6 (if (equal? %5 (bv #b1 1))
                                             %arg4 %arg5))
                                %6
                                )
                              (begin
                                (define %lastidx2 (-  %arg3  1))
                                (define %8 (+  j0.new  %lastidx2))
                                (define %9 (extract  %8 j0.new a))
                                (define %lastidx3 (-  %arg6  1))
                                (define %highidx1 (+  %lastidx3  %arg7))
                                (define %10 (extract  %highidx1 %arg7 count))
                                (define %11 (zero-extend  %9 (bitvector %arg6)))
                                (define %12 (bvashr  %11  %10))
                                (define %14.high.idx (- %arg6 1))
                                (define %14.low.idx (+ (- %14.high.idx %arg3) 1) )
                                (define %14 (extract  %14.high.idx %14.low.idx %12))
                                %14
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg8)
  )

(define (_mm512_maskz_packus_epi16  %arg3 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
  0
  )

(define (_mm512_mask_cmplt_epi8_mask  %arg3 k1 a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg4 )
  (define k
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %1 (extract  j0 j0 k1))
                            (if (equal? %1 (bv #b1 1))
                              (begin
                                (define %factor0 (/  %arg2  %elemsize))
                                (define %0.copy.0 (*  j0  %factor0))
                                (define %lastidx1 (-  %arg2  1))
                                (define %2 (+  %0.copy.0  %lastidx1))
                                (define %3 (extract  %2 %0.copy.0 a))
                                (define %5 (extract  %2 %0.copy.0 b))
                                (define %6 (bvslt  %3  %5))
                                (define %7 (if (equal? %6 #t) %arg0 %arg1))
                                %7
                                )
                              (begin
                                (define %lastidx2 (-  %elemsize  1))
                                (define %highidx1 (+  j0  %lastidx2))
                                (define %8 (extract  %highidx1 j0 %arg3))
                                %8
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k %arg4)
  )

(define (_m_pextrw  a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %lastidx3 (-  %arg3  1))
                            (define %highidx3 (+  %lastidx3  %arg7))
                            (define %0 (extract  %highidx3 %arg7 a))
                            (define %lastidx2 (-  %elemsize  1))
                            (define %highidx2 (+  %lastidx2  %arg6))
                            (define %1 (extract  %highidx2 %arg6 imm8))
                            (define %2 (zero-extend  %1 (bitvector %arg5)))
                            (define %3 (bvmul  %2  %arg4))
                            (define %4 (zero-extend  %3 (bitvector %arg3)))
                            (define %5 (bvashr  %0  %4))
                            (define %lastidx1 (-  %arg0  1))
                            (define %highidx1 (+  %lastidx1  %arg2))
                            (define %6 (extract  %highidx1 %arg2 %5))
                            %6
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg8)
  )

(define (_mm512_maskz_mul_epu32  %arg1 k a b %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg2 )
  (define dst
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
                                (define %13 (extract  %12 %0.copy.5.new0 %arg1))
                                %13
                                )
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_rol_epi64  a imm8 %vectsize %lanesize1 %lanesize2 %elemsize %laneoffset %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize %lanesize1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %laneoffset %lanesize2 %elemsize))])
                            (define %factor0 (/  %arg0  %elemsize))
                            (define %0.new0 (*  j0.new  %factor0))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  %0.new0  %lastidx0))
                            (define %2 (extract  %1 %0.new0 a))
                            (define %lastidx1 (-  %elemsize  1))
                            (define %highidx0 (+  %lastidx1  %arg3))
                            (define %3 (extract  %highidx0 %arg3 imm8))
                            (define %0.site0 (bvsmod  %3  %arg2))
                            (define %1.site0 (zero-extend  %0.site0 (bitvector %arg0)))
                            (define %2.site0 (bvlshr  %2  %1.site0))
                            (define %3.site0 (bvsub  %arg1  %0.site0))
                            (define %4.site0 (zero-extend  %3.site0 (bitvector %arg0)))
                            (define %5.site0 (bvashr  %2  %4.site0))
                            (define %6.site0 (bvor  %2.site0  %5.site0))
                            %6.site0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm256_packus_epi32  a b %vectsize %lanesize1 %lanesize2 %lanesize3 %elemsize %elemsize1 %laneoffset %laneoffset1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
  (define dst
    (apply
      concat
      (for/list ([iterator.lane (reverse (range 0 %vectsize %lanesize1))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range %laneoffset %lanesize2 %elemsize))])
                              (define %low.cofactor0 (*  iterator.0  %arg1))
                              (define %low.scaled.it0 (+  iterator.lane  %low.cofactor0))
                              (define %lastidx1 (-  %arg0  1))
                              (define %high.offset0 (+  %low.scaled.it0  %lastidx1))
                              (define %0 (extract  %high.offset0 %low.scaled.it0 a))
                              (define %1 (bvusat %0 %arg0 %elemsize ))
                              %1
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %laneoffset1 %lanesize3 %elemsize1))])
                              (define %low.cofactor1 (*  iterator.1  %arg4))
                              (define %low.scaled.it2 (+  iterator.lane  %low.cofactor1))
                              (define %low.offset0.new0 (-  %low.scaled.it2  %arg3))
                              (define %lastidx3 (-  %arg2  1))
                              (define %high.offset2 (+  %low.offset0.new0  %lastidx3))
                              (define %8 (extract  %high.offset2 %low.offset0.new0 b))
                              (define %9 (bvusat %8 %arg2 %elemsize1 ))
                              %9
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg5)
  )


;; ================================================================================
