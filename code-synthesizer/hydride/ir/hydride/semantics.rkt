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



(define (_mm_sub_pi16  a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
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
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm512_mask_extracti32x4_epi32  k.norm imm8.norm src.norm a.norm %elemsize1.norm )
  (define tmp0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 512 512))])
                (apply
                  concat
                  (for/list ([%inner.it.norm (reverse (range 0 512 512))])
                            (define %0.norm (extract  1 0 imm8.norm))
                            (define %cond0.norm (bveq  %0.norm  (bv 0 2)))
                            (define %cond1.norm (bveq  %0.norm  (bv 1 2)))
                            (define %cond2.norm (bveq  %0.norm  (bv 2 2)))
                            (define %cond3.norm (bveq  %0.norm  (bv 3 2)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %1.norm (extract  127 0 a.norm))
                                 %1.norm
                                 )]
                              [(equal? %cond1.norm #t)
                               (begin
                                 (define %2.norm (extract  255 128 a.norm))
                                 %2.norm
                                 )]
                              [(equal? %cond2.norm #t)
                               (begin
                                 (define %3.norm (extract  383 256 a.norm))
                                 %3.norm
                                 )]
                              [(equal? %cond3.norm #t)
                               (begin
                                 (define %4.norm (extract  511 384 a.norm))
                                 %4.norm
                                 )]
                              )
                            )
                  )
                )
      )
    )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 128 %elemsize1.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize1.norm))
                            (define %6.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond4.norm (bveq  %6.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond4.norm #t)
                               (begin
                                 (define %lastidx10.norm (-  %elemsize1.norm  1))
                                 (define %8.norm (+  j0.new.norm  %lastidx10.norm))
                                 (define %9.norm (extract  %8.norm j0.new.norm tmp0.norm))
                                 %9.norm
                                 )]
                              [else (begin
                                      (define %lastidx11.norm (-  %elemsize1.norm  1))
                                      (define %12.norm (+  j0.new.norm  %lastidx11.norm))
                                      (define %13.norm (extract  %12.norm j0.new.norm src.norm))
                                      %13.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm_maskz_sllv_epi16  count.perm %arg2.perm k.perm %arg5.perm %arg6.perm a.perm %innerlanesize0.perm %elemsize0.perm %arg3.perm %arg4.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %1.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %arg3.perm  1))
                                 (define %2.perm (+  j0.new.perm  %lastidx1.perm))
                                 (define %3.perm (extract  %2.perm j0.new.perm count.perm))
                                 (define %4.perm (bvult  %3.perm  %arg2.perm))
                                 (cond
                                   [(equal? %4.perm #t)
                                    (begin
                                      (define %lastidx2.perm (-  %arg4.perm  1))
                                      (define %5.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %6.perm (extract  %5.perm j0.new.perm a.perm))
                                      (define %8.perm (extract  %5.perm j0.new.perm count.perm))
                                      (define %9.perm (bvshl  %6.perm  %8.perm))
                                      %9.perm
                                      )]
                                   [else (begin
                                           (define %lastidx3.perm (-  %arg4.perm  1))
                                           (define %12.perm (+  j0.new.perm  %lastidx3.perm))
                                           (define %15.perm (extract  %12.perm j0.new.perm %arg5.perm))
                                           %15.perm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx4.perm (-  %elemsize0.perm  1))
                                      (define %14.perm (+  j0.new.perm  %lastidx4.perm))
                                      (define %16.perm (extract  %14.perm j0.new.perm %arg6.perm))
                                      %16.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.perm 0)
  dst.perm
  )

(define (_mm256_mask_adds_epi16  k.perm src.perm a.perm b.perm %innerlanesize0.perm %elemsize0.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %1.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %elemsize0.perm  1))
                                 (define %2.perm (+  j0.new.perm  %lastidx1.perm))
                                 (define %3.perm (extract  %2.perm j0.new.perm a.perm))
                                 (define %5.perm (extract  %2.perm j0.new.perm b.perm))
                                 (define %6.perm (bvaddnsw  %3.perm  %5.perm %elemsize0.perm))
                                 %6.perm
                                 )]
                              [else (begin
                                      (define %lastidx2.perm (-  %elemsize0.perm  1))
                                      (define %10.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %11.perm (extract  %10.perm j0.new.perm src.perm))
                                      %11.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.perm 0)
  dst.perm
  )

(define (_mm_mask_cmplt_epi16_mask  k1.norm %arg2.norm %arg3.norm a.norm b.norm %arg5.norm %innerlanesize0.norm %arg4.norm %arg6.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range 0 %innerlanesize0.norm 1))])
                            (define %1.norm (extract  j0.norm j0.norm k1.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %0.copy.0.norm (*  j0.norm  %arg4.norm))
                                 (define %lastidx2.norm (-  %arg4.norm  1))
                                 (define %2.norm (+  %0.copy.0.norm  %lastidx2.norm))
                                 (define %3.norm (extract  %2.norm %0.copy.0.norm a.norm))
                                 (define %5.norm (extract  %2.norm %0.copy.0.norm b.norm))
                                 (define %6.norm (bvslt  %3.norm  %5.norm))
                                 (define %7.norm (if (equal? %6.norm #t) %arg2.norm %arg3.norm))
                                 %7.norm
                                 )]
                              [else (begin
                                      (define %8.norm (extract  j0.norm j0.norm %arg5.norm))
                                      %8.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg6.norm)
  )

(define (_mm_mask_madd_epi16  k.norm src.norm a.norm b.norm %innerlanesize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm 16))])
                            (define j0.new.div.norm (/  j0.new.norm  16))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %0.copy.0.new0.norm (*  j0.new.norm  2))
                                 (define %3.norm (+  %0.copy.0.new0.norm  16))
                                 (define %4.norm (+  %0.copy.0.new0.norm  31))
                                 (define %5.norm (extract  %4.norm %3.norm a.norm))
                                 (define %8.norm (extract  %4.norm %3.norm b.norm))
                                 (define %9.norm (sign-extend  %5.norm (bitvector 32)))
                                 (define %10.norm (sign-extend  %8.norm (bitvector 32)))
                                 (define %11.norm (bvmul  %9.norm  %10.norm))
                                 (define %12.norm (+  %0.copy.0.new0.norm  15))
                                 (define %13.norm (extract  %12.norm %0.copy.0.new0.norm a.norm))
                                 (define %15.norm (extract  %12.norm %0.copy.0.new0.norm b.norm))
                                 (define %16.norm (sign-extend  %13.norm (bitvector 32)))
                                 (define %17.norm (sign-extend  %15.norm (bitvector 32)))
                                 (define %18.norm (bvmul  %16.norm  %17.norm))
                                 (define %19.norm (bvadd  %11.norm  %18.norm))
                                 %19.norm
                                 )]
                              [else (begin
                                      (define %0.copy.6.new0.norm (*  j0.new.norm  2))
                                      (define %22.norm (+  %0.copy.6.new0.norm  31))
                                      (define %23.norm (extract  %22.norm %0.copy.6.new0.norm src.norm))
                                      %23.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm_mask_srl_epi16  count.norm %arg2.norm k.norm %arg6.norm src.norm a.norm %innerlanesize0.norm %elemsize0.norm %arg5.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize0.norm))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %2.norm (extract  63 0 count.norm))
                                 (define %3.norm (bvugt  %2.norm  %arg2.norm))
                                 (cond
                                   [(equal? %3.norm #t)
                                    (begin
                                      (define %lastidx2.norm (-  %arg5.norm  1))
                                      (define %5.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %17.norm (extract  %5.norm j0.new.norm %arg6.norm))
                                      %17.norm
                                      )]
                                   [else (begin
                                           (define %lastidx3.norm (-  %arg5.norm  1))
                                           (define %6.norm (+  j0.new.norm  %lastidx3.norm))
                                           (define %7.norm (extract  %6.norm j0.new.norm a.norm))
                                           (define %8.norm (extract  63 0 count.norm))
                                           (define %9.norm (zero-extend  %7.norm (bitvector 64)))
                                           (define %10.norm (bvlshr  %9.norm  %8.norm))
                                           (define %12.norm.high.idx 63 )
                                           (define %12.norm.low.idx (+ (- %12.norm.high.idx %arg5.norm) 1) )
                                           (define %12.norm (extract  %12.norm.high.idx %12.norm.low.idx %10.norm))
                                           %12.norm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx5.norm (-  %elemsize0.norm  1))
                                      (define %14.norm (+  j0.new.norm  %lastidx5.norm))
                                      (define %15.norm (extract  %14.norm j0.new.norm src.norm))
                                      %15.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm_mulhi_pi16  a b %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %3 (sign-extend  %2 (bitvector %arg1)))
                            (define %5 (extract  %1 j0.new b))
                            (define %6 (sign-extend  %5 (bitvector %arg1)))
                            (define %7 (bvmul  %3  %6))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %highidx0 (+  %lastidx1  %arg0))
                            (define %8 (extract  %highidx0 %arg0 %7))
                            %8
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm_maskz_cvtepu8_epi32  k.perm %arg3.perm a.perm %innerlanesize0.perm %elemsize0.perm %arg2.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %2.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %2.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx2.perm (-  %elemsize0.perm  1))
                                 (define %3.perm (+  j0.new.perm  %lastidx2.perm))
                                 (define %4.perm (extract  %3.perm j0.new.perm a.perm))
                                 (define %5.perm (zero-extend  %4.perm (bitvector %arg2.perm)))
                                 %5.perm
                                 )]
                              [else (begin
                                      (define %factor2.perm (/  %arg2.perm  %elemsize0.perm))
                                      (define %0.copy.2.new0.perm (*  j0.new.perm  %factor2.perm))
                                      (define %lastidx3.perm (-  %arg2.perm  1))
                                      (define %8.perm (+  %0.copy.2.new0.perm  %lastidx3.perm))
                                      (define %9.perm (extract  %8.perm %0.copy.2.new0.perm %arg3.perm))
                                      %9.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.perm 0)
  dst.perm
  )

(define (_mm_hadd_epi16  a b %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range 0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %elemsize0  %elemsize0))
                              (define %factor1 (*  2  %factor0))
                              (define %low.cofactor0 (*  iterator.0  %factor1))
                              (define %low.offset0 (+  %low.cofactor0  %arg0))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %high.offset0 (+  %low.offset0  %lastidx2))
                              (define %0 (extract  %high.offset0 %low.offset0 a))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %high.offset1 (+  %low.cofactor0  %lastidx1))
                              (define %1 (extract  %high.offset1 %low.cofactor0 a))
                              (define %2 (bvadd  %0  %1))
                              %2
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %low.cofactor2 (*  iterator.1  2))
                              (define %low.offset1.new0 (-  %low.cofactor2  %arg2))
                              (define %lastidx5 (-  %elemsize1  1))
                              (define %high.offset3 (+  %low.offset1.new0  %lastidx5))
                              (define %12 (extract  %high.offset3 %low.offset1.new0 b))
                              (define %low.offset2.new0 (-  %low.cofactor2  %arg1))
                              (define %lastidx4 (-  %elemsize1  1))
                              (define %high.offset4 (+  %low.offset2.new0  %lastidx4))
                              (define %13 (extract  %high.offset4 %low.offset2.new0 b))
                              (define %14 (bvadd  %12  %13))
                              %14
                              )
                    )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm_hsubs_epi16  a b %innerlanesize0 %innerlaneoffset1 %innerlanesize1 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range 0 %innerlanesize0 16))])
                              (define %low.cofactor0 (*  iterator.0  2))
                              (define %high.offset0 (+  %low.cofactor0  15))
                              (define %0 (extract  %high.offset0 %low.cofactor0 a))
                              (define %low.offset0 (+  %low.cofactor0  16))
                              (define %high.offset1 (+  %low.offset0  15))
                              (define %1 (extract  %high.offset1 %low.offset0 a))
                              (define %2 (bvsubnsw  %0  %1 16))
                              %2
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %innerlaneoffset1 %innerlanesize1 16))])
                              (define %low.cofactor2 (*  iterator.1  2))
                              (define %low.offset1.new0 (-  %low.cofactor2  %arg2))
                              (define %high.offset3 (+  %low.offset1.new0  15))
                              (define %16 (extract  %high.offset3 %low.offset1.new0 b))
                              (define %low.offset2.new0 (-  %low.cofactor2  %arg1))
                              (define %high.offset4 (+  %low.offset2.new0  15))
                              (define %17 (extract  %high.offset4 %low.offset2.new0 b))
                              (define %18 (bvsubnsw  %16  %17 16))
                              %18
                              )
                    )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm256_extract_epi16  %arg2 a index %innerlanesize0 %elemsize0 %arg0 %arg1 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx2 (-  %arg1  1))
                            (define %8 (+  %inner.it  %lastidx2))
                            (define %0 (extract  %8 %inner.it a))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %10 (+  %inner.it  %lastidx1))
                            (define %1 (extract  %10 %inner.it index))
                            (define %2 (zero-extend  %1 (bitvector %arg3)))
                            (define %3 (bvmul  %2  %arg2))
                            (define %4 (zero-extend  %3 (bitvector %arg1)))
                            (define %5 (bvashr  %0  %4))
                            (define %lastidx0 (-  %arg0  1))
                            (define %12 (+  %inner.it  %lastidx0))
                            (define %6 (extract  %12 %inner.it %5))
                            %6
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm_sra_epi64  count.norm a.norm %innerlanesize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm 64))])
                            (define %1.norm (extract  63 0 count.norm))
                            (define %2.norm (bvugt  %1.norm  (bv 63 64)))
                            (cond
                              [(equal? %2.norm #t)
                               (begin
                                 (define %4.norm (+  j0.new.norm  63))
                                 (define %5.norm (extract  %4.norm %4.norm a.norm))
                                 (define %cond0.norm (bveq  %5.norm  (bv 1 1)))
                                 (define %6.norm (if (equal? %cond0.norm #t) (bv 18446744073709551615 64) (bv 0 64)))
                                 %6.norm
                                 )]
                              [else (begin
                                      (define %8.norm (+  j0.new.norm  63))
                                      (define %9.norm (extract  %8.norm j0.new.norm a.norm))
                                      (define %10.norm (extract  63 0 count.norm))
                                      (define %11.norm (bvashr  %9.norm  %10.norm))
                                      %11.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm256_div_epi16  a b %innerlanesize0 %elemsize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %4 (extract  %1 j0.new b))
                            (define %5 (sign-extend  %2 (bitvector %arg0)))
                            (define %6 (sign-extend  %4 (bitvector %arg0)))
                            (define %7 (bvsdiv  %5  %6))
                            (define %8.high.idx (- %elemsize0 1))
                            (define %8.low.idx 0)
                            (define %8 (extract  %8.high.idx %8.low.idx %7))
                            %8
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm_mask_subs_epi16  k.0 src.0 a.0 b.0 %innerlanesize0.0 %elemsize0.0 )
  (define dst.0
    (apply
      concat
      (for/list ([%outer.it.0 (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.0 (reverse (range 0 %innerlanesize0.0 %elemsize0.0))])
                            (define j0.new.div.0 (/  j0.new.0  %elemsize0.0))
                            (define %1.0 (extract  j0.new.div.0 j0.new.div.0 k.0))
                            (define %cond0.0 (bveq  %1.0  (bv 1 1)))
                            (cond
                              [(equal? %cond0.0 #t)
                               (begin
                                 (define %lastidx1.0 (-  %elemsize0.0  1))
                                 (define %2.0 (+  j0.new.0  %lastidx1.0))
                                 (define %3.0 (extract  %2.0 j0.new.0 a.0))
                                 (define %5.0 (extract  %2.0 j0.new.0 b.0))
                                 (define %6.0 (bvsubnsw  %3.0  %5.0 %elemsize0.0))
                                 %6.0
                                 )]
                              [else (begin
                                      (define %lastidx2.0 (-  %elemsize0.0  1))
                                      (define %10.0 (+  j0.new.0  %lastidx2.0))
                                      (define %11.0 (extract  %10.0 j0.new.0 src.0))
                                      %11.0
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.0 0)
  dst.0
  )

(define (_mm256_hadds_epi16  a b )
  (define dst
    (apply
      concat
      (for/list ([iterator.lane (reverse (range 0 256 128))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range 0 64 16))])
                              (define %low.cofactor0 (*  iterator.0  2))
                              (define %low.scaled.it0 (+  iterator.lane  %low.cofactor0))
                              (define %low.offset0 (+  %low.scaled.it0  16))
                              (define %high.offset0 (+  %low.offset0  15))
                              (define %0 (extract  %high.offset0 %low.offset0 a))
                              (define %high.offset1 (+  %low.scaled.it0  15))
                              (define %1 (extract  %high.offset1 %low.scaled.it0 a))
                              (define %2 (bvaddnsw  %0  %1 16))
                              %2
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range 64 128 16))])
                              (define %low.cofactor2 (*  iterator.1  2))
                              (define %low.scaled.it3 (+  iterator.lane  %low.cofactor2))
                              (define %low.offset1.new0 (-  %low.scaled.it3  112))
                              (define %high.offset3 (+  %low.offset1.new0  15))
                              (define %16 (extract  %high.offset3 %low.offset1.new0 b))
                              (define %low.offset2.new0 (-  %low.scaled.it3  128))
                              (define %high.offset4 (+  %low.offset2.new0  15))
                              (define %17 (extract  %high.offset4 %low.offset2.new0 b))
                              (define %18 (bvaddnsw  %16  %17 16))
                              %18
                              )
                    )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm256_hsub_epi32  a b %elemsize0 %elemsize1 %arg0 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([iterator.lane (reverse (range 0 256 128))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range 0 64 %elemsize0))])
                              (define %low.cofactor0 (*  iterator.0  2))
                              (define %low.scaled.it0 (+  iterator.lane  %low.cofactor0))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %high.offset0 (+  %low.scaled.it0  %lastidx2))
                              (define %0 (extract  %high.offset0 %low.scaled.it0 a))
                              (define %low.offset0 (+  %low.scaled.it0  %arg0))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %high.offset1 (+  %low.offset0  %lastidx1))
                              (define %1 (extract  %high.offset1 %low.offset0 a))
                              (define %2 (bvsub  %0  %1))
                              %2
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range 64 128 %elemsize1))])
                              (define %low.cofactor2 (*  iterator.1  2))
                              (define %low.scaled.it3 (+  iterator.lane  %low.cofactor2))
                              (define %low.offset1.new0 (-  %low.scaled.it3  128))
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
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm512_maskz_madd52lo_epu64  k.norm %arg6.norm a.norm b.norm c.norm %innerlanesize0.norm %arg4.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm 52))])
                            (define j0.new.div.norm (/  j0.new.norm  52))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define j0.new.div.copy.2.norm (/  j0.new.norm  52))
                                 (define %0.copy.0.norm (*  j0.new.div.copy.2.norm  64))
                                 (define %2.norm (+  %0.copy.0.norm  51))
                                 (define %3.norm (extract  %2.norm %0.copy.0.norm b.norm))
                                 (define %6.norm (extract  %2.norm %0.copy.0.norm c.norm))
                                 (define %8.norm (zero-extend  %3.norm (bitvector 128)))
                                 (define %9.norm (zero-extend  %6.norm (bitvector 128)))
                                 (define %10.norm (bvmul  %8.norm  %9.norm))
                                 (define %13.norm (+  %0.copy.0.norm  63))
                                 (define %14.norm (extract  %13.norm %0.copy.0.norm a.norm))
                                 (define %highidx1.norm (+  51  %arg4.norm))
                                 (define %15.norm (extract  %highidx1.norm %arg4.norm %10.norm))
                                 (define %16.norm (zero-extend  %15.norm (bitvector 64)))
                                 (define %17.norm (bvadd  %14.norm  %16.norm))
                                 %17.norm
                                 )]
                              [else (begin
                                      (define j0.new.div.copy.8.norm (/  j0.new.norm  52))
                                      (define %0.copy.6.norm (*  j0.new.div.copy.8.norm  64))
                                      (define %20.norm (+  %0.copy.6.norm  63))
                                      (define %21.norm (extract  %20.norm %0.copy.6.norm %arg6.norm))
                                      %21.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm256_maskz_extracti64x2_epi64  k.perm imm8.perm %arg10.perm a.perm %innerlanesize1.perm %elemsize1.perm %arg3.perm %arg7.perm )
  (define tmp0.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([%inner.it.perm (reverse (range 0 1 1))])
                            (define %0.perm (extract  0 0 imm8.perm))
                            (define %cond0.perm (bveq  %0.perm  (bv 0 1)))
                            (define %cond1.perm (bveq  %0.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx2.perm (-  %arg3.perm  1))
                                 (define %1.perm (extract  %lastidx2.perm 0 a.perm))
                                 %1.perm
                                 )]
                              [(equal? %cond1.perm #t)
                               (begin
                                 (define %lastidx4.perm (-  %arg3.perm  1))
                                 (define %highidx4.perm (+  %lastidx4.perm  %arg7.perm))
                                 (define %2.perm (extract  %highidx4.perm %arg7.perm a.perm))
                                 %2.perm
                                 )]
                              )
                            )
                  )
                )
      )
    )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize1.perm %elemsize1.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize1.perm))
                            (define %4.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond2.perm (bveq  %4.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond2.perm #t)
                               (begin
                                 (define %lastidx6.perm (-  %elemsize1.perm  1))
                                 (define %6.perm (+  j0.new.perm  %lastidx6.perm))
                                 (define %7.perm (extract  %6.perm j0.new.perm tmp0.perm))
                                 %7.perm
                                 )]
                              [else (begin
                                      (define %lastidx7.perm (-  %elemsize1.perm  1))
                                      (define %10.perm (+  j0.new.perm  %lastidx7.perm))
                                      (define %11.perm (extract  %10.perm j0.new.perm %arg10.perm))
                                      %11.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.perm 0)
  dst.perm
  )

(define (_mm_maskz_cvtepi16_epi8  k.perm %arg3.perm a.perm %innerlanesize0.perm %elemsize0.perm %arg2.perm %arg4.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %2.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %2.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %factor0.perm (/  %arg2.perm  %elemsize0.perm))
                                 (define %0.copy.0.new0.perm (*  j0.new.perm  %factor0.perm))
                                 (define %lastidx2.perm (-  %arg2.perm  1))
                                 (define %3.perm (+  %0.copy.0.new0.perm  %lastidx2.perm))
                                 (define %4.perm (extract  %3.perm %0.copy.0.new0.perm a.perm))
                                 (define %5.perm.high.idx (- %elemsize0.perm 1))
                                 (define %5.perm.low.idx 0)
                                 (define %5.perm (extract  %5.perm.high.idx %5.perm.low.idx %4.perm))
                                 %5.perm
                                 )]
                              [else (begin
                                      (define %lastidx3.perm (-  %elemsize0.perm  1))
                                      (define %8.perm (+  j0.new.perm  %lastidx3.perm))
                                      (define %9.perm (extract  %8.perm j0.new.perm %arg3.perm))
                                      %9.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm %arg4.perm)
  )

(define (_mm_hsub_pi32  a b )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 32 32))])
                            (define %7 (+  %inner.it  31))
                            (define %0 (extract  %7 %inner.it a))
                            (define %8 (+  %inner.it  32))
                            (define %9 (+  %8  31))
                            (define %1 (extract  %9 %8 a))
                            (define %2 (bvsub  %0  %1))
                            (define %3 (extract  %7 %inner.it b))
                            (define %4 (extract  %9 %8 b))
                            (define %5 (bvsub  %3  %4))
                            (concat %5 %2)
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm256_mask_max_epi32  k.perm src.perm a.perm b.perm %innerlanesize0.perm %elemsize0.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %1.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %elemsize0.perm  1))
                                 (define %2.perm (+  j0.new.perm  %lastidx1.perm))
                                 (define %3.perm (extract  %2.perm j0.new.perm a.perm))
                                 (define %5.perm (extract  %2.perm j0.new.perm b.perm))
                                 (define %6.perm (bvsmax  %3.perm  %5.perm))
                                 %6.perm
                                 )]
                              [else (begin
                                      (define %lastidx2.perm (-  %elemsize0.perm  1))
                                      (define %9.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %10.perm (extract  %9.perm j0.new.perm src.perm))
                                      %10.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.perm 0)
  dst.perm
  )

(define (_mm_cmplt_epi16  b.norm %arg1.norm %arg0.norm a.norm %elemsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 128 %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %2.norm (+  j0.new.norm  %lastidx0.norm))
                            (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                            (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                            (define %6.norm (bvslt  %3.norm  %5.norm))
                            (define %7.norm (if (equal? %6.norm #t) %arg0.norm %arg1.norm))
                            %7.norm
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm_srli_pi32  imm8.norm %arg0.norm %arg4.norm a.norm %innerlanesize0.norm %arg3.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 8 8))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm 8))])
                            (define %1.norm (extract  7 0 imm8.norm))
                            (define %2.norm (bvugt  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %2.norm #t)
                               (begin
                                 (define %factor0.norm (/  %arg3.norm  8))
                                 (define %0.copy.0.new0.norm (*  j0.new.norm  %factor0.norm))
                                 (define %lastidx1.norm (-  %arg3.norm  1))
                                 (define %4.norm (+  %0.copy.0.new0.norm  %lastidx1.norm))
                                 (define %11.norm (extract  %4.norm %0.copy.0.new0.norm %arg4.norm))
                                 %11.norm
                                 )]
                              [else (begin
                                      (define %factor2.norm (/  %arg3.norm  8))
                                      (define %0.copy.2.new0.norm (*  j0.new.norm  %factor2.norm))
                                      (define %lastidx2.norm (-  %arg3.norm  1))
                                      (define %5.norm (+  %0.copy.2.new0.norm  %lastidx2.norm))
                                      (define %6.norm (extract  %5.norm %0.copy.2.new0.norm a.norm))
                                      (define %7.norm (extract  7 0 imm8.norm))
                                      (define %8.norm (zero-extend  %7.norm (bitvector %arg3.norm)))
                                      (define %9.norm (bvlshr  %6.norm  %8.norm))
                                      %9.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm_cmple_epu16_mask  b.norm a.norm %innerlanesize0.norm %arg2.norm %arg3.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range 0 %innerlanesize0.norm 1))])
                            (define %0.norm (*  j0.norm  %arg2.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %1.norm (+  %0.norm  %lastidx1.norm))
                            (define %2.norm (extract  %1.norm %0.norm a.norm))
                            (define %4.norm (extract  %1.norm %0.norm b.norm))
                            (define %5.norm (bvule  %2.norm  %4.norm))
                            (define %6.norm (if (equal? %5.norm #t) (bv 1 1) (bv 0 1)))
                            %6.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg3.norm)
  )

(define (_mm512_movepi64_mask  a.norm %arg5.norm %arg4.norm %innerlanesize0.norm %arg2.norm %arg3.norm %arg6.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range 0 %innerlanesize0.norm 1))])
                            (define %0.norm (*  j0.norm  %arg3.norm))
                            (define %1.norm (+  %0.norm  %arg2.norm))
                            (define %2.norm (extract  %1.norm %1.norm a.norm))
                            (define %cond0.norm (bveq  %2.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %3.norm (extract  j0.norm j0.norm %arg4.norm))
                                 %3.norm
                                 )]
                              [else (begin
                                      (define %4.norm (extract  j0.norm j0.norm %arg5.norm))
                                      %4.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg6.norm)
  )

(define (_mm256_testn_epi16_mask  b.norm %arg1.norm %arg2.norm %arg0.norm a.norm %innerlanesize0.norm %arg3.norm %arg4.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range 0 %innerlanesize0.norm 1))])
                            (define %0.norm (*  j0.norm  %arg3.norm))
                            (define %lastidx1.norm (-  %arg3.norm  1))
                            (define %1.norm (+  %0.norm  %lastidx1.norm))
                            (define %2.norm (extract  %1.norm %0.norm a.norm))
                            (define %4.norm (extract  %1.norm %0.norm b.norm))
                            (define %5.norm (bvand  %2.norm  %4.norm))
                            (define %6.norm (bveq  %5.norm  %arg2.norm))
                            (define %7.norm (if (equal? %6.norm #t) %arg0.norm %arg1.norm))
                            %7.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg4.norm)
  )

(define (_mm512_maskz_sll_epi32  k.norm count.norm %arg2.norm %arg9.norm %arg6.norm a.norm %innerlanesize0.norm %elemsize0.norm %arg5.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize0.norm))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %2.norm (extract  63 0 count.norm))
                                 (define %3.norm (bvugt  %2.norm  %arg2.norm))
                                 (cond
                                   [(equal? %3.norm #t)
                                    (begin
                                      (define %lastidx2.norm (-  %arg5.norm  1))
                                      (define %5.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %15.norm (extract  %5.norm j0.new.norm %arg6.norm))
                                      %15.norm
                                      )]
                                   [else (begin
                                           (define %lastidx3.norm (-  %arg5.norm  1))
                                           (define %6.norm (+  j0.new.norm  %lastidx3.norm))
                                           (define %7.norm (extract  %6.norm j0.new.norm a.norm))
                                           (define %8.norm (extract  63 0 count.norm))
                                           (define %9.norm (zero-extend  %7.norm (bitvector 64)))
                                           (define %10.norm (bvshl  %9.norm  %8.norm))
                                           (define %12.norm.high.idx 63 )
                                           (define %12.norm.low.idx (+ (- %12.norm.high.idx %arg5.norm) 1) )
                                           (define %12.norm (extract  %12.norm.high.idx %12.norm.low.idx %10.norm))
                                           %12.norm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx5.norm (-  %elemsize0.norm  1))
                                      (define %14.norm (+  j0.new.norm  %lastidx5.norm))
                                      (define %16.norm (extract  %14.norm j0.new.norm %arg9.norm))
                                      %16.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm256_mask_mul_epi32  k.6 src.6 a.6 b.6 %innerlanesize0.6 )
  (define dst.6
    (apply
      concat
      (for/list ([%outer.it.6 (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.6 (reverse (range 0 %innerlanesize0.6 32))])
                            (define j0.new.div.6 (/  j0.new.6  32))
                            (define %1.6 (extract  j0.new.div.6 j0.new.div.6 k.6))
                            (define %cond0.6 (bveq  %1.6  (bv 1 1)))
                            (cond
                              [(equal? %cond0.6 #t)
                               (begin
                                 (define %0.copy.0.new0.6 (*  j0.new.6  2))
                                 (define %3.6 (+  %0.copy.0.new0.6  31))
                                 (define %4.6 (extract  %3.6 %0.copy.0.new0.6 a.6))
                                 (define %5.6 (sign-extend  %4.6 (bitvector 64)))
                                 (define %7.6 (extract  %3.6 %0.copy.0.new0.6 b.6))
                                 (define %8.6 (sign-extend  %7.6 (bitvector 64)))
                                 (define %9.6 (bvmul  %5.6  %8.6))
                                 %9.6
                                 )]
                              [else (begin
                                      (define %0.copy.5.new0.6 (*  j0.new.6  2))
                                      (define %12.6 (+  %0.copy.5.new0.6  63))
                                      (define %13.6 (extract  %12.6 %0.copy.5.new0.6 src.6))
                                      %13.6
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.6 0)
  dst.6
  )

(define (_mm512_cmpneq_epi8_mask  a.norm b.norm %innerlanesize0.norm %arg2.norm %arg3.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range 0 %innerlanesize0.norm 1))])
                            (define %0.norm (*  j0.norm  %arg2.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %1.norm (+  %0.norm  %lastidx1.norm))
                            (define %2.norm (extract  %1.norm %0.norm a.norm))
                            (define %4.norm (extract  %1.norm %0.norm b.norm))
                            (define %5.norm (not (bveq  %2.norm  %4.norm )))
                            (define %6.norm (if (equal? %5.norm #t) (bv 1 1) (bv 0 1)))
                            %6.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg3.norm)
  )

(define (_mm_mulhrs_pi16  a b %innerlanesize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 16))])
                            (define %1 (+  j0.new  15))
                            (define %2 (extract  %1 j0.new a))
                            (define %3 (sign-extend  %2 (bitvector 32)))
                            (define %5 (extract  %1 j0.new b))
                            (define %6 (sign-extend  %5 (bitvector 32)))
                            (define %7 (bvmul  %3  %6))
                            (define %8 (bvashr  %7  (bv 14 32)))
                            (define %9 (bvadd  %8  (bv 1 32)))
                            (define %10 (extract  16 1 %9))
                            %10
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm512_max_epi16  a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
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
  ;;(bvpadhighbits  dst 0)
  ;; TEMP
  dst
  )

(define (_mm512_madd52lo_epu64  a b c %innerlanesize0 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 52))])
                            (define j0.new.div (/  j0.new  52))
                            (define %0 (*  j0.new.div  64))
                            (define %1 (+  %0  51))
                            (define %2 (extract  %1 %0 b))
                            (define %5 (extract  %1 %0 c))
                            (define %7 (zero-extend  %2 (bitvector 128)))
                            (define %8 (zero-extend  %5 (bitvector 128)))
                            (define %9 (bvmul  %7  %8))
                            (define %12 (+  %0  63))
                            (define %13 (extract  %12 %0 a))
                            (define %highidx0 (+  51  %arg2))
                            (define %14 (extract  %highidx0 %arg2 %9))
                            (define %15 (zero-extend  %14 (bitvector 64)))
                            (define %16 (bvadd  %13  %15))
                            %16
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_m_por  a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %4 (+  %inner.it  %lastidx0))
                            (define %0 (extract  %4 %inner.it a))
                            (define %1 (extract  %4 %inner.it b))
                            (define %2 (bvor  %0  %1))
                            %2
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm_unpackhi_epi8  a b %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([iterator.0.site0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %elemsize0  %elemsize0))
                            (define %factor1 (*  2  %factor0))
                            (define iterator.0.site0.new.mul (*  iterator.0.site0.new  %factor1))
                            (define %0.site0.new.low.idx (+  %arg1  iterator.0.site0.new))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %0.site0.new.high.idx0 (+  %0.site0.new.low.idx  %lastidx1))
                            (define %0.copy.copy.00.new (extract  %0.site0.new.high.idx0 %0.site0.new.low.idx a))
                            (define %1.copy.copy.00.new (extract  %0.site0.new.high.idx0 %0.site0.new.low.idx b))
                            (concat %1.copy.copy.00.new %0.copy.copy.00.new)
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm256_mask_mul_epu32  k.norm src.norm a.norm b.norm %innerlanesize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm 32))])
                            (define j0.new.div.norm (/  j0.new.norm  32))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %0.copy.0.new0.norm (*  j0.new.norm  2))
                                 (define %3.norm (+  %0.copy.0.new0.norm  31))
                                 (define %4.norm (extract  %3.norm %0.copy.0.new0.norm a.norm))
                                 (define %6.norm (extract  %3.norm %0.copy.0.new0.norm b.norm))
                                 (define %7.norm (zero-extend  %4.norm (bitvector 64)))
                                 (define %8.norm (zero-extend  %6.norm (bitvector 64)))
                                 (define %9.norm (bvmul  %7.norm  %8.norm))
                                 %9.norm
                                 )]
                              [else (begin
                                      (define %0.copy.5.new0.norm (*  j0.new.norm  2))
                                      (define %12.norm (+  %0.copy.5.new0.norm  63))
                                      (define %13.norm (extract  %12.norm %0.copy.5.new0.norm src.norm))
                                      %13.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm256_maskz_mulhi_epi16  k.perm %arg4.perm a.perm b.perm %innerlanesize0.perm %arg2.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm 16))])
                            (define j0.new.div.perm (/  j0.new.perm  16))
                            (define %1.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %2.perm (+  j0.new.perm  15))
                                 (define %3.perm (extract  %2.perm j0.new.perm a.perm))
                                 (define %4.perm (sign-extend  %3.perm (bitvector 32)))
                                 (define %6.perm (extract  %2.perm j0.new.perm b.perm))
                                 (define %7.perm (sign-extend  %6.perm (bitvector 32)))
                                 (define %8.perm (bvmul  %4.perm  %7.perm))
                                 (define %highidx1.perm (+  15  %arg2.perm))
                                 (define %9.perm (extract  %highidx1.perm %arg2.perm %8.perm))
                                 %9.perm
                                 )]
                              [else (begin
                                      (define %12.perm (+  j0.new.perm  15))
                                      (define %13.perm (extract  %12.perm j0.new.perm %arg4.perm))
                                      %13.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.perm 0)
  dst.perm
  )

(define (_mm_mul_epi32  a b %innerlanesize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 32))])
                            (define %0.new0 (*  j0.new  2))
                            (define %2 (+  %0.new0  31))
                            (define %3 (extract  %2 %0.new0 a))
                            (define %4 (sign-extend  %3 (bitvector 64)))
                            (define %6 (extract  %2 %0.new0 b))
                            (define %7 (sign-extend  %6 (bitvector 64)))
                            (define %8 (bvmul  %4  %7))
                            %8
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm512_packus_epi16  a b %vectsize0 %elemsize0 %elemsize1 %arg0 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([iterator.lane (reverse (range 0 %vectsize0 128))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range 0 64 %elemsize0))])
                              (define %low.cofactor0 (*  iterator.0  2))
                              (define %low.scaled.it0 (+  iterator.lane  %low.cofactor0))
                              (define %lastidx1 (-  %arg0  1))
                              (define %high.offset0 (+  %low.scaled.it0  %lastidx1))
                              (define %0 (extract  %high.offset0 %low.scaled.it0 a))
                              (define %1 (bvusat %0 %arg0 %elemsize0 ))
                              %1
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range 64 128 %elemsize1))])
                              (define %low.cofactor1 (*  iterator.1  2))
                              (define %low.scaled.it2 (+  iterator.lane  %low.cofactor1))
                              (define %low.offset0.new0 (-  %low.scaled.it2  128))
                              (define %lastidx3 (-  %arg2  1))
                              (define %high.offset2 (+  %low.offset0.new0  %lastidx3))
                              (define %16 (extract  %high.offset2 %low.offset0.new0 b))
                              (define %17 (bvusat %16 %arg2 %elemsize1 ))
                              %17
                              )
                    )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm512_sllv_epi64  %arg0.norm count.norm %arg2.norm a.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %1.norm (+  j0.new.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm j0.new.norm count.norm))
                            (define %3.norm (bvult  %2.norm  %arg0.norm))
                            (cond
                              [(equal? %3.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %4.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %5.norm (extract  %4.norm j0.new.norm a.norm))
                                 (define %7.norm (extract  %4.norm j0.new.norm count.norm))
                                 (define %8.norm (bvshl  %5.norm  %7.norm))
                                 %8.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %11.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %12.norm (extract  %11.norm j0.new.norm %arg2.norm))
                                      %12.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm_unpacklo_epi64  a b %innerlanesize0 %elemsize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %4 (+  %inner.it  %lastidx1))
                            (define %0.copy.copy.00.new (extract  %4 %inner.it a))
                            (define %1.copy.copy.00.new (extract  %4 %inner.it b))
                            (concat %1.copy.copy.00.new %0.copy.copy.00.new)
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm_maskz_dpbusds_epi32  k.norm %arg3.norm src.norm a.norm b.norm %vectsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([j0.new.norm (reverse (range 0 %vectsize0.norm 32))])
                (define j0.new.div.norm (/  j0.new.norm  32))
                (define %0.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                (define %cond0.norm (bveq  %0.norm  (bv 1 1)))
                (cond
                  [(equal? %cond0.norm #t)
                   (begin
                     (define %56.clone.0.norm (+  j0.new.norm  31))
                     (define %57.clone.0.norm (extract  %56.clone.0.norm j0.new.norm src.norm))
                     (define dst.norm %57.clone.0.norm)
                     (define %12.ext0.norm.red
                       (apply
                         bvadd
                         (for/list ([iterator.0.new.norm (reverse (range 0 32 8))])
                                   (define %2.new0.norm (+  j0.new.norm  iterator.0.new.norm))
                                   (define %3.norm (+  %2.new0.norm  7))
                                   (define %4.norm (extract  %3.norm %2.new0.norm a.norm))
                                   (define %5.norm (zero-extend  %4.norm (bitvector 16)))
                                   (define %9.norm (extract  %3.norm %2.new0.norm b.norm))
                                   (define %10.norm (sign-extend  %9.norm (bitvector 16)))
                                   (define %11.norm (bvmul  %5.norm  %10.norm))
                                   (define %12.norm (sign-extend  %11.norm (bitvector 32)))
                                   %12.norm
                                   )
                         ))
                     (define %64.clone.4.norm (+  j0.new.norm  31))
                     (define %12.acc0.norm (bvaddnsw %12.ext0.norm.red dst.norm 32))
                     %12.acc0.norm
                     )]
                  [else (begin
                          (apply
                            concat
                            (for/list ([%outer.it.norm (reverse (range 0 32 32))])
                                      (define %66.norm (+  j0.new.norm  31))
                                      (define %67.norm (extract  %66.norm j0.new.norm %arg3.norm))
                                      %67.norm
                                      )
                            )
                          )]
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_m_paddsb  a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %4 (extract  %1 j0.new b))
                            (define %5 (bvaddnsw  %2  %4 %elemsize0))
                            %5
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm_cvtsepi64_epi16  a %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %0.new0 (*  j0.new  %factor0))
                            (define %lastidx1 (-  %arg0  1))
                            (define %2 (+  %0.new0  %lastidx1))
                            (define %3 (extract  %2 %0.new0 a))
                            (define %4 (bvssat %3 %arg0 %elemsize0 ))
                            %4
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm512_mask_testn_epi32_mask  k1.norm %arg2.norm %arg4.norm b.norm %arg3.norm %arg6.norm a.norm %innerlanesize0.norm %arg5.norm %arg7.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range 0 %innerlanesize0.norm 1))])
                            (define %1.norm (extract  j0.norm j0.norm k1.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %0.copy.0.norm (*  j0.norm  %arg5.norm))
                                 (define %lastidx2.norm (-  %arg5.norm  1))
                                 (define %2.norm (+  %0.copy.0.norm  %lastidx2.norm))
                                 (define %3.norm (extract  %2.norm %0.copy.0.norm a.norm))
                                 (define %5.norm (extract  %2.norm %0.copy.0.norm b.norm))
                                 (define %6.norm (bvand  %3.norm  %5.norm))
                                 (define %7.norm (bveq  %6.norm  %arg4.norm))
                                 (define %8.norm (if (equal? %7.norm #t) %arg2.norm %arg3.norm))
                                 %8.norm
                                 )]
                              [else (begin
                                      (define %9.norm (extract  j0.norm j0.norm %arg6.norm))
                                      %9.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg7.norm)
  )

(define (_m_pminub  a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
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
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm256_srl_epi64  count.norm %arg3.norm a.norm %innerlanesize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm 64))])
                            (define %1.norm (extract  63 0 count.norm))
                            (define %2.norm (bvugt  %1.norm  (bv 63 64)))
                            (cond
                              [(equal? %2.norm #t)
                               (begin
                                 (define %4.norm (+  j0.new.norm  63))
                                 (define %10.norm (extract  %4.norm j0.new.norm %arg3.norm))
                                 %10.norm
                                 )]
                              [else (begin
                                      (define %5.norm (+  j0.new.norm  63))
                                      (define %6.norm (extract  %5.norm j0.new.norm a.norm))
                                      (define %7.norm (extract  63 0 count.norm))
                                      (define %8.norm (bvlshr  %6.norm  %7.norm))
                                      %8.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm_srlv_epi32  count.norm %arg0.norm %arg2.norm a.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %1.norm (+  j0.new.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm j0.new.norm count.norm))
                            (define %3.norm (bvult  %2.norm  %arg0.norm))
                            (cond
                              [(equal? %3.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %4.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %5.norm (extract  %4.norm j0.new.norm a.norm))
                                 (define %7.norm (extract  %4.norm j0.new.norm count.norm))
                                 (define %8.norm (bvlshr  %5.norm  %7.norm))
                                 %8.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %11.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %12.norm (extract  %11.norm j0.new.norm %arg2.norm))
                                      %12.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm512_srav_epi64  %arg0.norm count.norm %arg2.norm a.norm %arg3.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %1.norm (+  j0.new.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm j0.new.norm count.norm))
                            (define %3.norm (bvult  %2.norm  %arg0.norm))
                            (cond
                              [(equal? %3.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %4.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %5.norm (extract  %4.norm j0.new.norm a.norm))
                                 (define %7.norm (extract  %4.norm j0.new.norm count.norm))
                                 (define %8.norm (bvashr  %5.norm  %7.norm))
                                 %8.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %11.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %12.norm (extract  %11.norm %11.norm a.norm))
                                      (define %cond0.norm (bveq  %12.norm  (bv 1 1)))
                                      (define %13.norm (if (equal? %cond0.norm #t) %arg2.norm %arg3.norm))
                                      %13.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm256_maskz_slli_epi16  imm8.perm %arg2.perm k.perm %arg6.perm %arg9.perm a.perm %innerlanesize0.perm %elemsize0.perm %arg5.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %1.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %2.perm (extract  7 0 imm8.perm))
                                 (define %3.perm (bvugt  %2.perm  %arg2.perm))
                                 (cond
                                   [(equal? %3.perm #t)
                                    (begin
                                      (define %lastidx2.perm (-  %arg5.perm  1))
                                      (define %5.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %14.perm (extract  %5.perm j0.new.perm %arg6.perm))
                                      %14.perm
                                      )]
                                   [else (begin
                                           (define %lastidx3.perm (-  %arg5.perm  1))
                                           (define %6.perm (+  j0.new.perm  %lastidx3.perm))
                                           (define %7.perm (extract  %6.perm j0.new.perm a.perm))
                                           (define %8.perm (extract  7 0 imm8.perm))
                                           (define %9.perm (zero-extend  %8.perm (bitvector %arg5.perm)))
                                           (define %10.perm (bvshl  %7.perm  %9.perm))
                                           %10.perm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx5.perm (-  %elemsize0.perm  1))
                                      (define %13.perm (+  j0.new.perm  %lastidx5.perm))
                                      (define %15.perm (extract  %13.perm j0.new.perm %arg9.perm))
                                      %15.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.perm 0)
  dst.perm
  )

(define (_mm_mulhi_epu16  a b %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %2 (+  j0.new  %lastidx0))
                            (define %3 (extract  %2 j0.new a))
                            (define %5 (extract  %2 j0.new b))
                            (define %6 (zero-extend  %3 (bitvector %arg1)))
                            (define %7 (zero-extend  %5 (bitvector %arg1)))
                            (define %8 (bvmul  %6  %7))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %highidx0 (+  %lastidx1  %arg0))
                            (define %9 (extract  %highidx0 %arg0 %8))
                            %9
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm256_maskz_adds_epu8  k.norm %arg2.norm a.norm b.norm %innerlanesize0.norm %elemsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize0.norm))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %2.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                                 (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                                 (define %6.norm (bvaddnuw  %3.norm  %5.norm %elemsize0.norm))
                                 %6.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %10.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %11.norm (extract  %10.norm j0.new.norm %arg2.norm))
                                      %11.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm_mask_cmplt_epu16_mask  k1.norm a.norm %arg3.norm %arg2.norm b.norm %arg5.norm %innerlanesize0.norm %arg4.norm %arg6.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range 0 %innerlanesize0.norm 1))])
                            (define %1.norm (extract  j0.norm j0.norm k1.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %0.copy.0.norm (*  j0.norm  %arg4.norm))
                                 (define %lastidx2.norm (-  %arg4.norm  1))
                                 (define %2.norm (+  %0.copy.0.norm  %lastidx2.norm))
                                 (define %3.norm (extract  %2.norm %0.copy.0.norm a.norm))
                                 (define %5.norm (extract  %2.norm %0.copy.0.norm b.norm))
                                 (define %6.norm (bvult  %3.norm  %5.norm))
                                 (define %7.norm (if (equal? %6.norm #t) %arg2.norm %arg3.norm))
                                 %7.norm
                                 )]
                              [else (begin
                                      (define %8.norm (extract  j0.norm j0.norm %arg5.norm))
                                      %8.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg6.norm)
  )

(define (_mm256_mask_maddubs_epi16  k.norm src.norm a.norm b.norm %innerlanesize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm 8))])
                            (define j0.new.div.norm (/  j0.new.norm  8))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %0.copy.0.new0.norm (*  j0.new.norm  2))
                                 (define %2.norm (+  %0.copy.0.new0.norm  8))
                                 (define %3.norm (+  %0.copy.0.new0.norm  15))
                                 (define %4.norm (extract  %3.norm %2.norm a.norm))
                                 (define %7.norm (extract  %3.norm %2.norm b.norm))
                                 (define %8.norm (zero-extend  %4.norm (bitvector 16)))
                                 (define %9.norm (sign-extend  %7.norm (bitvector 16)))
                                 (define %10.norm (bvmul  %8.norm  %9.norm))
                                 (define %11.norm (+  %0.copy.0.new0.norm  7))
                                 (define %12.norm (extract  %11.norm %0.copy.0.new0.norm a.norm))
                                 (define %14.norm (extract  %11.norm %0.copy.0.new0.norm b.norm))
                                 (define %15.norm (zero-extend  %12.norm (bitvector 16)))
                                 (define %16.norm (sign-extend  %14.norm (bitvector 16)))
                                 (define %17.norm (bvmul  %15.norm  %16.norm))
                                 (define %18.norm (bvaddnsw  %10.norm  %17.norm 16))
                                 %18.norm
                                 )]
                              [else (begin
                                      (define %0.copy.6.new0.norm (*  j0.new.norm  2))
                                      (define %22.norm (+  %0.copy.6.new0.norm  15))
                                      (define %23.norm (extract  %22.norm %0.copy.6.new0.norm src.norm))
                                      %23.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm512_mask_ror_epi32  k.norm %arg4.norm %arg3.norm src.norm a.norm imm8.norm %innerlanesize0.norm %arg2.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 8 8))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm 8))])
                            (define j0.new.div.norm (/  j0.new.norm  8))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %factor0.norm (/  %arg2.norm  8))
                                 (define %0.copy.0.new0.norm (*  j0.new.norm  %factor0.norm))
                                 (define %lastidx1.norm (-  %arg2.norm  1))
                                 (define %2.norm (+  %0.copy.0.new0.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %2.norm %0.copy.0.new0.norm a.norm))
                                 (define %4.norm (extract  7 0 imm8.norm))
                                 (define %0.site0.norm (bvsmod  %4.norm  %arg4.norm))
                                 (define %1.site0.norm (zero-extend  %0.site0.norm (bitvector %arg2.norm)))
                                 (define %2.site0.norm (bvashr  %3.norm  %1.site0.norm))
                                 (define %3.site0.norm (bvsub  %arg3.norm  %0.site0.norm))
                                 (define %4.site0.norm (zero-extend  %3.site0.norm (bitvector %arg2.norm)))
                                 (define %5.site0.norm (bvshl  %3.norm  %4.site0.norm))
                                 (define %6.site0.norm (bvor  %2.site0.norm  %5.site0.norm))
                                 %6.site0.norm
                                 )]
                              [else (begin
                                      (define %factor2.norm (/  %arg2.norm  8))
                                      (define %0.copy.3.new0.norm (*  j0.new.norm  %factor2.norm))
                                      (define %lastidx3.norm (-  %arg2.norm  1))
                                      (define %8.norm (+  %0.copy.3.new0.norm  %lastidx3.norm))
                                      (define %9.norm (extract  %8.norm %0.copy.3.new0.norm src.norm))
                                      %9.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm512_broadcast_i64x4  a %innerlanesize0 %elemsize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define j0.new.div (/  j0.new  %elemsize0))
                            (define %1 (modulo  j0.new.div  %arg0))
                            (define %2 (*  %1  %elemsize0))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %4 (+  %2  %lastidx1))
                            (define %5 (extract  %4 %2 a))
                            %5
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm_maskz_broadcastq_epi64  k.perm %arg3.perm a.perm %innerlanesize0.perm %elemsize0.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %1.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx2.perm (-  %elemsize0.perm  1))
                                 (define %2.perm (extract  %lastidx2.perm 0 a.perm))
                                 %2.perm
                                 )]
                              [else (begin
                                      (define %lastidx3.perm (-  %elemsize0.perm  1))
                                      (define %5.perm (+  j0.new.perm  %lastidx3.perm))
                                      (define %6.perm (extract  %5.perm j0.new.perm %arg3.perm))
                                      %6.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.perm 0)
  dst.perm
  )

(define (_mm512_mask_fmadd_epi32  k.norm a.norm b.norm c.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 512 32))])
                            (define j0.new.div.norm (/  j0.new.norm  32))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %3.norm (+  j0.new.norm  31))
                                 (define %4.norm (extract  %3.norm j0.new.norm a.norm))
                                 (define %6.norm (extract  %3.norm j0.new.norm b.norm))
                                 (define %7.norm (zero-extend  %4.norm (bitvector 64)))
                                 (define %8.norm (zero-extend  %6.norm (bitvector 64)))
                                 (define %9.norm (bvmul  %7.norm  %8.norm))
                                 (define %11.norm (extract  %3.norm j0.new.norm c.norm))
                                 (define %12.norm (zero-extend  %11.norm (bitvector 64)))
                                 (define %13.norm (bvadd  %9.norm  %12.norm))
                                 (define %15.norm.high.idx 63 )
                                 (define %15.norm.low.idx (+ (- %15.norm.high.idx 32) 1) )
                                 (define %15.norm (extract  %15.norm.high.idx %15.norm.low.idx %13.norm))
                                 %15.norm
                                 )]
                              [else (begin
                                      (define %17.norm (+  j0.new.norm  31))
                                      (define %18.norm (extract  %17.norm j0.new.norm a.norm))
                                      %18.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm256_avg_epu16  %arg1 %arg0 a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
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
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm512_mask_min_epu16  k.perm src.perm a.perm b.perm %innerlanesize0.perm %elemsize0.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %1.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %elemsize0.perm  1))
                                 (define %2.perm (+  j0.new.perm  %lastidx1.perm))
                                 (define %3.perm (extract  %2.perm j0.new.perm a.perm))
                                 (define %5.perm (extract  %2.perm j0.new.perm b.perm))
                                 (define %6.perm (bvumin  %3.perm  %5.perm))
                                 %6.perm
                                 )]
                              [else (begin
                                      (define %lastidx2.perm (-  %elemsize0.perm  1))
                                      (define %9.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %10.perm (extract  %9.perm j0.new.perm src.perm))
                                      %10.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.perm 0)
  dst.perm
  )

(define (_mm_cvtepi64_epi32  a %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %0.new0 (*  j0.new  %factor0))
                            (define %lastidx1 (-  %arg0  1))
                            (define %2 (+  %0.new0  %lastidx1))
                            (define %3 (extract  %2 %0.new0 a))
                            (define %4.high.idx (- %elemsize0 1))
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

(define (_mm_cmpgt_pi32  %arg0.norm b.norm a.norm %arg1.norm %innerlanesize0.norm %elemsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %2.norm (+  j0.new.norm  %lastidx0.norm))
                            (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                            (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                            (define %6.norm (bvsgt  %3.norm  %5.norm))
                            (define %7.norm (if (equal? %6.norm #t) %arg0.norm %arg1.norm))
                            %7.norm
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm512_maskz_dpbusd_epi32  k.norm %arg3.norm src.norm a.norm b.norm %vectsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([j0.new.norm (reverse (range 0 %vectsize0.norm 32))])
                (define j0.new.div.norm (/  j0.new.norm  32))
                (define %0.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                (define %cond0.norm (bveq  %0.norm  (bv 1 1)))
                (cond
                  [(equal? %cond0.norm #t)
                   (begin
                     (define %56.clone.0.norm (+  j0.new.norm  31))
                     (define %57.clone.0.norm (extract  %56.clone.0.norm j0.new.norm src.norm))
                     (define dst.norm %57.clone.0.norm)
                     (define %12.ext0.norm.red
                       (apply
                         bvadd
                         (for/list ([iterator.0.new.norm (reverse (range 0 32 8))])
                                   (define %2.new0.norm (+  j0.new.norm  iterator.0.new.norm))
                                   (define %3.norm (+  %2.new0.norm  7))
                                   (define %4.norm (extract  %3.norm %2.new0.norm a.norm))
                                   (define %5.norm (zero-extend  %4.norm (bitvector 16)))
                                   (define %9.norm (extract  %3.norm %2.new0.norm b.norm))
                                   (define %10.norm (sign-extend  %9.norm (bitvector 16)))
                                   (define %11.norm (bvmul  %5.norm  %10.norm))
                                   (define %12.norm (sign-extend  %11.norm (bitvector 32)))
                                   %12.norm
                                   )
                         ))
                     (define %63.clone.4.norm (+  j0.new.norm  31))
                     (define %12.acc0.norm (bvadd %12.ext0.norm.red dst.norm))
                     %12.acc0.norm
                     )]
                  [else (begin
                          (apply
                            concat
                            (for/list ([%outer.it.norm (reverse (range 0 32 32))])
                                      (define %65.norm (+  j0.new.norm  31))
                                      (define %66.norm (extract  %65.norm j0.new.norm %arg3.norm))
                                      %66.norm
                                      )
                            )
                          )]
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm256_mask_abs_epi64  k.perm src.perm a.perm %innerlanesize0.perm %elemsize0.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %1.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %elemsize0.perm  1))
                                 (define %2.perm (+  j0.new.perm  %lastidx1.perm))
                                 (define %3.perm (extract  %2.perm j0.new.perm a.perm))
                                 (define %4.perm (integer->bitvector (abs (bitvector->integer %3.perm)) (bitvector %elemsize0.perm)))
                                 %4.perm
                                 )]
                              [else (begin
                                      (define %lastidx2.perm (-  %elemsize0.perm  1))
                                      (define %7.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %8.perm (extract  %7.perm j0.new.perm src.perm))
                                      %8.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm 0)
  )

(define (_mm256_mask_sll_epi64  k.perm count.perm src.perm %arg6.perm a.perm %innerlanesize0.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm 64))])
                            (define j0.new.div.perm (/  j0.new.perm  64))
                            (define %1.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %2.perm (extract  63 0 count.perm))
                                 (define %3.perm (bvugt  %2.perm  (bv 63 64)))
                                 (cond
                                   [(equal? %3.perm #t)
                                    (begin
                                      (define %5.perm (+  j0.new.perm  63))
                                      (define %15.perm (extract  %5.perm j0.new.perm %arg6.perm))
                                      %15.perm
                                      )]
                                   [else (begin
                                           (define %6.perm (+  j0.new.perm  63))
                                           (define %7.perm (extract  %6.perm j0.new.perm a.perm))
                                           (define %8.perm (extract  63 0 count.perm))
                                           (define %9.perm (bvshl  %7.perm  %8.perm))
                                           %9.perm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %12.perm (+  j0.new.perm  63))
                                      (define %13.perm (extract  %12.perm j0.new.perm src.perm))
                                      %13.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.perm 0)
  dst.perm
  )

(define (_mm_maskz_unpackhi_epi64  k.norm %arg8.norm a.norm b.norm %arg2.norm %arg5.norm )
  (define tmp_dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([%inner.it.norm (reverse (range 0 128 128))])
                            (define %highidx3.norm (+  63  %arg5.norm))
                            (define %0.copy.copy.00.new.norm (extract  %highidx3.norm %arg5.norm a.norm))
                            (define %highidx1.norm (+  63  %arg2.norm))
                            (define %1.copy.copy.00.new.norm (extract  %highidx1.norm %arg2.norm b.norm))
                            (concat %1.copy.copy.00.new.norm %0.copy.copy.00.new.norm)
                            )
                  )
                )
      )
    )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 128 64))])
                            (define j0.new.div.norm (/  j0.new.norm  64))
                            (define %4.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %4.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %6.norm (+  j0.new.norm  63))
                                 (define %7.norm (extract  %6.norm j0.new.norm tmp_dst0.norm))
                                 %7.norm
                                 )]
                              [else (begin
                                      (define %10.norm (+  j0.new.norm  63))
                                      (define %11.norm (extract  %10.norm j0.new.norm %arg8.norm))
                                      %11.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm512_mask_sub_epi32  k.perm src.perm b.perm a.perm %innerlanesize0.perm %elemsize0.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %1.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %elemsize0.perm  1))
                                 (define %5.perm (+  j0.new.perm  %lastidx1.perm))
                                 (define %6.perm (extract  %5.perm j0.new.perm a.perm))
                                 (define %8.perm (extract  %5.perm j0.new.perm b.perm))
                                 (define %9.perm (bvsub  %6.perm  %8.perm))
                                 %9.perm
                                 )]
                              [else (begin
                                      (define %lastidx2.perm (-  %elemsize0.perm  1))
                                      (define %12.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %13.perm (extract  %12.perm j0.new.perm src.perm))
                                      %13.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.perm 0)
  dst.perm
  )

(define (_mm_xor_epi32  a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
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
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm_blendv_epi8  mask.norm a.norm b.norm %innerlanesize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm 8))])
                            (define %1.norm (+  j0.new.norm  7))
                            (define %2.norm (extract  %1.norm %1.norm mask.norm))
                            (define %cond0.norm (bveq  %2.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %4.norm (+  j0.new.norm  7))
                                 (define %5.norm (extract  %4.norm j0.new.norm b.norm))
                                 %5.norm
                                 )]
                              [else (begin
                                      (define %8.norm (+  j0.new.norm  7))
                                      (define %9.norm (extract  %8.norm j0.new.norm a.norm))
                                      %9.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm_movepi64_pi64  a %innerlanesize0 %elemsize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %2 (+  %inner.it  %lastidx0))
                            (define %0 (extract  %2 %inner.it a))
                            %0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg0)
  )

(define (_mm256_movm_epi64  k.perm %arg3.perm %arg2.perm %innerlanesize0.perm %elemsize0.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %1.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %elemsize0.perm  1))
                                 (define %3.perm (+  j0.new.perm  %lastidx1.perm))
                                 (define %6.perm (extract  %3.perm j0.new.perm %arg2.perm))
                                 %6.perm
                                 )]
                              [else (begin
                                      (define %lastidx2.perm (-  %elemsize0.perm  1))
                                      (define %5.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %7.perm (extract  %5.perm j0.new.perm %arg3.perm))
                                      %7.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.perm 0)
  dst.perm
  )

(define (_mm256_sign_epi8  b.norm %arg2.norm %arg0.norm %arg4.norm a.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg3.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %1.norm (+  j0.new.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm j0.new.norm b.norm))
                            (define %3.norm (bvslt  %2.norm  %arg0.norm))
                            (cond
                              [(equal? %3.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %5.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %6.norm (extract  %5.norm j0.new.norm a.norm))
                                 (define %7.norm (bvneg  %6.norm))
                                 %7.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %arg3.norm  1))
                                      (define %9.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %10.norm (extract  %9.norm j0.new.norm b.norm))
                                      (define %11.norm (bveq  %10.norm  %arg2.norm))
                                      (cond
                                        [(equal? %11.norm #t)
                                         (begin
                                           (define %lastidx3.norm (-  %elemsize0.norm  1))
                                           (define %13.norm (+  j0.new.norm  %lastidx3.norm))
                                           (define %18.norm (extract  %13.norm j0.new.norm %arg4.norm))
                                           %18.norm
                                           )]
                                        [else (begin
                                                (define %lastidx4.norm (-  %elemsize0.norm  1))
                                                (define %15.norm (+  j0.new.norm  %lastidx4.norm))
                                                (define %16.norm (extract  %15.norm j0.new.norm a.norm))
                                                %16.norm
                                                )]
                                        )
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm256_maskz_cvtusepi64_epi16  k.norm %arg3.norm a.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg4.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize0.norm))
                            (define %2.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %2.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                                 (define %0.copy.0.new0.norm (*  j0.new.norm  %factor0.norm))
                                 (define %lastidx2.norm (-  %arg2.norm  1))
                                 (define %3.norm (+  %0.copy.0.new0.norm  %lastidx2.norm))
                                 (define %4.norm (extract  %3.norm %0.copy.0.new0.norm a.norm))
                                 (define %5.norm (bvusat %4.norm %arg2.norm %elemsize0.norm ))
                                 %5.norm
                                 )]
                              [else (begin
                                      (define %lastidx3.norm (-  %elemsize0.norm  1))
                                      (define %8.norm (+  j0.new.norm  %lastidx3.norm))
                                      (define %9.norm (extract  %8.norm j0.new.norm %arg3.norm))
                                      %9.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg4.norm)
  )

(define (_mm_packus_epi16  a b %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range 0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %low.cofactor0 (*  iterator.0  %factor0))
                              (define %lastidx1 (-  %arg0  1))
                              (define %high.offset0 (+  %low.cofactor0  %lastidx1))
                              (define %0 (extract  %high.offset0 %low.cofactor0 a))
                              (define %1 (bvusat %0 %arg0 %elemsize0 ))
                              %1
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %low.cofactor1 (*  iterator.1  2))
                              (define %low.offset0.new0 (-  %low.cofactor1  %arg2))
                              (define %lastidx3 (-  %arg1  1))
                              (define %high.offset2 (+  %low.offset0.new0  %lastidx3))
                              (define %16 (extract  %high.offset2 %low.offset0.new0 b))
                              (define %17 (bvusat %16 %arg1 %elemsize1 ))
                              %17
                              )
                    )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm512_max_epu64  a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
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
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm512_maskz_subs_epu8  k.norm %arg2.norm a.norm b.norm %innerlanesize0.norm %elemsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize0.norm))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %2.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                                 (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                                 (define %6.norm (bvsubnuw  %3.norm  %5.norm %elemsize0.norm))
                                 %6.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %10.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %11.norm (extract  %10.norm j0.new.norm %arg2.norm))
                                      %11.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm512_ror_epi64  %arg2 %arg1 a imm8 %innerlanesize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 8 8))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 8))])
                            (define %factor0 (/  %arg0  8))
                            (define %0.new0 (*  j0.new  %factor0))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  %0.new0  %lastidx0))
                            (define %2 (extract  %1 %0.new0 a))
                            (define %3 (extract  7 0 imm8))
                            (define %0.site0 (bvsmod  %3  %arg2))
                            (define %1.site0 (zero-extend  %0.site0 (bitvector %arg0)))
                            (define %2.site0 (bvashr  %2  %1.site0))
                            (define %3.site0 (bvsub  %arg1  %0.site0))
                            (define %4.site0 (zero-extend  %3.site0 (bitvector %arg0)))
                            (define %5.site0 (bvshl  %2  %4.site0))
                            (define %6.site0 (bvor  %2.site0  %5.site0))
                            %6.site0
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm256_abs_epi16  a %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %3 (integer->bitvector (abs (bitvector->integer %2)) (bitvector %elemsize0)))
                            %3
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm_maskz_min_epi8  k.norm %arg2.norm a.norm b.norm %innerlanesize0.norm %elemsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize0.norm))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %2.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                                 (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                                 (define %6.norm (bvsmin  %3.norm  %5.norm))
                                 %6.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %9.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %10.norm (extract  %9.norm j0.new.norm %arg2.norm))
                                      %10.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm512_mask_mulhi_epi32  k.norm src.norm a.norm b.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 512 512))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 512 32))])
                            (define j0.new.div.norm (/  j0.new.norm  32))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %3.norm (+  j0.new.norm  31))
                                 (define %4.norm (extract  %3.norm j0.new.norm a.norm))
                                 (define %6.norm (extract  %3.norm j0.new.norm b.norm))
                                 (define %7.norm (zero-extend  %4.norm (bitvector 64)))
                                 (define %8.norm (zero-extend  %6.norm (bitvector 64)))
                                 (define %9.norm (bvmul  %7.norm  %8.norm))
                                 (define %10.norm (bvashr  %9.norm  (bv 32 64)))
                                 (define %12.norm.high.idx 63 )
                                 (define %12.norm.low.idx (+ (- %12.norm.high.idx 32) 1) )
                                 (define %12.norm (extract  %12.norm.high.idx %12.norm.low.idx %10.norm))
                                 %12.norm
                                 )]
                              [else (begin
                                      (define %14.norm (+  j0.new.norm  31))
                                      (define %15.norm (extract  %14.norm j0.new.norm src.norm))
                                      %15.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm_sll_epi64  count.norm %arg3.norm a.norm %innerlanesize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm 64))])
                            (define %1.norm (extract  63 0 count.norm))
                            (define %2.norm (bvugt  %1.norm  (bv 63 64)))
                            (cond
                              [(equal? %2.norm #t)
                               (begin
                                 (define %4.norm (+  j0.new.norm  63))
                                 (define %10.norm (extract  %4.norm j0.new.norm %arg3.norm))
                                 %10.norm
                                 )]
                              [else (begin
                                      (define %5.norm (+  j0.new.norm  63))
                                      (define %6.norm (extract  %5.norm j0.new.norm a.norm))
                                      (define %7.norm (extract  63 0 count.norm))
                                      (define %8.norm (bvshl  %6.norm  %7.norm))
                                      %8.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm256_unpacklo_epi64  a b %innerlanesize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 %innerlanesize0 64))])
                            (define iterator.0.new.mul (*  iterator.0.new  2))
                            (define %0.site0.new.high.idx0 (+  iterator.0.new.mul  63))
                            (define %0.copy.copy.00.new (extract  %0.site0.new.high.idx0 iterator.0.new.mul a))
                            (define %1.copy.copy.00.new (extract  %0.site0.new.high.idx0 iterator.0.new.mul b))
                            (concat %1.copy.copy.00.new %0.copy.copy.00.new)
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm512_cmpgt_epi16_mask  b.norm a.norm %innerlanesize0.norm %arg2.norm %arg3.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range 0 %innerlanesize0.norm 1))])
                            (define %0.norm (*  j0.norm  %arg2.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %1.norm (+  %0.norm  %lastidx1.norm))
                            (define %2.norm (extract  %1.norm %0.norm a.norm))
                            (define %4.norm (extract  %1.norm %0.norm b.norm))
                            (define %5.norm (bvsgt  %2.norm  %4.norm))
                            (define %6.norm (if (equal? %5.norm #t) (bv 1 1) (bv 0 1)))
                            %6.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg3.norm)
  )

(define (_mm512_mul_epu32  a b %innerlanesize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 32))])
                            (define %0.new0 (*  j0.new  2))
                            (define %2 (+  %0.new0  31))
                            (define %3 (extract  %2 %0.new0 a))
                            (define %5 (extract  %2 %0.new0 b))
                            (define %6 (zero-extend  %3 (bitvector 64)))
                            (define %7 (zero-extend  %5 (bitvector 64)))
                            (define %8 (bvmul  %6  %7))
                            %8
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm512_mask_div_epu32  k.norm src.norm a.norm b.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 512 32))])
                            (define j0.new.div.norm (/  j0.new.norm  32))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %2.norm (+  j0.new.norm  31))
                                 (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                                 (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                                 (define %6.norm (zero-extend  %3.norm (bitvector 64)))
                                 (define %7.norm (zero-extend  %5.norm (bitvector 64)))
                                 (define %8.norm (bvudiv  %6.norm  %7.norm))
                                 (define %9.norm.high.idx (- 32 1))
                                 (define %9.norm.low.idx 0)
                                 (define %9.norm (extract  %9.norm.high.idx %9.norm.low.idx %8.norm))
                                 %9.norm
                                 )]
                              [else (begin
                                      (define %12.norm (+  j0.new.norm  31))
                                      (define %13.norm (extract  %12.norm j0.new.norm src.norm))
                                      %13.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm_dpbusds_epi32  src a b %vectsize0 )
  (define dst
    (apply
      concat
      (for/list ([j0.new (reverse (range 0 %vectsize0 32))])
                (define %55.clone.0 (+  j0.new  31))
                (define %56.clone.0 (extract  %55.clone.0 j0.new src))
                (define dst %56.clone.0)
                (define %11.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new (reverse (range 0 32 8))])
                              (define %1.new0 (+  j0.new  iterator.0.new))
                              (define %2 (+  %1.new0  7))
                              (define %3 (extract  %2 %1.new0 a))
                              (define %4 (zero-extend  %3 (bitvector 16)))
                              (define %8 (extract  %2 %1.new0 b))
                              (define %9 (sign-extend  %8 (bitvector 16)))
                              (define %10 (bvmul  %4  %9))
                              (define %11 (sign-extend  %10 (bitvector 32)))
                              %11
                              )
                    ))
                (define %63.clone.4 (+  j0.new  31))
                (define %11.acc0 (bvaddnsw %11.ext0.red dst 32))
                %11.acc0
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm_maddubs_pi16  a b %innerlanesize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 8))])
                            (define %0.new0 (*  j0.new  2))
                            (define %1 (+  %0.new0  8))
                            (define %2 (+  %0.new0  15))
                            (define %3 (extract  %2 %1 a))
                            (define %6 (extract  %2 %1 b))
                            (define %7 (zero-extend  %3 (bitvector 16)))
                            (define %8 (sign-extend  %6 (bitvector 16)))
                            (define %9 (bvmul  %7  %8))
                            (define %10 (+  %0.new0  7))
                            (define %11 (extract  %10 %0.new0 a))
                            (define %13 (extract  %10 %0.new0 b))
                            (define %14 (zero-extend  %11 (bitvector 16)))
                            (define %15 (sign-extend  %13 (bitvector 16)))
                            (define %16 (bvmul  %14  %15))
                            (define %17 (bvaddnsw  %9  %16 16))
                            %17
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm512_extracti32x4_epi32  imm8.norm a.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([%inner.it.norm (reverse (range 0 128 128))])
                            (define %0.norm (extract  1 0 imm8.norm))
                            (define %cond0.norm (bveq  %0.norm  (bv 0 2)))
                            (define %cond1.norm (bveq  %0.norm  (bv 1 2)))
                            (define %cond2.norm (bveq  %0.norm  (bv 2 2)))
                            (define %cond3.norm (bveq  %0.norm  (bv 3 2)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %1.norm (extract  127 0 a.norm))
                                 %1.norm
                                 )]
                              [(equal? %cond1.norm #t)
                               (begin
                                 (define %2.norm (extract  255 128 a.norm))
                                 %2.norm
                                 )]
                              [(equal? %cond2.norm #t)
                               (begin
                                 (define %3.norm (extract  383 256 a.norm))
                                 %3.norm
                                 )]
                              [(equal? %cond3.norm #t)
                               (begin
                                 (define %4.norm (extract  511 384 a.norm))
                                 %4.norm
                                 )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm512_maskz_srlv_epi32  %arg2.norm count.norm k.norm %arg6.norm %arg5.norm a.norm %innerlanesize0.norm %elemsize0.norm %arg3.norm %arg4.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize0.norm))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %arg3.norm  1))
                                 (define %2.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %2.norm j0.new.norm count.norm))
                                 (define %4.norm (bvult  %3.norm  %arg2.norm))
                                 (cond
                                   [(equal? %4.norm #t)
                                    (begin
                                      (define %lastidx2.norm (-  %arg4.norm  1))
                                      (define %5.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %6.norm (extract  %5.norm j0.new.norm a.norm))
                                      (define %8.norm (extract  %5.norm j0.new.norm count.norm))
                                      (define %9.norm (bvlshr  %6.norm  %8.norm))
                                      %9.norm
                                      )]
                                   [else (begin
                                           (define %lastidx3.norm (-  %arg4.norm  1))
                                           (define %12.norm (+  j0.new.norm  %lastidx3.norm))
                                           (define %15.norm (extract  %12.norm j0.new.norm %arg5.norm))
                                           %15.norm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx4.norm (-  %elemsize0.norm  1))
                                      (define %14.norm (+  j0.new.norm  %lastidx4.norm))
                                      (define %16.norm (extract  %14.norm j0.new.norm %arg6.norm))
                                      %16.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm512_div_epu16  a b %innerlanesize0 %elemsize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %4 (extract  %1 j0.new b))
                            (define %5 (zero-extend  %2 (bitvector %arg0)))
                            (define %6 (zero-extend  %4 (bitvector %arg0)))
                            (define %7 (bvudiv  %5  %6))
                            (define %8.high.idx (- %elemsize0 1))
                            (define %8.low.idx 0)
                            (define %8 (extract  %8.high.idx %8.low.idx %7))
                            %8
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm512_mask3_fmadd_epi32  k.norm a.norm b.norm c.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 512 32))])
                            (define j0.new.div.norm (/  j0.new.norm  32))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %3.norm (+  j0.new.norm  31))
                                 (define %4.norm (extract  %3.norm j0.new.norm a.norm))
                                 (define %6.norm (extract  %3.norm j0.new.norm b.norm))
                                 (define %7.norm (zero-extend  %4.norm (bitvector 64)))
                                 (define %8.norm (zero-extend  %6.norm (bitvector 64)))
                                 (define %9.norm (bvmul  %7.norm  %8.norm))
                                 (define %11.norm (extract  %3.norm j0.new.norm c.norm))
                                 (define %12.norm (zero-extend  %11.norm (bitvector 64)))
                                 (define %13.norm (bvadd  %9.norm  %12.norm))
                                 (define %15.norm.high.idx 63 )
                                 (define %15.norm.low.idx (+ (- %15.norm.high.idx 32) 1) )
                                 (define %15.norm (extract  %15.norm.high.idx %15.norm.low.idx %13.norm))
                                 %15.norm
                                 )]
                              [else (begin
                                      (define %17.norm (+  j0.new.norm  31))
                                      (define %18.norm (extract  %17.norm j0.new.norm c.norm))
                                      %18.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm256_dpwssds_epi32  src a b %vectsize0 )
  (define dst
    (apply
      concat
      (for/list ([j0.new (reverse (range 0 %vectsize0 32))])
                (define %25.clone.0 (+  j0.new  31))
                (define %26.clone.0 (extract  %25.clone.0 j0.new src))
                (define dst %26.clone.0)
                (define %10.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new (reverse (range 0 32 16))])
                              (define %1.new0 (+  j0.new  iterator.0.new))
                              (define %2 (+  %1.new0  15))
                              (define %3 (extract  %2 %1.new0 a))
                              (define %4 (sign-extend  %3 (bitvector 32)))
                              (define %8 (extract  %2 %1.new0 b))
                              (define %9 (sign-extend  %8 (bitvector 32)))
                              (define %10 (bvmul  %4  %9))
                              %10
                              )
                    ))
                (define %31.clone.2 (+  j0.new  31))
                (define %10.acc0 (bvaddnsw %10.ext0.red dst 32))
                %10.acc0
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm256_cvtepi8_epi32  a %innerlanesize0 %elemsize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %2 (+  j0.new  %lastidx1))
                            (define %3 (extract  %2 j0.new a))
                            (define %4 (sign-extend  %3 (bitvector %arg0)))
                            %4
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst 0)
  dst
  )

(define (_mm_maskz_or_epi64  k.norm %arg2.norm a.norm b.norm %innerlanesize0.norm %elemsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize0.norm))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %5.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %6.norm (extract  %5.norm j0.new.norm a.norm))
                                 (define %8.norm (extract  %5.norm j0.new.norm b.norm))
                                 (define %9.norm (bvor  %6.norm  %8.norm))
                                 %9.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %12.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %13.norm (extract  %12.norm j0.new.norm %arg2.norm))
                                      %13.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm_cmplt_epu16_mask  b.norm a.norm %innerlanesize0.norm %arg2.norm %arg3.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range 0 %innerlanesize0.norm 1))])
                            (define %0.norm (*  j0.norm  %arg2.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %1.norm (+  %0.norm  %lastidx1.norm))
                            (define %2.norm (extract  %1.norm %0.norm a.norm))
                            (define %4.norm (extract  %1.norm %0.norm b.norm))
                            (define %5.norm (bvult  %2.norm  %4.norm))
                            (define %6.norm (if (equal? %5.norm #t) (bv 1 1) (bv 0 1)))
                            %6.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg3.norm)
  )

(define (_mm512_mask_rem_epu32  k.norm src.norm a.norm b.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 512 512))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 512 32))])
                            (define j0.new.div.norm (/  j0.new.norm  32))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %2.norm (+  j0.new.norm  31))
                                 (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                                 (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                                 (define %6.norm (bvsrem  %3.norm  %5.norm))
                                 %6.norm
                                 )]
                              [else (begin
                                      (define %9.norm (+  j0.new.norm  31))
                                      (define %10.norm (extract  %9.norm j0.new.norm src.norm))
                                      %10.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm512_mask_dpwssds_epi32  k.norm src.norm a.norm b.norm %vectsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([j0.new.norm (reverse (range 0 %vectsize0.norm 32))])
                (define j0.new.div.norm (/  j0.new.norm  32))
                (define %0.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                (define %cond0.norm (bveq  %0.norm  (bv 1 1)))
                (cond
                  [(equal? %cond0.norm #t)
                   (begin
                     (define %26.clone.0.norm (+  j0.new.norm  31))
                     (define %27.clone.0.norm (extract  %26.clone.0.norm j0.new.norm src.norm))
                     (define dst.norm %27.clone.0.norm)
                     (define %11.ext0.norm.red
                       (apply
                         bvadd
                         (for/list ([iterator.0.new.norm (reverse (range 0 32 16))])
                                   (define %2.new0.norm (+  j0.new.norm  iterator.0.new.norm))
                                   (define %3.norm (+  %2.new0.norm  15))
                                   (define %4.norm (extract  %3.norm %2.new0.norm a.norm))
                                   (define %5.norm (sign-extend  %4.norm (bitvector 32)))
                                   (define %9.norm (extract  %3.norm %2.new0.norm b.norm))
                                   (define %10.norm (sign-extend  %9.norm (bitvector 32)))
                                   (define %11.norm (bvmul  %5.norm  %10.norm))
                                   %11.norm
                                   )
                         ))
                     (define %32.clone.2.norm (+  j0.new.norm  31))
                     (define %11.acc0.norm (bvaddnsw %11.ext0.norm.red dst.norm 32))
                     %11.acc0.norm
                     )]
                  [else (begin
                          (apply
                            concat
                            (for/list ([%outer.it.norm (reverse (range 0 32 32))])
                                      (define %34.norm (+  j0.new.norm  31))
                                      (define %35.norm (extract  %34.norm j0.new.norm src.norm))
                                      %35.norm
                                      )
                            )
                          )]
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm256_hadd_epi32  a b %elemsize0 %elemsize1 %arg0 %arg3 )
  (define dst
    (apply
      concat
      (for/list ([iterator.lane (reverse (range 0 256 128))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range 0 64 %elemsize0))])
                              (define %low.cofactor0 (*  iterator.0  2))
                              (define %low.scaled.it0 (+  iterator.lane  %low.cofactor0))
                              (define %low.offset0 (+  %low.scaled.it0  %arg0))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %high.offset0 (+  %low.offset0  %lastidx2))
                              (define %0 (extract  %high.offset0 %low.offset0 a))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %high.offset1 (+  %low.scaled.it0  %lastidx1))
                              (define %1 (extract  %high.offset1 %low.scaled.it0 a))
                              (define %2 (bvadd  %0  %1))
                              %2
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range 64 128 %elemsize1))])
                              (define %low.cofactor2 (*  iterator.1  2))
                              (define %low.scaled.it3 (+  iterator.lane  %low.cofactor2))
                              (define %low.offset1.new0 (-  %low.scaled.it3  %arg3))
                              (define %lastidx5 (-  %elemsize1  1))
                              (define %high.offset3 (+  %low.offset1.new0  %lastidx5))
                              (define %6 (extract  %high.offset3 %low.offset1.new0 b))
                              (define %low.offset2.new0 (-  %low.scaled.it3  128))
                              (define %lastidx4 (-  %elemsize1  1))
                              (define %high.offset4 (+  %low.offset2.new0  %lastidx4))
                              (define %7 (extract  %high.offset4 %low.offset2.new0 b))
                              (define %8 (bvadd  %6  %7))
                              %8
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm256_rorv_epi32  %arg1 %arg0 a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %4 (extract  %1 j0.new b))
                            (define %0.site0 (bvsmod  %4  %arg1))
                            (define %1.site0 (bvashr  %2  %0.site0))
                            (define %2.site0 (bvsub  %arg0  %0.site0))
                            (define %3.site0 (bvshl  %2  %2.site0))
                            (define %4.site0 (bvor  %1.site0  %3.site0))
                            %4.site0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm_hsub_epi32  a b %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range 0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %elemsize0  %elemsize0))
                              (define %factor1 (*  2  %factor0))
                              (define %low.cofactor0 (*  iterator.0  %factor1))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %high.offset0 (+  %low.cofactor0  %lastidx2))
                              (define %0 (extract  %high.offset0 %low.cofactor0 a))
                              (define %low.offset0 (+  %low.cofactor0  %arg0))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %high.offset1 (+  %low.offset0  %lastidx1))
                              (define %1 (extract  %high.offset1 %low.offset0 a))
                              (define %2 (bvsub  %0  %1))
                              %2
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %low.cofactor2 (*  iterator.1  2))
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
  (bvpadhighbits  dst 0)
  )

(define (_mm256_srai_epi32  %arg0.norm imm8.norm %arg5.norm a.norm %arg4.norm %innerlanesize0.norm %arg3.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 8 8))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm 8))])
                            (define %1.norm (extract  7 0 imm8.norm))
                            (define %2.norm (bvugt  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %2.norm #t)
                               (begin
                                 (define %factor0.norm (/  %arg3.norm  8))
                                 (define %0.copy.0.new0.norm (*  j0.new.norm  %factor0.norm))
                                 (define %lastidx1.norm (-  %arg3.norm  1))
                                 (define %4.norm (+  %0.copy.0.new0.norm  %lastidx1.norm))
                                 (define %5.norm (extract  %4.norm %4.norm a.norm))
                                 (define %cond0.norm (bveq  %5.norm  (bv 1 1)))
                                 (define %6.norm (if (equal? %cond0.norm #t) %arg4.norm %arg5.norm))
                                 %6.norm
                                 )]
                              [else (begin
                                      (define %factor2.norm (/  %arg3.norm  8))
                                      (define %0.copy.2.new0.norm (*  j0.new.norm  %factor2.norm))
                                      (define %lastidx3.norm (-  %arg3.norm  1))
                                      (define %8.norm (+  %0.copy.2.new0.norm  %lastidx3.norm))
                                      (define %9.norm (extract  %8.norm %0.copy.2.new0.norm a.norm))
                                      (define %10.norm (extract  7 0 imm8.norm))
                                      (define %11.norm (zero-extend  %10.norm (bitvector %arg3.norm)))
                                      (define %12.norm (bvashr  %9.norm  %11.norm))
                                      %12.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm512_maskz_avg_epu16  k.perm %arg3.perm %arg2.perm %arg4.perm a.perm b.perm %innerlanesize0.perm %elemsize0.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %1.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %elemsize0.perm  1))
                                 (define %3.perm (+  j0.new.perm  %lastidx1.perm))
                                 (define %4.perm (extract  %3.perm j0.new.perm a.perm))
                                 (define %6.perm (extract  %3.perm j0.new.perm b.perm))
                                 (define %7.perm (bvadd  %4.perm  %6.perm))
                                 (define %8.perm (bvadd  %7.perm  %arg3.perm))
                                 (define %9.perm (bvashr  %8.perm  %arg2.perm))
                                 %9.perm
                                 )]
                              [else (begin
                                      (define %lastidx2.perm (-  %elemsize0.perm  1))
                                      (define %12.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %13.perm (extract  %12.perm j0.new.perm %arg4.perm))
                                      %13.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm 0)
  )

(define (_mm_cmpeq_epi32  %arg1.norm %arg0.norm a.norm b.norm %innerlanesize0.norm %elemsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %2.norm (+  j0.new.norm  %lastidx0.norm))
                            (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                            (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                            (define %6.norm (bveq  %3.norm  %5.norm))
                            (define %7.norm (if (equal? %6.norm #t) %arg0.norm %arg1.norm))
                            %7.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm_mask_dpwssd_epi32  k.norm src.norm a.norm b.norm %vectsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([j0.new.norm (reverse (range 0 %vectsize0.norm 32))])
                (define j0.new.div.norm (/  j0.new.norm  32))
                (define %0.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                (define %cond0.norm (bveq  %0.norm  (bv 1 1)))
                (cond
                  [(equal? %cond0.norm #t)
                   (begin
                     (define %26.clone.0.norm (+  j0.new.norm  31))
                     (define %27.clone.0.norm (extract  %26.clone.0.norm j0.new.norm src.norm))
                     (define dst.norm %27.clone.0.norm)
                     (define %11.ext0.norm.red
                       (apply
                         bvadd
                         (for/list ([iterator.0.new.norm (reverse (range 0 32 16))])
                                   (define %2.new0.norm (+  j0.new.norm  iterator.0.new.norm))
                                   (define %3.norm (+  %2.new0.norm  15))
                                   (define %4.norm (extract  %3.norm %2.new0.norm a.norm))
                                   (define %5.norm (sign-extend  %4.norm (bitvector 32)))
                                   (define %9.norm (extract  %3.norm %2.new0.norm b.norm))
                                   (define %10.norm (sign-extend  %9.norm (bitvector 32)))
                                   (define %11.norm (bvmul  %5.norm  %10.norm))
                                   %11.norm
                                   )
                         ))
                     (define %31.clone.2.norm (+  j0.new.norm  31))
                     (define %11.acc0.norm (bvadd %11.ext0.norm.red dst.norm))
                     %11.acc0.norm
                     )]
                  [else (begin
                          (apply
                            concat
                            (for/list ([%outer.it.norm (reverse (range 0 32 32))])
                                      (define %33.norm (+  j0.new.norm  31))
                                      (define %34.norm (extract  %33.norm j0.new.norm src.norm))
                                      %34.norm
                                      )
                            )
                          )]
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm512_subs_epi16  a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %4 (extract  %1 j0.new b))
                            (define %5 (bvsubnsw  %2  %4 %elemsize0))
                            %5
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm_maskz_sra_epi64  count.norm k.norm a.norm %arg11.norm %innerlanesize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm 64))])
                            (define j0.new.div.norm (/  j0.new.norm  64))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %2.norm (extract  63 0 count.norm))
                                 (define %3.norm (bvugt  %2.norm  (bv 63 64)))
                                 (cond
                                   [(equal? %3.norm #t)
                                    (begin
                                      (define %5.norm (+  j0.new.norm  63))
                                      (define %6.norm (extract  %5.norm %5.norm a.norm))
                                      (define %cond1.norm (bveq  %6.norm  (bv 1 1)))
                                      (define %7.norm (if (equal? %cond1.norm #t) (bv 18446744073709551615 64) (bv 0 64)))
                                      %7.norm
                                      )]
                                   [else (begin
                                           (define %9.norm (+  j0.new.norm  63))
                                           (define %10.norm (extract  %9.norm j0.new.norm a.norm))
                                           (define %11.norm (extract  63 0 count.norm))
                                           (define %12.norm (bvashr  %10.norm  %11.norm))
                                           %12.norm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %15.norm (+  j0.new.norm  63))
                                      (define %16.norm (extract  %15.norm j0.new.norm %arg11.norm))
                                      %16.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm_sll_pi16  count.perm %arg0.perm %arg3.perm a.perm %innerlanesize0.perm %elemsize0.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define %1.perm (extract  63 0 count.perm))
                            (define %2.perm (bvugt  %1.perm  %arg0.perm))
                            (cond
                              [(equal? %2.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %elemsize0.perm  1))
                                 (define %4.perm (+  j0.new.perm  %lastidx1.perm))
                                 (define %12.perm (extract  %4.perm j0.new.perm %arg3.perm))
                                 %12.perm
                                 )]
                              [else (begin
                                      (define %lastidx2.perm (-  %elemsize0.perm  1))
                                      (define %5.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %6.perm (extract  %5.perm j0.new.perm a.perm))
                                      (define %7.perm (extract  63 0 count.perm))
                                      (define %8.perm (zero-extend  %6.perm (bitvector 64)))
                                      (define %9.perm (bvshl  %8.perm  %7.perm))
                                      (define %11.perm.high.idx 63 )
                                      (define %11.perm.low.idx (+ (- %11.perm.high.idx %elemsize0.perm) 1) )
                                      (define %11.perm (extract  %11.perm.high.idx %11.perm.low.idx %9.perm))
                                      %11.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm 0)
  )

(define (_mm_cmpge_epu64_mask  a.norm b.norm %innerlanesize0.norm %arg2.norm %arg3.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range 0 %innerlanesize0.norm 1))])
                            (define %0.norm (*  j0.norm  %arg2.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %1.norm (+  %0.norm  %lastidx1.norm))
                            (define %2.norm (extract  %1.norm %0.norm a.norm))
                            (define %4.norm (extract  %1.norm %0.norm b.norm))
                            (define %5.norm (bvuge  %2.norm  %4.norm))
                            (define %6.norm (if (equal? %5.norm #t) (bv 1 1) (bv 0 1)))
                            %6.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg3.norm)
  )

(define (_mm512_andnot_epi32  a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
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
  (bvpadhighbits  dst 0)
  )

(define (_mm512_mulhi_epi32  a b )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 512 512))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 512 32))])
                            (define %2 (+  j0.new  31))
                            (define %3 (extract  %2 j0.new a))
                            (define %5 (extract  %2 j0.new b))
                            (define %6 (zero-extend  %3 (bitvector 64)))
                            (define %7 (zero-extend  %5 (bitvector 64)))
                            (define %8 (bvmul  %6  %7))
                            (define %9 (bvashr  %8  (bv 32 64)))
                            (define %11.high.idx 63 )
                            (define %11.low.idx (+ (- %11.high.idx 32) 1) )
                            (define %11 (extract  %11.high.idx %11.low.idx %9))
                            %11
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm256_unpacklo_epi32  a b %vectsize0 %elemsize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([iterator.0 (reverse (range 0 %vectsize0 128))])
                (apply
                  concat
                  (for/list ([iterator.0.site0.new (reverse (range 0 64 %elemsize0))])
                            (define %factor0 (/  %elemsize0  %elemsize0))
                            (define %factor1 (*  2  %factor0))
                            (define iterator.0.site0.new.mul (*  iterator.0.site0.new  %factor1))
                            (define %0.site0.new.low.idx (+  iterator.0  iterator.0.site0.new))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %0.site0.new.high.idx0 (+  %0.site0.new.low.idx  %lastidx1))
                            (define %0.copy.copy.00.new (extract  %0.site0.new.high.idx0 %0.site0.new.low.idx a))
                            (define %1.copy.copy.00.new (extract  %0.site0.new.high.idx0 %0.site0.new.low.idx b))
                            (concat %1.copy.copy.00.new %0.copy.copy.00.new)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm512_maskz_xor_epi32  k.perm %arg2.perm a.perm b.perm %innerlanesize0.perm %elemsize0.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %1.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %elemsize0.perm  1))
                                 (define %5.perm (+  j0.new.perm  %lastidx1.perm))
                                 (define %6.perm (extract  %5.perm j0.new.perm a.perm))
                                 (define %8.perm (extract  %5.perm j0.new.perm b.perm))
                                 (define %9.perm (bvxor  %6.perm  %8.perm))
                                 %9.perm
                                 )]
                              [else (begin
                                      (define %lastidx2.perm (-  %elemsize0.perm  1))
                                      (define %12.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %13.perm (extract  %12.perm j0.new.perm %arg2.perm))
                                      %13.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm 0)
  )

(define (_mm_mul_su32  a b )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 32 32))])
                            (define %6 (+  %inner.it  31))
                            (define %0 (extract  %6 %inner.it a))
                            (define %1 (extract  %6 %inner.it b))
                            (define %2 (zero-extend  %0 (bitvector 64)))
                            (define %3 (zero-extend  %1 (bitvector 64)))
                            (define %4 (bvmul  %2  %3))
                            %4
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm512_mask_unpackhi_epi8  k.norm src.norm a.norm b.norm %vectsize0.norm %elemsize0.norm %innerlanesize1.norm %elemsize1.norm %arg0.norm %arg1.norm %arg2.norm )
  (define tmp_dst.norm
    (apply
      concat
      (for/list ([iterator.0.norm (reverse (range 0 %vectsize0.norm 128))])
                (apply
                  concat
                  (for/list ([iterator.0.site0.new.norm (reverse (range 0 64 %elemsize0.norm))])
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %factor1.norm (*  2  %factor0.norm))
                            (define iterator.0.site0.new.mul.norm (*  iterator.0.site0.new.norm  %factor1.norm))
                            (define %low.offset0.site0.norm (+  iterator.0.site0.new.norm  64))
                            (define %0.site0.new.low.idx.norm (+  iterator.0.norm  %low.offset0.site0.norm))
                            (define %lastidx1.norm (-  %arg0.norm  1))
                            (define %0.site0.new.high.idx0.norm (+  %0.site0.new.low.idx.norm  %lastidx1.norm))
                            (define %0.copy.copy.00.new.norm (extract  %0.site0.new.high.idx0.norm %0.site0.new.low.idx.norm a.norm))
                            (define %1.copy.copy.00.new.norm (extract  %0.site0.new.high.idx0.norm %0.site0.new.low.idx.norm b.norm))
                            (define %low.offset2.site0.norm (+  iterator.0.site0.new.mul.norm  %arg1.norm))
                            (concat %1.copy.copy.00.new.norm %0.copy.copy.00.new.norm)
                            )
                  )
                )
      )
    )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize1.norm %elemsize1.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize1.norm))
                            (define %13.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %13.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx4.norm (-  %elemsize1.norm  1))
                                 (define %15.norm (+  j0.new.norm  %lastidx4.norm))
                                 (define %16.norm (extract  %15.norm j0.new.norm tmp_dst.norm))
                                 %16.norm
                                 )]
                              [else (begin
                                      (define %lastidx5.norm (-  %elemsize1.norm  1))
                                      (define %19.norm (+  j0.new.norm  %lastidx5.norm))
                                      (define %20.norm (extract  %19.norm j0.new.norm src.norm))
                                      %20.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm_set1_pi8  a %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %1 (extract  %lastidx1 0 a))
                            %1
                            )
                  )
                )
      )
    )
  ;;(bvpadhighbits  dst 0)
  ;; TEMP
  dst
  )

(define (_mm512_unpackhi_epi64  a b %innerlanesize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 %innerlanesize0 64))])
                            (define iterator.0.new.mul (*  iterator.0.new  2))
                            (define %0.site0.new.low.idx (+  iterator.0.new.mul  64))
                            (define %0.site0.new.high.idx0 (+  %0.site0.new.low.idx  63))
                            (define %0.copy.copy.00.new (extract  %0.site0.new.high.idx0 %0.site0.new.low.idx a))
                            (define %1.copy.copy.00.new (extract  %0.site0.new.high.idx0 %0.site0.new.low.idx b))
                            (concat %1.copy.copy.00.new %0.copy.copy.00.new)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm_mask_srav_epi16  count.perm %arg2.perm k.perm %arg5.perm %arg6.perm a.perm src.perm %innerlanesize0.perm %elemsize0.perm %arg3.perm %arg4.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %1.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %arg3.perm  1))
                                 (define %2.perm (+  j0.new.perm  %lastidx1.perm))
                                 (define %3.perm (extract  %2.perm j0.new.perm count.perm))
                                 (define %4.perm (bvult  %3.perm  %arg2.perm))
                                 (cond
                                   [(equal? %4.perm #t)
                                    (begin
                                      (define %lastidx2.perm (-  %arg4.perm  1))
                                      (define %5.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %6.perm (extract  %5.perm j0.new.perm a.perm))
                                      (define %8.perm (extract  %5.perm j0.new.perm count.perm))
                                      (define %9.perm (bvashr  %6.perm  %8.perm))
                                      %9.perm
                                      )]
                                   [else (begin
                                           (define %lastidx3.perm (-  %arg4.perm  1))
                                           (define %12.perm (+  j0.new.perm  %lastidx3.perm))
                                           (define %13.perm (extract  %12.perm %12.perm a.perm))
                                           (define %cond1.perm (bveq  %13.perm  (bv 1 1)))
                                           (define %14.perm (if (equal? %cond1.perm #t) %arg5.perm %arg6.perm))
                                           %14.perm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx5.perm (-  %elemsize0.perm  1))
                                      (define %17.perm (+  j0.new.perm  %lastidx5.perm))
                                      (define %18.perm (extract  %17.perm j0.new.perm src.perm))
                                      %18.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm 0)
  )

(define (_mm256_maskz_unpacklo_epi8  k.norm %arg5.norm a.norm b.norm %vectsize0.norm %elemsize0.norm %innerlanesize1.norm %elemsize1.norm %arg0.norm %arg1.norm %arg2.norm )
  (define tmp_dst0.norm
    (apply
      concat
      (for/list ([iterator.0.norm (reverse (range 0 %vectsize0.norm 128))])
                (apply
                  concat
                  (for/list ([iterator.0.site0.new.norm (reverse (range 0 64 %elemsize0.norm))])
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %factor1.norm (*  2  %factor0.norm))
                            (define iterator.0.site0.new.mul.norm (*  iterator.0.site0.new.norm  %factor1.norm))
                            (define %0.site0.new.low.idx.norm (+  iterator.0.norm  iterator.0.site0.new.norm))
                            (define %lastidx1.norm (-  %arg0.norm  1))
                            (define %0.site0.new.high.idx0.norm (+  %0.site0.new.low.idx.norm  %lastidx1.norm))
                            (define %0.copy.copy.00.new.norm (extract  %0.site0.new.high.idx0.norm %0.site0.new.low.idx.norm a.norm))
                            (define %1.copy.copy.00.new.norm (extract  %0.site0.new.high.idx0.norm %0.site0.new.low.idx.norm b.norm))
                            (define %low.offset0.site0.norm (+  iterator.0.site0.new.mul.norm  %arg1.norm))
                            (concat %1.copy.copy.00.new.norm %0.copy.copy.00.new.norm)
                            )
                  )
                )
      )
    )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize1.norm %elemsize1.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize1.norm))
                            (define %7.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %7.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx4.norm (-  %elemsize1.norm  1))
                                 (define %9.norm (+  j0.new.norm  %lastidx4.norm))
                                 (define %10.norm (extract  %9.norm j0.new.norm tmp_dst0.norm))
                                 %10.norm
                                 )]
                              [else (begin
                                      (define %lastidx5.norm (-  %elemsize1.norm  1))
                                      (define %13.norm (+  j0.new.norm  %lastidx5.norm))
                                      (define %17.norm (extract  %13.norm j0.new.norm %arg5.norm))
                                      %17.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm_maskz_broadcast_i32x2  k.perm %arg3.perm a.perm %innerlanesize0.perm %elemsize0.perm %arg2.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %3.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %3.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define j0.new.div.copy.3.perm (/  j0.new.perm  %elemsize0.perm))
                                 (define %1.copy.0.perm (modulo  j0.new.div.copy.3.perm  %arg2.perm))
                                 (define %2.copy.0.perm (*  %1.copy.0.perm  %elemsize0.perm))
                                 (define %lastidx2.perm (-  %elemsize0.perm  1))
                                 (define %5.perm (+  %2.copy.0.perm  %lastidx2.perm))
                                 (define %6.perm (extract  %5.perm %2.copy.0.perm a.perm))
                                 %6.perm
                                 )]
                              [else (begin
                                      (define %lastidx3.perm (-  %elemsize0.perm  1))
                                      (define %9.perm (+  j0.new.perm  %lastidx3.perm))
                                      (define %10.perm (extract  %9.perm j0.new.perm %arg3.perm))
                                      %10.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm 0)
  )

(define (_mm256_maskz_mulhrs_epi16  k.perm %arg6.perm a.perm b.perm %innerlanesize0.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm 16))])
                            (define j0.new.div.perm (/  j0.new.perm  16))
                            (define %1.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %2.perm (+  j0.new.perm  15))
                                 (define %3.perm (extract  %2.perm j0.new.perm a.perm))
                                 (define %4.perm (sign-extend  %3.perm (bitvector 32)))
                                 (define %6.perm (extract  %2.perm j0.new.perm b.perm))
                                 (define %7.perm (sign-extend  %6.perm (bitvector 32)))
                                 (define %8.perm (bvmul  %4.perm  %7.perm))
                                 (define %9.perm (bvashr  %8.perm  (bv 14 32)))
                                 (define %10.perm (bvadd  %9.perm  (bv 1 32)))
                                 (define %11.perm (extract  16 1 %10.perm))
                                 %11.perm
                                 )]
                              [else (begin
                                      (define %14.perm (+  j0.new.perm  15))
                                      (define %15.perm (extract  %14.perm j0.new.perm %arg6.perm))
                                      %15.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm 0)
  )

(define (_mm512_maskz_packs_epi16  k.0 %arg5.0 a.0 b.0 %vectsize0.0 %elemsize0.0 %elemsize1.0 %innerlanesize2.0 %elemsize2.0 %arg0.0 %arg1.0 )
  (define tmp_dst.0
    (apply
      concat
      (for/list ([iterator.lane.0 (reverse (range 0 %vectsize0.0 128))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0.new.0 (reverse (range 0 128 %elemsize0.0))])
                              (define %low.scaled.it0.0 (+  iterator.lane.0  iterator.0.new.0))
                              (define %lastidx1.0 (-  %elemsize0.0  1))
                              (define %high.offset0.0 (+  %low.scaled.it0.0  %lastidx1.0))
                              (define %0.0 (extract  %high.offset0.0 %low.scaled.it0.0 a.0))
                              (define %1.0 (bvssat %0.0 %elemsize0.0 %arg0.0 ))
                              %1.0
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1.new.0 (reverse (range 128 256 %elemsize1.0))])
                              (define %low.scaled.it2.0 (+  iterator.lane.0  iterator.1.new.0))
                              (define %low.offset0.new0.0 (-  %low.scaled.it2.0  128))
                              (define %lastidx3.0 (-  %elemsize1.0  1))
                              (define %high.offset2.0 (+  %low.offset0.new0.0  %lastidx3.0))
                              (define %16.0 (extract  %high.offset2.0 %low.offset0.new0.0 b.0))
                              (define %17.0 (bvssat %16.0 %elemsize1.0 %arg1.0 ))
                              %17.0
                              )
                    )
                  )
                )
      )
    )
  (define dst.0
    (apply
      concat
      (for/list ([%outer.it.0 (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.0 (reverse (range 0 %innerlanesize2.0 %elemsize2.0))])
                            (define j0.new.div.0 (/  j0.new.0  %elemsize2.0))
                            (define %129.0 (extract  j0.new.div.0 j0.new.div.0 k.0))
                            (define %cond0.0 (bveq  %129.0  (bv 1 1)))
                            (cond
                              [(equal? %cond0.0 #t)
                               (begin
                                 (define %lastidx5.0 (-  %elemsize2.0  1))
                                 (define %131.0 (+  j0.new.0  %lastidx5.0))
                                 (define %132.0 (extract  %131.0 j0.new.0 tmp_dst.0))
                                 %132.0
                                 )]
                              [else (begin
                                      (define %lastidx6.0 (-  %elemsize2.0  1))
                                      (define %135.0 (+  j0.new.0  %lastidx6.0))
                                      (define %136.0 (extract  %135.0 j0.new.0 %arg5.0))
                                      %136.0
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.0 0)
  )

(define (_mm_mask_sra_epi16  %arg2.norm count.norm k.norm %arg6.norm %arg7.norm a.norm src.norm %innerlanesize0.norm %elemsize0.norm %arg5.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize0.norm))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %2.norm (extract  63 0 count.norm))
                                 (define %3.norm (bvugt  %2.norm  %arg2.norm))
                                 (cond
                                   [(equal? %3.norm #t)
                                    (begin
                                      (define %lastidx2.norm (-  %arg5.norm  1))
                                      (define %5.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %6.norm (extract  %5.norm %5.norm a.norm))
                                      (define %cond1.norm (bveq  %6.norm  (bv 1 1)))
                                      (define %7.norm (if (equal? %cond1.norm #t) %arg6.norm %arg7.norm))
                                      %7.norm
                                      )]
                                   [else (begin
                                           (define %lastidx4.norm (-  %arg5.norm  1))
                                           (define %9.norm (+  j0.new.norm  %lastidx4.norm))
                                           (define %10.norm (extract  %9.norm j0.new.norm a.norm))
                                           (define %11.norm (extract  63 0 count.norm))
                                           (define %12.norm (zero-extend  %10.norm (bitvector 64)))
                                           (define %13.norm (bvashr  %12.norm  %11.norm))
                                           (define %15.norm.high.idx 63 )
                                           (define %15.norm.low.idx (+ (- %15.norm.high.idx %arg5.norm) 1) )
                                           (define %15.norm (extract  %15.norm.high.idx %15.norm.low.idx %13.norm))
                                           %15.norm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx6.norm (-  %elemsize0.norm  1))
                                      (define %17.norm (+  j0.new.norm  %lastidx6.norm))
                                      (define %18.norm (extract  %17.norm j0.new.norm src.norm))
                                      %18.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm512_fmadd_epi32  a b c )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 512 32))])
                            (define %2 (+  j0.new  31))
                            (define %3 (extract  %2 j0.new a))
                            (define %5 (extract  %2 j0.new b))
                            (define %6 (zero-extend  %3 (bitvector 64)))
                            (define %7 (zero-extend  %5 (bitvector 64)))
                            (define %8 (bvmul  %6  %7))
                            (define %10 (extract  %2 j0.new c))
                            (define %11 (zero-extend  %10 (bitvector 64)))
                            (define %12 (bvadd  %8  %11))
                            (define %14.high.idx 63 )
                            (define %14.low.idx (+ (- %14.high.idx 32) 1) )
                            (define %14 (extract  %14.high.idx %14.low.idx %12))
                            %14
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm_maskz_unpackhi_epi32  k.norm %arg6.norm a.norm b.norm %elemsize0.norm %elemsize1.norm %arg0.norm %arg1.norm %arg2.norm )
  (define tmp_dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([iterator.0.site0.new.norm (reverse (range 0 64 %elemsize0.norm))])
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %factor1.norm (*  2  %factor0.norm))
                            (define iterator.0.site0.new.mul.norm (*  iterator.0.site0.new.norm  %factor1.norm))
                            (define %0.site0.new.low.idx.norm (+  64  iterator.0.site0.new.norm))
                            (define %lastidx1.norm (-  %arg0.norm  1))
                            (define %0.site0.new.high.idx0.norm (+  %0.site0.new.low.idx.norm  %lastidx1.norm))
                            (define %0.copy.copy.00.new.norm (extract  %0.site0.new.high.idx0.norm %0.site0.new.low.idx.norm a.norm))
                            (define %1.copy.copy.00.new.norm (extract  %0.site0.new.high.idx0.norm %0.site0.new.low.idx.norm b.norm))
                            (concat %1.copy.copy.00.new.norm %0.copy.copy.00.new.norm)
                            )
                  )
                )
      )
    )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 128 %elemsize1.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize1.norm))
                            (define %4.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %4.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx4.norm (-  %elemsize1.norm  1))
                                 (define %6.norm (+  j0.new.norm  %lastidx4.norm))
                                 (define %7.norm (extract  %6.norm j0.new.norm tmp_dst0.norm))
                                 %7.norm
                                 )]
                              [else (begin
                                      (define %lastidx5.norm (-  %elemsize1.norm  1))
                                      (define %10.norm (+  j0.new.norm  %lastidx5.norm))
                                      (define %14.norm (extract  %10.norm j0.new.norm %arg6.norm))
                                      %14.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm256_and_si256  a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %4 (+  %inner.it  %lastidx0))
                            (define %0 (extract  %4 %inner.it a))
                            (define %1 (extract  %4 %inner.it b))
                            (define %2 (bvand  %0  %1))
                            %2
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm512_mask_mullo_epi64  k.norm src.norm a.norm b.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg3.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize0.norm))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %3.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %4.norm (extract  %3.norm j0.new.norm a.norm))
                                 (define %6.norm (extract  %3.norm j0.new.norm b.norm))
                                 (define %7.norm (zero-extend  %4.norm (bitvector %arg3.norm)))
                                 (define %8.norm (zero-extend  %6.norm (bitvector %arg3.norm)))
                                 (define %9.norm (bvmul  %7.norm  %8.norm))
                                 (define %lastidx2.norm (-  %elemsize0.norm  1))
                                 (define %highidx1.norm (+  %lastidx2.norm  %arg2.norm))
                                 (define %10.norm (extract  %highidx1.norm %arg2.norm %9.norm))
                                 %10.norm
                                 )]
                              [else (begin
                                      (define %lastidx3.norm (-  %elemsize0.norm  1))
                                      (define %13.norm (+  j0.new.norm  %lastidx3.norm))
                                      (define %14.norm (extract  %13.norm j0.new.norm src.norm))
                                      %14.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm_hadds_epi16  a b %innerlanesize0 %innerlaneoffset1 %innerlanesize1 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range 0 %innerlanesize0 16))])
                              (define %low.cofactor0 (*  iterator.0  2))
                              (define %low.offset0 (+  %low.cofactor0  16))
                              (define %high.offset0 (+  %low.offset0  15))
                              (define %0 (extract  %high.offset0 %low.offset0 a))
                              (define %high.offset1 (+  %low.cofactor0  15))
                              (define %1 (extract  %high.offset1 %low.cofactor0 a))
                              (define %2 (bvaddnsw  %0  %1 16))
                              %2
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %innerlaneoffset1 %innerlanesize1 16))])
                              (define %low.cofactor2 (*  iterator.1  2))
                              (define %low.offset1.new0 (-  %low.cofactor2  %arg2))
                              (define %high.offset3 (+  %low.offset1.new0  15))
                              (define %16 (extract  %high.offset3 %low.offset1.new0 b))
                              (define %low.offset2.new0 (-  %low.cofactor2  %arg1))
                              (define %high.offset4 (+  %low.offset2.new0  15))
                              (define %17 (extract  %high.offset4 %low.offset2.new0 b))
                              (define %18 (bvaddnsw  %16  %17 16))
                              %18
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm_unpacklo_epi32  a b %innerlanesize0 %elemsize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([iterator.0.site0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %elemsize0  %elemsize0))
                            (define %factor1 (*  2  %factor0))
                            (define iterator.0.site0.new.mul (*  iterator.0.site0.new  %factor1))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %0.site0.new.high.idx0 (+  iterator.0.site0.new  %lastidx1))
                            (define %0.copy.copy.00.new (extract  %0.site0.new.high.idx0 iterator.0.site0.new a))
                            (define %1.copy.copy.00.new (extract  %0.site0.new.high.idx0 iterator.0.site0.new b))
                            (concat %1.copy.copy.00.new %0.copy.copy.00.new)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm_cmpeq_epi64_mask  b.norm a.norm %innerlanesize0.norm %arg2.norm %arg3.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range 0 %innerlanesize0.norm 1))])
                            (define %0.norm (*  j0.norm  %arg2.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %1.norm (+  %0.norm  %lastidx1.norm))
                            (define %2.norm (extract  %1.norm %0.norm a.norm))
                            (define %4.norm (extract  %1.norm %0.norm b.norm))
                            (define %5.norm (bveq  %2.norm  %4.norm))
                            (define %6.norm (if (equal? %5.norm #t) (bv 1 1) (bv 0 1)))
                            %6.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg3.norm)
  )

(define (_mm512_rem_epu16  a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
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
  (bvpadhighbits  dst 0)
  )

(define (_mm_cvtusepi64_epi8  a %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %0.new0 (*  j0.new  %factor0))
                            (define %lastidx1 (-  %arg0  1))
                            (define %2 (+  %0.new0  %lastidx1))
                            (define %3 (extract  %2 %0.new0 a))
                            (define %4 (bvusat %3 %arg0 %elemsize0 ))
                            %4
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_m_paddusw  a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %4 (extract  %1 j0.new b))
                            (define %5 (bvaddnuw  %2  %4 %elemsize0))
                            %5
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm512_maskz_dpwssd_epi32  k.norm %arg2.norm src.norm a.norm b.norm %vectsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([j0.new.norm (reverse (range 0 %vectsize0.norm 32))])
                (define j0.new.div.norm (/  j0.new.norm  32))
                (define %0.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                (define %cond0.norm (bveq  %0.norm  (bv 1 1)))
                (cond
                  [(equal? %cond0.norm #t)
                   (begin
                     (define %26.clone.0.norm (+  j0.new.norm  31))
                     (define %27.clone.0.norm (extract  %26.clone.0.norm j0.new.norm src.norm))
                     (define dst.norm %27.clone.0.norm)
                     (define %11.ext0.norm.red
                       (apply
                         bvadd
                         (for/list ([iterator.0.new.norm (reverse (range 0 32 16))])
                                   (define %2.new0.norm (+  j0.new.norm  iterator.0.new.norm))
                                   (define %3.norm (+  %2.new0.norm  15))
                                   (define %4.norm (extract  %3.norm %2.new0.norm a.norm))
                                   (define %5.norm (sign-extend  %4.norm (bitvector 32)))
                                   (define %9.norm (extract  %3.norm %2.new0.norm b.norm))
                                   (define %10.norm (sign-extend  %9.norm (bitvector 32)))
                                   (define %11.norm (bvmul  %5.norm  %10.norm))
                                   %11.norm
                                   )
                         ))
                     (define %31.clone.2.norm (+  j0.new.norm  31))
                     (define %11.acc0.norm (bvadd %11.ext0.norm.red dst.norm))
                     %11.acc0.norm
                     )]
                  [else (begin
                          (apply
                            concat
                            (for/list ([%outer.it.norm (reverse (range 0 32 32))])
                                      (define %33.norm (+  j0.new.norm  31))
                                      (define %34.norm (extract  %33.norm j0.new.norm %arg2.norm))
                                      %34.norm
                                      )
                            )
                          )]
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm_mask_dpbusd_epi32  k.norm src.norm a.norm b.norm %vectsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([j0.new.norm (reverse (range 0 %vectsize0.norm 32))])
                (define j0.new.div.norm (/  j0.new.norm  32))
                (define %0.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                (define %cond0.norm (bveq  %0.norm  (bv 1 1)))
                (cond
                  [(equal? %cond0.norm #t)
                   (begin
                     (define %56.clone.0.norm (+  j0.new.norm  31))
                     (define %57.clone.0.norm (extract  %56.clone.0.norm j0.new.norm src.norm))
                     (define dst.norm %57.clone.0.norm)
                     (define %12.ext0.norm.red
                       (apply
                         bvadd
                         (for/list ([iterator.0.new.norm (reverse (range 0 32 8))])
                                   (define %2.new0.norm (+  j0.new.norm  iterator.0.new.norm))
                                   (define %3.norm (+  %2.new0.norm  7))
                                   (define %4.norm (extract  %3.norm %2.new0.norm a.norm))
                                   (define %5.norm (zero-extend  %4.norm (bitvector 16)))
                                   (define %9.norm (extract  %3.norm %2.new0.norm b.norm))
                                   (define %10.norm (sign-extend  %9.norm (bitvector 16)))
                                   (define %11.norm (bvmul  %5.norm  %10.norm))
                                   (define %12.norm (sign-extend  %11.norm (bitvector 32)))
                                   %12.norm
                                   )
                         ))
                     (define %63.clone.4.norm (+  j0.new.norm  31))
                     (define %12.acc0.norm (bvadd %12.ext0.norm.red dst.norm))
                     %12.acc0.norm
                     )]
                  [else (begin
                          (apply
                            concat
                            (for/list ([%outer.it.norm (reverse (range 0 32 32))])
                                      (define %65.norm (+  j0.new.norm  31))
                                      (define %66.norm (extract  %65.norm j0.new.norm src.norm))
                                      %66.norm
                                      )
                            )
                          )]
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_m_packsswb  a b %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range 0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %low.cofactor0 (*  iterator.0  %factor0))
                              (define %lastidx1 (-  %arg0  1))
                              (define %high.offset0 (+  %low.cofactor0  %lastidx1))
                              (define %0 (extract  %high.offset0 %low.cofactor0 a))
                              (define %1 (bvssat %0 %arg0 %elemsize0 ))
                              %1
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %low.cofactor1 (*  iterator.1  2))
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
  (bvpadhighbits  dst 0)
  )

(define (_mm_mask_packus_epi16  k.norm src.norm a.norm b.norm %elemsize0.norm %elemsize1.norm %elemsize2.norm %arg0.norm %arg1.norm )
  (define tmp_dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0.new.norm (reverse (range 0 128 %elemsize0.norm))])
                              (define %lastidx1.norm (-  %elemsize0.norm  1))
                              (define %high.offset0.norm (+  iterator.0.new.norm  %lastidx1.norm))
                              (define %0.norm (extract  %high.offset0.norm iterator.0.new.norm a.norm))
                              (define %1.norm (bvusat %0.norm %elemsize0.norm %arg0.norm ))
                              %1.norm
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1.new.norm (reverse (range 128 256 %elemsize1.norm))])
                              (define %low.offset0.new0.norm (-  iterator.1.new.norm  128))
                              (define %lastidx3.norm (-  %elemsize1.norm  1))
                              (define %high.offset2.norm (+  %low.offset0.new0.norm  %lastidx3.norm))
                              (define %16.norm (extract  %high.offset2.norm %low.offset0.new0.norm b.norm))
                              (define %17.norm (bvusat %16.norm %elemsize1.norm %arg1.norm ))
                              %17.norm
                              )
                    )
                  )
                )
      )
    )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 128 %elemsize2.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize2.norm))
                            (define %33.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %33.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx5.norm (-  %elemsize2.norm  1))
                                 (define %35.norm (+  j0.new.norm  %lastidx5.norm))
                                 (define %36.norm (extract  %35.norm j0.new.norm tmp_dst0.norm))
                                 %36.norm
                                 )]
                              [else (begin
                                      (define %lastidx6.norm (-  %elemsize2.norm  1))
                                      (define %39.norm (+  j0.new.norm  %lastidx6.norm))
                                      (define %40.norm (extract  %39.norm j0.new.norm src.norm))
                                      %40.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm256_min_epi16  a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
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
  ;;(bvpadhighbits  dst 0)
  ;;TEMP
  dst
  )

(define (_mm_mask_madd52hi_epu64  k.norm a.norm b.norm c.norm %innerlanesize0.norm %arg4.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm 52))])
                            (define j0.new.div.norm (/  j0.new.norm  52))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define j0.new.div.copy.2.norm (/  j0.new.norm  52))
                                 (define %0.copy.0.norm (*  j0.new.div.copy.2.norm  64))
                                 (define %2.norm (+  %0.copy.0.norm  51))
                                 (define %3.norm (extract  %2.norm %0.copy.0.norm b.norm))
                                 (define %6.norm (extract  %2.norm %0.copy.0.norm c.norm))
                                 (define %8.norm (zero-extend  %3.norm (bitvector 128)))
                                 (define %9.norm (zero-extend  %6.norm (bitvector 128)))
                                 (define %10.norm (bvmul  %8.norm  %9.norm))
                                 (define %13.norm (+  %0.copy.0.norm  63))
                                 (define %14.norm (extract  %13.norm %0.copy.0.norm a.norm))
                                 (define %highidx1.norm (+  51  %arg4.norm))
                                 (define %15.norm (extract  %highidx1.norm %arg4.norm %10.norm))
                                 (define %16.norm (zero-extend  %15.norm (bitvector 64)))
                                 (define %17.norm (bvadd  %14.norm  %16.norm))
                                 %17.norm
                                 )]
                              [else (begin
                                      (define j0.new.div.copy.8.norm (/  j0.new.norm  52))
                                      (define %0.copy.6.norm (*  j0.new.div.copy.8.norm  64))
                                      (define %20.norm (+  %0.copy.6.norm  63))
                                      (define %21.norm (extract  %20.norm %0.copy.6.norm a.norm))
                                      %21.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  ;(bvpadhighbits  dst.norm 0)
  dst.norm
  )

(define (_mm512_mask_div_epi32  k.norm src.norm a.norm b.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 512 32))])
                            (define j0.new.div.norm (/  j0.new.norm  32))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %2.norm (+  j0.new.norm  31))
                                 (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                                 (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                                 (define %6.norm (sign-extend  %3.norm (bitvector 64)))
                                 (define %7.norm (sign-extend  %5.norm (bitvector 64)))
                                 (define %8.norm (bvsdiv  %6.norm  %7.norm))
                                 (define %9.norm.high.idx (- 32 1))
                                 (define %9.norm.low.idx 0)
                                 (define %9.norm (extract  %9.norm.high.idx %9.norm.low.idx %8.norm))
                                 %9.norm
                                 )]
                              [else (begin
                                      (define %12.norm (+  j0.new.norm  31))
                                      (define %13.norm (extract  %12.norm j0.new.norm src.norm))
                                      %13.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_m_psllwi  imm8.norm %arg0.norm %arg4.norm a.norm %innerlanesize0.norm %arg3.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 8 8))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm 8))])
                            (define %1.norm (extract  7 0 imm8.norm))
                            (define %2.norm (bvugt  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %2.norm #t)
                               (begin
                                 (define %factor0.norm (/  %arg3.norm  8))
                                 (define %0.copy.0.new0.norm (*  j0.new.norm  %factor0.norm))
                                 (define %lastidx1.norm (-  %arg3.norm  1))
                                 (define %4.norm (+  %0.copy.0.new0.norm  %lastidx1.norm))
                                 (define %11.norm (extract  %4.norm %0.copy.0.new0.norm %arg4.norm))
                                 %11.norm
                                 )]
                              [else (begin
                                      (define %factor2.norm (/  %arg3.norm  8))
                                      (define %0.copy.2.new0.norm (*  j0.new.norm  %factor2.norm))
                                      (define %lastidx2.norm (-  %arg3.norm  1))
                                      (define %5.norm (+  %0.copy.2.new0.norm  %lastidx2.norm))
                                      (define %6.norm (extract  %5.norm %0.copy.2.new0.norm a.norm))
                                      (define %7.norm (extract  7 0 imm8.norm))
                                      (define %8.norm (zero-extend  %7.norm (bitvector %arg3.norm)))
                                      (define %9.norm (bvshl  %6.norm  %8.norm))
                                      %9.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm256_broadcastmw_epi32  k %innerlanesize0 %elemsize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %1 (extract  %lastidx1 0 k))
                            (define %2 (zero-extend  %1 (bitvector %arg0)))
                            %2
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm_mask_andnot_epi32  k.0 src.0 a.0 b.0 %innerlanesize0.0 %elemsize0.0 )
  (define dst.0
    (apply
      concat
      (for/list ([%outer.it.0 (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.0 (reverse (range 0 %innerlanesize0.0 %elemsize0.0))])
                            (define j0.new.div.0 (/  j0.new.0  %elemsize0.0))
                            (define %1.0 (extract  j0.new.div.0 j0.new.div.0 k.0))
                            (define %cond0.0 (bveq  %1.0  (bv 1 1)))
                            (cond
                              [(equal? %cond0.0 #t)
                               (begin
                                 (define %lastidx1.0 (-  %elemsize0.0  1))
                                 (define %3.0 (+  j0.new.0  %lastidx1.0))
                                 (define %4.0 (extract  %3.0 j0.new.0 a.0))
                                 (define %5.0 (bvnot  %4.0))
                                 (define %7.0 (extract  %3.0 j0.new.0 b.0))
                                 (define %8.0 (bvand  %5.0  %7.0))
                                 %8.0
                                 )]
                              [else (begin
                                      (define %lastidx2.0 (-  %elemsize0.0  1))
                                      (define %11.0 (+  j0.new.0  %lastidx2.0))
                                      (define %12.0 (extract  %11.0 j0.new.0 src.0))
                                      %12.0
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.0 0)
  )

(define (_mm256_mask_add_epi8  k.norm src.norm a.norm b.norm %innerlanesize0.norm %elemsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize0.norm))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %5.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %6.norm (extract  %5.norm j0.new.norm a.norm))
                                 (define %8.norm (extract  %5.norm j0.new.norm b.norm))
                                 (define %9.norm (bvadd  %6.norm  %8.norm))
                                 %9.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %12.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %13.norm (extract  %12.norm j0.new.norm src.norm))
                                      %13.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm_dpwssd_epi32  src a b %vectsize0 )
  (define dst
    (apply
      concat
      (for/list ([j0.new (reverse (range 0 %vectsize0 32))])
                (define %25.clone.0 (+  j0.new  31))
                (define %26.clone.0 (extract  %25.clone.0 j0.new src))
                (define dst %26.clone.0)
                (define %10.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new (reverse (range 0 32 16))])
                              (define %1.new0 (+  j0.new  iterator.0.new))
                              (define %2 (+  %1.new0  15))
                              (define %3 (extract  %2 %1.new0 a))
                              (define %4 (sign-extend  %3 (bitvector 32)))
                              (define %8 (extract  %2 %1.new0 b))
                              (define %9 (sign-extend  %8 (bitvector 32)))
                              (define %10 (bvmul  %4  %9))
                              %10
                              )
                    ))
                (define %30.clone.2 (+  j0.new  31))
                (define %10.acc0 (bvadd %10.ext0.red dst))
                %10.acc0
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm256_cmple_epi32_mask  b.norm a.norm %innerlanesize0.norm %arg2.norm %arg3.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range 0 %innerlanesize0.norm 1))])
                            (define %0.norm (*  j0.norm  %arg2.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %1.norm (+  %0.norm  %lastidx1.norm))
                            (define %2.norm (extract  %1.norm %0.norm a.norm))
                            (define %4.norm (extract  %1.norm %0.norm b.norm))
                            (define %5.norm (bvsle  %2.norm  %4.norm))
                            (define %6.norm (if (equal? %5.norm #t) (bv 1 1) (bv 0 1)))
                            %6.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg3.norm)
  )

(define (_mm256_unpackhi_epi8  a b %vectsize0 %elemsize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([iterator.0 (reverse (range 0 %vectsize0 128))])
                (apply
                  concat
                  (for/list ([iterator.0.site0.new (reverse (range 0 64 %elemsize0))])
                            (define %factor0 (/  %elemsize0  %elemsize0))
                            (define %factor1 (*  2  %factor0))
                            (define iterator.0.site0.new.mul (*  iterator.0.site0.new  %factor1))
                            (define %low.offset0.site0 (+  iterator.0.site0.new  64))
                            (define %0.site0.new.low.idx (+  iterator.0  %low.offset0.site0))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %0.site0.new.high.idx0 (+  %0.site0.new.low.idx  %lastidx1))
                            (define %0.copy.copy.00.new (extract  %0.site0.new.high.idx0 %0.site0.new.low.idx a))
                            (define %1.copy.copy.00.new (extract  %0.site0.new.high.idx0 %0.site0.new.low.idx b))
                            (concat %1.copy.copy.00.new %0.copy.copy.00.new)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm_madd_pi16  a b %innerlanesize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 16))])
                            (define %0.new0 (*  j0.new  2))
                            (define %2 (+  %0.new0  16))
                            (define %3 (+  %0.new0  31))
                            (define %4 (extract  %3 %2 a))
                            (define %7 (extract  %3 %2 b))
                            (define %8 (sign-extend  %4 (bitvector 32)))
                            (define %9 (sign-extend  %7 (bitvector 32)))
                            (define %10 (bvmul  %8  %9))
                            (define %11 (+  %0.new0  15))
                            (define %12 (extract  %11 %0.new0 a))
                            (define %14 (extract  %11 %0.new0 b))
                            (define %15 (sign-extend  %12 (bitvector 32)))
                            (define %16 (sign-extend  %14 (bitvector 32)))
                            (define %17 (bvmul  %15  %16))
                            (define %18 (bvadd  %10  %17))
                            %18
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm256_mask_cvtepi8_epi32  k.perm src.perm a.perm %innerlanesize0.perm %elemsize0.perm %arg2.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %2.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %2.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx2.perm (-  %elemsize0.perm  1))
                                 (define %3.perm (+  j0.new.perm  %lastidx2.perm))
                                 (define %4.perm (extract  %3.perm j0.new.perm a.perm))
                                 (define %5.perm (sign-extend  %4.perm (bitvector %arg2.perm)))
                                 %5.perm
                                 )]
                              [else (begin
                                      (define %factor2.perm (/  %arg2.perm  %elemsize0.perm))
                                      (define %0.copy.2.new0.perm (*  j0.new.perm  %factor2.perm))
                                      (define %lastidx3.perm (-  %arg2.perm  1))
                                      (define %8.perm (+  %0.copy.2.new0.perm  %lastidx3.perm))
                                      (define %9.perm (extract  %8.perm %0.copy.2.new0.perm src.perm))
                                      %9.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm 0)
  )

(define (_mm256_mask_packus_epi16  k.0 src.0 a.0 b.0 %vectsize0.0 %elemsize0.0 %elemsize1.0 %innerlanesize2.0 %elemsize2.0 %arg0.0 %arg1.0 )
  (define tmp_dst0.0
    (apply
      concat
      (for/list ([iterator.lane.0 (reverse (range 0 %vectsize0.0 128))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0.new.0 (reverse (range 0 128 %elemsize0.0))])
                              (define %low.scaled.it0.0 (+  iterator.lane.0  iterator.0.new.0))
                              (define %lastidx1.0 (-  %elemsize0.0  1))
                              (define %high.offset0.0 (+  %low.scaled.it0.0  %lastidx1.0))
                              (define %0.0 (extract  %high.offset0.0 %low.scaled.it0.0 a.0))
                              (define %1.0 (bvusat %0.0 %elemsize0.0 %arg0.0 ))
                              %1.0
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1.new.0 (reverse (range 128 256 %elemsize1.0))])
                              (define %low.scaled.it2.0 (+  iterator.lane.0  iterator.1.new.0))
                              (define %low.offset0.new0.0 (-  %low.scaled.it2.0  128))
                              (define %lastidx3.0 (-  %elemsize1.0  1))
                              (define %high.offset2.0 (+  %low.offset0.new0.0  %lastidx3.0))
                              (define %16.0 (extract  %high.offset2.0 %low.offset0.new0.0 b.0))
                              (define %17.0 (bvusat %16.0 %elemsize1.0 %arg1.0 ))
                              %17.0
                              )
                    )
                  )
                )
      )
    )
  (define dst.0
    (apply
      concat
      (for/list ([%outer.it.0 (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.0 (reverse (range 0 %innerlanesize2.0 %elemsize2.0))])
                            (define j0.new.div.0 (/  j0.new.0  %elemsize2.0))
                            (define %65.0 (extract  j0.new.div.0 j0.new.div.0 k.0))
                            (define %cond0.0 (bveq  %65.0  (bv 1 1)))
                            (cond
                              [(equal? %cond0.0 #t)
                               (begin
                                 (define %lastidx5.0 (-  %elemsize2.0  1))
                                 (define %67.0 (+  j0.new.0  %lastidx5.0))
                                 (define %68.0 (extract  %67.0 j0.new.0 tmp_dst0.0))
                                 %68.0
                                 )]
                              [else (begin
                                      (define %lastidx6.0 (-  %elemsize2.0  1))
                                      (define %71.0 (+  j0.new.0  %lastidx6.0))
                                      (define %72.0 (extract  %71.0 j0.new.0 src.0))
                                      %72.0
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.0 0)
  )

(define (_mm256_packs_epi32  a b %vectsize0 %elemsize0 %elemsize1 %arg0 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([iterator.lane (reverse (range 0 %vectsize0 128))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range 0 64 %elemsize0))])
                              (define %low.cofactor0 (*  iterator.0  2))
                              (define %low.scaled.it0 (+  iterator.lane  %low.cofactor0))
                              (define %lastidx1 (-  %arg0  1))
                              (define %high.offset0 (+  %low.scaled.it0  %lastidx1))
                              (define %0 (extract  %high.offset0 %low.scaled.it0 a))
                              (define %1 (bvssat %0 %arg0 %elemsize0 ))
                              %1
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range 64 128 %elemsize1))])
                              (define %low.cofactor1 (*  iterator.1  2))
                              (define %low.scaled.it2 (+  iterator.lane  %low.cofactor1))
                              (define %low.offset0.new0 (-  %low.scaled.it2  128))
                              (define %lastidx3 (-  %arg2  1))
                              (define %high.offset2 (+  %low.offset0.new0  %lastidx3))
                              (define %8 (extract  %high.offset2 %low.offset0.new0 b))
                              (define %9 (bvssat %8 %arg2 %elemsize1 ))
                              %9
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm_cmpgt_epu8_mask  a.norm b.norm %innerlanesize0.norm %arg2.norm %arg3.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range 0 %innerlanesize0.norm 1))])
                            (define %0.norm (*  j0.norm  %arg2.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %1.norm (+  %0.norm  %lastidx1.norm))
                            (define %2.norm (extract  %1.norm %0.norm a.norm))
                            (define %4.norm (extract  %1.norm %0.norm b.norm))
                            (define %5.norm (bvugt  %2.norm  %4.norm))
                            (define %6.norm (if (equal? %5.norm #t) (bv 1 1) (bv 0 1)))
                            %6.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg3.norm)
  )

(define (_mm256_cmpge_epi64_mask  b.norm a.norm %innerlanesize0.norm %arg2.norm %arg3.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range 0 %innerlanesize0.norm 1))])
                            (define %0.norm (*  j0.norm  %arg2.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %1.norm (+  %0.norm  %lastidx1.norm))
                            (define %2.norm (extract  %1.norm %0.norm a.norm))
                            (define %4.norm (extract  %1.norm %0.norm b.norm))
                            (define %5.norm (bvsge  %2.norm  %4.norm))
                            (define %6.norm (if (equal? %5.norm #t) (bv 1 1) (bv 0 1)))
                            %6.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg3.norm)
  )

(define (_mm_maskz_srl_epi64  k.norm count.norm %arg8.norm %arg6.norm a.norm %innerlanesize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm 64))])
                            (define j0.new.div.norm (/  j0.new.norm  64))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %2.norm (extract  63 0 count.norm))
                                 (define %3.norm (bvugt  %2.norm  (bv 63 64)))
                                 (cond
                                   [(equal? %3.norm #t)
                                    (begin
                                      (define %5.norm (+  j0.new.norm  63))
                                      (define %13.norm (extract  %5.norm j0.new.norm %arg6.norm))
                                      %13.norm
                                      )]
                                   [else (begin
                                           (define %6.norm (+  j0.new.norm  63))
                                           (define %7.norm (extract  %6.norm j0.new.norm a.norm))
                                           (define %8.norm (extract  63 0 count.norm))
                                           (define %9.norm (bvlshr  %7.norm  %8.norm))
                                           %9.norm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %12.norm (+  j0.new.norm  63))
                                      (define %14.norm (extract  %12.norm j0.new.norm %arg8.norm))
                                      %14.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm256_maskz_dpwssds_epi32  k.norm %arg2.norm src.norm a.norm b.norm %vectsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([j0.new.norm (reverse (range 0 %vectsize0.norm 32))])
                (define j0.new.div.norm (/  j0.new.norm  32))
                (define %0.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                (define %cond0.norm (bveq  %0.norm  (bv 1 1)))
                (cond
                  [(equal? %cond0.norm #t)
                   (begin
                     (define %26.clone.0.norm (+  j0.new.norm  31))
                     (define %27.clone.0.norm (extract  %26.clone.0.norm j0.new.norm src.norm))
                     (define dst.norm %27.clone.0.norm)
                     (define %11.ext0.norm.red
                       (apply
                         bvadd
                         (for/list ([iterator.0.new.norm (reverse (range 0 32 16))])
                                   (define %2.new0.norm (+  j0.new.norm  iterator.0.new.norm))
                                   (define %3.norm (+  %2.new0.norm  15))
                                   (define %4.norm (extract  %3.norm %2.new0.norm a.norm))
                                   (define %5.norm (sign-extend  %4.norm (bitvector 32)))
                                   (define %9.norm (extract  %3.norm %2.new0.norm b.norm))
                                   (define %10.norm (sign-extend  %9.norm (bitvector 32)))
                                   (define %11.norm (bvmul  %5.norm  %10.norm))
                                   %11.norm
                                   )
                         ))
                     (define %32.clone.2.norm (+  j0.new.norm  31))
                     (define %11.acc0.norm (bvaddnsw %11.ext0.norm.red dst.norm 32))
                     %11.acc0.norm
                     )]
                  [else (begin
                          (apply
                            concat
                            (for/list ([%outer.it.norm (reverse (range 0 32 32))])
                                      (define %34.norm (+  j0.new.norm  31))
                                      (define %35.norm (extract  %34.norm j0.new.norm %arg2.norm))
                                      %35.norm
                                      )
                            )
                          )]
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_m_punpckhdq  a b %innerlanesize0 %elemsize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %2 (+  %inner.it  %arg0))
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %3 (+  %2  %lastidx0))
                            (define %0 (extract  %3 %2 a))
                            (define %1 (extract  %3 %2 b))
                            (concat %1 %0)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm256_dpbusd_epi32  src a b %vectsize0 )
  (define dst
    (apply
      concat
      (for/list ([j0.new (reverse (range 0 %vectsize0 32))])
                (define %55.clone.0 (+  j0.new  31))
                (define %56.clone.0 (extract  %55.clone.0 j0.new src))
                (define dst %56.clone.0)
                (define %11.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new (reverse (range 0 32 8))])
                              (define %1.new0 (+  j0.new  iterator.0.new))
                              (define %2 (+  %1.new0  7))
                              (define %3 (extract  %2 %1.new0 a))
                              (define %4 (zero-extend  %3 (bitvector 16)))
                              (define %8 (extract  %2 %1.new0 b))
                              (define %9 (sign-extend  %8 (bitvector 16)))
                              (define %10 (bvmul  %4  %9))
                              (define %11 (sign-extend  %10 (bitvector 32)))
                              %11
                              )
                    ))
                (define %62.clone.4 (+  j0.new  31))
                (define %11.acc0 (bvadd %11.ext0.red dst))
                %11.acc0
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm512_mask_cmpneq_epu16_mask  k1.perm %arg3.perm b.perm a.perm %arg2.perm %arg5.perm %innerlanesize0.perm %arg4.perm %arg6.perm )
  (define k.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.perm (reverse (range 0 %innerlanesize0.perm 1))])
                            (define %1.perm (extract  j0.perm j0.perm k1.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %0.copy.0.perm (*  j0.perm  %arg4.perm))
                                 (define %lastidx2.perm (-  %arg4.perm  1))
                                 (define %2.perm (+  %0.copy.0.perm  %lastidx2.perm))
                                 (define %3.perm (extract  %2.perm %0.copy.0.perm a.perm))
                                 (define %5.perm (extract  %2.perm %0.copy.0.perm b.perm))
                                 (define %6.perm (not (bveq  %3.perm  %5.perm )))
                                 (define %7.perm (if (equal? %6.perm #t) %arg2.perm %arg3.perm))
                                 %7.perm
                                 )]
                              [else (begin
                                      (define %8.perm (extract  j0.perm j0.perm %arg5.perm))
                                      %8.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.perm %arg6.perm)
  )

(define (_mm_mask_packs_epi16  k.perm src.perm a.perm b.perm %elemsize0.perm %elemsize1.perm %elemsize2.perm %arg0.perm %arg1.perm )
  (define tmp_dst0.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 128 128))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0.new.perm (reverse (range 0 128 %elemsize0.perm))])
                              (define %lastidx1.perm (-  %elemsize0.perm  1))
                              (define %high.offset0.perm (+  iterator.0.new.perm  %lastidx1.perm))
                              (define %0.perm (extract  %high.offset0.perm iterator.0.new.perm a.perm))
                              (define %1.perm (bvssat %0.perm %elemsize0.perm %arg0.perm ))
                              %1.perm
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1.new.perm (reverse (range 128 256 %elemsize1.perm))])
                              (define %low.offset0.new0.perm (-  iterator.1.new.perm  128))
                              (define %lastidx3.perm (-  %elemsize1.perm  1))
                              (define %high.offset2.perm (+  %low.offset0.new0.perm  %lastidx3.perm))
                              (define %16.perm (extract  %high.offset2.perm %low.offset0.new0.perm b.perm))
                              (define %17.perm (bvssat %16.perm %elemsize1.perm %arg1.perm ))
                              %17.perm
                              )
                    )
                  )
                )
      )
    )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 128 %elemsize2.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize2.perm))
                            (define %33.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %33.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx5.perm (-  %elemsize2.perm  1))
                                 (define %35.perm (+  j0.new.perm  %lastidx5.perm))
                                 (define %36.perm (extract  %35.perm j0.new.perm tmp_dst0.perm))
                                 %36.perm
                                 )]
                              [else (begin
                                      (define %lastidx6.perm (-  %elemsize2.perm  1))
                                      (define %39.perm (+  j0.new.perm  %lastidx6.perm))
                                      (define %40.perm (extract  %39.perm j0.new.perm src.perm))
                                      %40.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm 0)
  )

(define (_mm_mask_rol_epi64  k.perm src.perm %arg4.perm %arg3.perm a.perm imm8.perm %innerlanesize0.perm %arg2.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 8 8))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm 8))])
                            (define j0.new.div.perm (/  j0.new.perm  8))
                            (define %1.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %factor0.perm (/  %arg2.perm  8))
                                 (define %0.copy.0.new0.perm (*  j0.new.perm  %factor0.perm))
                                 (define %lastidx1.perm (-  %arg2.perm  1))
                                 (define %2.perm (+  %0.copy.0.new0.perm  %lastidx1.perm))
                                 (define %3.perm (extract  %2.perm %0.copy.0.new0.perm a.perm))
                                 (define %4.perm (extract  7 0 imm8.perm))
                                 (define %0.site0.perm (bvsmod  %4.perm  %arg4.perm))
                                 (define %1.site0.perm (zero-extend  %0.site0.perm (bitvector %arg2.perm)))
                                 (define %2.site0.perm (bvshl  %3.perm  %1.site0.perm))
                                 (define %3.site0.perm (bvsub  %arg3.perm  %0.site0.perm))
                                 (define %4.site0.perm (zero-extend  %3.site0.perm (bitvector %arg2.perm)))
                                 (define %5.site0.perm (bvashr  %3.perm  %4.site0.perm))
                                 (define %6.site0.perm (bvor  %2.site0.perm  %5.site0.perm))
                                 %6.site0.perm
                                 )]
                              [else (begin
                                      (define %factor2.perm (/  %arg2.perm  8))
                                      (define %0.copy.3.new0.perm (*  j0.new.perm  %factor2.perm))
                                      (define %lastidx3.perm (-  %arg2.perm  1))
                                      (define %8.perm (+  %0.copy.3.new0.perm  %lastidx3.perm))
                                      (define %9.perm (extract  %8.perm %0.copy.3.new0.perm src.perm))
                                      %9.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm 0)
  )

(define (_mm256_cvtepu16_epi32  a %innerlanesize0 %elemsize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %2 (+  j0.new  %lastidx1))
                            (define %3 (extract  %2 j0.new a))
                            (define %4 (zero-extend  %3 (bitvector %arg0)))
                            %4
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm_mask_unpacklo_epi16  k.perm src.perm a.perm b.perm %elemsize0.perm %elemsize1.perm %arg0.perm %arg1.perm %arg2.perm )
  (define tmp_dst0.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([iterator.0.site0.new.perm (reverse (range 0 64 %elemsize0.perm))])
                            (define %factor0.perm (/  %arg2.perm  %elemsize0.perm))
                            (define %factor1.perm (*  2  %factor0.perm))
                            (define iterator.0.site0.new.mul.perm (*  iterator.0.site0.new.perm  %factor1.perm))
                            (define %lastidx1.perm (-  %arg0.perm  1))
                            (define %0.site0.new.high.idx0.perm (+  iterator.0.site0.new.perm  %lastidx1.perm))
                            (define %0.copy.copy.00.new.perm (extract  %0.site0.new.high.idx0.perm iterator.0.site0.new.perm a.perm))
                            (define %1.copy.copy.00.new.perm (extract  %0.site0.new.high.idx0.perm iterator.0.site0.new.perm b.perm))
                            (concat %1.copy.copy.00.new.perm %0.copy.copy.00.new.perm)
                            )
                  )
                )
      )
    )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 128 %elemsize1.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize1.perm))
                            (define %4.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %4.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx4.perm (-  %elemsize1.perm  1))
                                 (define %6.perm (+  j0.new.perm  %lastidx4.perm))
                                 (define %7.perm (extract  %6.perm j0.new.perm tmp_dst0.perm))
                                 %7.perm
                                 )]
                              [else (begin
                                      (define %lastidx5.perm (-  %elemsize1.perm  1))
                                      (define %10.perm (+  j0.new.perm  %lastidx5.perm))
                                      (define %11.perm (extract  %10.perm j0.new.perm src.perm))
                                      %11.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm 0)
  )

(define (_mm_movemask_pi8  a %innerlanesize0 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 32 32))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range 0 %innerlanesize0 1))])
                            (define %0 (*  j0  8))
                            (define %1 (+  %0  7))
                            (define %2 (extract  %1 %1 a))
                            %2
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm512_maskz_unpacklo_epi64  k.norm %arg6.norm a.norm b.norm %innerlanesize0.norm %innerlanesize1.norm )
  (define tmp_dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([iterator.0.new.norm (reverse (range 0 %innerlanesize0.norm 64))])
                            (define iterator.0.new.mul.norm (*  iterator.0.new.norm  2))
                            (define %0.site0.new.high.idx0.norm (+  iterator.0.new.mul.norm  63))
                            (define %0.copy.copy.00.new.norm (extract  %0.site0.new.high.idx0.norm iterator.0.new.mul.norm a.norm))
                            (define %1.copy.copy.00.new.norm (extract  %0.site0.new.high.idx0.norm iterator.0.new.mul.norm b.norm))
                            (concat %1.copy.copy.00.new.norm %0.copy.copy.00.new.norm)
                            )
                  )
                )
      )
    )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize1.norm 64))])
                            (define j0.new.div.norm (/  j0.new.norm  64))
                            (define %13.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %13.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %15.norm (+  j0.new.norm  63))
                                 (define %16.norm (extract  %15.norm j0.new.norm tmp_dst.norm))
                                 %16.norm
                                 )]
                              [else (begin
                                      (define %19.norm (+  j0.new.norm  63))
                                      (define %20.norm (extract  %19.norm j0.new.norm %arg6.norm))
                                      %20.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm_maskz_srai_epi64  imm8.perm %arg2.perm k.perm a.perm %arg7.perm %arg6.perm %arg12.perm %innerlanesize0.perm %elemsize0.perm %arg5.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %1.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %2.perm (extract  7 0 imm8.perm))
                                 (define %3.perm (bvugt  %2.perm  %arg2.perm))
                                 (cond
                                   [(equal? %3.perm #t)
                                    (begin
                                      (define %lastidx2.perm (-  %arg5.perm  1))
                                      (define %5.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %6.perm (extract  %5.perm %5.perm a.perm))
                                      (define %cond1.perm (bveq  %6.perm  (bv 1 1)))
                                      (define %7.perm (if (equal? %cond1.perm #t) %arg6.perm %arg7.perm))
                                      %7.perm
                                      )]
                                   [else (begin
                                           (define %lastidx4.perm (-  %arg5.perm  1))
                                           (define %9.perm (+  j0.new.perm  %lastidx4.perm))
                                           (define %10.perm (extract  %9.perm j0.new.perm a.perm))
                                           (define %11.perm (extract  7 0 imm8.perm))
                                           (define %12.perm (zero-extend  %11.perm (bitvector %arg5.perm)))
                                           (define %13.perm (bvashr  %10.perm  %12.perm))
                                           %13.perm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx6.perm (-  %elemsize0.perm  1))
                                      (define %16.perm (+  j0.new.perm  %lastidx6.perm))
                                      (define %17.perm (extract  %16.perm j0.new.perm %arg12.perm))
                                      %17.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm 0)
  )

(define (_mm512_mask_rolv_epi64  k.norm %arg3.norm %arg2.norm src.norm a.norm b.norm %innerlanesize0.norm %elemsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize0.norm))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %2.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                                 (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                                 (define %0.site0.norm (bvsmod  %5.norm  %arg3.norm))
                                 (define %1.site0.norm (bvshl  %3.norm  %0.site0.norm))
                                 (define %2.site0.norm (bvsub  %arg2.norm  %0.site0.norm))
                                 (define %3.site0.norm (bvashr  %3.norm  %2.site0.norm))
                                 (define %4.site0.norm (bvor  %1.site0.norm  %3.site0.norm))
                                 %4.site0.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %9.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %10.norm (extract  %9.norm j0.new.norm src.norm))
                                      %10.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm_hadd_pi32  a b )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 32 32))])
                            (define %6 (+  %inner.it  32))
                            (define %7 (+  %6  31))
                            (define %0 (extract  %7 %6 a))
                            (define %9 (+  %inner.it  31))
                            (define %1 (extract  %9 %inner.it a))
                            (define %2 (bvadd  %0  %1))
                            (define %3 (extract  %7 %6 b))
                            (define %4 (extract  %9 %inner.it b))
                            (define %5 (bvadd  %3  %4))
                            (concat %5 %2)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm256_add_epi8  a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
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
  (bvpadhighbits  dst 0)
  )

(define (_mm256_maskz_rorv_epi64  k.norm %arg4.norm %arg3.norm %arg2.norm a.norm b.norm %innerlanesize0.norm %elemsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize0.norm))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %2.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                                 (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                                 (define %0.site0.norm (bvsmod  %5.norm  %arg3.norm))
                                 (define %1.site0.norm (bvashr  %3.norm  %0.site0.norm))
                                 (define %2.site0.norm (bvsub  %arg2.norm  %0.site0.norm))
                                 (define %3.site0.norm (bvshl  %3.norm  %2.site0.norm))
                                 (define %4.site0.norm (bvor  %1.site0.norm  %3.site0.norm))
                                 %4.site0.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %9.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %10.norm (extract  %9.norm j0.new.norm %arg4.norm))
                                      %10.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm512_maskz_unpackhi_epi64  k.perm %arg8.perm a.perm b.perm %innerlanesize0.perm %innerlanesize1.perm )
  (define tmp_dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([iterator.0.new.perm (reverse (range 0 %innerlanesize0.perm 64))])
                            (define iterator.0.new.mul.perm (*  iterator.0.new.perm  2))
                            (define %0.site0.new.low.idx.perm (+  iterator.0.new.mul.perm  64))
                            (define %0.site0.new.high.idx0.perm (+  %0.site0.new.low.idx.perm  63))
                            (define %0.copy.copy.00.new.perm (extract  %0.site0.new.high.idx0.perm %0.site0.new.low.idx.perm a.perm))
                            (define %1.copy.copy.00.new.perm (extract  %0.site0.new.high.idx0.perm %0.site0.new.low.idx.perm b.perm))
                            (concat %1.copy.copy.00.new.perm %0.copy.copy.00.new.perm)
                            )
                  )
                )
      )
    )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize1.perm 64))])
                            (define j0.new.div.perm (/  j0.new.perm  64))
                            (define %13.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %13.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %15.perm (+  j0.new.perm  63))
                                 (define %16.perm (extract  %15.perm j0.new.perm tmp_dst.perm))
                                 %16.perm
                                 )]
                              [else (begin
                                      (define %19.perm (+  j0.new.perm  63))
                                      (define %20.perm (extract  %19.perm j0.new.perm %arg8.perm))
                                      %20.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm 0)
  )

(define (_mm256_extract_epi8  %arg2 a index %innerlanesize0 %elemsize0 %arg1 %arg3 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx2 (-  %arg1  1))
                            (define %7 (+  %inner.it  %lastidx2))
                            (define %0 (extract  %7 %inner.it a))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %9 (+  %inner.it  %lastidx1))
                            (define %1 (extract  %9 %inner.it index))
                            (define %2 (bvmul  %1  %arg2))
                            (define %3 (zero-extend  %2 (bitvector %arg1)))
                            (define %4 (bvashr  %0  %3))
                            (define %11 (+  %inner.it  7))
                            (define %5 (extract  %11 %inner.it %4))
                            %5
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm256_maskz_max_epu8  k.norm %arg2.norm a.norm b.norm %innerlanesize0.norm %elemsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize0.norm))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %2.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                                 (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                                 (define %6.norm (bvumax  %3.norm  %5.norm))
                                 %6.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %9.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %10.norm (extract  %9.norm j0.new.norm %arg2.norm))
                                      %10.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm_sra_pi16  %arg0.norm count.norm %arg4.norm a.norm %arg3.norm %innerlanesize0.norm %elemsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define %1.norm (extract  63 0 count.norm))
                            (define %2.norm (bvugt  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %2.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %4.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %5.norm (extract  %4.norm %4.norm a.norm))
                                 (define %cond0.norm (bveq  %5.norm  (bv 1 1)))
                                 (define %6.norm (if (equal? %cond0.norm #t) %arg3.norm %arg4.norm))
                                 %6.norm
                                 )]
                              [else (begin
                                      (define %lastidx3.norm (-  %elemsize0.norm  1))
                                      (define %8.norm (+  j0.new.norm  %lastidx3.norm))
                                      (define %9.norm (extract  %8.norm j0.new.norm a.norm))
                                      (define %10.norm (extract  63 0 count.norm))
                                      (define %11.norm (zero-extend  %9.norm (bitvector 64)))
                                      (define %12.norm (bvashr  %11.norm  %10.norm))
                                      (define %14.norm.high.idx 63 )
                                      (define %14.norm.low.idx (+ (- %14.norm.high.idx %elemsize0.norm) 1) )
                                      (define %14.norm (extract  %14.norm.high.idx %14.norm.low.idx %12.norm))
                                      %14.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm256_mask_cvtsepi32_epi16  k.perm src.perm a.perm %innerlanesize0.perm %elemsize0.perm %arg2.perm %arg3.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range 0 %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %elemsize0.perm))
                            (define %2.perm (extract  j0.new.div.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %2.perm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %factor0.perm (/  %arg2.perm  %elemsize0.perm))
                                 (define %0.copy.0.new0.perm (*  j0.new.perm  %factor0.perm))
                                 (define %lastidx2.perm (-  %arg2.perm  1))
                                 (define %3.perm (+  %0.copy.0.new0.perm  %lastidx2.perm))
                                 (define %4.perm (extract  %3.perm %0.copy.0.new0.perm a.perm))
                                 (define %5.perm (bvssat %4.perm %arg2.perm %elemsize0.perm ))
                                 %5.perm
                                 )]
                              [else (begin
                                      (define %lastidx3.perm (-  %elemsize0.perm  1))
                                      (define %8.perm (+  j0.new.perm  %lastidx3.perm))
                                      (define %9.perm (extract  %8.perm j0.new.perm src.perm))
                                      %9.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm %arg3.perm)
  )

(define (_mm_rolv_epi32  %arg1 %arg0 a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %4 (extract  %1 j0.new b))
                            (define %0.site0 (bvsmod  %4  %arg1))
                            (define %1.site0 (bvshl  %2  %0.site0))
                            (define %2.site0 (bvsub  %arg0  %0.site0))
                            (define %3.site0 (bvashr  %2  %2.site0))
                            (define %4.site0 (bvor  %1.site0  %3.site0))
                            %4.site0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm256_mask_dpbusds_epi32  k.norm src.norm a.norm b.norm %vectsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([j0.new.norm (reverse (range 0 %vectsize0.norm 32))])
                (define j0.new.div.norm (/  j0.new.norm  32))
                (define %0.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                (define %cond0.norm (bveq  %0.norm  (bv 1 1)))
                (cond
                  [(equal? %cond0.norm #t)
                   (begin
                     (define %56.clone.0.norm (+  j0.new.norm  31))
                     (define %57.clone.0.norm (extract  %56.clone.0.norm j0.new.norm src.norm))
                     (define dst.norm %57.clone.0.norm)
                     (define %12.ext0.norm.red
                       (apply
                         bvadd
                         (for/list ([iterator.0.new.norm (reverse (range 0 32 8))])
                                   (define %2.new0.norm (+  j0.new.norm  iterator.0.new.norm))
                                   (define %3.norm (+  %2.new0.norm  7))
                                   (define %4.norm (extract  %3.norm %2.new0.norm a.norm))
                                   (define %5.norm (zero-extend  %4.norm (bitvector 16)))
                                   (define %9.norm (extract  %3.norm %2.new0.norm b.norm))
                                   (define %10.norm (sign-extend  %9.norm (bitvector 16)))
                                   (define %11.norm (bvmul  %5.norm  %10.norm))
                                   (define %12.norm (sign-extend  %11.norm (bitvector 32)))
                                   %12.norm
                                   )
                         ))
                     (define %64.clone.4.norm (+  j0.new.norm  31))
                     (define %12.acc0.norm (bvaddnsw %12.ext0.norm.red dst.norm 32))
                     %12.acc0.norm
                     )]
                  [else (begin
                          (apply
                            concat
                            (for/list ([%outer.it.norm (reverse (range 0 32 32))])
                                      (define %66.norm (+  j0.new.norm  31))
                                      (define %67.norm (extract  %66.norm j0.new.norm src.norm))
                                      %67.norm
                                      )
                            )
                          )]
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm256_rol_epi64  %arg2 %arg1 a imm8 %innerlanesize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 8 8))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 8))])
                            (define %factor0 (/  %arg0  8))
                            (define %0.new0 (*  j0.new  %factor0))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  %0.new0  %lastidx0))
                            (define %2 (extract  %1 %0.new0 a))
                            (define %3 (extract  7 0 imm8))
                            (define %0.site0 (bvsmod  %3  %arg2))
                            (define %1.site0 (zero-extend  %0.site0 (bitvector %arg0)))
                            (define %2.site0 (bvshl  %2  %1.site0))
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
  (bvpadhighbits  dst 0)
  )

(define (_mm512_maskz_and_epi64  k.norm %arg2.norm a.norm b.norm %innerlanesize0.norm %elemsize0.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize0.norm))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %5.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %6.norm (extract  %5.norm j0.new.norm a.norm))
                                 (define %8.norm (extract  %5.norm j0.new.norm b.norm))
                                 (define %9.norm (bvand  %6.norm  %8.norm))
                                 %9.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %12.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %13.norm (extract  %12.norm j0.new.norm %arg2.norm))
                                      %13.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm_cmplt_epi16_mask  a.norm b.norm %innerlanesize0.norm %arg2.norm %arg3.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range 0 %innerlanesize0.norm 1))])
                            (define %0.norm (*  j0.norm  %arg2.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %1.norm (+  %0.norm  %lastidx1.norm))
                            (define %2.norm (extract  %1.norm %0.norm a.norm))
                            (define %4.norm (extract  %1.norm %0.norm b.norm))
                            (define %5.norm (bvslt  %2.norm  %4.norm))
                            (define %6.norm (if (equal? %5.norm #t) (bv 1 1) (bv 0 1)))
                            %6.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg3.norm)
  )

(define (_mm256_blend_epi16  imm8.norm a.norm b.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 256 16))])
                            (define j0.new.div.norm (/  j0.new.norm  16))
                            (define %1.norm (modulo  j0.new.div.norm  8))
                            (define %2.norm (extract  %1.norm %1.norm imm8.norm))
                            (define %cond0.norm (bveq  %2.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %4.norm (+  j0.new.norm  15))
                                 (define %5.norm (extract  %4.norm j0.new.norm b.norm))
                                 %5.norm
                                 )]
                              [else (begin
                                      (define %8.norm (+  j0.new.norm  15))
                                      (define %9.norm (extract  %8.norm j0.new.norm a.norm))
                                      %9.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm256_hsubs_epi16  a b )
  (define dst
    (apply
      concat
      (for/list ([iterator.lane (reverse (range 0 256 128))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range 0 64 16))])
                              (define %low.cofactor0 (*  iterator.0  2))
                              (define %low.scaled.it0 (+  iterator.lane  %low.cofactor0))
                              (define %high.offset0 (+  %low.scaled.it0  15))
                              (define %0 (extract  %high.offset0 %low.scaled.it0 a))
                              (define %low.offset0 (+  %low.scaled.it0  16))
                              (define %high.offset1 (+  %low.offset0  15))
                              (define %1 (extract  %high.offset1 %low.offset0 a))
                              (define %2 (bvsubnsw  %0  %1 16))
                              %2
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range 64 128 16))])
                              (define %low.cofactor2 (*  iterator.1  2))
                              (define %low.scaled.it3 (+  iterator.lane  %low.cofactor2))
                              (define %low.offset1.new0 (-  %low.scaled.it3  128))
                              (define %high.offset3 (+  %low.offset1.new0  15))
                              (define %16 (extract  %high.offset3 %low.offset1.new0 b))
                              (define %low.offset2.new0 (-  %low.scaled.it3  112))
                              (define %high.offset4 (+  %low.offset2.new0  15))
                              (define %17 (extract  %high.offset4 %low.offset2.new0 b))
                              (define %18 (bvsubnsw  %16  %17 16))
                              %18
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm256_extracti32x4_epi32  imm8.norm a.norm %elemsize0.norm %arg6.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([%inner.it.norm (reverse (range 0 1 1))])
                            (define %0.norm (extract  0 0 imm8.norm))
                            (define %cond0.norm (bveq  %0.norm  (bv 0 1)))
                            (define %cond1.norm (bveq  %0.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx2.norm (-  %elemsize0.norm  1))
                                 (define %1.norm (extract  %lastidx2.norm 0 a.norm))
                                 %1.norm
                                 )]
                              [(equal? %cond1.norm #t)
                               (begin
                                 (define %lastidx4.norm (-  %elemsize0.norm  1))
                                 (define %highidx4.norm (+  %lastidx4.norm  %arg6.norm))
                                 (define %2.norm (extract  %highidx4.norm %arg6.norm a.norm))
                                 %2.norm
                                 )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

(define (_mm_subs_epu8  a b %innerlanesize0 %elemsize0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %4 (extract  %1 j0.new b))
                            (define %5 (bvsubnuw  %2  %4 %elemsize0))
                            %5
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst 0)
  )

(define (_mm512_mask_srli_epi64  %arg2.norm imm8.norm k.norm %arg6.norm src.norm a.norm %innerlanesize0.norm %elemsize0.norm %arg5.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range 0 %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %elemsize0.norm))
                            (define %1.norm (extract  j0.new.div.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  (bv 1 1)))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %2.norm (extract  7 0 imm8.norm))
                                 (define %3.norm (bvugt  %2.norm  %arg2.norm))
                                 (cond
                                   [(equal? %3.norm #t)
                                    (begin
                                      (define %lastidx2.norm (-  %arg5.norm  1))
                                      (define %5.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %16.norm (extract  %5.norm j0.new.norm %arg6.norm))
                                      %16.norm
                                      )]
                                   [else (begin
                                           (define %lastidx3.norm (-  %arg5.norm  1))
                                           (define %6.norm (+  j0.new.norm  %lastidx3.norm))
                                           (define %7.norm (extract  %6.norm j0.new.norm a.norm))
                                           (define %8.norm (extract  7 0 imm8.norm))
                                           (define %9.norm (zero-extend  %8.norm (bitvector %arg5.norm)))
                                           (define %10.norm (bvlshr  %7.norm  %9.norm))
                                           %10.norm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx5.norm (-  %elemsize0.norm  1))
                                      (define %13.norm (+  j0.new.norm  %lastidx5.norm))
                                      (define %14.norm (extract  %13.norm j0.new.norm src.norm))
                                      %14.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm 0)
  )

;; ================================================================================
