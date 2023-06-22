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

(define (_mm512_rem_epu32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %4 (extract  %1 j0.new b))
                            (define %5.ab0 (bvrem %2 %4 %arg0 ))
                            %5.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm512_or_epi32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
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

(define (_mm256_mask_min_epi8  k.norm %arg0.norm src.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %2.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                                 (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                                 (define %6.ab0.norm (bvmin %3.norm %5.norm %arg3.norm ))
                                 %6.ab0.norm
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
  (bvpadhighbits  dst.norm %arg4.norm)
  )

(define (_mm256_xor_epi32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm_add_si64  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %3 (+  %inner.it  %arg1))
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %4 (+  %3  %lastidx0))
                            (define %0 (extract  %4 %3 a))
                            (define %1 (extract  %4 %3 b))
                            (define %2.ab0 (bvaddnw %0 %1 %elemsize0 %arg0 ))
                            %2.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_m_packssdw  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %arg1 %alpha.arg0 %arg2 %arg3 %arg4 %arg5 %arg6 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %low.cofactor1 (*  iterator.1  %arg5))
                              (define %low.offset0.new0 (-  %low.cofactor1  %arg4))
                              (define %lastidx3 (-  %arg3  1))
                              (define %high.offset2 (+  %low.offset0.new0  %lastidx3))
                              (define %4 (extract  %high.offset2 %low.offset0.new0 b))
                              (define %5.ab0 (bvsaturate  %4 %arg3 %elemsize1 %arg2))
                              %5.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg1  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %low.cofactor0 (*  iterator.0  %factor1))
                              (define %lastidx1 (-  %arg1  1))
                              (define %high.offset0 (+  %low.cofactor0  %lastidx1))
                              (define %0 (extract  %high.offset0 %low.cofactor0 a))
                              (define %1.ab0 (bvsaturate  %0 %arg1 %elemsize0 %arg0))
                              %1.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg6)
  )

(define (_mm512_maskz_packus_epi32  k.perm %arg7.perm %arg10.perm a.perm b.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %innerlaneoffset1.perm %innerlanesize1.perm %elemsize1.perm %vectsize1.perm %outerlanesize1.perm %innerlaneoffset2.perm %innerlanesize2.perm %elemsize2.perm %arg0.perm %arg1.perm %arg2.perm %arg3.perm %arg4.perm %arg5.perm %arg6.perm %arg8.perm %arg9.perm %arg11.perm )
  (define tmp_dst.perm
    (apply
      concat
      (for/list ([iterator.lane.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.1.new.perm (reverse (range %innerlaneoffset1.perm %innerlanesize1.perm %elemsize1.perm))])
                              (define %low.scaled.it2.perm (+  iterator.lane.perm  iterator.1.new.perm))
                              (define %low.offset0.new0.perm (-  %low.scaled.it2.perm  %arg5.perm))
                              (define %lastidx3.perm (-  %elemsize1.perm  1))
                              (define %high.offset2.perm (+  %low.offset0.new0.perm  %lastidx3.perm))
                              (define %8.perm (extract  %high.offset2.perm %low.offset0.new0.perm b.perm))
                              (define %9.ab0.perm (bvsaturate  %8.perm %elemsize1.perm %arg3.perm %arg4.perm))
                              %9.ab0.perm
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.0.new.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                              (define %low.scaled.it0.perm (+  iterator.lane.perm  iterator.0.new.perm))
                              (define %lastidx1.perm (-  %elemsize0.perm  1))
                              (define %high.offset0.perm (+  %low.scaled.it0.perm  %lastidx1.perm))
                              (define %0.perm (extract  %high.offset0.perm %low.scaled.it0.perm a.perm))
                              (define %1.ab0.perm (bvsaturate  %0.perm %elemsize0.perm %arg0.perm %arg1.perm))
                              %1.ab0.perm
                              )
                    )
                  )
                )
      )
    )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize1.perm %outerlanesize1.perm))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range %innerlaneoffset2.perm %innerlanesize2.perm %elemsize2.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %arg9.perm))
                            (define %lastidx4.perm (-  %arg8.perm  1))
                            (define %highidx0.perm (+  j0.new.div.perm  %lastidx4.perm))
                            (define %65.perm (extract  %highidx0.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %65.perm  %arg7.perm))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx5.perm (-  %elemsize2.perm  1))
                                 (define %67.perm (+  j0.new.perm  %lastidx5.perm))
                                 (define %68.perm (extract  %67.perm j0.new.perm tmp_dst.perm))
                                 %68.perm
                                 )]
                              [else (begin
                                      (define %lastidx6.perm (-  %elemsize2.perm  1))
                                      (define %71.perm (+  j0.new.perm  %lastidx6.perm))
                                      (define %72.perm (extract  %71.perm j0.new.perm %arg10.perm))
                                      %72.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm %arg11.perm)
  )

(define (_mm256_xor_si256  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %3 (+  %inner.it  %arg0))
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %4 (+  %3  %lastidx0))
                            (define %0 (extract  %4 %3 a))
                            (define %1 (extract  %4 %3 b))
                            (define %2 (bvxor  %0  %1))
                            %2
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_rolv_epi32  %arg2 %arg0 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg3 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %4 (extract  %1 j0.new b))
                            (define %0.site0 (bvsmod  %4  %arg2))
                            (define %1.site0 (bvshl  %2  %0.site0))
                            (define %2.site0.ab0 (bvsubnw %arg0 %0.site0 %elemsize0 %arg1 ))
                            (define %3.site0 (bvashr  %2  %2.site0.ab0))
                            (define %4.site0 (bvor  %1.site0  %3.site0))
                            %4.site0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm_maskz_srl_epi32  count.norm k.norm %arg0.norm %arg12.norm %arg8.norm %arg3.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg4.norm %arg5.norm %arg6.norm %arg7.norm %arg9.norm %arg10.norm %arg11.norm %arg13.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %arg5.norm  1))
                                 (define %highidx1.norm (+  %lastidx1.norm  %arg6.norm))
                                 (define %2.norm (extract  %highidx1.norm %arg6.norm count.norm))
                                 (define %3.ab0.norm (bvgt %2.norm %arg3.norm %arg4.norm ))
                                 (cond
                                   [(equal? %3.ab0.norm #t)
                                    (begin
                                      (define %lastidx2.norm (-  %arg7.norm  1))
                                      (define %5.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %15.norm (extract  %5.norm j0.new.norm %arg8.norm))
                                      %15.norm
                                      )]
                                   [else (begin
                                           (define %lastidx3.norm (-  %arg7.norm  1))
                                           (define %6.norm (+  j0.new.norm  %lastidx3.norm))
                                           (define %7.norm (extract  %6.norm j0.new.norm a.norm))
                                           (define %lastidx4.norm (-  %arg10.norm  1))
                                           (define %highidx2.norm (+  %lastidx4.norm  %arg11.norm))
                                           (define %8.norm (extract  %highidx2.norm %arg11.norm count.norm))
                                           (define %9.ab0.norm (bvsizeext  %7.norm %arg10.norm %arg9.norm))
                                           (define %10.norm (bvlshr  %9.ab0.norm  %8.norm))
                                           (define %12.norm.high.idx (- %arg10.norm 1))
                                           (define %12.norm.low.idx (+ (- %12.norm.high.idx %arg7.norm) 1) )
                                           (define %12.norm (extract  %12.norm.high.idx %12.norm.low.idx %10.norm))
                                           %12.norm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx5.norm (-  %arg7.norm  1))
                                      (define %14.norm (+  j0.new.norm  %lastidx5.norm))
                                      (define %16.norm (extract  %14.norm j0.new.norm %arg12.norm))
                                      %16.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg13.norm)
  )

(define (_mm512_maskz_avg_epu16  k.perm %arg0.perm %arg4.perm %arg3.perm %arg7.perm a.perm b.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %arg1.perm %arg2.perm %arg5.perm %arg6.perm %arg8.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %arg2.perm))
                            (define %lastidx0.perm (-  %arg1.perm  1))
                            (define %highidx0.perm (+  j0.new.div.perm  %lastidx0.perm))
                            (define %1.perm (extract  %highidx0.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  %arg0.perm))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %elemsize0.perm  1))
                                 (define %3.perm (+  j0.new.perm  %lastidx1.perm))
                                 (define %4.perm (extract  %3.perm j0.new.perm a.perm))
                                 (define %6.perm (extract  %3.perm j0.new.perm b.perm))
                                 (define %7.ab0.perm (bvaddnw %4.perm %6.perm %elemsize0.perm %arg6.perm ))
                                 (define %8.ab0.perm (bvaddnw %7.ab0.perm %arg4.perm %elemsize0.perm %arg5.perm ))
                                 (define %9.perm (bvashr  %8.ab0.perm  %arg3.perm))
                                 %9.perm
                                 )]
                              [else (begin
                                      (define %lastidx2.perm (-  %elemsize0.perm  1))
                                      (define %12.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %13.perm (extract  %12.perm j0.new.perm %arg7.perm))
                                      %13.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm %arg8.perm)
  )

(define (_mm512_mask_rolv_epi32  k.norm %arg0.norm %arg5.norm %arg3.norm src.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg4.norm %arg6.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %2.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                                 (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                                 (define %0.site0.norm (bvsmod  %5.norm  %arg5.norm))
                                 (define %1.site0.norm (bvshl  %3.norm  %0.site0.norm))
                                 (define %2.site0.ab0.norm (bvsubnw %arg3.norm %0.site0.norm %elemsize0.norm %arg4.norm ))
                                 (define %3.site0.norm (bvashr  %3.norm  %2.site0.ab0.norm))
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
  (bvpadhighbits  dst.norm %arg6.norm)
  )

(define (_mm_hadd_pi16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %low.cofactor2 (*  iterator.1  %arg5))
                              (define %low.offset1.new0 (-  %low.cofactor2  %arg4))
                              (define %lastidx5 (-  %elemsize1  1))
                              (define %high.offset3 (+  %low.offset1.new0  %lastidx5))
                              (define %6 (extract  %high.offset3 %low.offset1.new0 b))
                              (define %low.offset2.new0 (-  %low.cofactor2  %arg3))
                              (define %lastidx4 (-  %elemsize1  1))
                              (define %high.offset4 (+  %low.offset2.new0  %lastidx4))
                              (define %7 (extract  %high.offset4 %low.offset2.new0 b))
                              (define %8.ab0 (bvaddnw %6 %7 %elemsize1 %arg2 ))
                              %8.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %elemsize0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %low.cofactor0 (*  iterator.0  %factor1))
                              (define %low.offset0 (+  %low.cofactor0  %arg1))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %high.offset0 (+  %low.offset0  %lastidx2))
                              (define %0 (extract  %high.offset0 %low.offset0 a))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %high.offset1 (+  %low.cofactor0  %lastidx1))
                              (define %1 (extract  %high.offset1 %low.cofactor0 a))
                              (define %2.ab0 (bvaddnw %0 %1 %elemsize0 %arg0 ))
                              %2.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg6)
  )

(define (_mm512_extracti64x4_epi64  %arg1.norm %arg0.norm imm8.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg3.norm %arg4.norm %arg5.norm %arg6.norm %arg7.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([%inner.it.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg2.norm  1))
                            (define %0.norm (extract  %lastidx0.norm 0 imm8.norm))
                            (define %cond0.norm (bveq  %0.norm  %arg1.norm))
                            (define %cond1.norm (bveq  %0.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx2.norm (-  %elemsize0.norm  1))
                                 (define %highidx2.norm (+  %lastidx2.norm  %arg4.norm))
                                 (define %1.norm (extract  %highidx2.norm %arg4.norm a.norm))
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
  (bvpadhighbits  dst.norm %arg7.norm)
  )

(define (_mm512_unpacklo_epi64  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define iterator.0.new.mul (*  iterator.0.new  %arg3))
                            (define %0.site0.new.low.idx (+  iterator.0.new.mul  %arg2))
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
  (bvpadhighbits  dst %arg4)
  )

(define (_mm256_cvtepi64_epi32  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define %0.new0 (*  j0.new  %factor1))
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

(define (_mm256_max_epu64  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %4 (extract  %1 j0.new b))
                            (define %5.ab0 (bvmax %2 %4 %arg0 ))
                            %5.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_broadcastmb_epi64  k %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %highidx0 (+  %lastidx1  %arg2))
                            (define %1 (extract  %highidx0 %arg2 k))
                            (define %2.ab0 (bvsizeext  %1 %arg0 %arg1))
                            %2.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm_unpacklo_pi32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %2 (+  %inner.it  %arg1))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %3 (+  %2  %lastidx1))
                            (define %0 (extract  %3 %2 a))
                            (define %1 (extract  %3 %2 b))
                            (concat %1 %0)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm512_srav_epi16  count.norm %arg5.norm a.norm %arg4.norm %arg6.norm %arg0.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg7.norm %arg8.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg2.norm  1))
                            (define %1.norm (+  j0.new.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm j0.new.norm count.norm))
                            (define %3.ab0.norm (bvlt %2.norm %arg0.norm %arg1.norm ))
                            (cond
                              [(equal? %3.ab0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %arg3.norm  1))
                                 (define %4.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %5.norm (extract  %4.norm j0.new.norm a.norm))
                                 (define %7.norm (extract  %4.norm j0.new.norm count.norm))
                                 (define %8.norm (bvashr  %5.norm  %7.norm))
                                 %8.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %arg3.norm  1))
                                      (define %11.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %lastidx3.norm (-  %arg7.norm  1))
                                      (define %highidx0.norm (+  %11.norm  %lastidx3.norm))
                                      (define %12.norm (extract  %highidx0.norm %11.norm a.norm))
                                      (define %cond0.norm (bveq  %12.norm  %arg6.norm))
                                      (define %13.norm (if (equal? %cond0.norm #t) %arg4.norm %arg5.norm))
                                      %13.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg8.norm)
  )

(define (_mm_unpacklo_pi8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([iterator.0.site0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %elemsize0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
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
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_mask_mul_epu32  %arg0.perm k.perm src.perm a.perm b.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %arg1.perm %arg2.perm %arg3.perm %alpha.arg0.perm %arg4.perm %arg5.perm %alpha.arg1.perm %arg6.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %arg2.perm))
                            (define %lastidx0.perm (-  %arg1.perm  1))
                            (define %highidx0.perm (+  j0.new.div.perm  %lastidx0.perm))
                            (define %1.perm (extract  %highidx0.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  %arg0.perm))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %factor0.perm (/  %arg3.perm  %elemsize0.perm))
                                 (define %factor1.perm (*  %alpha.arg0.perm  %factor0.perm))
                                 (define %0.copy.0.new0.perm (*  j0.new.perm  %factor1.perm))
                                 (define %lastidx2.perm (-  %elemsize0.perm  1))
                                 (define %3.perm (+  %0.copy.0.new0.perm  %lastidx2.perm))
                                 (define %4.perm (extract  %3.perm %0.copy.0.new0.perm a.perm))
                                 (define %6.perm (extract  %3.perm %0.copy.0.new0.perm b.perm))
                                 (define %7.ab0.perm (bvsizeext  %4.perm %arg3.perm %arg5.perm))
                                 (define %8.ab0.perm (bvsizeext  %6.perm %arg3.perm %arg4.perm))
                                 (define %9.perm (bvmul  %7.ab0.perm  %8.ab0.perm))
                                 %9.perm
                                 )]
                              [else (begin
                                      (define %factor2.perm (/  %arg3.perm  %elemsize0.perm))
                                      (define %factor3.perm (*  %alpha.arg1.perm  %factor2.perm))
                                      (define %0.copy.5.new0.perm (*  j0.new.perm  %factor3.perm))
                                      (define %lastidx3.perm (-  %arg3.perm  1))
                                      (define %12.perm (+  %0.copy.5.new0.perm  %lastidx3.perm))
                                      (define %13.perm (extract  %12.perm %0.copy.5.new0.perm src.perm))
                                      %13.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm %arg6.perm)
  )

(define (_mm256_mul_epi32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define %0.new0 (*  j0.new  %factor1))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %2 (+  %0.new0  %lastidx1))
                            (define %3 (extract  %2 %0.new0 a))
                            (define %4.ab0 (bvsizeext  %3 %arg0 %arg2))
                            (define %6 (extract  %2 %0.new0 b))
                            (define %7.ab0 (bvsizeext  %6 %arg0 %arg1))
                            (define %8 (bvmul  %4.ab0  %7.ab0))
                            %8
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm256_mask_testn_epi32_mask  %arg0.norm k1.norm %arg4.norm %arg3.norm %arg2.norm b.norm %arg6.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg5.norm %alpha.arg0.norm %arg7.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.norm k1.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %factor0.norm (/  %arg5.norm  %elemsize0.norm))
                                 (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                                 (define %0.copy.0.norm (*  j0.norm  %factor1.norm))
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
                                      (define %lastidx3.norm (-  %elemsize0.norm  1))
                                      (define %highidx2.norm (+  j0.norm  %lastidx3.norm))
                                      (define %9.norm (extract  %highidx2.norm j0.norm %arg6.norm))
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

(define (_mm_rorv_epi32  %arg2 %arg0 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg3 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %4 (extract  %1 j0.new b))
                            (define %0.site0 (bvsmod  %4  %arg2))
                            (define %1.site0 (bvashr  %2  %0.site0))
                            (define %2.site0.ab0 (bvsubnw %arg0 %0.site0 %elemsize0 %arg1 ))
                            (define %3.site0 (bvshl  %2  %2.site0.ab0))
                            (define %4.site0 (bvor  %1.site0  %3.site0))
                            %4.site0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg3)
  )

(define (_mm512_mulhi_epu16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %2 (+  j0.new  %lastidx0))
                            (define %3 (extract  %2 j0.new a))
                            (define %5 (extract  %2 j0.new b))
                            (define %6.ab0 (bvsizeext  %3 %arg2 %arg3))
                            (define %7.ab0 (bvsizeext  %5 %arg2 %arg1))
                            (define %8 (bvmul  %6.ab0  %7.ab0))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %highidx0 (+  %lastidx1  %arg0))
                            (define %9 (extract  %highidx0 %arg0 %8))
                            %9
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm_mul_su32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %5 (+  %inner.it  %arg3))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %6 (+  %5  %lastidx1))
                            (define %0 (extract  %6 %5 a))
                            (define %1 (extract  %6 %5 b))
                            (define %2.ab0 (bvsizeext  %0 %arg0 %arg2))
                            (define %3.ab0 (bvsizeext  %1 %arg0 %arg1))
                            (define %4 (bvmul  %2.ab0  %3.ab0))
                            %4
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm_broadcast_i32x2  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define j0.new.div (/  j0.new  %arg1))
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
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_mask_ror_epi32  %arg0.norm k.norm %arg8.norm %arg5.norm src.norm a.norm imm8.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %alpha.arg0.norm %arg4.norm %arg6.norm %arg7.norm %arg9.norm %alpha.arg1.norm %arg10.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %factor0.norm (/  %arg3.norm  %elemsize0.norm))
                                 (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                                 (define %0.copy.0.new0.norm (*  j0.new.norm  %factor1.norm))
                                 (define %lastidx1.norm (-  %arg3.norm  1))
                                 (define %2.norm (+  %0.copy.0.new0.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %2.norm %0.copy.0.new0.norm a.norm))
                                 (define %lastidx2.norm (-  %elemsize0.norm  1))
                                 (define %highidx1.norm (+  %lastidx2.norm  %arg9.norm))
                                 (define %4.norm (extract  %highidx1.norm %arg9.norm imm8.norm))
                                 (define %0.site0.norm (bvsmod  %4.norm  %arg8.norm))
                                 (define %1.site0.ab0.norm (bvsizeext  %0.site0.norm %arg3.norm %arg7.norm))
                                 (define %2.site0.norm (bvashr  %3.norm  %1.site0.ab0.norm))
                                 (define %3.site0.ab0.norm (bvsubnw %arg5.norm %0.site0.norm 8 %arg6.norm ))
                                 (define %4.site0.ab0.norm (bvsizeext  %3.site0.ab0.norm %arg3.norm %arg4.norm))
                                 (define %5.site0.norm (bvshl  %3.norm  %4.site0.ab0.norm))
                                 (define %6.site0.norm (bvor  %2.site0.norm  %5.site0.norm))
                                 %6.site0.norm
                                 )]
                              [else (begin
                                      (define %factor2.norm (/  %arg3.norm  %elemsize0.norm))
                                      (define %factor3.norm (*  %alpha.arg1.norm  %factor2.norm))
                                      (define %0.copy.3.new0.norm (*  j0.new.norm  %factor3.norm))
                                      (define %lastidx3.norm (-  %arg3.norm  1))
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
  (bvpadhighbits  dst.norm %arg10.norm)
  )

(define (_mm_mask_rol_epi32  %arg0.perm k.perm src.perm %arg8.perm %arg5.perm a.perm imm8.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %arg1.perm %arg2.perm %arg3.perm %alpha.arg0.perm %arg4.perm %arg6.perm %arg7.perm %arg9.perm %alpha.arg1.perm %arg10.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %arg2.perm))
                            (define %lastidx0.perm (-  %arg1.perm  1))
                            (define %highidx0.perm (+  j0.new.div.perm  %lastidx0.perm))
                            (define %1.perm (extract  %highidx0.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  %arg0.perm))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %factor0.perm (/  %arg3.perm  %elemsize0.perm))
                                 (define %factor1.perm (*  %alpha.arg0.perm  %factor0.perm))
                                 (define %0.copy.0.new0.perm (*  j0.new.perm  %factor1.perm))
                                 (define %lastidx1.perm (-  %arg3.perm  1))
                                 (define %2.perm (+  %0.copy.0.new0.perm  %lastidx1.perm))
                                 (define %3.perm (extract  %2.perm %0.copy.0.new0.perm a.perm))
                                 (define %lastidx2.perm (-  %elemsize0.perm  1))
                                 (define %highidx1.perm (+  %lastidx2.perm  %arg9.perm))
                                 (define %4.perm (extract  %highidx1.perm %arg9.perm imm8.perm))
                                 (define %0.site0.perm (bvsmod  %4.perm  %arg8.perm))
                                 (define %1.site0.ab0.perm (bvsizeext  %0.site0.perm %arg3.perm %arg7.perm))
                                 (define %2.site0.perm (bvshl  %3.perm  %1.site0.ab0.perm))
                                 (define %3.site0.ab0.perm (bvsubnw %arg5.perm %0.site0.perm 8 %arg6.perm ))
                                 (define %4.site0.ab0.perm (bvsizeext  %3.site0.ab0.perm %arg3.perm %arg4.perm))
                                 (define %5.site0.perm (bvashr  %3.perm  %4.site0.ab0.perm))
                                 (define %6.site0.perm (bvor  %2.site0.perm  %5.site0.perm))
                                 %6.site0.perm
                                 )]
                              [else (begin
                                      (define %factor2.perm (/  %arg3.perm  %elemsize0.perm))
                                      (define %factor3.perm (*  %alpha.arg1.perm  %factor2.perm))
                                      (define %0.copy.3.new0.perm (*  j0.new.perm  %factor3.perm))
                                      (define %lastidx3.perm (-  %arg3.perm  1))
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
  (bvpadhighbits  dst.perm %arg10.perm)
  )

(define (_mm_hadd_pi32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %6 (+  %inner.it  %arg3))
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %7 (+  %6  %lastidx0))
                            (define %0 (extract  %7 %6 a))
                            (define %8 (+  %inner.it  %arg2))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %9 (+  %8  %lastidx1))
                            (define %1 (extract  %9 %8 a))
                            (define %2.ab0 (bvaddnw %0 %1 %elemsize0 %arg1 ))
                            (define %3 (extract  %7 %6 b))
                            (define %4 (extract  %9 %8 b))
                            (define %5.ab0 (bvaddnw %3 %4 %elemsize0 %arg0 ))
                            (concat %5.ab0 %2.ab0)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm256_mask_cmpeq_epu8_mask  k1.perm %arg0.perm b.perm a.perm %arg3.perm %arg2.perm %arg5.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %arg1.perm %arg4.perm %alpha.arg0.perm %arg6.perm )
  (define k.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (apply
                  concat
                  (for/list ([j0.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                            (define %lastidx0.perm (-  %arg1.perm  1))
                            (define %highidx0.perm (+  j0.perm  %lastidx0.perm))
                            (define %1.perm (extract  %highidx0.perm j0.perm k1.perm))
                            (define %cond0.perm (bveq  %1.perm  %arg0.perm))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %factor0.perm (/  %arg4.perm  %elemsize0.perm))
                                 (define %factor1.perm (*  %alpha.arg0.perm  %factor0.perm))
                                 (define %0.copy.0.perm (*  j0.perm  %factor1.perm))
                                 (define %lastidx2.perm (-  %arg4.perm  1))
                                 (define %2.perm (+  %0.copy.0.perm  %lastidx2.perm))
                                 (define %3.perm (extract  %2.perm %0.copy.0.perm a.perm))
                                 (define %5.perm (extract  %2.perm %0.copy.0.perm b.perm))
                                 (define %6.perm (bveq  %3.perm  %5.perm))
                                 (define %7.perm (if (equal? %6.perm #t) %arg2.perm %arg3.perm))
                                 %7.perm
                                 )]
                              [else (begin
                                      (define %lastidx3.perm (-  %elemsize0.perm  1))
                                      (define %highidx2.perm (+  j0.perm  %lastidx3.perm))
                                      (define %8.perm (extract  %highidx2.perm j0.perm %arg5.perm))
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

(define (_mm_movemask_epi8  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %0 (*  j0  %arg1))
                            (define %1 (+  %0  %arg0))
                            (define %lastidx1 (-  %elemsize0  1))
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

(define (_mm512_sll_epi64  count.norm %arg5.norm %arg0.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg6.norm %arg7.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg2.norm  1))
                            (define %highidx0.norm (+  %lastidx0.norm  %arg3.norm))
                            (define %1.norm (extract  %highidx0.norm %arg3.norm count.norm))
                            (define %2.ab0.norm (bvgt %1.norm %arg0.norm %arg1.norm ))
                            (cond
                              [(equal? %2.ab0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %arg4.norm  1))
                                 (define %4.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %10.norm (extract  %4.norm j0.new.norm %arg5.norm))
                                 %10.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %arg4.norm  1))
                                      (define %5.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %6.norm (extract  %5.norm j0.new.norm a.norm))
                                      (define %lastidx3.norm (-  %arg4.norm  1))
                                      (define %highidx1.norm (+  %lastidx3.norm  %arg6.norm))
                                      (define %7.norm (extract  %highidx1.norm %arg6.norm count.norm))
                                      (define %8.norm (bvshl  %6.norm  %7.norm))
                                      %8.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg7.norm)
  )

(define (_mm_sign_pi16  %arg4.norm b.norm %arg6.norm %arg0.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg5.norm %arg7.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg2.norm  1))
                            (define %1.norm (+  j0.new.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm j0.new.norm b.norm))
                            (define %3.ab0.norm (bvlt %2.norm %arg0.norm %arg1.norm ))
                            (cond
                              [(equal? %3.ab0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %arg3.norm  1))
                                 (define %5.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %6.norm (extract  %5.norm j0.new.norm a.norm))
                                 (define %7.norm (bvneg  %6.norm))
                                 %7.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %arg5.norm  1))
                                      (define %9.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %10.norm (extract  %9.norm j0.new.norm b.norm))
                                      (define %11.norm (bveq  %10.norm  %arg4.norm))
                                      (cond
                                        [(equal? %11.norm #t)
                                         (begin
                                           (define %lastidx3.norm (-  %arg3.norm  1))
                                           (define %13.norm (+  j0.new.norm  %lastidx3.norm))
                                           (define %18.norm (extract  %13.norm j0.new.norm %arg6.norm))
                                           %18.norm
                                           )]
                                        [else (begin
                                                (define %lastidx4.norm (-  %arg3.norm  1))
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
  (bvpadhighbits  dst.norm %arg7.norm)
  )

(define (_mm512_mask_sll_epi64  count.perm k.perm %arg0.perm src.perm %arg8.perm %arg3.perm a.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %arg1.perm %arg2.perm %arg4.perm %arg5.perm %arg6.perm %arg7.perm %arg9.perm %arg10.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %arg2.perm))
                            (define %lastidx0.perm (-  %arg1.perm  1))
                            (define %highidx0.perm (+  j0.new.div.perm  %lastidx0.perm))
                            (define %1.perm (extract  %highidx0.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  %arg0.perm))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %arg5.perm  1))
                                 (define %highidx1.perm (+  %lastidx1.perm  %arg6.perm))
                                 (define %2.perm (extract  %highidx1.perm %arg6.perm count.perm))
                                 (define %3.ab0.perm (bvgt %2.perm %arg3.perm %arg4.perm ))
                                 (cond
                                   [(equal? %3.ab0.perm #t)
                                    (begin
                                      (define %lastidx2.perm (-  %arg7.perm  1))
                                      (define %5.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %15.perm (extract  %5.perm j0.new.perm %arg8.perm))
                                      %15.perm
                                      )]
                                   [else (begin
                                           (define %lastidx3.perm (-  %arg7.perm  1))
                                           (define %6.perm (+  j0.new.perm  %lastidx3.perm))
                                           (define %7.perm (extract  %6.perm j0.new.perm a.perm))
                                           (define %lastidx4.perm (-  %arg7.perm  1))
                                           (define %highidx2.perm (+  %lastidx4.perm  %arg9.perm))
                                           (define %8.perm (extract  %highidx2.perm %arg9.perm count.perm))
                                           (define %9.perm (bvshl  %7.perm  %8.perm))
                                           %9.perm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx5.perm (-  %arg7.perm  1))
                                      (define %12.perm (+  j0.new.perm  %lastidx5.perm))
                                      (define %13.perm (extract  %12.perm j0.new.perm src.perm))
                                      %13.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm %arg10.perm)
  )

(define (_mm_add_pi8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %4 (+  j0.new  %lastidx0))
                            (define %5 (extract  %4 j0.new a))
                            (define %7 (extract  %4 j0.new b))
                            (define %8.ab0 (bvaddnw %5 %7 %elemsize0 %arg0 ))
                            %8.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm512_mask_srav_epi32  count.norm k.norm %arg0.norm %arg9.norm %arg8.norm a.norm %arg7.norm %arg3.norm src.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg4.norm %arg5.norm %arg6.norm %arg10.norm %arg11.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %arg5.norm  1))
                                 (define %2.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %2.norm j0.new.norm count.norm))
                                 (define %4.ab0.norm (bvlt %3.norm %arg3.norm %arg4.norm ))
                                 (cond
                                   [(equal? %4.ab0.norm #t)
                                    (begin
                                      (define %lastidx2.norm (-  %arg6.norm  1))
                                      (define %5.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %6.norm (extract  %5.norm j0.new.norm a.norm))
                                      (define %8.norm (extract  %5.norm j0.new.norm count.norm))
                                      (define %9.norm (bvashr  %6.norm  %8.norm))
                                      %9.norm
                                      )]
                                   [else (begin
                                           (define %lastidx3.norm (-  %arg6.norm  1))
                                           (define %12.norm (+  j0.new.norm  %lastidx3.norm))
                                           (define %lastidx4.norm (-  %arg10.norm  1))
                                           (define %highidx1.norm (+  %12.norm  %lastidx4.norm))
                                           (define %13.norm (extract  %highidx1.norm %12.norm a.norm))
                                           (define %cond1.norm (bveq  %13.norm  %arg9.norm))
                                           (define %14.norm (if (equal? %cond1.norm #t) %arg7.norm %arg8.norm))
                                           %14.norm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx5.norm (-  %arg6.norm  1))
                                      (define %17.norm (+  j0.new.norm  %lastidx5.norm))
                                      (define %18.norm (extract  %17.norm j0.new.norm src.norm))
                                      %18.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg11.norm)
  )

(define (_mm_hsub_pi32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %6 (+  %inner.it  %arg3))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %7 (+  %6  %lastidx1))
                            (define %0 (extract  %7 %6 a))
                            (define %8 (+  %inner.it  %arg2))
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %9 (+  %8  %lastidx0))
                            (define %1 (extract  %9 %8 a))
                            (define %2.ab0 (bvsubnw %0 %1 %elemsize0 %arg1 ))
                            (define %3 (extract  %7 %6 b))
                            (define %4 (extract  %9 %8 b))
                            (define %5.ab0 (bvsubnw %3 %4 %elemsize0 %arg0 ))
                            (concat %5.ab0 %2.ab0)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm256_mulhrs_epi16  %arg3 %arg1 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg4 %arg5 %arg6 %arg7 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %3.ab0 (bvsizeext  %2 %arg5 %arg6))
                            (define %5 (extract  %1 j0.new b))
                            (define %6.ab0 (bvsizeext  %5 %arg5 %arg4))
                            (define %7 (bvmul  %3.ab0  %6.ab0))
                            (define %8 (bvashr  %7  %arg3))
                            (define %9.ab0 (bvaddnw %8 %arg1 %arg5 %arg2 ))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %highidx0 (+  %lastidx1  %arg0))
                            (define %10 (extract  %highidx0 %arg0 %9.ab0))
                            %10
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg7)
  )

(define (_mm256_mask_madd52hi_epu64  %arg0.norm k.norm a.norm b.norm c.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg5.norm %arg6.norm %arg7.norm %arg8.norm %arg9.norm %arg10.norm %arg11.norm %arg12.norm %arg13.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define j0.new.div.copy.2.norm (/  j0.new.norm  %arg11.norm))
                                 (define %0.copy.0.norm (*  j0.new.div.copy.2.norm  %arg3.norm))
                                 (define %lastidx3.norm (-  %elemsize0.norm  1))
                                 (define %2.norm (+  %0.copy.0.norm  %lastidx3.norm))
                                 (define %3.norm (extract  %2.norm %0.copy.0.norm b.norm))
                                 (define %6.norm (extract  %2.norm %0.copy.0.norm c.norm))
                                 (define %8.ab0.norm (bvsizeext  %3.norm %arg9.norm %arg10.norm))
                                 (define %9.ab0.norm (bvsizeext  %6.norm %arg9.norm %arg8.norm))
                                 (define %10.norm (bvmul  %8.ab0.norm  %9.ab0.norm))
                                 (define %lastidx1.norm (-  %arg3.norm  1))
                                 (define %13.norm (+  %0.copy.0.norm  %lastidx1.norm))
                                 (define %14.norm (extract  %13.norm %0.copy.0.norm a.norm))
                                 (define %lastidx2.norm (-  %arg6.norm  1))
                                 (define %highidx1.norm (+  %lastidx2.norm  %arg7.norm))
                                 (define %15.norm (extract  %highidx1.norm %arg7.norm %10.norm))
                                 (define %16.ab0.norm (bvsizeext  %15.norm %arg3.norm %arg5.norm))
                                 (define %17.ab0.norm (bvaddnw %14.norm %16.ab0.norm %arg3.norm %arg4.norm ))
                                 %17.ab0.norm
                                 )]
                              [else (begin
                                      (define j0.new.div.copy.8.norm (/  j0.new.norm  %arg12.norm))
                                      (define %0.copy.6.norm (*  j0.new.div.copy.8.norm  %arg3.norm))
                                      (define %lastidx4.norm (-  %arg3.norm  1))
                                      (define %20.norm (+  %0.copy.6.norm  %lastidx4.norm))
                                      (define %21.norm (extract  %20.norm %0.copy.6.norm a.norm))
                                      %21.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg13.norm)
  )

(define (_mm512_mask_extracti64x4_epi64  imm8.norm %arg0.norm %arg1.norm k.norm %arg8.norm src.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %vectsize1.norm %outerlanesize1.norm %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm %arg2.norm %arg3.norm %arg4.norm %arg5.norm %arg6.norm %arg7.norm %arg9.norm %arg10.norm %arg11.norm )
  (define tmp0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([%inner.it.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg2.norm  1))
                            (define %0.norm (extract  %lastidx0.norm 0 imm8.norm))
                            (define %cond0.norm (bveq  %0.norm  %arg1.norm))
                            (define %cond1.norm (bveq  %0.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx2.norm (-  %arg3.norm  1))
                                 (define %highidx2.norm (+  %lastidx2.norm  %arg5.norm))
                                 (define %1.norm (extract  %highidx2.norm %arg5.norm a.norm))
                                 %1.norm
                                 )]
                              [(equal? %cond1.norm #t)
                               (begin
                                 (define %lastidx4.norm (-  %arg3.norm  1))
                                 (define %highidx4.norm (+  %lastidx4.norm  %arg7.norm))
                                 (define %2.norm (extract  %highidx4.norm %arg7.norm a.norm))
                                 %2.norm
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
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize1.norm %outerlanesize1.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg10.norm))
                            (define %lastidx5.norm (-  %arg9.norm  1))
                            (define %highidx5.norm (+  j0.new.div.norm  %lastidx5.norm))
                            (define %4.norm (extract  %highidx5.norm j0.new.div.norm k.norm))
                            (define %cond2.norm (bveq  %4.norm  %arg8.norm))
                            (cond
                              [(equal? %cond2.norm #t)
                               (begin
                                 (define %lastidx6.norm (-  %elemsize1.norm  1))
                                 (define %6.norm (+  j0.new.norm  %lastidx6.norm))
                                 (define %7.norm (extract  %6.norm j0.new.norm tmp0.norm))
                                 %7.norm
                                 )]
                              [else (begin
                                      (define %lastidx7.norm (-  %elemsize1.norm  1))
                                      (define %10.norm (+  j0.new.norm  %lastidx7.norm))
                                      (define %11.norm (extract  %10.norm j0.new.norm src.norm))
                                      %11.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg11.norm)
  )

(define (_mm512_extracti64x2_epi64  %arg0.norm imm8.norm %arg1.norm %arg2.norm %arg3.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg4.norm %arg5.norm %arg6.norm %arg7.norm %arg8.norm %arg9.norm %arg10.norm %arg11.norm %arg12.norm %arg13.norm %arg14.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([%inner.it.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg4.norm  1))
                            (define %highidx0.norm (+  %lastidx0.norm  %arg5.norm))
                            (define %0.norm (extract  %highidx0.norm %arg5.norm imm8.norm))
                            (define %cond0.norm (bveq  %0.norm  %arg3.norm))
                            (define %cond1.norm (bveq  %0.norm  %arg2.norm))
                            (define %cond2.norm (bveq  %0.norm  %arg1.norm))
                            (define %cond3.norm (bveq  %0.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx2.norm (-  %elemsize0.norm  1))
                                 (define %highidx2.norm (+  %lastidx2.norm  %arg7.norm))
                                 (define %1.norm (extract  %highidx2.norm %arg7.norm a.norm))
                                 %1.norm
                                 )]
                              [(equal? %cond1.norm #t)
                               (begin
                                 (define %lastidx4.norm (-  %elemsize0.norm  1))
                                 (define %highidx4.norm (+  %lastidx4.norm  %arg9.norm))
                                 (define %2.norm (extract  %highidx4.norm %arg9.norm a.norm))
                                 %2.norm
                                 )]
                              [(equal? %cond2.norm #t)
                               (begin
                                 (define %lastidx6.norm (-  %elemsize0.norm  1))
                                 (define %highidx6.norm (+  %lastidx6.norm  %arg11.norm))
                                 (define %3.norm (extract  %highidx6.norm %arg11.norm a.norm))
                                 %3.norm
                                 )]
                              [(equal? %cond3.norm #t)
                               (begin
                                 (define %lastidx8.norm (-  %elemsize0.norm  1))
                                 (define %highidx8.norm (+  %lastidx8.norm  %arg13.norm))
                                 (define %4.norm (extract  %highidx8.norm %arg13.norm a.norm))
                                 %4.norm
                                 )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg14.norm)
  )

(define (_mm512_sra_epi64  count.norm %arg6.norm a.norm %arg7.norm %arg5.norm %arg0.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg8.norm %arg9.norm %arg10.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg2.norm  1))
                            (define %highidx0.norm (+  %lastidx0.norm  %arg3.norm))
                            (define %1.norm (extract  %highidx0.norm %arg3.norm count.norm))
                            (define %2.ab0.norm (bvgt %1.norm %arg0.norm %arg1.norm ))
                            (cond
                              [(equal? %2.ab0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %arg4.norm  1))
                                 (define %4.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %lastidx2.norm (-  %arg8.norm  1))
                                 (define %highidx1.norm (+  %4.norm  %lastidx2.norm))
                                 (define %5.norm (extract  %highidx1.norm %4.norm a.norm))
                                 (define %cond0.norm (bveq  %5.norm  %arg7.norm))
                                 (define %6.norm (if (equal? %cond0.norm #t) %arg5.norm %arg6.norm))
                                 %6.norm
                                 )]
                              [else (begin
                                      (define %lastidx3.norm (-  %arg4.norm  1))
                                      (define %8.norm (+  j0.new.norm  %lastidx3.norm))
                                      (define %9.norm (extract  %8.norm j0.new.norm a.norm))
                                      (define %lastidx4.norm (-  %arg4.norm  1))
                                      (define %highidx2.norm (+  %lastidx4.norm  %arg9.norm))
                                      (define %10.norm (extract  %highidx2.norm %arg9.norm count.norm))
                                      (define %11.norm (bvashr  %9.norm  %10.norm))
                                      %11.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg10.norm)
  )

(define (_mm256_maskz_max_epi32  %arg0.norm k.norm %arg4.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg5.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %2.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                                 (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                                 (define %6.ab0.norm (bvmax %3.norm %5.norm %arg3.norm ))
                                 %6.ab0.norm
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
  (bvpadhighbits  dst.norm %arg5.norm)
  )

(define (_mm_abs_epi16  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm512_unpacklo_epi16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([iterator.0 (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([iterator.0.site0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %elemsize0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
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
  (bvpadhighbits  dst %arg1)
  )

(define (_mm512_fmadd_epi32  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %2 (+  j0.new  %lastidx0))
                            (define %3 (extract  %2 j0.new a))
                            (define %5 (extract  %2 j0.new b))
                            (define %6.ab0 (bvsizeext  %3 %arg4 %arg5))
                            (define %7.ab0 (bvsizeext  %5 %arg4 %arg3))
                            (define %8 (bvmul  %6.ab0  %7.ab0))
                            (define %10 (extract  %2 j0.new c))
                            (define %11.ab0 (bvsizeext  %10 %arg2 %arg1))
                            (define %12.ab0 (bvaddnw %8 %11.ab0 %arg4 %arg0 ))
                            (define %14.high.idx 63 )
                            (define %14.low.idx (+ (- %14.high.idx %elemsize0) 1) )
                            (define %14 (extract  %14.high.idx %14.low.idx %12.ab0))
                            %14
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg6)
  )

(define (_mm_div_epi64  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %4 (extract  %1 j0.new b))
                            (define %5.ab0 (bvsizeext  %2 %arg4 %arg3))
                            (define %6.ab0 (bvsizeext  %4 %arg2 %arg1))
                            (define %7.ab0 (bvdiv %5.ab0 %6.ab0 %arg0 ))
                            (define %8.high.idx (- %elemsize0 1))
                            (define %8.low.idx 0)
                            (define %8 (extract  %8.high.idx %8.low.idx %7.ab0))
                            %8
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg5)
  )

(define (_mm256_mask_sllv_epi16  count.perm k.perm %arg0.perm src.perm %arg7.perm %arg3.perm a.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %arg1.perm %arg2.perm %arg4.perm %arg5.perm %arg6.perm %arg8.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %arg2.perm))
                            (define %lastidx0.perm (-  %arg1.perm  1))
                            (define %highidx0.perm (+  j0.new.div.perm  %lastidx0.perm))
                            (define %1.perm (extract  %highidx0.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  %arg0.perm))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %arg5.perm  1))
                                 (define %2.perm (+  j0.new.perm  %lastidx1.perm))
                                 (define %3.perm (extract  %2.perm j0.new.perm count.perm))
                                 (define %4.ab0.perm (bvlt %3.perm %arg3.perm %arg4.perm ))
                                 (cond
                                   [(equal? %4.ab0.perm #t)
                                    (begin
                                      (define %lastidx2.perm (-  %arg6.perm  1))
                                      (define %5.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %6.perm (extract  %5.perm j0.new.perm a.perm))
                                      (define %8.perm (extract  %5.perm j0.new.perm count.perm))
                                      (define %9.perm (bvshl  %6.perm  %8.perm))
                                      %9.perm
                                      )]
                                   [else (begin
                                           (define %lastidx3.perm (-  %arg6.perm  1))
                                           (define %12.perm (+  j0.new.perm  %lastidx3.perm))
                                           (define %17.perm (extract  %12.perm j0.new.perm %arg7.perm))
                                           %17.perm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx4.perm (-  %arg6.perm  1))
                                      (define %14.perm (+  j0.new.perm  %lastidx4.perm))
                                      (define %15.perm (extract  %14.perm j0.new.perm src.perm))
                                      %15.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm %arg8.perm)
  )

(define (_mm256_mask_abs_epi16  k.perm %arg0.perm src.perm a.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %arg1.perm %arg2.perm %arg3.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %arg2.perm))
                            (define %lastidx0.perm (-  %arg1.perm  1))
                            (define %highidx0.perm (+  j0.new.div.perm  %lastidx0.perm))
                            (define %1.perm (extract  %highidx0.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  %arg0.perm))
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
  (bvpadhighbits  dst.perm %arg3.perm)
  )

(define (_mm_cmpgt_epi16  %arg1.1 %arg0.1 b.1 a.1 %vectsize0.1 %outerlanesize0.1 %innerlaneoffset0.1 %innerlanesize0.1 %elemsize0.1 %arg2.1 %arg3.1 )
  (define dst.1
    (apply
      concat
      (for/list ([%outer.it.1 (reverse (range 0 %vectsize0.1 %outerlanesize0.1))])
                (apply
                  concat
                  (for/list ([j0.new.1 (reverse (range %innerlaneoffset0.1 %innerlanesize0.1 %elemsize0.1))])
                            (define %lastidx0.1 (-  %elemsize0.1  1))
                            (define %2.1 (+  j0.new.1  %lastidx0.1))
                            (define %3.1 (extract  %2.1 j0.new.1 a.1))
                            (define %5.1 (extract  %2.1 j0.new.1 b.1))
                            (define %6.ab0.1 (bvgt %3.1 %5.1 %arg2.1 ))
                            (define %7.1 (if (equal? %6.ab0.1 #t) %arg0.1 %arg1.1))
                            %7.1
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.1 %arg3.1)
  )

(define (_mm256_unpackhi_epi16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([iterator.0 (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([iterator.0.site0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %elemsize0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define iterator.0.site0.new.mul (*  iterator.0.site0.new  %factor1))
                            (define %low.offset0.site0 (+  iterator.0.site0.new  %arg1))
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
  (bvpadhighbits  dst %arg2)
  )

(define (_mm_mask_packs_epi16  %arg7.norm k.norm src.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm %vectsize1.norm %outerlanesize1.norm %innerlaneoffset2.norm %innerlanesize2.norm %elemsize2.norm %arg0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg5.norm %arg6.norm %arg8.norm %arg9.norm %arg10.norm )
  (define tmp_dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.1.new.norm (reverse (range %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm))])
                              (define %low.offset0.new0.norm (-  iterator.1.new.norm  %arg5.norm))
                              (define %lastidx3.norm (-  %elemsize1.norm  1))
                              (define %high.offset2.norm (+  %low.offset0.new0.norm  %lastidx3.norm))
                              (define %16.norm (extract  %high.offset2.norm %low.offset0.new0.norm b.norm))
                              (define %17.ab0.norm (bvsaturate  %16.norm %elemsize1.norm %arg3.norm %arg4.norm))
                              %17.ab0.norm
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                              (define %lastidx1.norm (-  %elemsize0.norm  1))
                              (define %high.offset0.norm (+  iterator.0.new.norm  %lastidx1.norm))
                              (define %0.norm (extract  %high.offset0.norm iterator.0.new.norm a.norm))
                              (define %1.ab0.norm (bvsaturate  %0.norm %elemsize0.norm %arg0.norm %arg1.norm))
                              %1.ab0.norm
                              )
                    )
                  )
                )
      )
    )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize1.norm %outerlanesize1.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset2.norm %innerlanesize2.norm %elemsize2.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg9.norm))
                            (define %lastidx4.norm (-  %arg8.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx4.norm))
                            (define %33.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %33.norm  %arg7.norm))
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
  (bvpadhighbits  dst.norm %arg10.norm)
  )

(define (_mm512_maskz_xor_epi32  k.norm %arg0.norm %arg3.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg4.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %5.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %6.norm (extract  %5.norm j0.new.norm a.norm))
                                 (define %8.norm (extract  %5.norm j0.new.norm b.norm))
                                 (define %9.norm (bvxor  %6.norm  %8.norm))
                                 %9.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %12.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %13.norm (extract  %12.norm j0.new.norm %arg3.norm))
                                      %13.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg4.norm)
  )

(define (_mm_mask_sra_epi64  %arg0.norm k.norm count.norm %arg10.norm %arg8.norm a.norm %arg9.norm %arg3.norm src.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg4.norm %arg5.norm %arg6.norm %arg7.norm %arg11.norm %arg12.norm %arg13.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %arg5.norm  1))
                                 (define %highidx1.norm (+  %lastidx1.norm  %arg6.norm))
                                 (define %2.norm (extract  %highidx1.norm %arg6.norm count.norm))
                                 (define %3.ab0.norm (bvgt %2.norm %arg3.norm %arg4.norm ))
                                 (cond
                                   [(equal? %3.ab0.norm #t)
                                    (begin
                                      (define %lastidx2.norm (-  %arg7.norm  1))
                                      (define %5.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %lastidx3.norm (-  %arg11.norm  1))
                                      (define %highidx2.norm (+  %5.norm  %lastidx3.norm))
                                      (define %6.norm (extract  %highidx2.norm %5.norm a.norm))
                                      (define %cond1.norm (bveq  %6.norm  %arg10.norm))
                                      (define %7.norm (if (equal? %cond1.norm #t) %arg8.norm %arg9.norm))
                                      %7.norm
                                      )]
                                   [else (begin
                                           (define %lastidx4.norm (-  %arg7.norm  1))
                                           (define %9.norm (+  j0.new.norm  %lastidx4.norm))
                                           (define %10.norm (extract  %9.norm j0.new.norm a.norm))
                                           (define %lastidx5.norm (-  %arg7.norm  1))
                                           (define %highidx3.norm (+  %lastidx5.norm  %arg12.norm))
                                           (define %11.norm (extract  %highidx3.norm %arg12.norm count.norm))
                                           (define %12.norm (bvashr  %10.norm  %11.norm))
                                           %12.norm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx6.norm (-  %arg7.norm  1))
                                      (define %15.norm (+  j0.new.norm  %lastidx6.norm))
                                      (define %16.norm (extract  %15.norm j0.new.norm src.norm))
                                      %16.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg13.norm)
  )

(define (_mm_mask_or_epi64  k.norm %arg0.norm src.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
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
                                      (define %13.norm (extract  %12.norm j0.new.norm src.norm))
                                      %13.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg3.norm)
  )

(define (_mm512_cmplt_epi32_mask  %arg0.perm %arg1.perm b.perm a.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %arg2.perm %arg3.perm %alpha.arg0.perm %arg4.perm )
  (define k.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (apply
                  concat
                  (for/list ([j0.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                            (define %factor0.perm (/  %arg3.perm  %elemsize0.perm))
                            (define %factor1.perm (*  %alpha.arg0.perm  %factor0.perm))
                            (define %0.perm (*  j0.perm  %factor1.perm))
                            (define %lastidx1.perm (-  %arg3.perm  1))
                            (define %1.perm (+  %0.perm  %lastidx1.perm))
                            (define %2.perm (extract  %1.perm %0.perm a.perm))
                            (define %4.perm (extract  %1.perm %0.perm b.perm))
                            (define %5.ab0.perm (bvlt %2.perm %4.perm %arg2.perm ))
                            (define %6.perm (if (equal? %5.ab0.perm #t) %arg0.perm %arg1.perm))
                            %6.perm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.perm %arg4.perm)
  )

(define (_mm512_sllv_epi16  count.norm %arg4.norm %arg0.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg5.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg2.norm  1))
                            (define %1.norm (+  j0.new.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm j0.new.norm count.norm))
                            (define %3.ab0.norm (bvlt %2.norm %arg0.norm %arg1.norm ))
                            (cond
                              [(equal? %3.ab0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %arg3.norm  1))
                                 (define %4.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %5.norm (extract  %4.norm j0.new.norm a.norm))
                                 (define %7.norm (extract  %4.norm j0.new.norm count.norm))
                                 (define %8.norm (bvshl  %5.norm  %7.norm))
                                 %8.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %arg3.norm  1))
                                      (define %11.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %12.norm (extract  %11.norm j0.new.norm %arg4.norm))
                                      %12.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg5.norm)
  )

(define (_mm512_mask3_fmadd_epi32  k.norm %arg0.norm a.norm b.norm c.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg5.norm %arg6.norm %arg7.norm %arg8.norm %arg9.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %3.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %4.norm (extract  %3.norm j0.new.norm a.norm))
                                 (define %6.norm (extract  %3.norm j0.new.norm b.norm))
                                 (define %7.ab0.norm (bvsizeext  %4.norm %arg7.norm %arg8.norm))
                                 (define %8.ab0.norm (bvsizeext  %6.norm %arg7.norm %arg6.norm))
                                 (define %9.norm (bvmul  %7.ab0.norm  %8.ab0.norm))
                                 (define %11.norm (extract  %3.norm j0.new.norm c.norm))
                                 (define %12.ab0.norm (bvsizeext  %11.norm %arg5.norm %arg4.norm))
                                 (define %13.ab0.norm (bvaddnw %9.norm %12.ab0.norm %arg7.norm %arg3.norm ))
                                 (define %15.norm.high.idx 63 )
                                 (define %15.norm.low.idx (+ (- %15.norm.high.idx %elemsize0.norm) 1) )
                                 (define %15.norm (extract  %15.norm.high.idx %15.norm.low.idx %13.ab0.norm))
                                 %15.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %17.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %18.norm (extract  %17.norm j0.new.norm c.norm))
                                      %18.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg9.norm)
  )

(define (_mm_mask_unpackhi_epi32  %arg4.norm k.norm src.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %vectsize1.norm %outerlanesize1.norm %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm %arg0.norm %arg1.norm %arg2.norm %alpha.arg0.norm %arg3.norm %arg5.norm %arg6.norm %arg7.norm )
  (define tmp_dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([iterator.0.site0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                            (define iterator.0.site0.new.mul.norm (*  iterator.0.site0.new.norm  %factor1.norm))
                            (define %0.site0.new.low.idx.norm (+  %arg3.norm  iterator.0.site0.new.norm))
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
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize1.norm %outerlanesize1.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg6.norm))
                            (define %lastidx3.norm (-  %arg5.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx3.norm))
                            (define %4.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %4.norm  %arg4.norm))
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
                                      (define %11.norm (extract  %10.norm j0.new.norm src.norm))
                                      %11.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg7.norm)
  )

(define (_mm256_dpbusd_epi32  src a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
  (define dst
    (apply
      concat
      (for/list ([j0.new (reverse (range 0 %vectsize0 %outerlanesize0))])
                (define %lastidx0 (-  %outerlanesize0  1))
                (define %55.clone.0 (+  j0.new  %lastidx0))
                (define %56.clone.0 (extract  %55.clone.0 j0.new src))
                (define dst %56.clone.0)
                (define %11.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %1.new0 (+  j0.new  iterator.0.new))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %2 (+  %1.new0  %lastidx2))
                              (define %3 (extract  %2 %1.new0 a))
                              (define %4.ab0 (bvsizeext  %3 %arg3 %arg4))
                              (define %8 (extract  %2 %1.new0 b))
                              (define %9.ab0 (bvsizeext  %8 %arg3 %arg2))
                              (define %10 (bvmul  %4.ab0  %9.ab0))
                              (define %11.ab0 (bvsizeext  %10 %outerlanesize0 %arg1))
                              %11.ab0
                              )
                    ))
                (define %lastidx1 (-  %outerlanesize0  1))
                (define %62.clone.4 (+  j0.new  %lastidx1))
                (define %11.acc0.ab0 (bvaddnw %11.ext0.red dst %outerlanesize0 %arg0))
                %11.acc0.ab0
                )
      )
    )
  (bvpadhighbits  dst %arg5)
  )

(define (_mm_avg_epu8  %arg1 %arg0 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %2 (+  j0.new  %lastidx0))
                            (define %3 (extract  %2 j0.new a))
                            (define %5 (extract  %2 j0.new b))
                            ;; Modified semantics
                            (define zext-size (* 2 %elemsize0))
                            (define %3.ext (zero-extend  %3 (bitvector zext-size)))
                            (define %5.ext (zero-extend  %5 (bitvector zext-size)))
                            (define %arg1.ext (zero-extend  %arg1 (bitvector zext-size)))
                            (define %arg0.ext (zero-extend  %arg0 (bitvector zext-size)))
                            ;;===============
                            ;(define %6.ab0 (bvaddnw %3 %5 %elemsize0 %arg3 ))
                            ;(define %7.ab0 (bvaddnw %6.ab0 %arg1 %elemsize0 %arg2 ))
                            ;(define %8 (bvlshr  %7.ab0  %arg0)) ;; should be logical right shift
                            ;%8


                            ;; Modified semantics
                            (define %6.ab0 (bvaddnw %3.ext %5.ext zext-size %arg3 ))
                            (define %7.ab0 (bvaddnw %6.ab0 %arg1.ext zext-size %arg2 ))
                            (define %8 (bvlshr  %7.ab0  %arg0.ext)) ;; should be logical right shift
                            (extract (- %elemsize0 1) 0 %8)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm256_maskz_mulhrs_epi16  %arg0.norm k.norm %arg10.norm %arg6.norm %arg4.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg5.norm %arg7.norm %arg8.norm %arg9.norm %arg11.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %2.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                                 (define %4.ab0.norm (bvsizeext  %3.norm %arg8.norm %arg9.norm))
                                 (define %6.norm (extract  %2.norm j0.new.norm b.norm))
                                 (define %7.ab0.norm (bvsizeext  %6.norm %arg8.norm %arg7.norm))
                                 (define %8.norm (bvmul  %4.ab0.norm  %7.ab0.norm))
                                 (define %9.norm (bvashr  %8.norm  %arg6.norm))
                                 (define %10.ab0.norm (bvaddnw %9.norm %arg4.norm %arg8.norm %arg5.norm ))
                                 (define %lastidx2.norm (-  %elemsize0.norm  1))
                                 (define %highidx1.norm (+  %lastidx2.norm  %arg3.norm))
                                 (define %11.norm (extract  %highidx1.norm %arg3.norm %10.ab0.norm))
                                 %11.norm
                                 )]
                              [else (begin
                                      (define %lastidx3.norm (-  %elemsize0.norm  1))
                                      (define %14.norm (+  j0.new.norm  %lastidx3.norm))
                                      (define %15.norm (extract  %14.norm j0.new.norm %arg10.norm))
                                      %15.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg11.norm)
  )

(define (_mm256_hadd_epi32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
  (define dst
    (apply
      concat
      (for/list ([iterator.lane (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %low.cofactor2 (*  iterator.1  %arg6))
                              (define %low.scaled.it3 (+  iterator.lane  %low.cofactor2))
                              (define %low.offset1.new0 (-  %low.scaled.it3  %arg5))
                              (define %lastidx5 (-  %elemsize1  1))
                              (define %high.offset3 (+  %low.offset1.new0  %lastidx5))
                              (define %6 (extract  %high.offset3 %low.offset1.new0 b))
                              (define %low.offset2.new0 (-  %low.scaled.it3  %arg4))
                              (define %lastidx4 (-  %elemsize1  1))
                              (define %high.offset4 (+  %low.offset2.new0  %lastidx4))
                              (define %7 (extract  %high.offset4 %low.offset2.new0 b))
                              (define %8.ab0 (bvaddnw %6 %7 %elemsize1 %arg3 ))
                              %8.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %low.cofactor0 (*  iterator.0  %arg2))
                              (define %low.scaled.it0 (+  iterator.lane  %low.cofactor0))
                              (define %low.offset0 (+  %low.scaled.it0  %arg1))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %high.offset0 (+  %low.offset0  %lastidx2))
                              (define %0 (extract  %high.offset0 %low.offset0 a))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %high.offset1 (+  %low.scaled.it0  %lastidx1))
                              (define %1 (extract  %high.offset1 %low.scaled.it0 a))
                              (define %2.ab0 (bvaddnw %0 %1 %elemsize0 %arg0 ))
                              %2.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg7)
  )

(define (_mm256_and_si256  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %3 (+  %inner.it  %arg0))
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %4 (+  %3  %lastidx0))
                            (define %0 (extract  %4 %3 a))
                            (define %1 (extract  %4 %3 b))
                            (define %2 (bvand  %0  %1))
                            %2
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm256_cmpeq_epu64_mask  %arg0.norm %arg1.norm b.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %alpha.arg0.norm %arg3.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                            (define %0.norm (*  j0.norm  %factor1.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %1.norm (+  %0.norm  %lastidx1.norm))
                            (define %2.norm (extract  %1.norm %0.norm a.norm))
                            (define %4.norm (extract  %1.norm %0.norm b.norm))
                            (define %5.norm (bveq  %2.norm  %4.norm))
                            (define %6.norm (if (equal? %5.norm #t) %arg0.norm %arg1.norm))
                            %6.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg3.norm)
  )

(define (_mm512_mask_cvtsepi16_epi8  k.perm %arg0.perm src.perm a.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %arg1.perm %arg2.perm %arg3.perm %arg4.perm %alpha.arg0.perm %arg5.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %arg2.perm))
                            (define %lastidx0.perm (-  %arg1.perm  1))
                            (define %highidx0.perm (+  j0.new.div.perm  %lastidx0.perm))
                            (define %2.perm (extract  %highidx0.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %2.perm  %arg0.perm))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %factor0.perm (/  %arg4.perm  %elemsize0.perm))
                                 (define %factor1.perm (*  %alpha.arg0.perm  %factor0.perm))
                                 (define %0.copy.0.new0.perm (*  j0.new.perm  %factor1.perm))
                                 (define %lastidx2.perm (-  %arg4.perm  1))
                                 (define %3.perm (+  %0.copy.0.new0.perm  %lastidx2.perm))
                                 (define %4.perm (extract  %3.perm %0.copy.0.new0.perm a.perm))
                                 (define %5.ab0.perm (bvsaturate  %4.perm %arg4.perm %elemsize0.perm %arg3.perm))
                                 %5.ab0.perm
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
  (bvpadhighbits  dst.perm %arg5.perm)
  )

(define (_mm512_mulhi_epu32  %arg0 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %2 (+  j0.new  %lastidx0))
                            (define %3 (extract  %2 j0.new a))
                            (define %5 (extract  %2 j0.new b))
                            (define %6.ab0 (bvsizeext  %3 %arg2 %arg3))
                            (define %7.ab0 (bvsizeext  %5 %arg2 %arg1))
                            (define %8 (bvmul  %6.ab0  %7.ab0))
                            (define %9 (bvashr  %8  %arg0))
                            (define %11.high.idx (- %arg2 1))
                            (define %11.low.idx (+ (- %11.high.idx %elemsize0) 1) )
                            (define %11 (extract  %11.high.idx %11.low.idx %9))
                            %11
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm512_broadcastq_epi64  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %highidx0 (+  %lastidx1  %arg0))
                            (define %1 (extract  %highidx0 %arg0 a))
                            %1
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_sub_si64  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %3 (+  %inner.it  %arg1))
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %4 (+  %3  %lastidx0))
                            (define %0 (extract  %4 %3 a))
                            (define %1 (extract  %4 %3 b))
                            (define %2.ab0 (bvsubnw %0 %1 %elemsize0 %arg0 ))
                            %2.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm256_extract_epi8  %arg3 a index %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg4 %arg5 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %6 (+  %inner.it  %arg4))
                            (define %lastidx2 (-  %arg2  1))
                            (define %7 (+  %6  %lastidx2))
                            (define %0 (extract  %7 %6 a))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %9 (+  %6  %lastidx1))
                            (define %1 (extract  %9 %6 index))
                            (define %2 (bvmul  %1  %arg3))
                            (define %3.ab0 (bvsizeext  %2 %arg2 %arg1))
                            (define %4 (bvashr  %0  %3.ab0))
                            (define %lastidx0 (-  %arg0  1))
                            (define %11 (+  %6  %lastidx0))
                            (define %5 (extract  %11 %6 %4))
                            %5
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg5)
  )

(define (_mm_mask_srai_epi16  %arg0.55 imm8.55 k.55 %arg10.55 a.55 %arg8.55 %arg9.55 src.55 %arg3.55 %vectsize0.55 %outerlanesize0.55 %innerlaneoffset0.55 %innerlanesize0.55 %elemsize0.55 %arg1.55 %arg2.55 %arg4.55 %arg5.55 %arg6.55 %arg7.55 %arg11.55 %arg12.55 %arg13.55 %arg14.55 %arg15.55 )
  (define dst.55
    (apply
      concat
      (for/list ([%outer.it.55 (reverse (range 0 %vectsize0.55 %outerlanesize0.55))])
                (apply
                  concat
                  (for/list ([j0.new.55 (reverse (range %innerlaneoffset0.55 %innerlanesize0.55 %elemsize0.55))])
                            (define j0.new.div.55 (/  j0.new.55  %arg2.55))
                            (define %lastidx0.55 (-  %arg1.55  1))
                            (define %highidx0.55 (+  j0.new.div.55  %lastidx0.55))
                            (define %1.55 (extract  %highidx0.55 j0.new.div.55 k.55))
                            (define %cond0.55 (bveq  %1.55  %arg0.55))
                            (cond
                              [(equal? %cond0.55 #t)
                               (begin
                                 (define %lastidx1.55 (-  %arg5.55  1))
                                 (define %highidx1.55 (+  %lastidx1.55  %arg6.55))
                                 (define %2.55 (extract  %highidx1.55 %arg6.55 imm8.55))
                                 (define %3.ab0.55 (bvgt %2.55 %arg3.55 %arg4.55 ))
                                 (cond
                                   [(equal? %3.ab0.55 #t)
                                    (begin
                                      (define %lastidx2.55 (-  %arg7.55  1))
                                      (define %5.55 (+  j0.new.55  %lastidx2.55))
                                      (define %lastidx3.55 (-  %arg11.55  1))
                                      (define %highidx2.55 (+  %5.55  %lastidx3.55))
                                      (define %6.55 (extract  %highidx2.55 %5.55 a.55))
                                      (define %cond1.55 (bveq  %6.55  %arg10.55))
                                      (define %7.55 (if (equal? %cond1.55 #t) %arg8.55 %arg9.55))
                                      %7.55
                                      )]
                                   [else (begin
                                           (define %lastidx4.55 (-  %arg7.55  1))
                                           (define %9.55 (+  j0.new.55  %lastidx4.55))
                                           (define %10.55 (extract  %9.55 j0.new.55 a.55))
                                           (define %lastidx5.55 (-  %arg13.55  1))
                                           (define %highidx3.55 (+  %lastidx5.55  %arg14.55))
                                           (define %11.55 (extract  %highidx3.55 %arg14.55 imm8.55))
                                           (define %12.ab0.55 (bvsizeext  %11.55 %arg7.55 %arg12.55))
                                           (define %13.55 (bvashr  %10.55  %12.ab0.55))
                                           %13.55
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx6.55 (-  %arg7.55  1))
                                      (define %16.55 (+  j0.new.55  %lastidx6.55))
                                      (define %17.55 (extract  %16.55 j0.new.55 src.55))
                                      %17.55
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.55 %arg15.55)
  )

(define (_mm256_sra_epi32  count.norm %arg6.norm %arg5.norm a.norm %arg7.norm %arg0.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg8.norm %arg9.norm %arg10.norm %arg11.norm %arg12.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg2.norm  1))
                            (define %highidx0.norm (+  %lastidx0.norm  %arg3.norm))
                            (define %1.norm (extract  %highidx0.norm %arg3.norm count.norm))
                            (define %2.ab0.norm (bvgt %1.norm %arg0.norm %arg1.norm ))
                            (cond
                              [(equal? %2.ab0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %arg4.norm  1))
                                 (define %4.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %lastidx2.norm (-  %arg8.norm  1))
                                 (define %highidx1.norm (+  %4.norm  %lastidx2.norm))
                                 (define %5.norm (extract  %highidx1.norm %4.norm a.norm))
                                 (define %cond0.norm (bveq  %5.norm  %arg7.norm))
                                 (define %6.norm (if (equal? %cond0.norm #t) %arg5.norm %arg6.norm))
                                 %6.norm
                                 )]
                              [else (begin
                                      (define %lastidx3.norm (-  %arg4.norm  1))
                                      (define %8.norm (+  j0.new.norm  %lastidx3.norm))
                                      (define %9.norm (extract  %8.norm j0.new.norm a.norm))
                                      (define %lastidx4.norm (-  %arg10.norm  1))
                                      (define %highidx2.norm (+  %lastidx4.norm  %arg11.norm))
                                      (define %10.norm (extract  %highidx2.norm %arg11.norm count.norm))
                                      (define %11.ab0.norm (bvsizeext  %9.norm %arg10.norm %arg9.norm))
                                      (define %12.norm (bvashr  %11.ab0.norm  %10.norm))
                                      (define %14.norm.high.idx (- %arg10.norm 1))
                                      (define %14.norm.low.idx (+ (- %14.norm.high.idx %arg4.norm) 1) )
                                      (define %14.norm (extract  %14.norm.high.idx %14.norm.low.idx %12.norm))
                                      %14.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg12.norm)
  )

(define (_m_psrawi  imm8.norm %arg5.norm a.norm %arg6.norm %arg7.norm %arg0.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %alpha.arg0.norm %arg8.norm %alpha.arg1.norm %arg9.norm %arg10.norm %arg11.norm %arg12.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg2.norm  1))
                            (define %highidx0.norm (+  %lastidx0.norm  %arg3.norm))
                            (define %1.norm (extract  %highidx0.norm %arg3.norm imm8.norm))
                            (define %2.ab0.norm (bvgt %1.norm %arg0.norm %arg1.norm ))
                            (cond
                              [(equal? %2.ab0.norm #t)
                               (begin
                                 (define %factor0.norm (/  %arg4.norm  %elemsize0.norm))
                                 (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                                 (define %0.copy.0.new0.norm (*  j0.new.norm  %factor1.norm))
                                 (define %lastidx1.norm (-  %arg4.norm  1))
                                 (define %4.norm (+  %0.copy.0.new0.norm  %lastidx1.norm))
                                 (define %lastidx2.norm (-  %arg8.norm  1))
                                 (define %highidx1.norm (+  %4.norm  %lastidx2.norm))
                                 (define %5.norm (extract  %highidx1.norm %4.norm a.norm))
                                 (define %cond0.norm (bveq  %5.norm  %arg7.norm))
                                 (define %6.norm (if (equal? %cond0.norm #t) %arg5.norm %arg6.norm))
                                 %6.norm
                                 )]
                              [else (begin
                                      (define %factor2.norm (/  %arg4.norm  %elemsize0.norm))
                                      (define %factor3.norm (*  %alpha.arg1.norm  %factor2.norm))
                                      (define %0.copy.2.new0.norm (*  j0.new.norm  %factor3.norm))
                                      (define %lastidx3.norm (-  %arg4.norm  1))
                                      (define %8.norm (+  %0.copy.2.new0.norm  %lastidx3.norm))
                                      (define %9.norm (extract  %8.norm %0.copy.2.new0.norm a.norm))
                                      (define %lastidx4.norm (-  %arg10.norm  1))
                                      (define %highidx2.norm (+  %lastidx4.norm  %arg11.norm))
                                      (define %10.norm (extract  %highidx2.norm %arg11.norm imm8.norm))
                                      (define %11.ab0.norm (bvsizeext  %10.norm %arg4.norm %arg9.norm))
                                      (define %12.norm (bvashr  %9.norm  %11.ab0.norm))
                                      %12.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg12.norm)
  )

(define (_mm512_packs_epi32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
  (define dst
    (apply
      concat
      (for/list ([iterator.lane (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %low.cofactor1 (*  iterator.1  %arg6))
                              (define %low.scaled.it2 (+  iterator.lane  %low.cofactor1))
                              (define %low.offset0.new0 (-  %low.scaled.it2  %arg5))
                              (define %lastidx3 (-  %arg4  1))
                              (define %high.offset2 (+  %low.offset0.new0  %lastidx3))
                              (define %8 (extract  %high.offset2 %low.offset0.new0 b))
                              (define %9.ab0 (bvsaturate  %8 %arg4 %elemsize1 %arg3))
                              %9.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %low.cofactor0 (*  iterator.0  %arg2))
                              (define %low.scaled.it0 (+  iterator.lane  %low.cofactor0))
                              (define %lastidx1 (-  %arg1  1))
                              (define %high.offset0 (+  %low.scaled.it0  %lastidx1))
                              (define %0 (extract  %high.offset0 %low.scaled.it0 a))
                              (define %1.ab0 (bvsaturate  %0 %arg1 %elemsize0 %arg0))
                              %1.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg7)
  )

(define (_mm256_mask_rorv_epi32  k.norm %arg0.norm %arg5.norm %arg3.norm src.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg4.norm %arg6.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %2.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                                 (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                                 (define %0.site0.norm (bvsmod  %5.norm  %arg5.norm))
                                 (define %1.site0.norm (bvashr  %3.norm  %0.site0.norm))
                                 (define %2.site0.ab0.norm (bvsubnw %arg3.norm %0.site0.norm %elemsize0.norm %arg4.norm ))
                                 (define %3.site0.norm (bvshl  %3.norm  %2.site0.ab0.norm))
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
  (bvpadhighbits  dst.norm %arg6.norm)
  )

(define (_mm512_maskz_srl_epi64  k.norm %arg0.norm count.norm %arg10.norm %arg8.norm %arg3.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg4.norm %arg5.norm %arg6.norm %arg7.norm %arg9.norm %arg11.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %arg5.norm  1))
                                 (define %highidx1.norm (+  %lastidx1.norm  %arg6.norm))
                                 (define %2.norm (extract  %highidx1.norm %arg6.norm count.norm))
                                 (define %3.ab0.norm (bvgt %2.norm %arg3.norm %arg4.norm ))
                                 (cond
                                   [(equal? %3.ab0.norm #t)
                                    (begin
                                      (define %lastidx2.norm (-  %arg7.norm  1))
                                      (define %5.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %13.norm (extract  %5.norm j0.new.norm %arg8.norm))
                                      %13.norm
                                      )]
                                   [else (begin
                                           (define %lastidx3.norm (-  %arg7.norm  1))
                                           (define %6.norm (+  j0.new.norm  %lastidx3.norm))
                                           (define %7.norm (extract  %6.norm j0.new.norm a.norm))
                                           (define %lastidx4.norm (-  %arg7.norm  1))
                                           (define %highidx2.norm (+  %lastidx4.norm  %arg9.norm))
                                           (define %8.norm (extract  %highidx2.norm %arg9.norm count.norm))
                                           (define %9.norm (bvlshr  %7.norm  %8.norm))
                                           %9.norm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx5.norm (-  %arg7.norm  1))
                                      (define %12.norm (+  j0.new.norm  %lastidx5.norm))
                                      (define %14.norm (extract  %12.norm j0.new.norm %arg10.norm))
                                      %14.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg11.norm)
  )

(define (_mm512_mask_rem_epi32  %arg0.norm k.norm src.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %2.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                                 (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                                 (define %6.ab0.norm (bvrem %3.norm %5.norm %arg3.norm ))
                                 %6.ab0.norm
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
  (bvpadhighbits  dst.norm %arg4.norm)
  )

(define (_mm256_madd52hi_epu64  a b c %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define j0.new.div (/  j0.new  %arg8))
                            (define %0 (*  j0.new.div  %arg0))
                            (define %lastidx2 (-  %elemsize0  1))
                            (define %1 (+  %0  %lastidx2))
                            (define %2 (extract  %1 %0 b))
                            (define %5 (extract  %1 %0 c))
                            (define %7.ab0 (bvsizeext  %2 %arg6 %arg7))
                            (define %8.ab0 (bvsizeext  %5 %arg6 %arg5))
                            (define %9 (bvmul  %7.ab0  %8.ab0))
                            (define %lastidx0 (-  %arg0  1))
                            (define %12 (+  %0  %lastidx0))
                            (define %13 (extract  %12 %0 a))
                            (define %lastidx1 (-  %arg3  1))
                            (define %highidx0 (+  %lastidx1  %arg4))
                            (define %14 (extract  %highidx0 %arg4 %9))
                            (define %15.ab0 (bvsizeext  %14 %arg0 %arg2))
                            (define %16.ab0 (bvaddnw %13 %15.ab0 %arg0 %arg1 ))
                            %16.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg9)
  )

(define (_mm_min_epu16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %4 (extract  %1 j0.new b))
                            (define %5.ab0 (bvmin %2 %4 %arg0 ))
                            %5.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm_andnot_si128  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %4 (+  %inner.it  %arg0))
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %5 (+  %4  %lastidx0))
                            (define %0 (extract  %5 %4 a))
                            (define %1 (bvnot  %0))
                            (define %2 (extract  %5 %4 b))
                            (define %3 (bvand  %1  %2))
                            %3
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm256_maskz_cvtepi16_epi8  k.perm %arg0.perm %arg4.perm a.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %arg1.perm %arg2.perm %arg3.perm %alpha.arg0.perm %arg5.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %arg2.perm))
                            (define %lastidx0.perm (-  %arg1.perm  1))
                            (define %highidx0.perm (+  j0.new.div.perm  %lastidx0.perm))
                            (define %2.perm (extract  %highidx0.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %2.perm  %arg0.perm))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %factor0.perm (/  %arg3.perm  %elemsize0.perm))
                                 (define %factor1.perm (*  %alpha.arg0.perm  %factor0.perm))
                                 (define %0.copy.0.new0.perm (*  j0.new.perm  %factor1.perm))
                                 (define %lastidx2.perm (-  %arg3.perm  1))
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
                                      (define %9.perm (extract  %8.perm j0.new.perm %arg4.perm))
                                      %9.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm %arg5.perm)
  )

(define (_mm_test_epi64_mask  %arg2.perm b.perm %arg1.perm %arg0.perm a.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %arg3.perm %alpha.arg0.perm %arg4.perm )
  (define k.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (apply
                  concat
                  (for/list ([j0.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                            (define %factor0.perm (/  %arg3.perm  %elemsize0.perm))
                            (define %factor1.perm (*  %alpha.arg0.perm  %factor0.perm))
                            (define %0.perm (*  j0.perm  %factor1.perm))
                            (define %lastidx1.perm (-  %arg3.perm  1))
                            (define %1.perm (+  %0.perm  %lastidx1.perm))
                            (define %2.perm (extract  %1.perm %0.perm a.perm))
                            (define %4.perm (extract  %1.perm %0.perm b.perm))
                            (define %5.perm (bvand  %2.perm  %4.perm))
                            (define %6.perm (not (bveq  %5.perm  %arg2.perm )))
                            (define %7.perm (if (equal? %6.perm #t) %arg0.perm %arg1.perm))
                            %7.perm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.perm %arg4.perm)
  )

(define (_mm512_cvtepu8_epi32  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %2 (+  j0.new  %lastidx1))
                            (define %3 (extract  %2 j0.new a))
                            (define %4.ab0 (bvsizeext  %3 %arg0 %arg1))
                            %4.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm256_mask_cmpgt_epu64_mask  k1.norm %arg0.norm %arg3.norm %arg2.norm %arg6.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg4.norm %arg5.norm %alpha.arg0.norm %arg7.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.norm k1.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %factor0.norm (/  %arg5.norm  %elemsize0.norm))
                                 (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                                 (define %0.copy.0.norm (*  j0.norm  %factor1.norm))
                                 (define %lastidx2.norm (-  %arg5.norm  1))
                                 (define %2.norm (+  %0.copy.0.norm  %lastidx2.norm))
                                 (define %3.norm (extract  %2.norm %0.copy.0.norm a.norm))
                                 (define %5.norm (extract  %2.norm %0.copy.0.norm b.norm))
                                 (define %6.ab0.norm (bvgt %3.norm %5.norm %arg4.norm ))
                                 (define %7.norm (if (equal? %6.ab0.norm #t) %arg2.norm %arg3.norm))
                                 %7.norm
                                 )]
                              [else (begin
                                      (define %lastidx3.norm (-  %elemsize0.norm  1))
                                      (define %highidx2.norm (+  j0.norm  %lastidx3.norm))
                                      (define %8.norm (extract  %highidx2.norm j0.norm %arg6.norm))
                                      %8.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg7.norm)
  )

(define (_mm_maskz_unpacklo_epi64  k.norm %arg6.norm %arg9.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %vectsize1.norm %outerlanesize1.norm %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm %arg0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg5.norm %arg7.norm %arg8.norm %arg10.norm )
  (define tmp_dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([%inner.it.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx3.norm (-  %arg3.norm  1))
                            (define %highidx3.norm (+  %lastidx3.norm  %arg5.norm))
                            (define %0.copy.copy.00.new.norm (extract  %highidx3.norm %arg5.norm a.norm))
                            (define %lastidx1.norm (-  %arg0.norm  1))
                            (define %highidx1.norm (+  %lastidx1.norm  %arg2.norm))
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
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize1.norm %outerlanesize1.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg8.norm))
                            (define %lastidx4.norm (-  %arg7.norm  1))
                            (define %highidx4.norm (+  j0.new.div.norm  %lastidx4.norm))
                            (define %4.norm (extract  %highidx4.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %4.norm  %arg6.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx5.norm (-  %elemsize1.norm  1))
                                 (define %6.norm (+  j0.new.norm  %lastidx5.norm))
                                 (define %7.norm (extract  %6.norm j0.new.norm tmp_dst0.norm))
                                 %7.norm
                                 )]
                              [else (begin
                                      (define %lastidx6.norm (-  %elemsize1.norm  1))
                                      (define %10.norm (+  j0.new.norm  %lastidx6.norm))
                                      (define %11.norm (extract  %10.norm j0.new.norm %arg9.norm))
                                      %11.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg10.norm)
  )

(define (_mm512_maskz_unpackhi_epi64  %arg6.perm k.perm %arg9.perm a.perm b.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %vectsize1.perm %outerlanesize1.perm %innerlaneoffset1.perm %innerlanesize1.perm %elemsize1.perm %arg0.perm %arg1.perm %arg2.perm %arg3.perm %arg4.perm %arg5.perm %arg7.perm %arg8.perm %arg10.perm )
  (define tmp_dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (apply
                  concat
                  (for/list ([iterator.0.new.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                            (define iterator.0.new.mul.perm (*  iterator.0.new.perm  %arg5.perm))
                            (define %0.site0.new.low.idx.perm (+  iterator.0.new.mul.perm  %arg4.perm))
                            (define %lastidx1.perm (-  %arg0.perm  1))
                            (define %0.site0.new.high.idx0.perm (+  %0.site0.new.low.idx.perm  %lastidx1.perm))
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
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize1.perm %outerlanesize1.perm))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range %innerlaneoffset1.perm %innerlanesize1.perm %elemsize1.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %arg8.perm))
                            (define %lastidx3.perm (-  %arg7.perm  1))
                            (define %highidx2.perm (+  j0.new.div.perm  %lastidx3.perm))
                            (define %13.perm (extract  %highidx2.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %13.perm  %arg6.perm))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx4.perm (-  %elemsize1.perm  1))
                                 (define %15.perm (+  j0.new.perm  %lastidx4.perm))
                                 (define %16.perm (extract  %15.perm j0.new.perm tmp_dst.perm))
                                 %16.perm
                                 )]
                              [else (begin
                                      (define %lastidx5.perm (-  %elemsize1.perm  1))
                                      (define %19.perm (+  j0.new.perm  %lastidx5.perm))
                                      (define %20.perm (extract  %19.perm j0.new.perm %arg9.perm))
                                      %20.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm %arg10.perm)
  )

(define (_mm512_mask_div_epi32  %arg0.norm k.norm src.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg5.norm %arg6.norm %arg7.norm %arg8.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %2.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %2.norm j0.new.norm a.norm))
                                 (define %5.norm (extract  %2.norm j0.new.norm b.norm))
                                 (define %6.ab0.norm (bvsizeext  %3.norm %arg7.norm %arg6.norm))
                                 (define %7.ab0.norm (bvsizeext  %5.norm %arg5.norm %arg4.norm))
                                 (define %8.ab0.norm (bvdiv %6.ab0.norm %7.ab0.norm %arg3.norm ))
                                 (define %9.norm.high.idx (- %elemsize0.norm 1))
                                 (define %9.norm.low.idx 0)
                                 (define %9.norm (extract  %9.norm.high.idx %9.norm.low.idx %8.ab0.norm))
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
  (bvpadhighbits  dst.norm %arg8.norm)
  )

(define (_mm_maskz_sll_epi32  k.norm %arg0.norm count.norm %arg12.norm %arg8.norm %arg3.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg4.norm %arg5.norm %arg6.norm %arg7.norm %arg9.norm %arg10.norm %arg11.norm %arg13.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %arg5.norm  1))
                                 (define %highidx1.norm (+  %lastidx1.norm  %arg6.norm))
                                 (define %2.norm (extract  %highidx1.norm %arg6.norm count.norm))
                                 (define %3.ab0.norm (bvgt %2.norm %arg3.norm %arg4.norm ))
                                 (cond
                                   [(equal? %3.ab0.norm #t)
                                    (begin
                                      (define %lastidx2.norm (-  %arg7.norm  1))
                                      (define %5.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %15.norm (extract  %5.norm j0.new.norm %arg8.norm))
                                      %15.norm
                                      )]
                                   [else (begin
                                           (define %lastidx3.norm (-  %arg7.norm  1))
                                           (define %6.norm (+  j0.new.norm  %lastidx3.norm))
                                           (define %7.norm (extract  %6.norm j0.new.norm a.norm))
                                           (define %lastidx4.norm (-  %arg10.norm  1))
                                           (define %highidx2.norm (+  %lastidx4.norm  %arg11.norm))
                                           (define %8.norm (extract  %highidx2.norm %arg11.norm count.norm))
                                           (define %9.ab0.norm (bvsizeext  %7.norm %arg10.norm %arg9.norm))
                                           (define %10.norm (bvshl  %9.ab0.norm  %8.norm))
                                           (define %12.norm.high.idx (- %arg10.norm 1))
                                           (define %12.norm.low.idx (+ (- %12.norm.high.idx %arg7.norm) 1) )
                                           (define %12.norm (extract  %12.norm.high.idx %12.norm.low.idx %10.norm))
                                           %12.norm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx5.norm (-  %arg7.norm  1))
                                      (define %14.norm (+  j0.new.norm  %lastidx5.norm))
                                      (define %16.norm (extract  %14.norm j0.new.norm %arg12.norm))
                                      %16.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg13.norm)
  )

(define (_mm512_and_epi32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
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

(define (_mm256_mask_dpbusd_epi32  k.norm %arg0.norm src.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg5.norm %arg6.norm %arg7.norm %arg8.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([j0.new.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                (define %lastidx0.norm (-  %arg1.norm  1))
                (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                (define %0.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                (define %cond0.norm (bveq  %0.norm  %arg0.norm))
                (cond
                  [(equal? %cond0.norm #t)
                   (begin
                     (define %lastidx1.norm (-  %outerlanesize0.norm  1))
                     (define %56.clone.0.norm (+  j0.new.norm  %lastidx1.norm))
                     (define %57.clone.0.norm (extract  %56.clone.0.norm j0.new.norm src.norm))
                     (define dst.norm %57.clone.0.norm)
                     (define %12.ext0.norm.red
                       (apply
                         bvadd
                         (for/list ([iterator.0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                                   (define %2.new0.norm (+  j0.new.norm  iterator.0.new.norm))
                                   (define %lastidx3.norm (-  %elemsize0.norm  1))
                                   (define %3.norm (+  %2.new0.norm  %lastidx3.norm))
                                   (define %4.norm (extract  %3.norm %2.new0.norm a.norm))
                                   (define %5.ab0.norm (bvsizeext  %4.norm %arg6.norm %arg7.norm))
                                   (define %9.norm (extract  %3.norm %2.new0.norm b.norm))
                                   (define %10.ab0.norm (bvsizeext  %9.norm %arg6.norm %arg5.norm))
                                   (define %11.norm (bvmul  %5.ab0.norm  %10.ab0.norm))
                                   (define %12.ab0.norm (bvsizeext  %11.norm %outerlanesize0.norm %arg4.norm))
                                   %12.ab0.norm
                                   )
                         ))
                     (define %lastidx2.norm (-  %outerlanesize0.norm  1))
                     (define %63.clone.4.norm (+  j0.new.norm  %lastidx2.norm))
                     (define %12.acc0.ab0.norm (bvaddnw %12.ext0.norm.red dst.norm %outerlanesize0.norm %arg3.norm))
                     %12.acc0.ab0.norm
                     )]
                  [else (begin
                          (apply
                            concat
                            (for/list ([%outer.it.norm (reverse (range %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm))])
                                      (define %lastidx4.norm (-  %outerlanesize0.norm  1))
                                      (define %65.norm (+  j0.new.norm  %lastidx4.norm))
                                      (define %66.norm (extract  %65.norm j0.new.norm src.norm))
                                      %66.norm
                                      )
                            )
                          )]
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg8.norm)
  )

(define (_m_pslld  count.norm %arg5.norm %arg0.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg6.norm %arg7.norm %arg8.norm %arg9.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg2.norm  1))
                            (define %highidx0.norm (+  %lastidx0.norm  %arg3.norm))
                            (define %1.norm (extract  %highidx0.norm %arg3.norm count.norm))
                            (define %2.ab0.norm (bvgt %1.norm %arg0.norm %arg1.norm ))
                            (cond
                              [(equal? %2.ab0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %arg4.norm  1))
                                 (define %4.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %12.norm (extract  %4.norm j0.new.norm %arg5.norm))
                                 %12.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %arg4.norm  1))
                                      (define %5.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %6.norm (extract  %5.norm j0.new.norm a.norm))
                                      (define %lastidx3.norm (-  %arg7.norm  1))
                                      (define %highidx1.norm (+  %lastidx3.norm  %arg8.norm))
                                      (define %7.norm (extract  %highidx1.norm %arg8.norm count.norm))
                                      (define %8.ab0.norm (bvsizeext  %6.norm %arg7.norm %arg6.norm))
                                      (define %9.norm (bvshl  %8.ab0.norm  %7.norm))
                                      (define %11.norm.high.idx (- %arg7.norm 1))
                                      (define %11.norm.low.idx (+ (- %11.norm.high.idx %arg4.norm) 1) )
                                      (define %11.norm (extract  %11.norm.high.idx %11.norm.low.idx %9.norm))
                                      %11.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg9.norm)
  )

(define (_mm512_andnot_epi32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
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
  (bvpadhighbits  dst %arg0)
  )

(define (_mm512_mask_mulhi_epu32  k.norm %arg0.norm %arg3.norm src.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg4.norm %arg5.norm %arg6.norm %arg7.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %3.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %4.norm (extract  %3.norm j0.new.norm a.norm))
                                 (define %6.norm (extract  %3.norm j0.new.norm b.norm))
                                 (define %7.ab0.norm (bvsizeext  %4.norm %arg5.norm %arg6.norm))
                                 (define %8.ab0.norm (bvsizeext  %6.norm %arg5.norm %arg4.norm))
                                 (define %9.norm (bvmul  %7.ab0.norm  %8.ab0.norm))
                                 (define %10.norm (bvashr  %9.norm  %arg3.norm))
                                 (define %12.norm.high.idx (- %arg5.norm 1))
                                 (define %12.norm.low.idx (+ (- %12.norm.high.idx %elemsize0.norm) 1) )
                                 (define %12.norm (extract  %12.norm.high.idx %12.norm.low.idx %10.norm))
                                 %12.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %14.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %15.norm (extract  %14.norm j0.new.norm src.norm))
                                      %15.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg7.norm)
  )

(define (_mm512_subs_epi8  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  j0.new  %lastidx0))
                            (define %2 (extract  %1 j0.new a))
                            (define %4 (extract  %1 j0.new b))
                            (define %5.ab0 (bvsubnw %2 %4 %elemsize0 %arg0 ))
                            %5.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_mm256_rol_epi32  %arg5 %arg2 a imm8 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg3 %arg4 %arg6 %arg7 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define %0.new0 (*  j0.new  %factor1))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  %0.new0  %lastidx0))
                            (define %2 (extract  %1 %0.new0 a))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %highidx0 (+  %lastidx1  %arg6))
                            (define %3 (extract  %highidx0 %arg6 imm8))
                            (define %0.site0 (bvsmod  %3  %arg5))
                            (define %1.site0.ab0 (bvsizeext  %0.site0 %arg0 %arg4))
                            (define %2.site0 (bvshl  %2  %1.site0.ab0))
                            (define %3.site0.ab0 (bvsubnw %arg2 %0.site0 8 %arg3 ))
                            (define %4.site0.ab0 (bvsizeext  %3.site0.ab0 %arg0 %arg1))
                            (define %5.site0 (bvashr  %2  %4.site0.ab0))
                            (define %6.site0 (bvor  %2.site0  %5.site0))
                            %6.site0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg7)
  )

(define (_m_from_int  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %1 (+  %inner.it  %arg0))
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %2 (+  %1  %lastidx0))
                            (define %0 (extract  %2 %1 a))
                            %0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_m_psrld  count.norm %arg5.norm %arg0.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg6.norm %arg7.norm %arg8.norm %arg9.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg2.norm  1))
                            (define %highidx0.norm (+  %lastidx0.norm  %arg3.norm))
                            (define %1.norm (extract  %highidx0.norm %arg3.norm count.norm))
                            (define %2.ab0.norm (bvgt %1.norm %arg0.norm %arg1.norm ))
                            (cond
                              [(equal? %2.ab0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %arg4.norm  1))
                                 (define %4.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %12.norm (extract  %4.norm j0.new.norm %arg5.norm))
                                 %12.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %arg4.norm  1))
                                      (define %5.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %6.norm (extract  %5.norm j0.new.norm a.norm))
                                      (define %lastidx3.norm (-  %arg7.norm  1))
                                      (define %highidx1.norm (+  %lastidx3.norm  %arg8.norm))
                                      (define %7.norm (extract  %highidx1.norm %arg8.norm count.norm))
                                      (define %8.ab0.norm (bvsizeext  %6.norm %arg7.norm %arg6.norm))
                                      (define %9.norm (bvlshr  %8.ab0.norm  %7.norm))
                                      (define %11.norm.high.idx (- %arg7.norm 1))
                                      (define %11.norm.low.idx (+ (- %11.norm.high.idx %arg4.norm) 1) )
                                      (define %11.norm (extract  %11.norm.high.idx %11.norm.low.idx %9.norm))
                                      %11.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg9.norm)
  )

(define (_mm512_mask_fmadd_epi32  k.norm %arg0.norm a.norm b.norm c.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg5.norm %arg6.norm %arg7.norm %arg8.norm %arg9.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %3.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %4.norm (extract  %3.norm j0.new.norm a.norm))
                                 (define %6.norm (extract  %3.norm j0.new.norm b.norm))
                                 (define %7.ab0.norm (bvsizeext  %4.norm %arg7.norm %arg8.norm))
                                 (define %8.ab0.norm (bvsizeext  %6.norm %arg7.norm %arg6.norm))
                                 (define %9.norm (bvmul  %7.ab0.norm  %8.ab0.norm))
                                 (define %11.norm (extract  %3.norm j0.new.norm c.norm))
                                 (define %12.ab0.norm (bvsizeext  %11.norm %arg5.norm %arg4.norm))
                                 (define %13.ab0.norm (bvaddnw %9.norm %12.ab0.norm %arg7.norm %arg3.norm ))
                                 (define %15.norm.high.idx 63 )
                                 (define %15.norm.low.idx (+ (- %15.norm.high.idx %elemsize0.norm) 1) )
                                 (define %15.norm (extract  %15.norm.high.idx %15.norm.low.idx %13.ab0.norm))
                                 %15.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %17.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %18.norm (extract  %17.norm j0.new.norm a.norm))
                                      %18.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg9.norm)
  )

(define (_mm512_srli_epi16  imm8.norm %arg5.norm %arg0.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %alpha.arg0.norm %alpha.arg1.norm %arg6.norm %arg7.norm %arg8.norm %arg9.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg2.norm  1))
                            (define %highidx0.norm (+  %lastidx0.norm  %arg3.norm))
                            (define %1.norm (extract  %highidx0.norm %arg3.norm imm8.norm))
                            (define %2.ab0.norm (bvgt %1.norm %arg0.norm %arg1.norm ))
                            (cond
                              [(equal? %2.ab0.norm #t)
                               (begin
                                 (define %factor0.norm (/  %arg4.norm  %elemsize0.norm))
                                 (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                                 (define %0.copy.0.new0.norm (*  j0.new.norm  %factor1.norm))
                                 (define %lastidx1.norm (-  %arg4.norm  1))
                                 (define %4.norm (+  %0.copy.0.new0.norm  %lastidx1.norm))
                                 (define %11.norm (extract  %4.norm %0.copy.0.new0.norm %arg5.norm))
                                 %11.norm
                                 )]
                              [else (begin
                                      (define %factor2.norm (/  %arg4.norm  %elemsize0.norm))
                                      (define %factor3.norm (*  %alpha.arg1.norm  %factor2.norm))
                                      (define %0.copy.2.new0.norm (*  j0.new.norm  %factor3.norm))
                                      (define %lastidx2.norm (-  %arg4.norm  1))
                                      (define %5.norm (+  %0.copy.2.new0.norm  %lastidx2.norm))
                                      (define %6.norm (extract  %5.norm %0.copy.2.new0.norm a.norm))
                                      (define %lastidx3.norm (-  %arg7.norm  1))
                                      (define %highidx1.norm (+  %lastidx3.norm  %arg8.norm))
                                      (define %7.norm (extract  %highidx1.norm %arg8.norm imm8.norm))
                                      (define %8.ab0.norm (bvsizeext  %7.norm %arg4.norm %arg6.norm))
                                      (define %9.norm (bvlshr  %6.norm  %8.ab0.norm))
                                      %9.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg9.norm)
  )

(define (_mm512_cmpneq_epu8_mask  %arg1.norm a.norm %arg0.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %alpha.arg0.norm %arg3.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                            (define %0.norm (*  j0.norm  %factor1.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %1.norm (+  %0.norm  %lastidx1.norm))
                            (define %2.norm (extract  %1.norm %0.norm a.norm))
                            (define %4.norm (extract  %1.norm %0.norm b.norm))
                            (define %5.norm (not (bveq  %2.norm  %4.norm )))
                            (define %6.norm (if (equal? %5.norm #t) %arg0.norm %arg1.norm))
                            %6.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  k.norm %arg3.norm)
  )

(define (_mm512_mask_srlv_epi64  %arg0.perm count.perm k.perm src.perm %arg7.perm %arg3.perm a.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %arg1.perm %arg2.perm %arg4.perm %arg5.perm %arg6.perm %arg8.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %arg2.perm))
                            (define %lastidx0.perm (-  %arg1.perm  1))
                            (define %highidx0.perm (+  j0.new.div.perm  %lastidx0.perm))
                            (define %1.perm (extract  %highidx0.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  %arg0.perm))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %arg5.perm  1))
                                 (define %2.perm (+  j0.new.perm  %lastidx1.perm))
                                 (define %3.perm (extract  %2.perm j0.new.perm count.perm))
                                 (define %4.ab0.perm (bvlt %3.perm %arg3.perm %arg4.perm ))
                                 (cond
                                   [(equal? %4.ab0.perm #t)
                                    (begin
                                      (define %lastidx2.perm (-  %arg6.perm  1))
                                      (define %5.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %6.perm (extract  %5.perm j0.new.perm a.perm))
                                      (define %8.perm (extract  %5.perm j0.new.perm count.perm))
                                      (define %9.perm (bvlshr  %6.perm  %8.perm))
                                      %9.perm
                                      )]
                                   [else (begin
                                           (define %lastidx3.perm (-  %arg6.perm  1))
                                           (define %12.perm (+  j0.new.perm  %lastidx3.perm))
                                           (define %17.perm (extract  %12.perm j0.new.perm %arg7.perm))
                                           %17.perm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx4.perm (-  %arg6.perm  1))
                                      (define %14.perm (+  j0.new.perm  %lastidx4.perm))
                                      (define %15.perm (extract  %14.perm j0.new.perm src.perm))
                                      %15.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm %arg8.perm)
  )

(define (_mm512_maskz_mulhi_epi16  %arg0.perm k.perm %arg7.perm a.perm b.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %arg1.perm %arg2.perm %arg3.perm %arg4.perm %arg5.perm %arg6.perm %arg8.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %arg2.perm))
                            (define %lastidx0.perm (-  %arg1.perm  1))
                            (define %highidx0.perm (+  j0.new.div.perm  %lastidx0.perm))
                            (define %1.perm (extract  %highidx0.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  %arg0.perm))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %elemsize0.perm  1))
                                 (define %2.perm (+  j0.new.perm  %lastidx1.perm))
                                 (define %3.perm (extract  %2.perm j0.new.perm a.perm))
                                 (define %4.ab0.perm (bvsizeext  %3.perm %arg5.perm %arg6.perm))
                                 (define %6.perm (extract  %2.perm j0.new.perm b.perm))
                                 (define %7.ab0.perm (bvsizeext  %6.perm %arg5.perm %arg4.perm))
                                 (define %8.perm (bvmul  %4.ab0.perm  %7.ab0.perm))
                                 (define %lastidx2.perm (-  %elemsize0.perm  1))
                                 (define %highidx1.perm (+  %lastidx2.perm  %arg3.perm))
                                 (define %9.perm (extract  %highidx1.perm %arg3.perm %8.perm))
                                 %9.perm
                                 )]
                              [else (begin
                                      (define %lastidx3.perm (-  %elemsize0.perm  1))
                                      (define %12.perm (+  j0.new.perm  %lastidx3.perm))
                                      (define %13.perm (extract  %12.perm j0.new.perm %arg7.perm))
                                      %13.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm %arg8.perm)
  )

(define (_mm512_cvtusepi64_epi32  a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %alpha.arg0 %arg2 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg1  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define %0.new0 (*  j0.new  %factor1))
                            (define %lastidx1 (-  %arg1  1))
                            (define %2 (+  %0.new0  %lastidx1))
                            (define %3 (extract  %2 %0.new0 a))
                            (define %4.ab0 (bvsaturate  %3 %arg1 %elemsize0 %arg0))
                            %4.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg2)
  )

(define (_mm512_slli_epi16  imm8.norm %arg5.norm %arg0.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %alpha.arg0.norm %alpha.arg1.norm %arg6.norm %arg7.norm %arg8.norm %arg9.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg2.norm  1))
                            (define %highidx0.norm (+  %lastidx0.norm  %arg3.norm))
                            (define %1.norm (extract  %highidx0.norm %arg3.norm imm8.norm))
                            (define %2.ab0.norm (bvgt %1.norm %arg0.norm %arg1.norm ))
                            (cond
                              [(equal? %2.ab0.norm #t)
                               (begin
                                 (define %factor0.norm (/  %arg4.norm  %elemsize0.norm))
                                 (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                                 (define %0.copy.0.new0.norm (*  j0.new.norm  %factor1.norm))
                                 (define %lastidx1.norm (-  %arg4.norm  1))
                                 (define %4.norm (+  %0.copy.0.new0.norm  %lastidx1.norm))
                                 (define %11.norm (extract  %4.norm %0.copy.0.new0.norm %arg5.norm))
                                 %11.norm
                                 )]
                              [else (begin
                                      (define %factor2.norm (/  %arg4.norm  %elemsize0.norm))
                                      (define %factor3.norm (*  %alpha.arg1.norm  %factor2.norm))
                                      (define %0.copy.2.new0.norm (*  j0.new.norm  %factor3.norm))
                                      (define %lastidx2.norm (-  %arg4.norm  1))
                                      (define %5.norm (+  %0.copy.2.new0.norm  %lastidx2.norm))
                                      (define %6.norm (extract  %5.norm %0.copy.2.new0.norm a.norm))
                                      (define %lastidx3.norm (-  %arg7.norm  1))
                                      (define %highidx1.norm (+  %lastidx3.norm  %arg8.norm))
                                      (define %7.norm (extract  %highidx1.norm %arg8.norm imm8.norm))
                                      (define %8.ab0.norm (bvsizeext  %7.norm %arg4.norm %arg6.norm))
                                      (define %9.norm (bvshl  %6.norm  %8.ab0.norm))
                                      %9.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg9.norm)
  )

(define (_mm256_mask_unpackhi_epi16  %arg4.norm k.norm src.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %vectsize1.norm %outerlanesize1.norm %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm %arg0.norm %arg1.norm %arg2.norm %alpha.arg0.norm %arg3.norm %arg5.norm %arg6.norm %arg7.norm )
  (define tmp_dst0.norm
    (apply
      concat
      (for/list ([iterator.0.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([iterator.0.site0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                            (define iterator.0.site0.new.mul.norm (*  iterator.0.site0.new.norm  %factor1.norm))
                            (define %low.offset0.site0.norm (+  iterator.0.site0.new.norm  %arg3.norm))
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
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize1.norm %outerlanesize1.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg6.norm))
                            (define %lastidx3.norm (-  %arg5.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx3.norm))
                            (define %7.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %7.norm  %arg4.norm))
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
                                      (define %14.norm (extract  %13.norm j0.new.norm src.norm))
                                      %14.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg7.norm)
  )

(define (_mm512_maskz_unpacklo_epi16  %arg3.0 k.0 %arg6.0 a.0 b.0 %vectsize0.0 %outerlanesize0.0 %innerlaneoffset0.0 %innerlanesize0.0 %elemsize0.0 %vectsize1.0 %outerlanesize1.0 %innerlaneoffset1.0 %innerlanesize1.0 %elemsize1.0 %arg0.0 %arg1.0 %arg2.0 %alpha.arg0.0 %arg4.0 %arg5.0 %arg7.0 )
  (define tmp_dst.0
    (apply
      concat
      (for/list ([iterator.0.0 (reverse (range 0 %vectsize0.0 %outerlanesize0.0))])
                (apply
                  concat
                  (for/list ([iterator.0.site0.new.0 (reverse (range %innerlaneoffset0.0 %innerlanesize0.0 %elemsize0.0))])
                            (define %factor0.0 (/  %arg2.0  %elemsize0.0))
                            (define %factor1.0 (*  %alpha.arg0.0  %factor0.0))
                            (define iterator.0.site0.new.mul.0 (*  iterator.0.site0.new.0  %factor1.0))
                            (define %0.site0.new.low.idx.0 (+  iterator.0.0  iterator.0.site0.new.0))
                            (define %lastidx1.0 (-  %arg0.0  1))
                            (define %0.site0.new.high.idx0.0 (+  %0.site0.new.low.idx.0  %lastidx1.0))
                            (define %0.copy.copy.00.new.0 (extract  %0.site0.new.high.idx0.0 %0.site0.new.low.idx.0 a.0))
                            (define %1.copy.copy.00.new.0 (extract  %0.site0.new.high.idx0.0 %0.site0.new.low.idx.0 b.0))
                            (define %low.offset0.site0.0 (+  iterator.0.site0.new.mul.0  %arg1.0))
                            (concat %1.copy.copy.00.new.0 %0.copy.copy.00.new.0)
                            )
                  )
                )
      )
    )
  (define dst.0
    (apply
      concat
      (for/list ([%outer.it.0 (reverse (range 0 %vectsize1.0 %outerlanesize1.0))])
                (apply
                  concat
                  (for/list ([j0.new.0 (reverse (range %innerlaneoffset1.0 %innerlanesize1.0 %elemsize1.0))])
                            (define j0.new.div.0 (/  j0.new.0  %arg5.0))
                            (define %lastidx3.0 (-  %arg4.0  1))
                            (define %highidx0.0 (+  j0.new.div.0  %lastidx3.0))
                            (define %13.0 (extract  %highidx0.0 j0.new.div.0 k.0))
                            (define %cond0.0 (bveq  %13.0  %arg3.0))
                            (cond
                              [(equal? %cond0.0 #t)
                               (begin
                                 (define %lastidx4.0 (-  %elemsize1.0  1))
                                 (define %15.0 (+  j0.new.0  %lastidx4.0))
                                 (define %16.0 (extract  %15.0 j0.new.0 tmp_dst.0))
                                 %16.0
                                 )]
                              [else (begin
                                      (define %lastidx5.0 (-  %elemsize1.0  1))
                                      (define %19.0 (+  j0.new.0  %lastidx5.0))
                                      (define %23.0 (extract  %19.0 j0.new.0 %arg6.0))
                                      %23.0
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.0 %arg7.0)
  )

(define (_mm256_maskz_dpwssd_epi32  %arg0.perm k.perm src.perm %arg6.perm a.perm b.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %innerlaneoffset1.perm %innerlanesize1.perm %elemsize1.perm %arg1.perm %arg2.perm %arg3.perm %arg4.perm %arg5.perm %arg7.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([j0.new.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (define j0.new.div.perm (/  j0.new.perm  %arg2.perm))
                (define %lastidx0.perm (-  %arg1.perm  1))
                (define %highidx0.perm (+  j0.new.div.perm  %lastidx0.perm))
                (define %0.perm (extract  %highidx0.perm j0.new.div.perm k.perm))
                (define %cond0.perm (bveq  %0.perm  %arg0.perm))
                (cond
                  [(equal? %cond0.perm #t)
                   (begin
                     (define %lastidx1.perm (-  %outerlanesize0.perm  1))
                     (define %26.clone.0.perm (+  j0.new.perm  %lastidx1.perm))
                     (define %27.clone.0.perm (extract  %26.clone.0.perm j0.new.perm src.perm))
                     (define dst.perm %27.clone.0.perm)
                     (define %11.ext0.perm.red
                       (apply
                         bvadd
                         (for/list ([iterator.0.new.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                                   (define %2.new0.perm (+  j0.new.perm  iterator.0.new.perm))
                                   (define %lastidx3.perm (-  %elemsize0.perm  1))
                                   (define %3.perm (+  %2.new0.perm  %lastidx3.perm))
                                   (define %4.perm (extract  %3.perm %2.new0.perm a.perm))
                                   (define %5.ab0.perm (bvsizeext  %4.perm %outerlanesize0.perm %arg5.perm))
                                   (define %9.perm (extract  %3.perm %2.new0.perm b.perm))
                                   (define %10.ab0.perm (bvsizeext  %9.perm %outerlanesize0.perm %arg4.perm))
                                   (define %11.perm (bvmul  %5.ab0.perm  %10.ab0.perm))
                                   %11.perm
                                   )
                         ))
                     (define %lastidx2.perm (-  %outerlanesize0.perm  1))
                     (define %31.clone.2.perm (+  j0.new.perm  %lastidx2.perm))
                     (define %11.acc0.ab0.perm (bvaddnw %11.ext0.perm.red dst.perm %outerlanesize0.perm %arg3.perm))
                     %11.acc0.ab0.perm
                     )]
                  [else (begin
                          (apply
                            concat
                            (for/list ([%outer.it.perm (reverse (range %innerlaneoffset1.perm %innerlanesize1.perm %elemsize1.perm))])
                                      (define %lastidx4.perm (-  %outerlanesize0.perm  1))
                                      (define %33.perm (+  j0.new.perm  %lastidx4.perm))
                                      (define %34.perm (extract  %33.perm j0.new.perm %arg6.perm))
                                      %34.perm
                                      )
                            )
                          )]
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm %arg7.perm)
  )

(define (_mm512_mask_extracti32x4_epi32  k.norm %arg1.norm %arg2.norm %arg15.norm %arg0.norm %arg3.norm imm8.norm src.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %vectsize1.norm %outerlanesize1.norm %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm %arg4.norm %arg5.norm %arg6.norm %arg7.norm %arg8.norm %arg9.norm %arg10.norm %arg11.norm %arg12.norm %arg13.norm %arg14.norm %arg16.norm %arg17.norm %arg18.norm )
  (define tmp0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([%inner.it.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg4.norm  1))
                            (define %highidx0.norm (+  %lastidx0.norm  %arg5.norm))
                            (define %0.norm (extract  %highidx0.norm %arg5.norm imm8.norm))
                            (define %cond0.norm (bveq  %0.norm  %arg3.norm))
                            (define %cond1.norm (bveq  %0.norm  %arg2.norm))
                            (define %cond2.norm (bveq  %0.norm  %arg1.norm))
                            (define %cond3.norm (bveq  %0.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx2.norm (-  %arg6.norm  1))
                                 (define %highidx2.norm (+  %lastidx2.norm  %arg8.norm))
                                 (define %1.norm (extract  %highidx2.norm %arg8.norm a.norm))
                                 %1.norm
                                 )]
                              [(equal? %cond1.norm #t)
                               (begin
                                 (define %lastidx4.norm (-  %arg6.norm  1))
                                 (define %highidx4.norm (+  %lastidx4.norm  %arg10.norm))
                                 (define %2.norm (extract  %highidx4.norm %arg10.norm a.norm))
                                 %2.norm
                                 )]
                              [(equal? %cond2.norm #t)
                               (begin
                                 (define %lastidx6.norm (-  %arg6.norm  1))
                                 (define %highidx6.norm (+  %lastidx6.norm  %arg12.norm))
                                 (define %3.norm (extract  %highidx6.norm %arg12.norm a.norm))
                                 %3.norm
                                 )]
                              [(equal? %cond3.norm #t)
                               (begin
                                 (define %lastidx8.norm (-  %arg6.norm  1))
                                 (define %highidx8.norm (+  %lastidx8.norm  %arg14.norm))
                                 (define %4.norm (extract  %highidx8.norm %arg14.norm a.norm))
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
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize1.norm %outerlanesize1.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg17.norm))
                            (define %lastidx9.norm (-  %arg16.norm  1))
                            (define %highidx9.norm (+  j0.new.div.norm  %lastidx9.norm))
                            (define %6.norm (extract  %highidx9.norm j0.new.div.norm k.norm))
                            (define %cond4.norm (bveq  %6.norm  %arg15.norm))
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
  (bvpadhighbits  dst.norm %arg18.norm)
  )

(define (_mm512_mask_cvtepi16_epi64  k.norm %arg0.norm src.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %alpha.arg0.norm %arg4.norm %alpha.arg1.norm %arg5.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %2.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %2.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx2.norm (-  %elemsize0.norm  1))
                                 (define %3.norm (+  j0.new.norm  %lastidx2.norm))
                                 (define %4.norm (extract  %3.norm j0.new.norm a.norm))
                                 (define %5.ab0.norm (bvsizeext  %4.norm %arg3.norm %arg4.norm))
                                 %5.ab0.norm
                                 )]
                              [else (begin
                                      (define %factor2.norm (/  %arg3.norm  %elemsize0.norm))
                                      (define %factor3.norm (*  %alpha.arg1.norm  %factor2.norm))
                                      (define %0.copy.2.new0.norm (*  j0.new.norm  %factor3.norm))
                                      (define %lastidx3.norm (-  %arg3.norm  1))
                                      (define %8.norm (+  %0.copy.2.new0.norm  %lastidx3.norm))
                                      (define %9.norm (extract  %8.norm %0.copy.2.new0.norm src.norm))
                                      %9.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg5.norm)
  )

(define (_mm_movepi32_mask  a.norm %arg0.norm %arg5.norm %arg4.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg6.norm )
  (define k.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %0.norm (*  j0.norm  %arg3.norm))
                            (define %1.norm (+  %0.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  %1.norm  %lastidx0.norm))
                            (define %2.norm (extract  %highidx0.norm %1.norm a.norm))
                            (define %cond0.norm (bveq  %2.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %highidx1.norm (+  j0.norm  %lastidx1.norm))
                                 (define %3.norm (extract  %highidx1.norm j0.norm %arg4.norm))
                                 %3.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %highidx2.norm (+  j0.norm  %lastidx2.norm))
                                      (define %4.norm (extract  %highidx2.norm j0.norm %arg5.norm))
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

(define (_m_por  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %3 (+  %inner.it  %arg0))
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %4 (+  %3  %lastidx0))
                            (define %0 (extract  %4 %3 a))
                            (define %1 (extract  %4 %3 b))
                            (define %2 (bvor  %0  %1))
                            %2
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg1)
  )

(define (_m_pcmpeqb  %arg1.norm b.norm a.norm %arg0.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
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
  (bvpadhighbits  dst.norm %arg2.norm)
  )

(define (_mm_extract_pi16  %arg3 a imm8 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg4 %arg5 %arg6 %arg7 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %7 (+  %inner.it  %arg6))
                            (define %lastidx2 (-  %arg2  1))
                            (define %8 (+  %7  %lastidx2))
                            (define %0 (extract  %8 %7 a))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %10 (+  %7  %lastidx1))
                            (define %1 (extract  %10 %7 imm8))
                            (define %2.ab0 (bvsizeext  %1 %arg5 %arg4))
                            (define %3 (bvmul  %2.ab0  %arg3))
                            (define %4.ab0 (bvsizeext  %3 %arg2 %arg1))
                            (define %5 (bvashr  %0  %4.ab0))
                            (define %lastidx0 (-  %arg0  1))
                            (define %12 (+  %7  %lastidx0))
                            (define %6 (extract  %12 %7 %5))
                            %6
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg7)
  )

(define (_mm256_mask_broadcast_i64x2  %arg0.0 k.0 src.0 a.0 %vectsize0.0 %outerlanesize0.0 %innerlaneoffset0.0 %innerlanesize0.0 %elemsize0.0 %arg1.0 %arg2.0 %arg3.0 %arg4.0 %arg5.0 )
  (define dst.0
    (apply
      concat
      (for/list ([%outer.it.0 (reverse (range 0 %vectsize0.0 %outerlanesize0.0))])
                (apply
                  concat
                  (for/list ([j0.new.0 (reverse (range %innerlaneoffset0.0 %innerlanesize0.0 %elemsize0.0))])
                            (define j0.new.div.0 (/  j0.new.0  %arg2.0))
                            (define %lastidx0.0 (-  %arg1.0  1))
                            (define %highidx0.0 (+  j0.new.div.0  %lastidx0.0))
                            (define %3.0 (extract  %highidx0.0 j0.new.div.0 k.0))
                            (define %cond0.0 (bveq  %3.0  %arg0.0))
                            (cond
                              [(equal? %cond0.0 #t)
                               (begin
                                 (define j0.new.div.copy.3.0 (/  j0.new.0  %arg4.0))
                                 (define %1.copy.0.0 (modulo  j0.new.div.copy.3.0  %arg3.0))
                                 (define %2.copy.0.0 (*  %1.copy.0.0  %elemsize0.0))
                                 (define %lastidx2.0 (-  %elemsize0.0  1))
                                 (define %5.0 (+  %2.copy.0.0  %lastidx2.0))
                                 (define %6.0 (extract  %5.0 %2.copy.0.0 a.0))
                                 %6.0
                                 )]
                              [else (begin
                                      (define %lastidx3.0 (-  %elemsize0.0  1))
                                      (define %9.0 (+  j0.new.0  %lastidx3.0))
                                      (define %10.0 (extract  %9.0 j0.new.0 src.0))
                                      %10.0
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.0 %arg5.0)
  )

(define (_mm256_hsub_epi32  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
  (define dst
    (apply
      concat
      (for/list ([iterator.lane (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %low.cofactor2 (*  iterator.1  %arg6))
                              (define %low.scaled.it3 (+  iterator.lane  %low.cofactor2))
                              (define %low.offset1.new0 (-  %low.scaled.it3  %arg5))
                              (define %lastidx5 (-  %elemsize1  1))
                              (define %high.offset3 (+  %low.offset1.new0  %lastidx5))
                              (define %6 (extract  %high.offset3 %low.offset1.new0 b))
                              (define %low.offset2.new0 (-  %low.scaled.it3  %arg4))
                              (define %lastidx4 (-  %elemsize1  1))
                              (define %high.offset4 (+  %low.offset2.new0  %lastidx4))
                              (define %7 (extract  %high.offset4 %low.offset2.new0 b))
                              (define %8.ab0 (bvsubnw %6 %7 %elemsize1 %arg3 ))
                              %8.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %low.cofactor0 (*  iterator.0  %arg2))
                              (define %low.scaled.it0 (+  iterator.lane  %low.cofactor0))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %high.offset0 (+  %low.scaled.it0  %lastidx2))
                              (define %0 (extract  %high.offset0 %low.scaled.it0 a))
                              (define %low.offset0 (+  %low.scaled.it0  %arg1))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %high.offset1 (+  %low.offset0  %lastidx1))
                              (define %1 (extract  %high.offset1 %low.offset0 a))
                              (define %2.ab0 (bvsubnw %0 %1 %elemsize0 %arg0 ))
                              %2.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg7)
  )

(define (_mm_hsub_epi16  a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %arg1 %alpha.arg0 %arg2 %arg3 %arg4 %arg5 %arg6 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([iterator.1 (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %low.cofactor2 (*  iterator.1  %arg5))
                              (define %low.offset1.new0 (-  %low.cofactor2  %arg4))
                              (define %lastidx5 (-  %elemsize1  1))
                              (define %high.offset3 (+  %low.offset1.new0  %lastidx5))
                              (define %12 (extract  %high.offset3 %low.offset1.new0 b))
                              (define %low.offset2.new0 (-  %low.cofactor2  %arg3))
                              (define %lastidx4 (-  %elemsize1  1))
                              (define %high.offset4 (+  %low.offset2.new0  %lastidx4))
                              (define %13 (extract  %high.offset4 %low.offset2.new0 b))
                              (define %14.ab0 (bvsubnw %12 %13 %elemsize1 %arg2 ))
                              %14.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %elemsize0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %low.cofactor0 (*  iterator.0  %factor1))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %high.offset0 (+  %low.cofactor0  %lastidx2))
                              (define %0 (extract  %high.offset0 %low.cofactor0 a))
                              (define %low.offset0 (+  %low.cofactor0  %arg1))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %high.offset1 (+  %low.offset0  %lastidx1))
                              (define %1 (extract  %high.offset1 %low.offset0 a))
                              (define %2.ab0 (bvsubnw %0 %1 %elemsize0 %arg0 ))
                              %2.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg6)
  )

(define (_mm512_mask_dpwssd_epi32  %arg0.norm k.norm src.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg5.norm %arg6.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([j0.new.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                (define %lastidx0.norm (-  %arg1.norm  1))
                (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                (define %0.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                (define %cond0.norm (bveq  %0.norm  %arg0.norm))
                (cond
                  [(equal? %cond0.norm #t)
                   (begin
                     (define %lastidx1.norm (-  %outerlanesize0.norm  1))
                     (define %26.clone.0.norm (+  j0.new.norm  %lastidx1.norm))
                     (define %27.clone.0.norm (extract  %26.clone.0.norm j0.new.norm src.norm))
                     (define dst.norm %27.clone.0.norm)
                     (define %11.ext0.norm.red
                       (apply
                         bvadd
                         (for/list ([iterator.0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                                   (define %2.new0.norm (+  j0.new.norm  iterator.0.new.norm))
                                   (define %lastidx3.norm (-  %elemsize0.norm  1))
                                   (define %3.norm (+  %2.new0.norm  %lastidx3.norm))
                                   (define %4.norm (extract  %3.norm %2.new0.norm a.norm))
                                   (define %5.ab0.norm (bvsizeext  %4.norm %outerlanesize0.norm %arg5.norm))
                                   (define %9.norm (extract  %3.norm %2.new0.norm b.norm))
                                   (define %10.ab0.norm (bvsizeext  %9.norm %outerlanesize0.norm %arg4.norm))
                                   (define %11.norm (bvmul  %5.ab0.norm  %10.ab0.norm))
                                   %11.norm
                                   )
                         ))
                     (define %lastidx2.norm (-  %outerlanesize0.norm  1))
                     (define %31.clone.2.norm (+  j0.new.norm  %lastidx2.norm))
                     (define %11.acc0.ab0.norm (bvaddnw %11.ext0.norm.red dst.norm %outerlanesize0.norm %arg3.norm))
                     %11.acc0.ab0.norm
                     )]
                  [else (begin
                          (apply
                            concat
                            (for/list ([%outer.it.norm (reverse (range %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm))])
                                      (define %lastidx4.norm (-  %outerlanesize0.norm  1))
                                      (define %33.norm (+  j0.new.norm  %lastidx4.norm))
                                      (define %34.norm (extract  %33.norm j0.new.norm src.norm))
                                      %34.norm
                                      )
                            )
                          )]
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg6.norm)
  )

(define (_mm256_ror_epi32  %arg5 %arg2 a imm8 %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg3 %arg4 %arg6 %arg7 )
  (define dst
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([j0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define %0.new0 (*  j0.new  %factor1))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  %0.new0  %lastidx0))
                            (define %2 (extract  %1 %0.new0 a))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %highidx0 (+  %lastidx1  %arg6))
                            (define %3 (extract  %highidx0 %arg6 imm8))
                            (define %0.site0 (bvsmod  %3  %arg5))
                            (define %1.site0.ab0 (bvsizeext  %0.site0 %arg0 %arg4))
                            (define %2.site0 (bvashr  %2  %1.site0.ab0))
                            (define %3.site0.ab0 (bvsubnw %arg2 %0.site0 8 %arg3 ))
                            (define %4.site0.ab0 (bvsizeext  %3.site0.ab0 %arg0 %arg1))
                            (define %5.site0 (bvshl  %2  %4.site0.ab0))
                            (define %6.site0 (bvor  %2.site0  %5.site0))
                            %6.site0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst %arg7)
  )

(define (_mm256_mask_srli_epi32  imm8.perm %arg0.perm k.perm src.perm %arg8.perm %arg3.perm a.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %arg1.perm %arg2.perm %arg4.perm %arg5.perm %arg6.perm %arg7.perm %arg9.perm %arg10.perm %arg11.perm %arg12.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %arg2.perm))
                            (define %lastidx0.perm (-  %arg1.perm  1))
                            (define %highidx0.perm (+  j0.new.div.perm  %lastidx0.perm))
                            (define %1.perm (extract  %highidx0.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  %arg0.perm))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %arg5.perm  1))
                                 (define %highidx1.perm (+  %lastidx1.perm  %arg6.perm))
                                 (define %2.perm (extract  %highidx1.perm %arg6.perm imm8.perm))
                                 (define %3.ab0.perm (bvgt %2.perm %arg3.perm %arg4.perm ))
                                 (cond
                                   [(equal? %3.ab0.perm #t)
                                    (begin
                                      (define %lastidx2.perm (-  %arg7.perm  1))
                                      (define %5.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %16.perm (extract  %5.perm j0.new.perm %arg8.perm))
                                      %16.perm
                                      )]
                                   [else (begin
                                           (define %lastidx3.perm (-  %arg7.perm  1))
                                           (define %6.perm (+  j0.new.perm  %lastidx3.perm))
                                           (define %7.perm (extract  %6.perm j0.new.perm a.perm))
                                           (define %lastidx4.perm (-  %arg10.perm  1))
                                           (define %highidx2.perm (+  %lastidx4.perm  %arg11.perm))
                                           (define %8.perm (extract  %highidx2.perm %arg11.perm imm8.perm))
                                           (define %9.ab0.perm (bvsizeext  %8.perm %arg7.perm %arg9.perm))
                                           (define %10.perm (bvlshr  %7.perm  %9.ab0.perm))
                                           %10.perm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx5.perm (-  %arg7.perm  1))
                                      (define %13.perm (+  j0.new.perm  %lastidx5.perm))
                                      (define %14.perm (extract  %13.perm j0.new.perm src.perm))
                                      %14.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm %arg12.perm)
  )

(define (_mm_mask_broadcastd_epi32  %arg0.norm k.norm src.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx2.norm (-  %elemsize0.norm  1))
                                 (define %highidx1.norm (+  %lastidx2.norm  %arg3.norm))
                                 (define %2.norm (extract  %highidx1.norm %arg3.norm a.norm))
                                 %2.norm
                                 )]
                              [else (begin
                                      (define %lastidx3.norm (-  %elemsize0.norm  1))
                                      (define %5.norm (+  j0.new.norm  %lastidx3.norm))
                                      (define %6.norm (extract  %5.norm j0.new.norm src.norm))
                                      %6.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg4.norm)
  )

(define (_mm_maskz_madd52lo_epu64  %arg0.norm k.norm %arg12.norm a.norm b.norm c.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg5.norm %arg6.norm %arg7.norm %arg8.norm %arg9.norm %arg10.norm %arg11.norm %arg13.norm %arg14.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define j0.new.div.copy.2.norm (/  j0.new.norm  %arg11.norm))
                                 (define %0.copy.0.norm (*  j0.new.div.copy.2.norm  %arg3.norm))
                                 (define %lastidx3.norm (-  %elemsize0.norm  1))
                                 (define %2.norm (+  %0.copy.0.norm  %lastidx3.norm))
                                 (define %3.norm (extract  %2.norm %0.copy.0.norm b.norm))
                                 (define %6.norm (extract  %2.norm %0.copy.0.norm c.norm))
                                 (define %8.ab0.norm (bvsizeext  %3.norm %arg9.norm %arg10.norm))
                                 (define %9.ab0.norm (bvsizeext  %6.norm %arg9.norm %arg8.norm))
                                 (define %10.norm (bvmul  %8.ab0.norm  %9.ab0.norm))
                                 (define %lastidx1.norm (-  %arg3.norm  1))
                                 (define %13.norm (+  %0.copy.0.norm  %lastidx1.norm))
                                 (define %14.norm (extract  %13.norm %0.copy.0.norm a.norm))
                                 (define %lastidx2.norm (-  %arg6.norm  1))
                                 (define %highidx1.norm (+  %lastidx2.norm  %arg7.norm))
                                 (define %15.norm (extract  %highidx1.norm %arg7.norm %10.norm))
                                 (define %16.ab0.norm (bvsizeext  %15.norm %arg3.norm %arg5.norm))
                                 (define %17.ab0.norm (bvaddnw %14.norm %16.ab0.norm %arg3.norm %arg4.norm ))
                                 %17.ab0.norm
                                 )]
                              [else (begin
                                      (define j0.new.div.copy.8.norm (/  j0.new.norm  %arg13.norm))
                                      (define %0.copy.6.norm (*  j0.new.div.copy.8.norm  %arg3.norm))
                                      (define %lastidx4.norm (-  %arg3.norm  1))
                                      (define %20.norm (+  %0.copy.6.norm  %lastidx4.norm))
                                      (define %21.norm (extract  %20.norm %0.copy.6.norm %arg12.norm))
                                      %21.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg14.norm)
  )

(define (_mm256_blendv_epi8  %arg0.norm mask.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %1.norm (+  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  %1.norm  %lastidx0.norm))
                            (define %2.norm (extract  %highidx0.norm %1.norm mask.norm))
                            (define %cond0.norm (bveq  %2.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %4.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %5.norm (extract  %4.norm j0.new.norm b.norm))
                                 %5.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %8.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %9.norm (extract  %8.norm j0.new.norm a.norm))
                                      %9.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg3.norm)
  )

(define (_mm512_srl_epi64  count.norm %arg5.norm %arg0.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg6.norm %arg7.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg2.norm  1))
                            (define %highidx0.norm (+  %lastidx0.norm  %arg3.norm))
                            (define %1.norm (extract  %highidx0.norm %arg3.norm count.norm))
                            (define %2.ab0.norm (bvgt %1.norm %arg0.norm %arg1.norm ))
                            (cond
                              [(equal? %2.ab0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %arg4.norm  1))
                                 (define %4.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %10.norm (extract  %4.norm j0.new.norm %arg5.norm))
                                 %10.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %arg4.norm  1))
                                      (define %5.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %6.norm (extract  %5.norm j0.new.norm a.norm))
                                      (define %lastidx3.norm (-  %arg4.norm  1))
                                      (define %highidx1.norm (+  %lastidx3.norm  %arg6.norm))
                                      (define %7.norm (extract  %highidx1.norm %arg6.norm count.norm))
                                      (define %8.norm (bvlshr  %6.norm  %7.norm))
                                      %8.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg7.norm)
  )

(define (_mm256_blend_epi16  imm8.norm %arg0.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg3.norm))
                            (define %1.norm (modulo  j0.new.div.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  %1.norm  %lastidx0.norm))
                            (define %2.norm (extract  %highidx0.norm %1.norm imm8.norm))
                            (define %cond0.norm (bveq  %2.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %4.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %5.norm (extract  %4.norm j0.new.norm b.norm))
                                 %5.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %8.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %9.norm (extract  %8.norm j0.new.norm a.norm))
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

(define (_mm_mask_sra_epi32  count.perm %arg0.perm k.perm %arg8.perm %arg10.perm %arg9.perm a.perm src.perm %arg3.perm %vectsize0.perm %outerlanesize0.perm %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm %arg1.perm %arg2.perm %arg4.perm %arg5.perm %arg6.perm %arg7.perm %arg11.perm %arg12.perm %arg13.perm %arg14.perm %arg15.perm )
  (define dst.perm
    (apply
      concat
      (for/list ([%outer.it.perm (reverse (range 0 %vectsize0.perm %outerlanesize0.perm))])
                (apply
                  concat
                  (for/list ([j0.new.perm (reverse (range %innerlaneoffset0.perm %innerlanesize0.perm %elemsize0.perm))])
                            (define j0.new.div.perm (/  j0.new.perm  %arg2.perm))
                            (define %lastidx0.perm (-  %arg1.perm  1))
                            (define %highidx0.perm (+  j0.new.div.perm  %lastidx0.perm))
                            (define %1.perm (extract  %highidx0.perm j0.new.div.perm k.perm))
                            (define %cond0.perm (bveq  %1.perm  %arg0.perm))
                            (cond
                              [(equal? %cond0.perm #t)
                               (begin
                                 (define %lastidx1.perm (-  %arg5.perm  1))
                                 (define %highidx1.perm (+  %lastidx1.perm  %arg6.perm))
                                 (define %2.perm (extract  %highidx1.perm %arg6.perm count.perm))
                                 (define %3.ab0.perm (bvgt %2.perm %arg3.perm %arg4.perm ))
                                 (cond
                                   [(equal? %3.ab0.perm #t)
                                    (begin
                                      (define %lastidx2.perm (-  %arg7.perm  1))
                                      (define %5.perm (+  j0.new.perm  %lastidx2.perm))
                                      (define %lastidx3.perm (-  %arg11.perm  1))
                                      (define %highidx2.perm (+  %5.perm  %lastidx3.perm))
                                      (define %6.perm (extract  %highidx2.perm %5.perm a.perm))
                                      (define %cond1.perm (bveq  %6.perm  %arg10.perm))
                                      (define %7.perm (if (equal? %cond1.perm #t) %arg8.perm %arg9.perm))
                                      %7.perm
                                      )]
                                   [else (begin
                                           (define %lastidx4.perm (-  %arg7.perm  1))
                                           (define %9.perm (+  j0.new.perm  %lastidx4.perm))
                                           (define %10.perm (extract  %9.perm j0.new.perm a.perm))
                                           (define %lastidx5.perm (-  %arg13.perm  1))
                                           (define %highidx3.perm (+  %lastidx5.perm  %arg14.perm))
                                           (define %11.perm (extract  %highidx3.perm %arg14.perm count.perm))
                                           (define %12.ab0.perm (bvsizeext  %10.perm %arg13.perm %arg12.perm))
                                           (define %13.perm (bvashr  %12.ab0.perm  %11.perm))
                                           (define %15.perm.high.idx (- %arg13.perm 1))
                                           (define %15.perm.low.idx (+ (- %15.perm.high.idx %arg7.perm) 1) )
                                           (define %15.perm (extract  %15.perm.high.idx %15.perm.low.idx %13.perm))
                                           %15.perm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx6.perm (-  %arg7.perm  1))
                                      (define %17.perm (+  j0.new.perm  %lastidx6.perm))
                                      (define %18.perm (extract  %17.perm j0.new.perm src.perm))
                                      %18.perm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.perm %arg15.perm)
  )

(define (_mm_movm_epi8  k.norm %arg0.norm %arg4.norm %arg3.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg5.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %3.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %6.norm (extract  %3.norm j0.new.norm %arg3.norm))
                                 %6.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %5.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %7.norm (extract  %5.norm j0.new.norm %arg4.norm))
                                      %7.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg5.norm)
  )

(define (_mm_maskz_sub_epi8  %arg0.norm k.norm %arg4.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg5.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %5.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %6.norm (extract  %5.norm j0.new.norm a.norm))
                                 (define %8.norm (extract  %5.norm j0.new.norm b.norm))
                                 (define %9.ab0.norm (bvsubnw %6.norm %8.norm %elemsize0.norm %arg3.norm ))
                                 %9.ab0.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %12.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %13.norm (extract  %12.norm j0.new.norm %arg4.norm))
                                      %13.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg5.norm)
  )

(define (_mm512_maskz_andnot_epi64  k.norm %arg0.norm %arg3.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg4.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %3.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %4.norm (extract  %3.norm j0.new.norm a.norm))
                                 (define %5.norm (bvnot  %4.norm))
                                 (define %7.norm (extract  %3.norm j0.new.norm b.norm))
                                 (define %8.norm (bvand  %5.norm  %7.norm))
                                 %8.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %elemsize0.norm  1))
                                      (define %11.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %12.norm (extract  %11.norm j0.new.norm %arg3.norm))
                                      %12.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg4.norm)
  )

(define (_mm512_mask_add_epi32  %arg0.norm k.norm src.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %elemsize0.norm  1))
                                 (define %5.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %6.norm (extract  %5.norm j0.new.norm a.norm))
                                 (define %8.norm (extract  %5.norm j0.new.norm b.norm))
                                 (define %9.ab0.norm (bvaddnw %6.norm %8.norm %elemsize0.norm %arg3.norm ))
                                 %9.ab0.norm
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
  (bvpadhighbits  dst.norm %arg4.norm)
  )

(define (_mm256_mask_and_epi32  k.norm %arg0.norm src.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
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
                                      (define %13.norm (extract  %12.norm j0.new.norm src.norm))
                                      %13.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg3.norm)
  )

(define (_mm_maskz_slli_epi32  imm8.norm k.norm %arg0.norm %arg12.norm %arg8.norm %arg3.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg4.norm %arg5.norm %arg6.norm %arg7.norm %arg9.norm %arg10.norm %arg11.norm %arg13.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                            (define %lastidx0.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                            (define %1.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                            (define %cond0.norm (bveq  %1.norm  %arg0.norm))
                            (cond
                              [(equal? %cond0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %arg5.norm  1))
                                 (define %highidx1.norm (+  %lastidx1.norm  %arg6.norm))
                                 (define %2.norm (extract  %highidx1.norm %arg6.norm imm8.norm))
                                 (define %3.ab0.norm (bvgt %2.norm %arg3.norm %arg4.norm ))
                                 (cond
                                   [(equal? %3.ab0.norm #t)
                                    (begin
                                      (define %lastidx2.norm (-  %arg7.norm  1))
                                      (define %5.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %14.norm (extract  %5.norm j0.new.norm %arg8.norm))
                                      %14.norm
                                      )]
                                   [else (begin
                                           (define %lastidx3.norm (-  %arg7.norm  1))
                                           (define %6.norm (+  j0.new.norm  %lastidx3.norm))
                                           (define %7.norm (extract  %6.norm j0.new.norm a.norm))
                                           (define %lastidx4.norm (-  %arg10.norm  1))
                                           (define %highidx2.norm (+  %lastidx4.norm  %arg11.norm))
                                           (define %8.norm (extract  %highidx2.norm %arg11.norm imm8.norm))
                                           (define %9.ab0.norm (bvsizeext  %8.norm %arg7.norm %arg9.norm))
                                           (define %10.norm (bvshl  %7.norm  %9.ab0.norm))
                                           %10.norm
                                           )]
                                   )
                                 )]
                              [else (begin
                                      (define %lastidx5.norm (-  %arg7.norm  1))
                                      (define %13.norm (+  j0.new.norm  %lastidx5.norm))
                                      (define %15.norm (extract  %13.norm j0.new.norm %arg12.norm))
                                      %15.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg13.norm)
  )

(define (_mm256_maddubs_epi16  %arg0 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg2 %arg3 %arg4 )
  (define dst
    (apply
      concat
      (for/list ([j0.new (reverse (range 0 %vectsize0 %outerlanesize0))])
                (define %lastidx0 (-  %outerlanesize0  1))
                (define %19.0 (+  j0.new  %lastidx0))
                (define %20 (extract  %19.0 j0.new %arg0))
                (define dst %20)
                (define %16.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %0.cloned0.new1 (+  j0.new  iterator.0))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %10.new0 (+  %0.cloned0.new1  %lastidx2))
                              (define %11 (extract  %10.new0 %0.cloned0.new1 a))
                              (define %13 (extract  %10.new0 %0.cloned0.new1 b))
                              (define %14.ab0 (bvsizeext  %11 %outerlanesize0 %arg3))
                              (define %15.ab0 (bvsizeext  %13 %outerlanesize0 %arg2))
                              (define %16 (bvmul  %14.ab0  %15.ab0))
                              %16
                              )
                    ))
                (define %lastidx1 (-  %outerlanesize0  1))
                (define %19.clone.1 (+  j0.new  %lastidx1))
                (define %16.acc0.ab0 (bvaddnw %16.ext0.red dst %outerlanesize0 %arg1))
                %16.acc0.ab0
                )
      )
    )
  (bvpadhighbits  dst %arg4)
  )

(define (_mm_maskz_dpbusds_epi32  k.norm %arg0.norm %arg8.norm src.norm a.norm b.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %arg5.norm %arg6.norm %arg7.norm %arg9.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([j0.new.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (define j0.new.div.norm (/  j0.new.norm  %arg2.norm))
                (define %lastidx0.norm (-  %arg1.norm  1))
                (define %highidx0.norm (+  j0.new.div.norm  %lastidx0.norm))
                (define %0.norm (extract  %highidx0.norm j0.new.div.norm k.norm))
                (define %cond0.norm (bveq  %0.norm  %arg0.norm))
                (cond
                  [(equal? %cond0.norm #t)
                   (begin
                     (define %lastidx1.norm (-  %outerlanesize0.norm  1))
                     (define %56.clone.0.norm (+  j0.new.norm  %lastidx1.norm))
                     (define %57.clone.0.norm (extract  %56.clone.0.norm j0.new.norm src.norm))
                     (define dst.norm %57.clone.0.norm)
                     (define %12.ext0.norm.red
                       (apply
                         bvadd
                         (for/list ([iterator.0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                                   (define %2.new0.norm (+  j0.new.norm  iterator.0.new.norm))
                                   (define %lastidx3.norm (-  %elemsize0.norm  1))
                                   (define %3.norm (+  %2.new0.norm  %lastidx3.norm))
                                   (define %4.norm (extract  %3.norm %2.new0.norm a.norm))
                                   (define %5.ab0.norm (bvsizeext  %4.norm %arg6.norm %arg7.norm))
                                   (define %9.norm (extract  %3.norm %2.new0.norm b.norm))
                                   (define %10.ab0.norm (bvsizeext  %9.norm %arg6.norm %arg5.norm))
                                   (define %11.norm (bvmul  %5.ab0.norm  %10.ab0.norm))
                                   (define %12.ab0.norm (bvsizeext  %11.norm %outerlanesize0.norm %arg4.norm))
                                   %12.ab0.norm
                                   )
                         ))
                     (define %lastidx2.norm (-  %outerlanesize0.norm  1))
                     (define %64.clone.4.norm (+  j0.new.norm  %lastidx2.norm))
                     (define %12.acc0.ab0.norm (bvaddnw %12.ext0.norm.red dst.norm %outerlanesize0.norm %arg3.norm))
                     %12.acc0.ab0.norm
                     )]
                  [else (begin
                          (apply
                            concat
                            (for/list ([%outer.it.norm (reverse (range %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm))])
                                      (define %lastidx4.norm (-  %outerlanesize0.norm  1))
                                      (define %66.norm (+  j0.new.norm  %lastidx4.norm))
                                      (define %67.norm (extract  %66.norm j0.new.norm %arg8.norm))
                                      %67.norm
                                      )
                            )
                          )]
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg9.norm)
  )

(define (_mm_srlv_epi32  count.norm %arg4.norm %arg0.norm a.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg5.norm )
  (define dst.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([j0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %arg2.norm  1))
                            (define %1.norm (+  j0.new.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm j0.new.norm count.norm))
                            (define %3.ab0.norm (bvlt %2.norm %arg0.norm %arg1.norm ))
                            (cond
                              [(equal? %3.ab0.norm #t)
                               (begin
                                 (define %lastidx1.norm (-  %arg3.norm  1))
                                 (define %4.norm (+  j0.new.norm  %lastidx1.norm))
                                 (define %5.norm (extract  %4.norm j0.new.norm a.norm))
                                 (define %7.norm (extract  %4.norm j0.new.norm count.norm))
                                 (define %8.norm (bvlshr  %5.norm  %7.norm))
                                 %8.norm
                                 )]
                              [else (begin
                                      (define %lastidx2.norm (-  %arg3.norm  1))
                                      (define %11.norm (+  j0.new.norm  %lastidx2.norm))
                                      (define %12.norm (extract  %11.norm j0.new.norm %arg4.norm))
                                      %12.norm
                                      )]
                              )
                            )
                  )
                )
      )
    )
  (bvpadhighbits  dst.norm %arg5.norm)
  )

;; ================================================================================
