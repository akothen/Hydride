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


(define (hexagon_V6_vandvrt_128B  Rt.norm Vu.norm )
  (define QdV.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range 0 128 1))])
                            (define %0.norm (*  8  i.norm))
                            (define %1.norm (+  %0.norm  7))
                            (define %2.norm (extract  %1.norm %0.norm Vu.norm))
                            (define %3.norm (modulo  i.norm  4))
                            (define %4.norm (*  8  %3.norm))
                            (define %5.norm (+  %4.norm  7))
                            (define %6.norm (extract  %5.norm %4.norm Rt.norm))
                            (define %7.norm (bvand  %2.norm  %6.norm))
                            (define %8.norm (not (bveq  %7.norm  (bv 0 8) )))
                            (define %9.norm (if (equal? %8.norm #t) (bv 1 1) (bv 0 1)))
                            %9.norm
                            )
                  )
                )
      )
    )
  QdV.norm
  )

(define (hexagon_V6_vaslh_acc_128B  Vx Vu Rt )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 16))])
                            (define %1 (+  i.new  15))
                            (define %2 (extract  %1 i.new Vx))
                            (define %5 (extract  %1 i.new Vu))
                            (define %6 (bvand  Rt  (bv 15 32)))
                            (define %7.ab0 (bvsizeext  %5 32 1))
                            (define %8 (bvshl  %7.ab0  %6))
                            (define %9.ab0 (bvsizeext  %2 32 1))
                            (define %10.ab0 (bvaddnw %9.ab0 %8 32 -1 ))
                            (define %13.high.idx 31 )
                            (define %13.low.idx (+ (- %13.high.idx 16) 1) )
                            (define %13 (extract  %13.high.idx %13.low.idx %10.ab0))
                            %13
                            )
                  )
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vrmpybv_128B  %arg0 Vu Vv %arg2 %arg3 %arg5 )
  (define Vd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 1024 32))])
                (define %75.0 (+  i.new  31))
                (define %76 (extract  %75.0 i.new %arg0))
                (define Vd %76)
                (define %15.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new (reverse (range 0 32 8))])
                              (define %2 (+  iterator.0.new  i.new))
                              (define %3 (+  %2  7))
                              (define %4 (extract  %3 %2 Vu))
                              (define %9 (extract  %3 %2 Vv))
                              (define %10.ab0 (bvsizeext  %4 16 %arg5))
                              (define %11.ab0 (bvsizeext  %9 16 %arg3))
                              (define %12 (bvmul  %10.ab0  %11.ab0))
                              (define %15.ab0 (bvsizeext  %12 32 %arg2))
                              %15.ab0
                              )
                    ))
                (define %75.clone.2 (+  i.new  31))
                (define %15.acc0.ab0 (bvaddnw %15.ext0.red Vd 32 -1))
                %15.acc0.ab0
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vminh_128B  Vu.norm Vv.norm %elemsize0.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range 0 1024 %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %1.norm (+  i.new.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm i.new.norm Vu.norm))
                            (define %5.norm (extract  %1.norm i.new.norm Vv.norm))
                            (define %6.norm (bvslt  %2.norm  %5.norm))
                            (define %13.norm (if (equal? %6.norm #t) %2.norm %5.norm))
                            %13.norm
                            )
                  )
                )
      )
    )
  Vd.norm
  )

(define (hexagon_V6_pred_xor_128B  QsV QtV %innerlanesize0 %elemsize0 )
  (define QdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx2 (-  %elemsize0  1))
                            (define %highidx2 (+  i  %lastidx2))
                            (define %0 (extract  %highidx2 i QsV))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %highidx1 (+  i  %lastidx1))
                            (define %1 (extract  %highidx1 i QtV))
                            (define %2 (bvxor  %0  %1))
                            %2
                            )
                  )
                )
      )
    )
  QdV
  )

(define (hexagon_V6_vmaxh_128B  Vu.norm Vv.norm %elemsize0.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range 0 1024 %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %1.norm (+  i.new.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm i.new.norm Vu.norm))
                            (define %5.norm (extract  %1.norm i.new.norm Vv.norm))
                            (define %6.norm (bvsgt  %2.norm  %5.norm))
                            (define %13.norm (if (equal? %6.norm #t) %2.norm %5.norm))
                            %13.norm
                            )
                  )
                )
      )
    )
  Vd.norm
  )

(define (hexagon_V6_vshufoeb_128B  Vu Vv %outerlanesize0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define Vdd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %1.new0 (/  i.new  2))
                            (define %2 (+  iterator.0.new  %1.new0))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %3 (+  %2  %lastidx1))
                            (define %4 (extract  %3 %2 Vv))
                            (define %7.new0 (*  iterator.0.new  %arg1))
                            (define %15 (extract  %3 %2 Vu))
                            (concat %15 %4)
                            )
                  )
                )
      )
    )
  Vdd
  )

(define (hexagon_V6_vasrwuhrndsat_128B  Vu Vv Rt %arg1 %arg4 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 16))])
                            (define %0 (bvand  Rt  (bv 15 32)))
                            (define %1.new0 (*  i.new  2))
                            (define %2 (+  %1.new0  31))
                            (define %3 (extract  %2 %1.new0 Vv))
                            (define %4.ab0 (bvsubnw %0 (bv 1 32) 32 -1 ))
                            (define %5 (bvshl  (bv 1 32)  %4.ab0))
                            (define %6.ab0 (bvaddnw %3 %5 32 -1 ))
                            (define %7 (bvashr  %6.ab0  %0))
                            (define %8.ab0 (bvsaturate  %7 32 16 %arg4))
                            (define %15 (extract  %2 %1.new0 Vu))
                            (define %18.ab0 (bvaddnw %15 %5 32 -1 ))
                            (define %19 (bvashr  %18.ab0  %0))
                            (define %20.ab0 (bvsaturate  %19 32 16 %arg1))
                            (concat %20.ab0 %8.ab0)
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vmpybusv_acc_128B  Vxx Vu Vv %outerlanesize0 %innerlanesize0 %elemsize0 %arg0 %arg2 %arg3 %arg4 )
  (define %dst0
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %0.new0 (/  i.new  2))
                            (define %1.new0 (*  iterator.0.new  %arg4))
                            (define %2 (+  %0.new0  %1.new0))
                            (define %lastidx0 (-  %arg0  1))
                            (define %3 (+  %2  %lastidx0))
                            (define %4 (extract  %3 %2 Vxx))
                            (define %7 (+  iterator.0.new  %0.new0))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %8 (+  %7  %lastidx1))
                            (define %9 (extract  %8 %7 Vu))
                            (define %14 (extract  %8 %7 Vv))
                            (define %15.ab0 (bvsizeext  %9 %arg0 %arg3))
                            (define %16.ab0 (bvsizeext  %14 %arg0 %arg2))
                            (define %17 (bvmul  %15.ab0  %16.ab0))
                            (define %18.ab0 (bvaddnw %4 %17 %arg0 -1 ))
                            %18.ab0
                            )
                  )
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vaslw_128B  VuV RtV )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 32))])
                            (define %1 (+  i.new  31))
                            (define %2 (extract  %1 i.new VuV))
                            (define %3 (bvand  RtV  (bv 31 32)))
                            (define %4 (bvshl  %2  %3))
                            %4
                            )
                  )
                )
      )
    )
  VdV
  )

(define (hexagon_V6_vmpyewuh_128B  Vu Vv )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 16))])
                            (define %0.new0 (*  i.new  2))
                            (define %1 (+  %0.new0  31))
                            (define %2 (extract  %1 %0.new0 Vu))
                            (define %6 (+  %0.new0  15))
                            (define %7 (extract  %6 %0.new0 Vv))
                            (define %9.ab0 (bvsizeext  %2 64 1))
                            (define %10.ab0 (bvsizeext  %7 64 1))
                            (define %11 (bvmul  %9.ab0  %10.ab0))
                            (define %12 (bvlshr  %11  (bv 16 64)))
                            (define %15.high.idx 63 )
                            (define %15.low.idx (+ (- %15.high.idx 32) 1) )
                            (define %15 (extract  %15.high.idx %15.low.idx %12))
                            %15
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vandnqrt_128B  Rt.norm QuV.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range 0 128 1))])
                            (define %0.norm (extract  i.norm i.norm QuV.norm))
                            (define %1.norm (bvnot  %0.norm))
                            (define %2.norm (modulo  i.norm  4))
                            (define %3.norm (*  8  %2.norm))
                            (define %4.norm (+  %3.norm  7))
                            (define %5.norm (extract  %4.norm %3.norm Rt.norm))
                            (define %6.norm (if (equal? %1.norm (bv #b1 1))
                                              %5.norm (bv 0 8)))
                            %6.norm
                            )
                  )
                )
      )
    )
  Vd.norm
  )

(define (hexagon_V6_vgtw_128B  Vu.norm %arg0.norm Vv.norm %arg1.norm %elemsize0.norm %arg2.norm )
  (define QdV.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range 0 128 %elemsize0.norm))])
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %3.new0.norm (*  i.norm  %factor0.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %4.norm (+  %3.new0.norm  %lastidx1.norm))
                            (define %5.norm (extract  %4.norm %3.new0.norm Vu.norm))
                            (define %9.norm (extract  %4.norm %3.new0.norm Vv.norm))
                            (define %10.norm (bvsgt  %5.norm  %9.norm))
                            (define %11.norm (if (equal? %10.norm #t) %arg0.norm %arg1.norm))
                            %11.norm
                            )
                  )
                )
      )
    )
  QdV.norm
  )

(define (hexagon_V6_vsubwq_128B  Vu.norm QvV.norm Vx.norm %elemsize0.norm %arg3.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range 0 1024 %elemsize0.norm))])
                            (define i.new.div.norm (/  i.new.norm  %arg3.norm))
                            (define %0.norm (extract  i.new.div.norm i.new.div.norm QvV.norm))
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %2.norm (+  i.new.norm  %lastidx0.norm))
                            (define %3.norm (extract  %2.norm i.new.norm Vx.norm))
                            (define %9.norm (extract  %2.norm i.new.norm Vu.norm))
                            (define %10.ab0.norm (bvsubnw %3.norm %9.norm %elemsize0.norm -1 ))
                            (define %cond0.norm (bveq  %0.norm  (bv 1 1)))
                            (define %11.norm (if (equal? %cond0.norm #t) %3.norm %10.ab0.norm))
                            %11.norm
                            )
                  )
                )
      )
    )
  %dst0.norm
  )

(define (hexagon_V6_vasruhubsat_128B  VuV VvV RtV )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 8))])
                            (define %0 (bvand  RtV  (bv 7 32)))
                            (define %1.new0 (*  i.new  2))
                            (define %2 (+  %1.new0  15))
                            (define %3 (extract  %2 %1.new0 VvV))
                            (define %4.ab0 (bvsizeext  %3 32 0))
                            (define %5 (bvashr  %4.ab0  %0))
                            (define %6.ab0 (bvsaturate  %5 32 8 0))
                            (define %13 (extract  %2 %1.new0 VuV))
                            (define %14.ab0 (bvsizeext  %13 32 0))
                            (define %15 (bvashr  %14.ab0  %0))
                            (define %16.ab0 (bvsaturate  %15 32 8 0))
                            (concat %16.ab0 %6.ab0)
                            )
                  )
                )
      )
    )
  VdV
  )

(define (hexagon_V6_vgtb_and_128B  Vu.norm %arg1.norm Vv.norm %arg0.norm QxV.norm %elemsize0.norm %arg2.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range 0 128 %elemsize0.norm))])
                            (define %lastidx2.norm (-  %elemsize0.norm  1))
                            (define %highidx1.norm (+  i.norm  %lastidx2.norm))
                            (define %6.norm (extract  %highidx1.norm i.norm QxV.norm))
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %8.new0.norm (*  i.norm  %factor0.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %9.norm (+  %8.new0.norm  %lastidx1.norm))
                            (define %10.norm (extract  %9.norm %8.new0.norm Vu.norm))
                            (define %14.norm (extract  %9.norm %8.new0.norm Vv.norm))
                            (define %15.norm (bvsgt  %10.norm  %14.norm))
                            (define %16.norm (if (equal? %15.norm #t) %arg0.norm %arg1.norm))
                            (define %17.norm (bvand  %6.norm  %16.norm))
                            %17.norm
                            )
                  )
                )
      )
    )
  %dst0.norm
  )

(define (hexagon_V6_lvsplatw_128B  Rt )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 32))])
                            Rt
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_pred_and_n_128B  QsV QtV )
  (define QdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i (reverse (range 0 128 1))])
                            (define %0 (extract  i i QsV))
                            (define %1 (extract  i i QtV))
                            (define %2 (bvnot  %1))
                            (define %3 (bvand  %0  %2))
                            %3
                            )
                  )
                )
      )
    )
  QdV
  )

(define (hexagon_V6_vasrhubsat_128B  VuV VvV RtV )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 8))])
                            (define %0 (bvand  RtV  (bv 7 32)))
                            (define %1.new0 (*  i.new  2))
                            (define %2 (+  %1.new0  15))
                            (define %3 (extract  %2 %1.new0 VvV))
                            (define %4.ab0 (bvsizeext  %3 32 1))
                            (define %5 (bvashr  %4.ab0  %0))
                            (define %6.ab0 (bvsaturate  %5 32 8 0))
                            (define %13 (extract  %2 %1.new0 VuV))
                            (define %14.ab0 (bvsizeext  %13 32 1))
                            (define %15 (bvashr  %14.ab0  %0))
                            (define %16.ab0 (bvsaturate  %15 32 8 0))
                            (concat %16.ab0 %6.ab0)
                            )
                  )
                )
      )
    )
  VdV
  )

(define (hexagon_V6_vunpackub_128B  Vu %elemsize0 %arg0 %arg1 )
  (define Vdd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 %elemsize0))])
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %1 (+  i.new  %lastidx1))
                            (define %2 (extract  %1 i.new Vu))
                            (define %5.ab0 (bvsizeext  %2 %arg0 %arg1))
                            %5.ab0
                            )
                  )
                )
      )
    )
  Vdd
  )

(define (hexagon_V6_vmpyieoh_128B  Vu Vv )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 16))])
                            (define %1.new0 (*  i.new  2))
                            (define %3 (+  %1.new0  15))
                            (define %4 (extract  %3 %1.new0 Vu))
                            (define %7 (+  16  %1.new0))
                            (define %8 (+  %7  15))
                            (define %9 (extract  %8 %7 Vv))
                            (define %10.ab0 (bvsizeext  %4 32 1))
                            (define %11.ab0 (bvsizeext  %9 32 1))
                            (define %12 (bvmul  %10.ab0  %11.ab0))
                            (define %13 (bvshl  %12  (bv 16 32)))
                            %13
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_lo_128B  Vxx )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 8))])
                            (define %2 (+  i.new  1024))
                            (define %3 (+  %2  7))
                            (define %4 (extract  %3 %2 Vxx))
                            %4
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vrmpybus_acc_128B  Vx Vu Rt %arg1 %arg2 )
  (define %dst0
    (apply
      concat
      (for/list ([i.new (reverse (range 0 1024 32))])
                (define %1.clone.0 (+  i.new  31))
                (define %2.clone.0 (extract  %1.clone.0 i.new Vx))
                (define %dst0 %2.clone.0)
                (define %14.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new (reverse (range 0 32 8))])
                              (define %5 (+  iterator.0.new  i.new))
                              (define %6 (+  %5  7))
                              (define %7 (extract  %6 %5 Vu))
                              (define %9 (+  iterator.0.new  7))
                              (define %10 (extract  %9 iterator.0.new Rt))
                              (define %11.ab0 (bvsizeext  %7 16 0))
                              (define %12.ab0 (bvsizeext  %10 16 %arg2))
                              (define %13 (bvmul  %11.ab0  %12.ab0))
                              (define %14.ab0 (bvsizeext  %13 32 %arg1))
                              %14.ab0
                              )
                    ))
                (define %71.clone.4 (+  i.new  31))
                (define %14.acc0.ab0 (bvaddnw %14.ext0.red %dst0 32 -1))
                %14.acc0.ab0
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vrounduhub_128B  Vu Vv %arg1 %arg6 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 8))])
                            (define %0.new0 (*  i.new  2))
                            (define %1 (+  %0.new0  15))
                            (define %2 (extract  %1 %0.new0 Vv))
                            (define %3.ab0 (bvaddnw %2 (bv 128 16) 16 -1 ))
                            (define %4 (bvlshr  %3.ab0  (bv 8 16)))
                            (define %5.ab0 (bvsaturate  %4 16 8 %arg6))
                            (define %12 (extract  %1 %0.new0 Vu))
                            (define %13.ab0 (bvaddnw %12 (bv 128 16) 16 -1 ))
                            (define %14 (bvlshr  %13.ab0  (bv 8 16)))
                            (define %15.ab0 (bvsaturate  %14 16 8 %arg1))
                            (concat %15.ab0 %5.ab0)
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vmpyowh_sacc_128B  Vx Vu Vv )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 16))])
                            (define %0.new0 (*  i.new  2))
                            (define %1 (+  %0.new0  31))
                            (define %2 (extract  %1 %0.new0 Vx))
                            (define %5 (extract  %1 %0.new0 Vu))
                            (define %8 (+  16  %0.new0))
                            (define %9 (+  %8  15))
                            (define %10 (extract  %9 %8 Vv))
                            (define %12.ab0 (bvsizeext  %5 64 1))
                            (define %13.ab0 (bvsizeext  %10 64 1))
                            (define %14 (bvmul  %12.ab0  %13.ab0))
                            (define %15.ab0 (bvsizeext  %2 64 1))
                            (define %16.ab0 (bvaddnw %15.ab0 %14 64 -1 ))
                            (define %17 (bvlshr  %16.ab0  (bv 14 64)))
                            (define %18.ab0 (bvaddnw %17 (bv 1 64) 64 -1 ))
                            (define %19 (bvlshr  %18.ab0  (bv 1 64)))
                            (define %20.ab0 (bvsaturate  %19 64 32 1))
                            %20.ab0
                            )
                  )
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vnot_128B  Vu %innerlanesize0 %elemsize0 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new  %lastidx0))
                            (define %2 (extract  %1 i.new Vu))
                            (define %3 (bvnot  %2))
                            %3
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vcombine_128B  Vu Vv )
  (define Vdd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (concat
                  (apply
                    concat
                    (for/list ([%iterator1.new (reverse (range 0 1024 8))])
                              (define %8 (+  %iterator1.new  7))
                              (define %9 (extract  %8 %iterator1.new Vu))
                              %9
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new (reverse (range 0 1024 8))])
                              (define %1 (+  %iterator0.new  7))
                              (define %2 (extract  %1 %iterator0.new Vv))
                              %2
                              )
                    )
                  )
                )
      )
    )
  Vdd
  )

(define (hexagon_V6_vasrh_acc_128B  Vx Vu Rt )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 16))])
                            (define %1 (+  i.new  15))
                            (define %2 (extract  %1 i.new Vx))
                            (define %5 (extract  %1 i.new Vu))
                            (define %6 (bvand  Rt  (bv 15 32)))
                            (define %7.ab0 (bvsizeext  %5 32 1))
                            (define %8 (bvashr  %7.ab0  %6))
                            (define %9.ab0 (bvsizeext  %2 32 1))
                            (define %10.ab0 (bvaddnw %9.ab0 %8 32 -1 ))
                            (define %13.high.idx 31 )
                            (define %13.low.idx (+ (- %13.high.idx 16) 1) )
                            (define %13 (extract  %13.high.idx %13.low.idx %10.ab0))
                            %13
                            )
                  )
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vasrw_acc_128B  Vx Vu Rt )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 32))])
                            (define %1 (+  i.new  31))
                            (define %2 (extract  %1 i.new Vx))
                            (define %5 (extract  %1 i.new Vu))
                            (define %6 (bvand  Rt  (bv 31 32)))
                            (define %7 (bvashr  %5  %6))
                            (define %8.ab0 (bvaddnw %2 %7 32 -1 ))
                            %8.ab0
                            )
                  )
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vmpyewuh_64_128B  Vu Vv )
  (define Vdd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (concat
                  (apply
                    concat
                    (for/list ([%iterator1.new (reverse (range 0 512 16))])
                              (define %18.new0 (*  %iterator1.new  2))
                              (define %19 (+  %18.new0  31))
                              (define %20 (extract  %19 %18.new0 Vu))
                              (define %24 (+  %18.new0  15))
                              (define %25 (extract  %24 %18.new0 Vv))
                              (define %27.ab0 (bvsizeext  %20 64 1))
                              (define %28.ab0 (bvsizeext  %25 64 1))
                              (define %29 (bvmul  %27.ab0  %28.ab0))
                              (define %30 (bvlshr  %29  (bv 16 64)))
                              (define %35.high.idx 63 )
                              (define %35.low.idx (+ (- %35.high.idx 32) 1) )
                              (define %35 (extract  %35.high.idx %35.low.idx %30))
                              %35
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new (reverse (range 0 512 16))])
                              (define %0.new0 (*  %iterator0.new  2))
                              (define %1 (+  %0.new0  31))
                              (define %2 (extract  %1 %0.new0 Vu))
                              (define %6 (+  %0.new0  15))
                              (define %7 (extract  %6 %0.new0 Vv))
                              (define %9.ab0 (bvsizeext  %2 64 1))
                              (define %10.ab0 (bvsizeext  %7 64 1))
                              (define %11 (bvmul  %9.ab0  %10.ab0))
                              (define %12 (bvshl  %11  (bv 16 64)))
                              (define %17.high.idx 63 )
                              (define %17.low.idx (+ (- %17.high.idx 32) 1) )
                              (define %17 (extract  %17.high.idx %17.low.idx %12))
                              %17
                              )
                    )
                  )
                )
      )
    )
  Vdd
  )

(define (hexagon_V6_veqh_xor_128B  Vu.norm Vv.norm %arg0.norm %arg1.norm QxV.norm %elemsize0.norm %arg2.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range 0 128 %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %5.new0.norm (+  i.norm  %lastidx0.norm))
                            (define %6.norm (extract  %5.new0.norm i.norm QxV.norm))
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %8.new0.norm (*  i.norm  %factor0.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %9.norm (+  %8.new0.norm  %lastidx1.norm))
                            (define %10.norm (extract  %9.norm %8.new0.norm Vu.norm))
                            (define %14.norm (extract  %9.norm %8.new0.norm Vv.norm))
                            (define %15.norm (bveq  %10.norm  %14.norm))
                            (define %16.norm (if (equal? %15.norm #t) %arg0.norm %arg1.norm))
                            (define %17.norm (bvxor  %6.norm  %16.norm))
                            %17.norm
                            )
                  )
                )
      )
    )
  %dst0.norm
  )

(define (hexagon_V6_vaddububb_sat_128B  Vu Vv %elemsize0 %arg0 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new  %lastidx0))
                            (define %2 (extract  %1 i.new Vu))
                            (define %5 (extract  %1 i.new Vv))
                            (define %6.ab0 (bvaddnw %2 %5 %elemsize0 %arg0 ))
                            %6.ab0
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vrounduwuh_128B  Vu Vv %arg1 %arg6 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 16))])
                            (define %0.new0 (*  i.new  2))
                            (define %1 (+  %0.new0  31))
                            (define %2 (extract  %1 %0.new0 Vv))
                            (define %3.ab0 (bvaddnw %2 (bv 32768 32) 32 -1 ))
                            (define %4 (bvlshr  %3.ab0  (bv 16 32)))
                            (define %5.ab0 (bvsaturate  %4 32 16 %arg6))
                            (define %12 (extract  %1 %0.new0 Vu))
                            (define %13.ab0 (bvaddnw %12 (bv 32768 32) 32 -1 ))
                            (define %14 (bvlshr  %13.ab0  (bv 16 32)))
                            (define %15.ab0 (bvsaturate  %14 32 16 %arg1))
                            (concat %15.ab0 %5.ab0)
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vmpabus_128B  Vuu Rt %arg3 %arg8 )
  (define Vdd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 32))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 16 8))])
                            (define %1.new0 (/  i.new  2))
                            (define %3 (+  iterator.0.new  %1.new0))
                            (define %5 (+  %3  7))
                            (define %6 (extract  %5 %3 Vuu))
                            (define %7.new0 (*  iterator.0.new  2))
                            (define %8 (+  %7.new0  7))
                            (define %9 (extract  %8 %7.new0 Rt))
                            (define %10.ab0 (bvsizeext  %6 16 0))
                            (define %11.ab0 (bvsizeext  %9 16 %arg8))
                            (define %12 (bvmul  %10.ab0  %11.ab0))
                            (define %17 (+  %3  1024))
                            (define %18 (+  %17  7))
                            (define %19 (extract  %18 %17 Vuu))
                            (define %64.new0 (/  iterator.0.new  4))
                            (define %65 (+  %64.new0  1))
                            (define %20 (*  8  %65))
                            (define %21 (+  %20  7))
                            (define %22 (extract  %21 %20 Rt))
                            (define %23.ab0 (bvsizeext  %19 16 0))
                            (define %24.ab0 (bvsizeext  %22 16 %arg3))
                            (define %25 (bvmul  %23.ab0  %24.ab0))
                            (define %26.ab0 (bvaddnw %12 %25 16 -1 ))
                            %26.ab0
                            )
                  )
                )
      )
    )
  Vdd
  )

(define (hexagon_V6_vadduhw_128B  Vu Vv %outerlanesize0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
  (define Vdd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %1.new0 (/  i.new  2))
                            (define %2 (+  iterator.0.new  %1.new0))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %3 (+  %2  %lastidx1))
                            (define %4 (extract  %3 %2 Vu))
                            (define %9 (extract  %3 %2 Vv))
                            (define %10.ab0 (bvaddnw %4 %9 %elemsize0 -1 ))
                            (define %15.ab0 (bvsizeext  %10.ab0 %arg0 %arg2))
                            %15.ab0
                            )
                  )
                )
      )
    )
  Vdd
  )

(define (hexagon_V6_vavguh_128B  %arg0 Vu Vv %elemsize0 %arg1 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new  %lastidx0))
                            (define %2 (extract  %1 i.new Vu))
                            (define %5 (extract  %1 i.new Vv))
                            (define %6.ab0 (bvaddnw %2 %5 %elemsize0 -1 ))
                            (define %7.ab0 (bvdiv %6.ab0 %arg0 %arg1 ))
                            %7.ab0
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vmpyubv_128B  Vu Vv %outerlanesize0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
  (define Vdd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %1.new0 (/  i.new  2))
                            (define %2 (+  iterator.0.new  %1.new0))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %3 (+  %2  %lastidx1))
                            (define %4 (extract  %3 %2 Vu))
                            (define %9 (extract  %3 %2 Vv))
                            (define %10.ab0 (bvsizeext  %4 %arg0 %arg3))
                            (define %11.ab0 (bvsizeext  %9 %arg0 %arg2))
                            (define %12 (bvmul  %10.ab0  %11.ab0))
                            %12
                            )
                  )
                )
      )
    )
  Vdd
  )

(define (hexagon_V6_vaddcarrysat_128B  Vu Vv QsV )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i (reverse (range 0 32 1))])
                            (define %0 (*  32  i))
                            (define %1 (+  %0  31))
                            (define %2 (extract  %1 %0 Vu))
                            (define %5 (extract  %1 %0 Vv))
                            (define %6.ab0 (bvaddnw %2 %5 32 -1 ))
                            (define %7 (*  i  4))
                            (define %8 (extract  %7 %7 QsV))
                            (define %9.ab0 (bvsizeext  %8 32 1))
                            (define %10.ab0 (bvaddnw %6.ab0 %9.ab0 32 1 ))
                            %10.ab0
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_pred_or_128B  QsV QtV %innerlanesize0 %elemsize0 )
  (define QdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx2 (-  %elemsize0  1))
                            (define %highidx2 (+  i  %lastidx2))
                            (define %0 (extract  %highidx2 i QsV))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %highidx1 (+  i  %lastidx1))
                            (define %1 (extract  %highidx1 i QtV))
                            (define %2 (bvor  %0  %1))
                            %2
                            )
                  )
                )
      )
    )
  QdV
  )

(define (hexagon_V6_vasrwhsat_128B  VuV VvV RtV )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 16))])
                            (define %0 (bvand  RtV  (bv 15 32)))
                            (define %1.new0 (*  i.new  2))
                            (define %2 (+  %1.new0  31))
                            (define %3 (extract  %2 %1.new0 VvV))
                            (define %4 (bvashr  %3  %0))
                            (define %5.ab0 (bvsaturate  %4 32 16 1))
                            (define %12 (extract  %2 %1.new0 VuV))
                            (define %13 (bvashr  %12  %0))
                            (define %14.ab0 (bvsaturate  %13 32 16 1))
                            (concat %14.ab0 %5.ab0)
                            )
                  )
                )
      )
    )
  VdV
  )

(define (hexagon_V6_vassign_128B  Vu %elemsize0 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new  %lastidx0))
                            (define %2 (extract  %1 i.new Vu))
                            %2
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vadduhw_acc_128B  Vxx Vu Vv %outerlanesize0 %innerlanesize0 %elemsize0 %arg0 %arg4 )
  (define %dst0
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %0.new0 (/  i.new  2))
                            (define %1.new0 (*  iterator.0.new  %arg4))
                            (define %2 (+  %0.new0  %1.new0))
                            (define %lastidx0 (-  %arg0  1))
                            (define %3 (+  %2  %lastidx0))
                            (define %4 (extract  %3 %2 Vxx))
                            (define %7 (+  iterator.0.new  %0.new0))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %8 (+  %7  %lastidx1))
                            (define %9 (extract  %8 %7 Vu))
                            (define %14 (extract  %8 %7 Vv))
                            (define %15.ab0 (bvaddnw %9 %14 %elemsize0 -1 ))
                            (define %16.ab0 (bvsizeext  %15.ab0 %arg0 1))
                            (define %17.ab0 (bvaddnw %4 %16.ab0 %arg0 -1 ))
                            %17.ab0
                            )
                  )
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vasruwuhsat_128B  VuV VvV RtV )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 16))])
                            (define %0 (bvand  RtV  (bv 15 32)))
                            (define %1.new0 (*  i.new  2))
                            (define %2 (+  %1.new0  31))
                            (define %3 (extract  %2 %1.new0 VvV))
                            (define %4 (bvashr  %3  %0))
                            (define %5.ab0 (bvsaturate  %4 32 16 0))
                            (define %12 (extract  %2 %1.new0 VuV))
                            (define %13 (bvashr  %12  %0))
                            (define %14.ab0 (bvsaturate  %13 32 16 0))
                            (concat %14.ab0 %5.ab0)
                            )
                  )
                )
      )
    )
  VdV
  )

(define (hexagon_V6_vandvrt_acc_128B  Rt.norm QxV.norm Vu.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range 0 128 1))])
                            (define %0.norm (extract  i.norm i.norm QxV.norm))
                            (define %1.norm (*  8  i.norm))
                            (define %2.norm (+  %1.norm  7))
                            (define %3.norm (extract  %2.norm %1.norm Vu.norm))
                            (define %4.norm (modulo  i.norm  4))
                            (define %5.norm (*  8  %4.norm))
                            (define %6.norm (+  %5.norm  7))
                            (define %7.norm (extract  %6.norm %5.norm Rt.norm))
                            (define %8.norm (bvand  %3.norm  %7.norm))
                            (define %9.norm (not (bveq  %8.norm  (bv 0 8) )))
                            (define %10.norm (if (equal? %9.norm #t) (bv 1 1) (bv 0 1)))
                            (define %11.norm (bvor  %0.norm  %10.norm))
                            %11.norm
                            )
                  )
                )
      )
    )
  %dst0.norm
  )

(define (hexagon_V6_vshuffeb_128B  Vu Vv %elemsize0 %arg0 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 %elemsize0))])
                            (define %factor0 (/  %elemsize0  %elemsize0))
                            (define %factor1 (*  2  %factor0))
                            (define %1.new0 (*  i.new  %factor1))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %3 (+  %1.new0  %lastidx1))
                            (define %4 (extract  %3 %1.new0 Vv))
                            (define %13 (extract  %3 %1.new0 Vu))
                            (concat %13 %4)
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vmpyiewuh_128B  Vu Vv )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 16))])
                            (define %0.new0 (*  i.new  2))
                            (define %1 (+  %0.new0  31))
                            (define %2 (extract  %1 %0.new0 Vu))
                            (define %6 (+  %0.new0  15))
                            (define %7 (extract  %6 %0.new0 Vv))
                            (define %9.ab0 (bvsizeext  %2 64 1))
                            (define %10.ab0 (bvsizeext  %7 64 1))
                            (define %11 (bvmul  %9.ab0  %10.ab0))
                            (define %14.high.idx 63 )
                            (define %14.low.idx (+ (- %14.high.idx 32) 1) )
                            (define %14 (extract  %14.high.idx %14.low.idx %11))
                            %14
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vasrwh_128B  VuV VvV RtV )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 16))])
                            (define %0 (bvand  RtV  (bv 15 32)))
                            (define %1.new0 (*  i.new  2))
                            (define %2 (+  %1.new0  31))
                            (define %3 (extract  %2 %1.new0 VvV))
                            (define %4 (bvashr  %3  %0))
                            (define %9.high.idx 31 )
                            (define %9.low.idx (+ (- %9.high.idx 16) 1) )
                            (define %9 (extract  %9.high.idx %9.low.idx %4))
                            (define %12 (extract  %2 %1.new0 VuV))
                            (define %13 (bvashr  %12  %0))
                            (define %18.high.idx 31 )
                            (define %18.low.idx (+ (- %18.high.idx 16) 1) )
                            (define %18 (extract  %18.high.idx %18.low.idx %13))
                            (concat %18 %9)
                            )
                  )
                )
      )
    )
  VdV
  )

(define (hexagon_V6_vminuh_128B  Vv.norm Vu.norm %elemsize0.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range 0 1024 %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %1.norm (+  i.new.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm i.new.norm Vu.norm))
                            (define %5.norm (extract  %1.norm i.new.norm Vv.norm))
                            (define %6.norm (bvult  %2.norm  %5.norm))
                            (define %13.norm (if (equal? %6.norm #t) %2.norm %5.norm))
                            %13.norm
                            )
                  )
                )
      )
    )
  Vd.norm
  )

(define (hexagon_V6_vpackhub_sat_128B  Vu Vv %arg1 %arg5 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (concat
                  (apply
                    concat
                    (for/list ([%iterator1.new (reverse (range 0 512 8))])
                              (define %9.new0 (*  %iterator1.new  2))
                              (define %10 (+  %9.new0  15))
                              (define %11 (extract  %10 %9.new0 Vu))
                              (define %12.ab0 (bvsaturate  %11 16 8 %arg5))
                              %12.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new (reverse (range 0 512 8))])
                              (define %0.new0 (*  %iterator0.new  2))
                              (define %1 (+  %0.new0  15))
                              (define %2 (extract  %1 %0.new0 Vv))
                              (define %3.ab0 (bvsaturate  %2 16 8 %arg1))
                              %3.ab0
                              )
                    )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vdmpyhisat_128B  %arg0 Vuu Rt %arg2 )
  (define Vd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 1024 32))])
                (define %29.0 (+  i.new  31))
                (define %32 (extract  %29.0 i.new %arg0))
                (define Vd %32)
                (define %12.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new (reverse (range 0 32 16))])
                              (define iterator.0.new.div (/  iterator.0.new  16))
                              (define %31.new0 (-  1  iterator.0.new.div))
                              (define %0 (*  16  %31.new0))
                              (define %2.new0 (*  iterator.0.new  64))
                              (define %3 (+  %0  i.new))
                              (define %4 (+  %3  %2.new0))
                              (define %5 (+  %4  15))
                              (define %6 (extract  %5 %4 Vuu))
                              (define %8 (+  iterator.0.new  15))
                              (define %9 (extract  %8 iterator.0.new Rt))
                              (define %10.ab0 (bvsizeext  %6 32 1))
                              (define %11.ab0 (bvsizeext  %9 32 %arg2))
                              (define %12 (bvmul  %10.ab0  %11.ab0))
                              %12
                              )
                    ))
                (define %29.clone.0 (+  i.new  31))
                (define %12.acc0.ab0 (bvaddnw %12.ext0.red Vd 32 1))
                %12.acc0.ab0
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vsatwh_128B  Vu Vv %elemsize0 %arg0 %arg1 %arg2 %arg3 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 %elemsize0))])
                            (define %factor0 (/  %arg2  %elemsize0))
                            (define %0.new0 (*  i.new  %factor0))
                            (define %lastidx1 (-  %arg2  1))
                            (define %1 (+  %0.new0  %lastidx1))
                            (define %2 (extract  %1 %0.new0 Vv))
                            (define %3.ab0 (bvsaturate  %2 %arg2 %elemsize0 %arg3))
                            (define %10 (extract  %1 %0.new0 Vu))
                            (define %11.ab0 (bvsaturate  %10 %arg2 %elemsize0 %arg1))
                            (concat %11.ab0 %3.ab0)
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vnavgub_128B  %arg0 Vu Vv %elemsize0 %arg1 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new  %lastidx0))
                            (define %2 (extract  %1 i.new Vu))
                            (define %5 (extract  %1 i.new Vv))
                            (define %6.ab0 (bvsubnw %2 %5 %elemsize0 -1 ))
                            (define %7.ab0 (bvdiv %6.ab0 %arg0 %arg1 ))
                            %7.ab0
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vabsh_sat_128B  Vu %elemsize0 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new  %lastidx0))
                            (define %2 (extract  %1 i.new Vu))
                            (define %3 (integer->bitvector (abs (bitvector->integer %2)) (bitvector %elemsize0)))
                            (define %4.ab0 (bvsaturate  %3 %elemsize0 %elemsize0 1))
                            %4.ab0
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vmpybus_128B  Vu Rt %arg2 )
  (define Vdd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 32))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 16 8))])
                            (define iterator.0.new.div (/  iterator.0.new  8))
                            (define %1.new0 (/  i.new  2))
                            (define %2 (+  iterator.0.new  %1.new0))
                            (define %3 (+  %2  7))
                            (define %4 (extract  %3 %2 Vu))
                            (define %5.new0 (/  i.new  16))
                            (define %6 (+  %5.new0  iterator.0.new.div))
                            (define %7 (modulo  %6  4))
                            (define %8 (*  8  %7))
                            (define %9 (+  %8  7))
                            (define %10 (extract  %9 %8 Rt))
                            (define %11.ab0 (bvsizeext  %4 16 0))
                            (define %12.ab0 (bvsizeext  %10 16 %arg2))
                            (define %13 (bvmul  %11.ab0  %12.ab0))
                            %13
                            )
                  )
                )
      )
    )
  Vdd
  )

(define (hexagon_V6_vpackwh_sat_128B  Vu Vv %arg0 %arg3 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (concat
                  (apply
                    concat
                    (for/list ([%iterator1.new (reverse (range 0 512 16))])
                              (define %6.new0 (*  %iterator1.new  2))
                              (define %7 (+  %6.new0  31))
                              (define %8 (extract  %7 %6.new0 Vu))
                              (define %9.ab0 (bvsaturate  %8 32 16 %arg3))
                              %9.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new (reverse (range 0 512 16))])
                              (define %0.new0 (*  %iterator0.new  2))
                              (define %1 (+  %0.new0  31))
                              (define %2 (extract  %1 %0.new0 Vv))
                              (define %3.ab0 (bvsaturate  %2 32 16 %arg0))
                              %3.ab0
                              )
                    )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_pred_or_n_128B  QsV QtV )
  (define QdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i (reverse (range 0 128 1))])
                            (define %0 (extract  i i QsV))
                            (define %1 (extract  i i QtV))
                            (define %2 (bvnot  %1))
                            (define %3 (bvor  %0  %2))
                            %3
                            )
                  )
                )
      )
    )
  QdV
  )

(define (hexagon_V6_vmpyhsat_acc_128B  Vxx Vu Rt %arg1 %arg2 %arg3 )
  (define %dst0
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 64))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 32 16))])
                            (define %0.new0 (/  i.new  2))
                            (define %1.new0 (*  iterator.0.new  64))
                            (define %2 (+  %0.new0  %1.new0))
                            (define %3 (+  %2  31))
                            (define %4 (extract  %3 %2 Vxx))
                            (define %7 (+  iterator.0.new  %0.new0))
                            (define %8 (+  %7  15))
                            (define %9 (extract  %8 %7 Vu))
                            (define %11 (+  iterator.0.new  15))
                            (define %12 (extract  %11 iterator.0.new Rt))
                            (define %13.ab0 (bvsizeext  %9 32 %arg3))
                            (define %14.ab0 (bvsizeext  %12 32 %arg2))
                            (define %15 (bvmul  %13.ab0  %14.ab0))
                            (define %16.ab0 (bvaddnw %4 %15 32 %arg1 ))
                            %16.ab0
                            )
                  )
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vdealb_128B  Vu %outerlanesize0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define Vd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 1024 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %2 (+  iterator.0.new  i.new))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %3 (+  %2  %lastidx1))
                            (define %4 (extract  %3 %2 Vu))
                            %4
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vlsrb_128B  VuV RtV )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 8))])
                            (define %1 (+  i.new  7))
                            (define %2 (extract  %1 i.new VuV))
                            (define %3 (bvand  RtV  (bv 7 32)))
                            (define %4.ab0 (bvsizeext  %2 32 0))
                            (define %5 (bvlshr  %4.ab0  %3))
                            (define %8.high.idx 31 )
                            (define %8.low.idx (+ (- %8.high.idx 8) 1) )
                            (define %8 (extract  %8.high.idx %8.low.idx %5))
                            %8
                            )
                  )
                )
      )
    )
  VdV
  )

(define (hexagon_V6_vandqrt_128B  QuV.norm Rt.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range 0 1024 8))])
                            (define i.new.div.norm (/  i.new.norm  8))
                            (define %0.norm (extract  i.new.div.norm i.new.div.norm QuV.norm))
                            (define %1.norm (modulo  i.new.div.norm  4))
                            (define %2.norm (*  8  %1.norm))
                            (define %3.norm (+  %2.norm  7))
                            (define %4.norm (extract  %3.norm %2.norm Rt.norm))
                            (define %cond0.norm (bveq  %0.norm  (bv 1 1)))
                            (define %5.norm (if (equal? %cond0.norm #t) %4.norm (bv 0 8)))
                            %5.norm
                            )
                  )
                )
      )
    )
  Vd.norm
  )

(define (hexagon_V6_vmaxuh_128B  Vv.norm Vu.norm %elemsize0.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range 0 1024 %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %1.norm (+  i.new.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm i.new.norm Vu.norm))
                            (define %5.norm (extract  %1.norm i.new.norm Vv.norm))
                            (define %6.norm (bvugt  %2.norm  %5.norm))
                            (define %13.norm (if (equal? %6.norm #t) %2.norm %5.norm))
                            %13.norm
                            )
                  )
                )
      )
    )
  Vd.norm
  )

(define (hexagon_V6_vlsrw_128B  VuV RtV )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 32))])
                            (define %1 (+  i.new  31))
                            (define %2 (extract  %1 i.new VuV))
                            (define %3 (bvand  RtV  (bv 31 32)))
                            (define %4 (bvlshr  %2  %3))
                            %4
                            )
                  )
                )
      )
    )
  VdV
  )

(define (hexagon_V6_veqw_and_128B  Vu.norm Vv.norm %arg0.norm %arg1.norm QxV.norm %elemsize0.norm %arg2.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range 0 128 %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %5.new0.norm (+  i.norm  %lastidx0.norm))
                            (define %6.norm (extract  %5.new0.norm i.norm QxV.norm))
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %8.new0.norm (*  i.norm  %factor0.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %9.norm (+  %8.new0.norm  %lastidx1.norm))
                            (define %10.norm (extract  %9.norm %8.new0.norm Vu.norm))
                            (define %14.norm (extract  %9.norm %8.new0.norm Vv.norm))
                            (define %15.norm (bveq  %10.norm  %14.norm))
                            (define %16.norm (if (equal? %15.norm #t) %arg0.norm %arg1.norm))
                            (define %17.norm (bvand  %6.norm  %16.norm))
                            %17.norm
                            )
                  )
                )
      )
    )
  %dst0.norm
  )

(define (hexagon_V6_vmpyiewuh_acc_128B  Vx Vu Vv )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 16))])
                            (define %0.new0 (*  i.new  2))
                            (define %1 (+  %0.new0  31))
                            (define %2 (extract  %1 %0.new0 Vx))
                            (define %5 (extract  %1 %0.new0 Vu))
                            (define %9 (+  %0.new0  15))
                            (define %10 (extract  %9 %0.new0 Vv))
                            (define %12.ab0 (bvsizeext  %5 64 1))
                            (define %13.ab0 (bvsizeext  %10 64 1))
                            (define %14 (bvmul  %12.ab0  %13.ab0))
                            (define %15.ab0 (bvsizeext  %2 64 1))
                            (define %16.ab0 (bvaddnw %15.ab0 %14 64 -1 ))
                            (define %19.high.idx 63 )
                            (define %19.low.idx (+ (- %19.high.idx 32) 1) )
                            (define %19 (extract  %19.high.idx %19.low.idx %16.ab0))
                            %19
                            )
                  )
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vdmpyhb_128B  %arg0 Vu Rt )
  (define Vd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 1024 32))])
                (define %37.0 (+  i.new  31))
                (define %38 (extract  %37.0 i.new %arg0))
                (define Vd %38)
                (define %14.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new (reverse (range 0 16 8))])
                              (define iterator.0.new.div (/  iterator.0.new  8))
                              (define %0.new0 (*  iterator.0.new  2))
                              (define %2 (+  %0.new0  i.new))
                              (define %3 (+  %2  15))
                              (define %4 (extract  %3 %2 Vu))
                              (define %5.new0 (/  i.new  16))
                              (define %6 (+  %5.new0  iterator.0.new.div))
                              (define %7 (modulo  %6  4))
                              (define %8 (*  8  %7))
                              (define %9 (+  %8  7))
                              (define %10 (extract  %9 %8 Rt))
                              (define %12.ab0 (bvsizeext  %4 32 1))
                              (define %13.ab0 (bvsizeext  %10 32 1))
                              (define %14 (bvmul  %12.ab0  %13.ab0))
                              %14
                              )
                    ))
                (define %37.clone.0 (+  i.new  31))
                (define %14.acc0.ab0 (bvaddnw %14.ext0.red Vd 32 -1))
                %14.acc0.ab0
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vaddw_dv_128B  Vuu Vvv %outerlanesize0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define Vdd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %0.new0 (/  i.new  2))
                            (define %1.new0 (*  iterator.0.new  %arg1))
                            (define %2 (+  %0.new0  %1.new0))
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %3 (+  %2  %lastidx0))
                            (define %4 (extract  %3 %2 Vuu))
                            (define %9 (extract  %3 %2 Vvv))
                            (define %10.ab0 (bvaddnw %4 %9 %elemsize0 %arg0 ))
                            %10.ab0
                            )
                  )
                )
      )
    )
  Vdd
  )

(define (hexagon_V6_vmpauhb_128B  Vuu Rt )
  (define Vdd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 64))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 16 8))])
                            (define %0.new0 (*  iterator.0.new  2))
                            (define %1.new0 (/  i.new  2))
                            (define %3 (+  %0.new0  %1.new0))
                            (define %5 (+  %3  15))
                            (define %6 (extract  %5 %3 Vuu))
                            (define %8 (+  %0.new0  7))
                            (define %9 (extract  %8 %0.new0 Rt))
                            (define %11.ab0 (bvsizeext  %6 32 1))
                            (define %12.ab0 (bvsizeext  %9 32 1))
                            (define %13 (bvmul  %11.ab0  %12.ab0))
                            (define %18 (+  %3  1024))
                            (define %19 (+  %18  15))
                            (define %20 (extract  %19 %18 Vuu))
                            (define %68.new0 (/  iterator.0.new  4))
                            (define %69 (+  %68.new0  1))
                            (define %21 (*  8  %69))
                            (define %22 (+  %21  7))
                            (define %23 (extract  %22 %21 Rt))
                            (define %25.ab0 (bvsizeext  %20 32 1))
                            (define %26.ab0 (bvsizeext  %23 32 1))
                            (define %27 (bvmul  %25.ab0  %26.ab0))
                            (define %28.ab0 (bvaddnw %13 %27 32 -1 ))
                            %28.ab0
                            )
                  )
                )
      )
    )
  Vdd
  )

(define (hexagon_V6_vandvqv_128B  QvV.norm Vu.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range 0 1024 8))])
                            (define i.new.div.norm (/  i.new.norm  8))
                            (define %0.norm (extract  i.new.div.norm i.new.div.norm QvV.norm))
                            (define %2.norm (+  i.new.norm  7))
                            (define %3.norm (extract  %2.norm i.new.norm Vu.norm))
                            (define %cond0.norm (bveq  %0.norm  (bv 1 1)))
                            (define %4.norm (if (equal? %cond0.norm #t) %3.norm (bv 0 8)))
                            %4.norm
                            )
                  )
                )
      )
    )
  Vd.norm
  )

(define (hexagon_V6_vpackeb_128B  Vu Vv %elemsize0 %elemsize1 %arg1 %arg2 %arg3 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (concat
                  (apply
                    concat
                    (for/list ([%iterator1.new (reverse (range 0 512 %elemsize1))])
                              (define %factor2 (/  %elemsize1  %elemsize1))
                              (define %factor3 (*  2  %factor2))
                              (define %11.new0 (*  %iterator1.new  %factor3))
                              (define %lastidx3 (-  %elemsize1  1))
                              (define %13 (+  %11.new0  %lastidx3))
                              (define %14 (extract  %13 %11.new0 Vu))
                              %14
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new (reverse (range 0 512 %elemsize0))])
                              (define %factor0 (/  %elemsize0  %elemsize0))
                              (define %factor1 (*  2  %factor0))
                              (define %1.new0 (*  %iterator0.new  %factor1))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %3 (+  %1.new0  %lastidx1))
                              (define %4 (extract  %3 %1.new0 Vv))
                              %4
                              )
                    )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vgtub_xor_128B  Vu.norm %arg0.norm %arg1.norm Vv.norm QxV.norm %elemsize0.norm %arg2.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range 0 128 %elemsize0.norm))])
                            (define %lastidx2.norm (-  %elemsize0.norm  1))
                            (define %highidx1.norm (+  i.norm  %lastidx2.norm))
                            (define %6.norm (extract  %highidx1.norm i.norm QxV.norm))
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %8.new0.norm (*  i.norm  %factor0.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %9.norm (+  %8.new0.norm  %lastidx1.norm))
                            (define %10.norm (extract  %9.norm %8.new0.norm Vu.norm))
                            (define %14.norm (extract  %9.norm %8.new0.norm Vv.norm))
                            (define %15.norm (bvugt  %10.norm  %14.norm))
                            (define %16.norm (if (equal? %15.norm #t) %arg0.norm %arg1.norm))
                            (define %17.norm (bvxor  %6.norm  %16.norm))
                            %17.norm
                            )
                  )
                )
      )
    )
  %dst0.norm
  )

(define (hexagon_V6_vaddwnq_128B  QvV.norm Vx.norm Vu.norm %elemsize0.norm %arg3.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range 0 1024 %elemsize0.norm))])
                            (define i.new.div.norm (/  i.new.norm  %arg3.norm))
                            (define %0.norm (extract  i.new.div.norm i.new.div.norm QvV.norm))
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %2.norm (+  i.new.norm  %lastidx0.norm))
                            (define %3.norm (extract  %2.norm i.new.norm Vx.norm))
                            (define %9.norm (extract  %2.norm i.new.norm Vu.norm))
                            (define %10.ab0.norm (bvaddnw %3.norm %9.norm %elemsize0.norm -1 ))
                            (define %cond0.norm (bveq  %0.norm  (bv 1 1)))
                            (define %11.norm (if (equal? %cond0.norm #t) %3.norm %10.ab0.norm))
                            %11.norm
                            )
                  )
                )
      )
    )
  %dst0.norm
  )

(define (hexagon_V6_vgtw_or_128B  Vu.norm Vv.norm %arg0.norm %arg1.norm QxV.norm %elemsize0.norm %arg2.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range 0 128 %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %5.new0.norm (+  i.norm  %lastidx0.norm))
                            (define %6.norm (extract  %5.new0.norm i.norm QxV.norm))
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %8.new0.norm (*  i.norm  %factor0.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %9.norm (+  %8.new0.norm  %lastidx1.norm))
                            (define %10.norm (extract  %9.norm %8.new0.norm Vu.norm))
                            (define %14.norm (extract  %9.norm %8.new0.norm Vv.norm))
                            (define %15.norm (bvsgt  %10.norm  %14.norm))
                            (define %16.norm (if (equal? %15.norm #t) %arg0.norm %arg1.norm))
                            (define %17.norm (bvor  %6.norm  %16.norm))
                            %17.norm
                            )
                  )
                )
      )
    )
  %dst0.norm
  )

(define (hexagon_V6_vdmpybus_acc_128B  Vx Vu Rt )
  (define %dst0
    (apply
      concat
      (for/list ([i.new (reverse (range 0 1024 16))])
                (define %1.clone.0 (+  i.new  15))
                (define %2.clone.0 (extract  %1.clone.0 i.new Vx))
                (define %dst0 %2.clone.0)
                (define %15.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new (reverse (range 0 16 8))])
                              (define iterator.0.new.div (/  iterator.0.new  8))
                              (define %5 (+  iterator.0.new  i.new))
                              (define %6 (+  %5  7))
                              (define %7 (extract  %6 %5 Vu))
                              (define %8.new1 (/  i.new  8))
                              (define %8.new0 (+  %8.new1  iterator.0.new.div))
                              (define %9 (modulo  %8.new0  4))
                              (define %10 (*  8  %9))
                              (define %11 (+  %10  7))
                              (define %12 (extract  %11 %10 Rt))
                              (define %13.ab0 (bvsizeext  %7 16 0))
                              (define %14.ab0 (bvsizeext  %12 16 1))
                              (define %15 (bvmul  %13.ab0  %14.ab0))
                              %15
                              )
                    ))
                (define %38.clone.2 (+  i.new  15))
                (define %15.acc0.ab0 (bvaddnw %15.ext0.red %dst0 16 -1))
                %15.acc0.ab0
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vmpyih_acc_128B  Vx Vu Vv )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 16))])
                            (define %1 (+  i.new  15))
                            (define %2 (extract  %1 i.new Vx))
                            (define %5 (extract  %1 i.new Vu))
                            (define %8 (extract  %1 i.new Vv))
                            (define %9.ab0 (bvsizeext  %5 32 1))
                            (define %10.ab0 (bvsizeext  %8 32 1))
                            (define %11 (bvmul  %9.ab0  %10.ab0))
                            (define %12.ab0 (bvsizeext  %2 32 1))
                            (define %13.ab0 (bvaddnw %12.ab0 %11 32 -1 ))
                            (define %16.high.idx 31 )
                            (define %16.low.idx (+ (- %16.high.idx 16) 1) )
                            (define %16 (extract  %16.high.idx %16.low.idx %13.ab0))
                            %16
                            )
                  )
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vgtw_xor_128B  %arg0.norm Vv.norm Vu.norm %arg1.norm QxV.norm %elemsize0.norm %arg2.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range 0 128 %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %5.new0.norm (+  i.norm  %lastidx0.norm))
                            (define %6.norm (extract  %5.new0.norm i.norm QxV.norm))
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %8.new0.norm (*  i.norm  %factor0.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %9.norm (+  %8.new0.norm  %lastidx1.norm))
                            (define %10.norm (extract  %9.norm %8.new0.norm Vu.norm))
                            (define %14.norm (extract  %9.norm %8.new0.norm Vv.norm))
                            (define %15.norm (bvsgt  %10.norm  %14.norm))
                            (define %16.norm (if (equal? %15.norm #t) %arg0.norm %arg1.norm))
                            (define %17.norm (bvxor  %6.norm  %16.norm))
                            %17.norm
                            )
                  )
                )
      )
    )
  %dst0.norm
  )

(define (hexagon_V6_vandqrt_acc_128B  Rt.norm QuV.norm Vx.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range 0 1024 8))])
                            (define i.new.div.norm (/  i.new.norm  8))
                            (define %1.norm (+  i.new.norm  7))
                            (define %2.norm (extract  %1.norm i.new.norm Vx.norm))
                            (define %3.norm (extract  i.new.div.norm i.new.div.norm QuV.norm))
                            (define %4.norm (modulo  i.new.div.norm  4))
                            (define %5.norm (*  8  %4.norm))
                            (define %6.norm (+  %5.norm  7))
                            (define %7.norm (extract  %6.norm %5.norm Rt.norm))
                            (define %cond0.norm (bveq  %3.norm  (bv 1 1)))
                            (define %8.norm (if (equal? %cond0.norm #t) %7.norm (bv 0 8)))
                            (define %9.norm (bvor  %2.norm  %8.norm))
                            %9.norm
                            )
                  )
                )
      )
    )
  %dst0.norm
  )

(define (hexagon_V6_pred_and_128B  QsV QtV %innerlanesize0 %elemsize0 )
  (define QdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %lastidx2 (-  %elemsize0  1))
                            (define %highidx2 (+  i  %lastidx2))
                            (define %0 (extract  %highidx2 i QsV))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %highidx1 (+  i  %lastidx1))
                            (define %1 (extract  %highidx1 i QtV))
                            (define %2 (bvand  %0  %1))
                            %2
                            )
                  )
                )
      )
    )
  QdV
  )

(define (hexagon_V6_vmpyowh_rnd_128B  Vu Vv )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 16))])
                            (define %0.new0 (*  i.new  2))
                            (define %1 (+  %0.new0  31))
                            (define %2 (extract  %1 %0.new0 Vu))
                            (define %5 (+  16  %0.new0))
                            (define %6 (+  %5  15))
                            (define %7 (extract  %6 %5 Vv))
                            (define %9.ab0 (bvsizeext  %2 64 1))
                            (define %10.ab0 (bvsizeext  %7 64 1))
                            (define %11 (bvmul  %9.ab0  %10.ab0))
                            (define %12 (bvlshr  %11  (bv 14 64)))
                            (define %13.ab0 (bvaddnw %12 (bv 1 64) 64 -1 ))
                            (define %14 (bvlshr  %13.ab0  (bv 1 64)))
                            (define %15.ab0 (bvsaturate  %14 64 32 1))
                            %15.ab0
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vmpybus_acc_128B  Vxx Vu Rt %arg2 )
  (define %dst0
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 32))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 16 8))])
                            (define iterator.0.new.div (/  iterator.0.new  8))
                            (define %0.new0 (/  i.new  2))
                            (define %1.new0 (*  iterator.0.new  128))
                            (define %2 (+  %0.new0  %1.new0))
                            (define %3 (+  %2  15))
                            (define %4 (extract  %3 %2 Vxx))
                            (define %7 (+  iterator.0.new  %0.new0))
                            (define %8 (+  %7  7))
                            (define %9 (extract  %8 %7 Vu))
                            (define %10.new0 (/  i.new  16))
                            (define %11 (+  %10.new0  iterator.0.new.div))
                            (define %12 (modulo  %11  4))
                            (define %13 (*  8  %12))
                            (define %14 (+  %13  7))
                            (define %15 (extract  %14 %13 Rt))
                            (define %16.ab0 (bvsizeext  %9 16 0))
                            (define %17.ab0 (bvsizeext  %15 16 %arg2))
                            (define %18 (bvmul  %16.ab0  %17.ab0))
                            (define %19.ab0 (bvaddnw %4 %18 16 -1 ))
                            %19.ab0
                            )
                  )
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vgtub_128B  %arg1.norm Vu.norm %arg0.norm Vv.norm %elemsize0.norm %arg2.norm )
  (define QdV.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range 0 128 %elemsize0.norm))])
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %3.new0.norm (*  i.norm  %factor0.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %4.norm (+  %3.new0.norm  %lastidx1.norm))
                            (define %5.norm (extract  %4.norm %3.new0.norm Vu.norm))
                            (define %9.norm (extract  %4.norm %3.new0.norm Vv.norm))
                            (define %10.norm (bvugt  %5.norm  %9.norm))
                            (define %11.norm (if (equal? %10.norm #t) %arg0.norm %arg1.norm))
                            %11.norm
                            )
                  )
                )
      )
    )
  QdV.norm
  )

(define (hexagon_V6_vabsdiffh_128B  Vv.norm Vu.norm %elemsize0.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range 0 1024 %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %1.norm (+  i.new.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm i.new.norm Vu.norm))
                            (define %5.norm (extract  %1.norm i.new.norm Vv.norm))
                            (define %6.norm (bvsgt  %2.norm  %5.norm))
                            (define %13.ab0.norm (bvsubnw %2.norm %5.norm %elemsize0.norm -1 ))
                            (define %20.ab0.norm (bvsubnw %5.norm %2.norm %elemsize0.norm -1 ))
                            (define %21.norm (if (equal? %6.norm #t) %13.ab0.norm %20.ab0.norm))
                            %21.norm
                            )
                  )
                )
      )
    )
  Vd.norm
  )

(define (hexagon_V6_vabsdiffub_128B  Vv.norm Vu.norm %elemsize0.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range 0 1024 %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %1.norm (+  i.new.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm i.new.norm Vu.norm))
                            (define %5.norm (extract  %1.norm i.new.norm Vv.norm))
                            (define %6.norm (bvugt  %2.norm  %5.norm))
                            (define %13.ab0.norm (bvsubnw %2.norm %5.norm %elemsize0.norm -1 ))
                            (define %20.ab0.norm (bvsubnw %5.norm %2.norm %elemsize0.norm -1 ))
                            (define %21.norm (if (equal? %6.norm #t) %13.ab0.norm %20.ab0.norm))
                            %21.norm
                            )
                  )
                )
      )
    )
  Vd.norm
  )

(define (hexagon_V6_vmpabuu_acc_128B  Vxx Vuu Rt %arg3 %arg8 )
  (define %dst0
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 32))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 16 8))])
                            (define %0.new0 (/  i.new  2))
                            (define %1.new0 (*  iterator.0.new  128))
                            (define %2 (+  %0.new0  %1.new0))
                            (define %3 (+  %2  15))
                            (define %4 (extract  %3 %2 Vxx))
                            (define %8 (+  iterator.0.new  %0.new0))
                            (define %10 (+  %8  7))
                            (define %11 (extract  %10 %8 Vuu))
                            (define %12.new0 (*  iterator.0.new  2))
                            (define %13 (+  %12.new0  7))
                            (define %14 (extract  %13 %12.new0 Rt))
                            (define %15.ab0 (bvsizeext  %11 16 0))
                            (define %16.ab0 (bvsizeext  %14 16 %arg8))
                            (define %17 (bvmul  %15.ab0  %16.ab0))
                            (define %22 (+  %8  1024))
                            (define %23 (+  %22  7))
                            (define %24 (extract  %23 %22 Vuu))
                            (define %76.new0 (/  iterator.0.new  4))
                            (define %77 (+  %76.new0  1))
                            (define %25 (*  8  %77))
                            (define %26 (+  %25  7))
                            (define %27 (extract  %26 %25 Rt))
                            (define %28.ab0 (bvsizeext  %24 16 0))
                            (define %29.ab0 (bvsizeext  %27 16 %arg3))
                            (define %30 (bvmul  %28.ab0  %29.ab0))
                            (define %31.ab0 (bvaddnw %17 %30 16 -1 ))
                            (define %32.ab0 (bvaddnw %4 %31.ab0 16 -1 ))
                            %32.ab0
                            )
                  )
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vsubb_dv_128B  Vuu Vvv %outerlanesize0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define Vdd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %0.new0 (/  i.new  2))
                            (define %1.new0 (*  iterator.0.new  %arg1))
                            (define %2 (+  %0.new0  %1.new0))
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %3 (+  %2  %lastidx0))
                            (define %4 (extract  %3 %2 Vuu))
                            (define %9 (extract  %3 %2 Vvv))
                            (define %10.ab0 (bvsubnw %4 %9 %elemsize0 %arg0 ))
                            %10.ab0
                            )
                  )
                )
      )
    )
  Vdd
  )

(define (hexagon_V6_vmpyih_128B  Vu Vv )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 16))])
                            (define %1 (+  i.new  15))
                            (define %2 (extract  %1 i.new Vu))
                            (define %5 (extract  %1 i.new Vv))
                            (define %6.ab0 (bvsizeext  %2 32 1))
                            (define %7.ab0 (bvsizeext  %5 32 1))
                            (define %8 (bvmul  %6.ab0  %7.ab0))
                            (define %11.high.idx 31 )
                            (define %11.low.idx (+ (- %11.high.idx 16) 1) )
                            (define %11 (extract  %11.high.idx %11.low.idx %8))
                            %11
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vsubhw_128B  Vu Vv %outerlanesize0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
  (define Vdd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %1.new0 (/  i.new  2))
                            (define %2 (+  iterator.0.new  %1.new0))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %3 (+  %2  %lastidx1))
                            (define %4 (extract  %3 %2 Vu))
                            (define %9 (extract  %3 %2 Vv))
                            (define %10.ab0 (bvsubnw %4 %9 %elemsize0 -1 ))
                            (define %15.ab0 (bvsizeext  %10.ab0 %arg0 %arg2))
                            %15.ab0
                            )
                  )
                )
      )
    )
  Vdd
  )

(define (hexagon_V6_vmux_128B  Vv.norm Vu.norm QtV.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range 0 1024 8))])
                            (define i.new.div.norm (/  i.new.norm  8))
                            (define %0.norm (extract  i.new.div.norm i.new.div.norm QtV.norm))
                            (define %2.norm (+  i.new.norm  7))
                            (define %3.norm (extract  %2.norm i.new.norm Vu.norm))
                            (define %6.norm (extract  %2.norm i.new.norm Vv.norm))
                            (define %cond0.norm (bveq  %0.norm  (bv 1 1)))
                            (define %7.norm (if (equal? %cond0.norm #t) %3.norm %6.norm))
                            %7.norm
                            )
                  )
                )
      )
    )
  Vd.norm
  )

(define (hexagon_V6_vasrhbsat_128B  VuV VvV RtV )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 8))])
                            (define %0 (bvand  RtV  (bv 7 32)))
                            (define %1.new0 (*  i.new  2))
                            (define %2 (+  %1.new0  15))
                            (define %3 (extract  %2 %1.new0 VvV))
                            (define %4.ab0 (bvsizeext  %3 32 1))
                            (define %5 (bvashr  %4.ab0  %0))
                            (define %6.ab0 (bvsaturate  %5 32 8 1))
                            (define %13 (extract  %2 %1.new0 VuV))
                            (define %14.ab0 (bvsizeext  %13 32 1))
                            (define %15 (bvashr  %14.ab0  %0))
                            (define %16.ab0 (bvsaturate  %15 32 8 1))
                            (concat %16.ab0 %6.ab0)
                            )
                  )
                )
      )
    )
  VdV
  )

(define (hexagon_V6_vmpyiowh_128B  Vu Vv )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 16))])
                            (define %0.new0 (*  i.new  2))
                            (define %1 (+  %0.new0  31))
                            (define %2 (extract  %1 %0.new0 Vu))
                            (define %5 (+  16  %0.new0))
                            (define %6 (+  %5  15))
                            (define %7 (extract  %6 %5 Vv))
                            (define %9.ab0 (bvsizeext  %2 64 1))
                            (define %10.ab0 (bvsizeext  %7 64 1))
                            (define %11 (bvmul  %9.ab0  %10.ab0))
                            (define %14.high.idx 63 )
                            (define %14.low.idx (+ (- %14.high.idx 32) 1) )
                            (define %14 (extract  %14.high.idx %14.low.idx %11))
                            %14
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vmpyiwb_acc_128B  Vx Vu Rt %innerlanesize0 %elemsize0 %arg4 %arg7 %arg8 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 32 32))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define i.new.div (/  i.new  %arg8))
                            (define %factor0 (/  32  %elemsize0))
                            (define %0.new0 (*  i.new  %factor0))
                            (define %1 (+  %0.new0  31))
                            (define %2 (extract  %1 %0.new0 Vx))
                            (define %5 (extract  %1 %0.new0 Vu))
                            (define %6 (modulo  i.new.div  %arg7))
                            (define %7 (*  %elemsize0  %6))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %8 (+  %7  %lastidx1))
                            (define %9 (extract  %8 %7 Rt))
                            (define %11.ab0 (bvsizeext  %5 64 1))
                            (define %12.ab0 (bvsizeext  %9 64 %arg4))
                            (define %13 (bvmul  %11.ab0  %12.ab0))
                            (define %14.ab0 (bvsizeext  %2 64 1))
                            (define %15.ab0 (bvaddnw %14.ab0 %13 64 -1 ))
                            (define %18.high.idx 63 )
                            (define %18.low.idx (+ (- %18.high.idx 32) 1) )
                            (define %18 (extract  %18.high.idx %18.low.idx %15.ab0))
                            %18
                            )
                  )
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vmpyuh_128B  Vu Rt %arg2 %arg3 )
  (define Vdd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 64))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 32 16))])
                            (define %1.new0 (/  i.new  2))
                            (define %2 (+  iterator.0.new  %1.new0))
                            (define %3 (+  %2  15))
                            (define %4 (extract  %3 %2 Vu))
                            (define %6 (+  iterator.0.new  15))
                            (define %7 (extract  %6 iterator.0.new Rt))
                            (define %8.ab0 (bvsizeext  %4 32 %arg3))
                            (define %9.ab0 (bvsizeext  %7 32 %arg2))
                            (define %10 (bvmul  %8.ab0  %9.ab0))
                            %10
                            )
                  )
                )
      )
    )
  Vdd
  )

(define (hexagon_V6_vabsh_128B  Vu %elemsize0 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new  %lastidx0))
                            (define %2 (extract  %1 i.new Vu))
                            (define %3 (integer->bitvector (abs (bitvector->integer %2)) (bitvector %elemsize0)))
                            %3
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vmpyuhe_acc_128B  Vx Vu Rt )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 16))])
                            (define %0.new0 (*  i.new  2))
                            (define %1 (+  %0.new0  31))
                            (define %2 (extract  %1 %0.new0 Vx))
                            (define %6 (+  %0.new0  15))
                            (define %7 (extract  %6 %0.new0 Vu))
                            (define %10 (extract  15 0 Rt))
                            (define %11.ab0 (bvsizeext  %7 32 0))
                            (define %12.ab0 (bvsizeext  %10 32 0))
                            (define %13 (bvmul  %11.ab0  %12.ab0))
                            (define %14.ab0 (bvaddnw %2 %13 32 -1 ))
                            %14.ab0
                            )
                  )
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vdmpyhsat_128B  %arg0 Vu Rt %arg2 )
  (define Vd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 1024 32))])
                (define %25.0 (+  i.new  31))
                (define %26 (extract  %25.0 i.new %arg0))
                (define Vd %26)
                (define %10.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new (reverse (range 0 32 16))])
                              (define %2 (+  iterator.0.new  i.new))
                              (define %3 (+  %2  15))
                              (define %4 (extract  %3 %2 Vu))
                              (define %6 (+  iterator.0.new  15))
                              (define %7 (extract  %6 iterator.0.new Rt))
                              (define %8.ab0 (bvsizeext  %4 32 1))
                              (define %9.ab0 (bvsizeext  %7 32 %arg2))
                              (define %10 (bvmul  %8.ab0  %9.ab0))
                              %10
                              )
                    ))
                (define %25.clone.0 (+  i.new  31))
                (define %10.acc0.ab0 (bvaddnw %10.ext0.red Vd 32 1))
                %10.acc0.ab0
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vmpyiwh_128B  Vu Rt %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg4 %arg5 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 32 32))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define i.new.div (/  i.new  %arg5))
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %0.new0 (*  i.new  %factor0))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  %0.new0  %lastidx0))
                            (define %2 (extract  %1 %0.new0 Vu))
                            (define %3 (modulo  i.new.div  %arg4))
                            (define %4 (*  %elemsize0  %3))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %5 (+  %4  %lastidx1))
                            (define %6 (extract  %5 %4 Rt))
                            (define %8.ab0 (bvsizeext  %2 %arg2 1))
                            (define %9.ab0 (bvsizeext  %6 %arg2 %arg1))
                            (define %10 (bvmul  %8.ab0  %9.ab0))
                            (define %13.high.idx (- %arg2 1))
                            (define %13.low.idx (+ (- %13.high.idx %arg0) 1) )
                            (define %13 (extract  %13.high.idx %13.low.idx %10))
                            %13
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vgtub_and_128B  %arg0.norm Vu.norm %arg1.norm Vv.norm QxV.norm %elemsize0.norm %arg2.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range 0 128 %elemsize0.norm))])
                            (define %lastidx2.norm (-  %elemsize0.norm  1))
                            (define %highidx1.norm (+  i.norm  %lastidx2.norm))
                            (define %6.norm (extract  %highidx1.norm i.norm QxV.norm))
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %8.new0.norm (*  i.norm  %factor0.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %9.norm (+  %8.new0.norm  %lastidx1.norm))
                            (define %10.norm (extract  %9.norm %8.new0.norm Vu.norm))
                            (define %14.norm (extract  %9.norm %8.new0.norm Vv.norm))
                            (define %15.norm (bvugt  %10.norm  %14.norm))
                            (define %16.norm (if (equal? %15.norm #t) %arg0.norm %arg1.norm))
                            (define %17.norm (bvand  %6.norm  %16.norm))
                            %17.norm
                            )
                  )
                )
      )
    )
  %dst0.norm
  )

(define (hexagon_V6_vdealb4w_128B  Vu Vv )
  (define Vd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 1024 32))])
                (concat
                  (apply
                    concat
                    (for/list ([iterator.1.new (reverse (range 16 32 8))])
                              (define %42.new0 (/  iterator.1.new  4))
                              (define %43.new0 (-  %42.new0  4))
                              (define %20 (*  8  %43.new0))
                              (define %22 (+  %20  i.new))
                              (define %23 (+  %22  7))
                              (define %24 (extract  %23 %22 Vu))
                              %24
                              )
                    )
                  (apply
                    concat
                    (for/list ([iterator.0.new (reverse (range 0 16 8))])
                              (define %0.new0 (*  iterator.0.new  2))
                              (define %2 (+  %0.new0  i.new))
                              (define %3 (+  %2  7))
                              (define %4 (extract  %3 %2 Vv))
                              %4
                              )
                    )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vgtub_or_128B  Vu.norm %arg1.norm Vv.norm %arg0.norm QxV.norm %elemsize0.norm %arg2.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range 0 128 %elemsize0.norm))])
                            (define %lastidx2.norm (-  %elemsize0.norm  1))
                            (define %highidx1.norm (+  i.norm  %lastidx2.norm))
                            (define %6.norm (extract  %highidx1.norm i.norm QxV.norm))
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %8.new0.norm (*  i.norm  %factor0.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %9.norm (+  %8.new0.norm  %lastidx1.norm))
                            (define %10.norm (extract  %9.norm %8.new0.norm Vu.norm))
                            (define %14.norm (extract  %9.norm %8.new0.norm Vv.norm))
                            (define %15.norm (bvugt  %10.norm  %14.norm))
                            (define %16.norm (if (equal? %15.norm #t) %arg0.norm %arg1.norm))
                            (define %17.norm (bvor  %6.norm  %16.norm))
                            %17.norm
                            )
                  )
                )
      )
    )
  %dst0.norm
  )

(define (hexagon_V6_vdmpyhvsat_acc_128B  Vx Vu Vv )
  (define %dst0
    (apply
      concat
      (for/list ([i.new (reverse (range 0 1024 32))])
                (define %28.clone.0 (+  i.new  31))
                (define %29.clone.0 (extract  %28.clone.0 i.new Vx))
                (define %dst0 %29.clone.0)
                (define %12.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new (reverse (range 0 32 16))])
                              (define %2 (+  iterator.0.new  i.new))
                              (define %3 (+  %2  15))
                              (define %4 (extract  %3 %2 Vu))
                              (define %9 (extract  %3 %2 Vv))
                              (define %10.ab0 (bvsizeext  %4 32 1))
                              (define %11.ab0 (bvsizeext  %9 32 1))
                              (define %12 (bvmul  %10.ab0  %11.ab0))
                              %12
                              )
                    ))
                (define %33.clone.1 (+  i.new  31))
                (define %12.acc0.ab0 (bvaddnw %12.ext0.red %dst0 32 1))
                %12.acc0.ab0
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vandvnqv_128B  Vu.norm QvV.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range 0 128 1))])
                            (define %0.norm (extract  i.norm i.norm QvV.norm))
                            (define %1.norm (bvnot  %0.norm))
                            (define %2.norm (*  8  i.norm))
                            (define %3.norm (+  %2.norm  7))
                            (define %4.norm (extract  %3.norm %2.norm Vu.norm))
                            (define %5.norm (if (equal? %1.norm (bv #b1 1))
                                              %4.norm (bv 0 8)))
                            %5.norm
                            )
                  )
                )
      )
    )
  Vd.norm
  )

(define (hexagon_V6_vunpackoh_128B  %arg2 Vxx Vu %elemsize0 %arg0 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %0.new0 (*  i.new  %factor0))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  %0.new0  %lastidx0))
                            (define %2 (extract  %1 %0.new0 Vxx))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %4 (+  i.new  %lastidx1))
                            (define %5 (extract  %4 i.new Vu))
                            (define %6 (bvshl  %5  %arg2))
                            (define %7.ab0 (bvsizeext  %6 %arg0 0))
                            (define %8 (bvor  %2  %7.ab0))
                            %8
                            )
                  )
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vaslh_128B  VuV RtV )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 16))])
                            (define %1 (+  i.new  15))
                            (define %2 (extract  %1 i.new VuV))
                            (define %3 (bvand  RtV  (bv 15 32)))
                            (define %4.ab0 (bvsizeext  %2 32 1))
                            (define %5 (bvshl  %4.ab0  %3))
                            (define %8.high.idx 31 )
                            (define %8.low.idx (+ (- %8.high.idx 16) 1) )
                            (define %8 (extract  %8.high.idx %8.low.idx %5))
                            %8
                            )
                  )
                )
      )
    )
  VdV
  )

(define (hexagon_V6_vshuffh_128B  Vu %outerlanesize0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define Vd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 1024 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %1.new0.new0 (*  iterator.0.new  %arg1))
                            (define i.new.div.copy.0 (/  i.new  %arg0))
                            (define %2 (+  i.new.div.copy.0  %1.new0.new0))
                            (define %3 (*  %elemsize0  %2))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %4 (+  %3  %lastidx1))
                            (define %5 (extract  %4 %3 Vu))
                            %5
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vavguhrnd_128B  %arg2 %arg0 Vu Vv %elemsize0 %arg1 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new  %lastidx0))
                            (define %2 (extract  %1 i.new Vu))
                            (define %5 (extract  %1 i.new Vv))
                            (define %6.ab0 (bvaddnw %2 %5 %elemsize0 -1 ))
                            (define %7.ab0 (bvaddnw %6.ab0 %arg2 %elemsize0 -1 ))
                            (define %8.ab0 (bvdiv %7.ab0 %arg0 %arg1 ))
                            %8.ab0
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vinsertwr_128B  Rt )
  (define Vx
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range 0 32 32))])
                            Rt
                            )
                  )
                )
      )
    )
  Vx
  )

(define (hexagon_V6_veqw_or_128B  %arg0.norm Vu.norm %arg1.norm Vv.norm QxV.norm %elemsize0.norm %arg2.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range 0 128 %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %5.new0.norm (+  i.norm  %lastidx0.norm))
                            (define %6.norm (extract  %5.new0.norm i.norm QxV.norm))
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %8.new0.norm (*  i.norm  %factor0.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %9.norm (+  %8.new0.norm  %lastidx1.norm))
                            (define %10.norm (extract  %9.norm %8.new0.norm Vu.norm))
                            (define %14.norm (extract  %9.norm %8.new0.norm Vv.norm))
                            (define %15.norm (bveq  %10.norm  %14.norm))
                            (define %16.norm (if (equal? %15.norm #t) %arg0.norm %arg1.norm))
                            (define %17.norm (bvor  %6.norm  %16.norm))
                            %17.norm
                            )
                  )
                )
      )
    )
  %dst0.norm
  )

(define (hexagon_V6_vasrwuhsat_128B  VuV VvV RtV )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 16))])
                            (define %0 (bvand  RtV  (bv 15 32)))
                            (define %1.new0 (*  i.new  2))
                            (define %2 (+  %1.new0  31))
                            (define %3 (extract  %2 %1.new0 VvV))
                            (define %4 (bvashr  %3  %0))
                            (define %5.ab0 (bvsaturate  %4 32 16 0))
                            (define %12 (extract  %2 %1.new0 VuV))
                            (define %13 (bvashr  %12  %0))
                            (define %14.ab0 (bvsaturate  %13 32 16 0))
                            (concat %14.ab0 %5.ab0)
                            )
                  )
                )
      )
    )
  VdV
  )

(define (hexagon_V6_vsubuwsat_128B  Vu Vv %elemsize0 %arg0 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new  %lastidx0))
                            (define %2 (extract  %1 i.new Vu))
                            (define %5 (extract  %1 i.new Vv))
                            (define %6.ab0 (bvsubnw %2 %5 %elemsize0 %arg0 ))
                            %6.ab0
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vmpyihb_acc_128B  Vx Vu Rt )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 8))])
                            (define i.new.div (/  i.new  8))
                            (define %0.new0 (*  i.new  2))
                            (define %1 (+  %0.new0  15))
                            (define %2 (extract  %1 %0.new0 Vx))
                            (define %5 (extract  %1 %0.new0 Vu))
                            (define %6 (modulo  i.new.div  4))
                            (define %7 (*  8  %6))
                            (define %8 (+  %7  7))
                            (define %9 (extract  %8 %7 Rt))
                            (define %11.ab0 (bvsizeext  %5 32 1))
                            (define %12.ab0 (bvsizeext  %9 32 1))
                            (define %13 (bvmul  %11.ab0  %12.ab0))
                            (define %14.ab0 (bvsizeext  %2 32 1))
                            (define %15.ab0 (bvaddnw %14.ab0 %13 32 -1 ))
                            (define %18.high.idx 31 )
                            (define %18.low.idx (+ (- %18.high.idx 16) 1) )
                            (define %18 (extract  %18.high.idx %18.low.idx %15.ab0))
                            %18
                            )
                  )
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vshufoh_128B  Vu Vv %elemsize0 %arg0 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 %elemsize0))])
                            (define %factor0 (/  %elemsize0  %elemsize0))
                            (define %factor1 (*  2  %factor0))
                            (define %1.new0 (*  i.new  %factor1))
                            (define %2 (+  %arg0  %1.new0))
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %3 (+  %2  %lastidx0))
                            (define %4 (extract  %3 %2 Vv))
                            (define %13 (extract  %3 %2 Vu))
                            (concat %13 %4)
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vasrhubrndsat_128B  Vu Vv Rt %arg1 %arg3 %arg6 %arg8 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 8))])
                            (define %0 (bvand  Rt  (bv 7 32)))
                            (define %1.new0 (*  i.new  2))
                            (define %2 (+  %1.new0  15))
                            (define %3 (extract  %2 %1.new0 Vv))
                            (define %4.ab0 (bvsubnw %0 (bv 1 32) 32 -1 ))
                            (define %5 (bvshl  (bv 1 32)  %4.ab0))
                            (define %6.ab0 (bvsizeext  %3 32 %arg8))
                            (define %7.ab0 (bvaddnw %6.ab0 %5 32 -1 ))
                            (define %8 (bvashr  %7.ab0  %0))
                            (define %9.ab0 (bvsaturate  %8 32 8 %arg6))
                            (define %16 (extract  %2 %1.new0 Vu))
                            (define %19.ab0 (bvsizeext  %16 32 %arg3))
                            (define %20.ab0 (bvaddnw %19.ab0 %5 32 -1 ))
                            (define %21 (bvashr  %20.ab0  %0))
                            (define %22.ab0 (bvsaturate  %21 32 8 %arg1))
                            (concat %22.ab0 %9.ab0)
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vsh_128B  Vu %outerlanesize0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
  (define Vdd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 %innerlanesize0 %elemsize0))])
                            (define %1.new0 (/  i.new  2))
                            (define %2 (+  iterator.0.new  %1.new0))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %3 (+  %2  %lastidx1))
                            (define %4 (extract  %3 %2 Vu))
                            (define %9.ab0 (bvsizeext  %4 %arg0 %arg2))
                            %9.ab0
                            )
                  )
                )
      )
    )
  Vdd
  )

(define (hexagon_V6_vmpabusv_128B  Vuu Vvv )
  (define Vdd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 32))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 16 8))])
                            (define %1.new0 (/  i.new  2))
                            (define %3 (+  iterator.0.new  %1.new0))
                            (define %5 (+  %3  7))
                            (define %6 (extract  %5 %3 Vuu))
                            (define %13 (extract  %5 %3 Vvv))
                            (define %14.ab0 (bvsizeext  %6 16 0))
                            (define %15.ab0 (bvsizeext  %13 16 0))
                            (define %16 (bvmul  %14.ab0  %15.ab0))
                            (define %21 (+  %3  1024))
                            (define %22 (+  %21  7))
                            (define %23 (extract  %22 %21 Vuu))
                            (define %30 (extract  %22 %21 Vvv))
                            (define %31.ab0 (bvsizeext  %23 16 0))
                            (define %32.ab0 (bvsizeext  %30 16 0))
                            (define %33 (bvmul  %31.ab0  %32.ab0))
                            (define %34.ab0 (bvaddnw %16 %33 16 -1 ))
                            %34.ab0
                            )
                  )
                )
      )
    )
  Vdd
  )

(define (hexagon_V6_veqb_128B  %arg1.norm Vv.norm Vu.norm %arg0.norm %elemsize0.norm %arg2.norm )
  (define QdV.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 128 128))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range 0 128 %elemsize0.norm))])
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %3.new0.norm (*  i.norm  %factor0.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %4.norm (+  %3.new0.norm  %lastidx1.norm))
                            (define %5.norm (extract  %4.norm %3.new0.norm Vu.norm))
                            (define %9.norm (extract  %4.norm %3.new0.norm Vv.norm))
                            (define %10.norm (bveq  %5.norm  %9.norm))
                            (define %11.norm (if (equal? %10.norm #t) %arg0.norm %arg1.norm))
                            %11.norm
                            )
                  )
                )
      )
    )
  QdV.norm
  )

(define (hexagon_V6_vpackoh_128B  Vu Vv %elemsize0 %elemsize1 %arg0 %arg2 %arg3 %arg5 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (concat
                  (apply
                    concat
                    (for/list ([%iterator1.new (reverse (range 0 512 %elemsize1))])
                              (define %8.new0 (*  %iterator1.new  2))
                              (define %9 (+  %arg3  %8.new0))
                              (define %lastidx3 (-  %elemsize1  1))
                              (define %10 (+  %9  %lastidx3))
                              (define %11 (extract  %10 %9 Vu))
                              %11
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new (reverse (range 0 512 %elemsize0))])
                              (define %1.new0 (*  %iterator0.new  2))
                              (define %2 (+  %arg0  %1.new0))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %3 (+  %2  %lastidx1))
                              (define %4 (extract  %3 %2 Vv))
                              %4
                              )
                    )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vaslw_acc_128B  Vx Vu Rt )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 32))])
                            (define %1 (+  i.new  31))
                            (define %2 (extract  %1 i.new Vx))
                            (define %5 (extract  %1 i.new Vu))
                            (define %6 (bvand  Rt  (bv 31 32)))
                            (define %7 (bvshl  %5  %6))
                            (define %8.ab0 (bvaddnw %2 %7 32 -1 ))
                            %8.ab0
                            )
                  )
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vlsrh_128B  VuV RtV )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 16))])
                            (define %1 (+  i.new  15))
                            (define %2 (extract  %1 i.new VuV))
                            (define %3 (bvand  RtV  (bv 15 32)))
                            (define %4.ab0 (bvsizeext  %2 32 0))
                            (define %5 (bvlshr  %4.ab0  %3))
                            (define %8.high.idx 31 )
                            (define %8.low.idx (+ (- %8.high.idx 16) 1) )
                            (define %8 (extract  %8.high.idx %8.low.idx %5))
                            %8
                            )
                  )
                )
      )
    )
  VdV
  )

(define (hexagon_V6_vmpyuhe_128B  Vu Rt )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 512 16))])
                            (define %1.new0 (*  i.new  2))
                            (define %3 (+  %1.new0  15))
                            (define %4 (extract  %3 %1.new0 Vu))
                            (define %7 (extract  15 0 Rt))
                            (define %8.ab0 (bvsizeext  %4 32 0))
                            (define %9.ab0 (bvsizeext  %7 32 0))
                            (define %10 (bvmul  %8.ab0  %9.ab0))
                            %10
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vmpauhb_acc_128B  Vxx Vuu Rt )
  (define %dst0
    (apply
      concat
      (for/list ([i.new (reverse (range 0 2048 64))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range 0 16 8))])
                            (define %0.new0 (/  i.new  2))
                            (define %1.new0 (*  iterator.0.new  128))
                            (define %2 (+  %0.new0  %1.new0))
                            (define %3 (+  %2  31))
                            (define %4 (extract  %3 %2 Vxx))
                            (define %5.new0 (*  iterator.0.new  2))
                            (define %8 (+  %5.new0  %0.new0))
                            (define %10 (+  %8  15))
                            (define %11 (extract  %10 %8 Vuu))
                            (define %13 (+  %5.new0  7))
                            (define %14 (extract  %13 %5.new0 Rt))
                            (define %16.ab0 (bvsizeext  %11 32 1))
                            (define %17.ab0 (bvsizeext  %14 32 1))
                            (define %18 (bvmul  %16.ab0  %17.ab0))
                            (define %23 (+  %8  1024))
                            (define %24 (+  %23  15))
                            (define %25 (extract  %24 %23 Vuu))
                            (define %80.new0 (/  iterator.0.new  4))
                            (define %81 (+  %80.new0  1))
                            (define %26 (*  8  %81))
                            (define %27 (+  %26  7))
                            (define %28 (extract  %27 %26 Rt))
                            (define %30.ab0 (bvsizeext  %25 32 1))
                            (define %31.ab0 (bvsizeext  %28 32 1))
                            (define %32 (bvmul  %30.ab0  %31.ab0))
                            (define %33.ab0 (bvaddnw %18 %32 32 -1 ))
                            (define %34.ab0 (bvaddnw %4 %33.ab0 32 -1 ))
                            %34.ab0
                            )
                  )
                )
      )
    )
  %dst0
  )

(define (hexagon_V6_vswap_128B  Vv.norm Vu.norm QtV.norm )
  (define Vdd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (concat
                  (apply
                    concat
                    (for/list ([%iterator1.norm (reverse (range 0 128 1))])
                              (define %0.copy0.copy.0.norm (extract  %iterator1.norm %iterator1.norm QtV.norm))
                              (define %13.norm (bvnot  %0.copy0.copy.0.norm))
                              (define %14.norm (*  8  %iterator1.norm))
                              (define %15.norm (+  %14.norm  7))
                              (define %16.norm (extract  %15.norm %14.norm Vu.norm))
                              (define %19.norm (extract  %15.norm %14.norm Vv.norm))
                              (define %20.norm (if (equal? %13.norm (bv #b1 1))
                                                 %16.norm %19.norm))
                              %20.norm
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new.norm (reverse (range 0 1024 8))])
                              (define %iterator0.new.div.norm (/  %iterator0.new.norm  8))
                              (define %0.norm (extract  %iterator0.new.div.norm %iterator0.new.div.norm QtV.norm))
                              (define %2.norm (+  %iterator0.new.norm  7))
                              (define %3.norm (extract  %2.norm %iterator0.new.norm Vu.norm))
                              (define %6.norm (extract  %2.norm %iterator0.new.norm Vv.norm))
                              (define %cond0.norm (bveq  %0.norm  (bv 1 1)))
                              (define %7.norm (if (equal? %cond0.norm #t) %3.norm %6.norm))
                              %7.norm
                              )
                    )
                  )
                )
      )
    )
  Vdd.norm
  )

(define (hexagon_V6_lvsplath_128B  Rt %elemsize0 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 1024 1024))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range 0 1024 %elemsize0))])
                            (define %2.high.idx 31 )
                            (define %2.low.idx (+ (- %2.high.idx %elemsize0) 1) )
                            (define %2 (extract  %2.high.idx %2.low.idx Rt))
                            %2
                            )
                  )
                )
      )
    )
  Vd
  )

(define (hexagon_V6_vandnqrt_acc_128B  Rt.norm Vx.norm QuV.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 1 1))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range 0 128 1))])
                            (define %0.norm (*  8  i.norm))
                            (define %1.norm (+  %0.norm  7))
                            (define %2.norm (extract  %1.norm %0.norm Vx.norm))
                            (define %3.norm (extract  i.norm i.norm QuV.norm))
                            (define %4.norm (bvnot  %3.norm))
                            (define %5.norm (modulo  i.norm  4))
                            (define %6.norm (*  8  %5.norm))
                            (define %7.norm (+  %6.norm  7))
                            (define %8.norm (extract  %7.norm %6.norm Rt.norm))
                            (define %9.norm (if (equal? %4.norm (bv #b1 1))
                                              %8.norm (bv 0 8)))
                            (define %10.norm (bvor  %2.norm  %9.norm))
                            %10.norm
                            )
                  )
                )
      )
    )
  %dst0.norm
  )

(define (vector-ashr v1 v2 vlen prec) (define VdV (apply concat (for/list ([%outer.it (reverse (range 0 1 1))]) (apply concat (for/list ([i.new (reverse (range 0 vlen prec))]) (define %1 (+  i.new  (- prec 1))) (define %2 (extract  %1 i.new v1)) (define %3 (extract  %1 i.new v2)) (define %4 (bvashr  %2  %3)) %4 ) ) ) ) )  VdV  )
(define (vector-lshr v1 v2 vlen prec) (define VdV (apply concat (for/list ([%outer.it (reverse (range 0 1 1))]) (apply concat (for/list ([i.new (reverse (range 0 vlen prec))]) (define %1 (+  i.new  (- prec 1))) (define %2 (extract  %1 i.new v1)) (define %3 (extract  %1 i.new v2)) (define %4 (bvlshr  %2  %3)) %4 ) ) ) ) )  VdV  )
(define (vector-shl v1 v2 vlen prec) (define VdV (apply concat (for/list ([%outer.it (reverse (range 0 1 1))]) (apply concat (for/list ([i.new (reverse (range 0 vlen prec))]) (define %1 (+  i.new  (- prec 1))) (define %2 (extract  %1 i.new v1)) (define %3 (extract  %1 i.new v2)) (define %4 (bvshl  %2  %3)) %4 ) ) ) ) )  VdV  )



;; ================================================================================
