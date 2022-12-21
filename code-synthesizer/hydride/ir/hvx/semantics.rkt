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




(define (hexagon_V6_vshuffb_128B  Vu %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 )
  (define Vd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([iterator.0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
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
  (bvpadhighbits  Vd %arg2)
  )

(define (hexagon_V6_vmpyih_acc_128B  Vx Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 Vx))
                            (define %5 (extract  %1 i.new0 Vu))
                            (define %8 (extract  %1 i.new0 Vv))
                            (define %9.ab0 (bvsizeext  %5 %arg4 %arg5))
                            (define %10.ab0 (bvsizeext  %8 %arg4 %arg3))
                            (define %11 (bvmul  %9.ab0  %10.ab0))
                            (define %12.ab0 (bvsizeext  %2 %arg2 %arg1))
                            (define %13.ab0 (bvaddnw %12.ab0 %11 %arg2 %arg0 ))
                            (define %16.high.idx (- %elemsize0 1))
                            (define %16.low.idx 0)
                            (define %16 (extract  %16.high.idx %16.low.idx %13.ab0))
                            %16
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0 %arg6)
  )

(define (hexagon_V6_vcombine_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %arg1 )
  (define Vdd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new0 (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %lastidx2 (-  %elemsize1  1))
                              (define %8 (+  %iterator1.new0  %lastidx2))
                              (define %9 (extract  %8 %iterator1.new0 Vu))
                              %9
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %lastidx0 (-  %elemsize0  1))
                              (define %1 (+  %iterator0.new0  %lastidx0))
                              (define %2 (extract  %1 %iterator0.new0 Vv))
                              %2
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  Vdd %arg1)
  )

(define (hexagon_V6_vaslw_128B  %arg0 VuV RtV %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 VuV))
                            (define %3 (bvand  RtV  %arg0))
                            (define %4 (bvshl  %2  %3))
                            %4
                            )
                  )
                )
      )
    )
  (bvpadhighbits  VdV %arg1)
  )

(define (hexagon_V6_vdealb4w_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %innerlaneoffset2 %innerlanesize2 %elemsize2 %innerlaneoffset3 %innerlanesize3 %elemsize3 %alpha.arg0 %arg0 %arg1 %arg2 %arg3 %arg4 %alpha.arg1 %arg5 %arg6 %arg7 %arg8 %arg9 %arg10 )
  (define Vdd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator3.new (reverse (range %innerlaneoffset3 %innerlanesize3 %elemsize3))])
                              (define %31.new0 (*  %iterator3.new  %arg8))
                              (define %32 (+  %arg7  %31.new0))
                              (define %lastidx7 (-  %elemsize3  1))
                              (define %33 (+  %32  %lastidx7))
                              (define %34 (extract  %33 %32 Vu))
                              %34
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator2.new (reverse (range %innerlaneoffset2 %innerlanesize2 %elemsize2))])
                              (define %factor2 (/  %elemsize2  %elemsize2))
                              (define %factor3 (*  %alpha.arg1  %factor2))
                              (define %21.new0 (*  %iterator2.new  %factor3))
                              (define %lastidx5 (-  %elemsize2  1))
                              (define %23 (+  %21.new0  %lastidx5))
                              (define %24 (extract  %23 %21.new0 Vu))
                              %24
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator1.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %11.new0 (*  %iterator1.new  %arg2))
                              (define %12 (+  %arg1  %11.new0))
                              (define %lastidx3 (-  %elemsize1  1))
                              (define %13 (+  %12  %lastidx3))
                              (define %14 (extract  %13 %12 Vv))
                              %14
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %elemsize0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
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
  (bvpadhighbits  Vdd %arg10)
  )

(define (hexagon_V6_vsubhw_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
  (define Vdd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new0.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %iterator1.new0.new.mul (*  %iterator1.new0.new  %arg8))
                              (define %18 (+  %arg7  %iterator1.new0.new.mul))
                              (define %lastidx3 (-  %elemsize1  1))
                              (define %19 (+  %18  %lastidx3))
                              (define %20 (extract  %19 %18 Vu))
                              (define %25 (extract  %19 %18 Vv))
                              (define %26.ab0 (bvsubnw %20 %25 %elemsize1 %arg6 ))
                              (define %31.ab0 (bvsizeext  %26.ab0 %arg3 %arg5))
                              %31.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %iterator0.new0.new.mul (*  %iterator0.new0.new  %factor1))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %3 (+  %iterator0.new0.new.mul  %lastidx1))
                              (define %4 (extract  %3 %iterator0.new0.new.mul Vu))
                              (define %9 (extract  %3 %iterator0.new0.new.mul Vv))
                              (define %10.ab0 (bvsubnw %4 %9 %elemsize0 %arg2 ))
                              (define %15.ab0 (bvsizeext  %10.ab0 %arg0 %arg1))
                              %15.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  Vdd %arg9)
  )

(define (hexagon_V6_vmpabus_acc_128B  Vxx Vuu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 %arg10 %arg11 %arg12 %arg13 %arg14 %arg15 %arg16 %arg17 %arg18 %arg19 %arg20 %arg21 %arg22 %arg23 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new0.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %iterator1.new0.new.mul (*  %iterator1.new0.new  %arg22))
                              (define %39 (+  %iterator1.new0.new.mul  %arg21))
                              (define %lastidx5 (-  %arg10  1))
                              (define %40 (+  %39  %lastidx5))
                              (define %41 (extract  %40 %39 Vxx))
                              (define %45 (+  %arg20  %iterator1.new0.new.mul))
                              (define %lastidx9 (-  %elemsize1  1))
                              (define %47 (+  %45  %lastidx9))
                              (define %48 (extract  %47 %45 Vuu))
                              (define %lastidx8 (-  %elemsize1  1))
                              (define %highidx3 (+  %lastidx8  %arg19))
                              (define %51 (extract  %highidx3 %arg19 Rt))
                              (define %52.ab0 (bvsizeext  %48 %arg10 %arg18))
                              (define %53.ab0 (bvsizeext  %51 %arg10 %arg17))
                              (define %54 (bvmul  %52.ab0  %53.ab0))
                              (define %59 (+  %iterator1.new0.new.mul  %arg16))
                              (define %lastidx7 (-  %elemsize1  1))
                              (define %60 (+  %59  %lastidx7))
                              (define %61 (extract  %60 %59 Vuu))
                              (define %lastidx6 (-  %elemsize1  1))
                              (define %highidx2 (+  %lastidx6  %arg15))
                              (define %64 (extract  %highidx2 %arg15 Rt))
                              (define %65.ab0 (bvsizeext  %61 %arg10 %arg14))
                              (define %66.ab0 (bvsizeext  %64 %arg10 %arg13))
                              (define %67 (bvmul  %65.ab0  %66.ab0))
                              (define %68.ab0 (bvaddnw %54 %67 %arg10 %arg12 ))
                              (define %69.ab0 (bvaddnw %41 %68.ab0 %arg10 %arg11 ))
                              %69.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %iterator0.new0.new.mul (*  %iterator0.new0.new  %factor1))
                              (define %lastidx0 (-  %arg0  1))
                              (define %3 (+  %iterator0.new0.new.mul  %lastidx0))
                              (define %4 (extract  %3 %iterator0.new0.new.mul Vxx))
                              (define %lastidx4 (-  %elemsize0  1))
                              (define %10 (+  %iterator0.new0.new.mul  %lastidx4))
                              (define %11 (extract  %10 %iterator0.new0.new.mul Vuu))
                              (define %lastidx3 (-  %elemsize0  1))
                              (define %highidx1 (+  %lastidx3  %arg9))
                              (define %14 (extract  %highidx1 %arg9 Rt))
                              (define %15.ab0 (bvsizeext  %11 %arg0 %arg8))
                              (define %16.ab0 (bvsizeext  %14 %arg0 %arg7))
                              (define %17 (bvmul  %15.ab0  %16.ab0))
                              (define %22 (+  %iterator0.new0.new.mul  %arg6))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %23 (+  %22  %lastidx2))
                              (define %24 (extract  %23 %22 Vuu))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %highidx0 (+  %lastidx1  %arg5))
                              (define %27 (extract  %highidx0 %arg5 Rt))
                              (define %28.ab0 (bvsizeext  %24 %arg0 %arg4))
                              (define %29.ab0 (bvsizeext  %27 %arg0 %arg3))
                              (define %30 (bvmul  %28.ab0  %29.ab0))
                              (define %31.ab0 (bvaddnw %17 %30 %arg0 %arg2 ))
                              (define %32.ab0 (bvaddnw %4 %31.ab0 %arg0 %arg1 ))
                              %32.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0 %arg23)
  )

(define (hexagon_V6_vmpybv_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
  (define Vdd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new0.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %iterator1.new0.new.mul (*  %iterator1.new0.new  %arg8))
                              (define %19 (+  %arg7  %iterator1.new0.new.mul))
                              (define %lastidx3 (-  %elemsize1  1))
                              (define %20 (+  %19  %lastidx3))
                              (define %21 (extract  %20 %19 Vu))
                              (define %26 (extract  %20 %19 Vv))
                              (define %27.ab0 (bvsizeext  %21 %arg3 %arg6))
                              (define %28.ab0 (bvsizeext  %26 %arg3 %arg5))
                              (define %29 (bvmul  %27.ab0  %28.ab0))
                              %29
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %iterator0.new0.new.mul (*  %iterator0.new0.new  %factor1))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %3 (+  %iterator0.new0.new.mul  %lastidx1))
                              (define %4 (extract  %3 %iterator0.new0.new.mul Vu))
                              (define %9 (extract  %3 %iterator0.new0.new.mul Vv))
                              (define %10.ab0 (bvsizeext  %4 %arg0 %arg2))
                              (define %11.ab0 (bvsizeext  %9 %arg0 %arg1))
                              (define %12 (bvmul  %10.ab0  %11.ab0))
                              %12
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  Vdd %arg9)
  )

(define (hexagon_V6_lvsplath_128B  Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %2.high.idx (- %elemsize0 1))
                            (define %2.low.idx 0)
                            (define %2 (extract  %2.high.idx %2.low.idx Rt))
                            %2
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg0)
  )

(define (hexagon_V6_vasrw_acc_128B  %arg1 Vx Vu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 Vx))
                            (define %5 (extract  %1 i.new0 Vu))
                            (define %6 (bvand  Rt  %arg1))
                            (define %7 (bvashr  %5  %6))
                            (define %8.ab0 (bvaddnw %2 %7 %elemsize0 %arg0 ))
                            %8.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0 %arg2)
  )

(define (hexagon_V6_vroundhub_128B  %arg8 %arg7 %arg3 %arg2 Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg4 %arg5 %alpha.arg0 %arg6 %arg9 %arg10 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg5  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %lastidx1 (-  %arg5  1))
                            (define %1 (+  i.new0.new.mul  %lastidx1))
                            (define %2 (extract  %1 i.new0.new.mul Vv))
                            (define %3.ab0 (bvaddnw %2 %arg8 %arg5 %arg9 ))
                            (define %4 (bvlshr  %3.ab0  %arg7))
                            (define %5.ab0 (bvsaturate  %4 16 %elemsize0 %arg6))
                            (define %12 (extract  %1 i.new0.new.mul Vu))
                            (define %13.ab0 (bvaddnw %12 %arg3 %arg5 %arg4 ))
                            (define %14 (bvlshr  %13.ab0  %arg2))
                            (define %15.ab0 (bvsaturate  %14 16 %elemsize0 %arg1))
                            (concat %15.ab0 %5.ab0)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg10)
  )

(define (hexagon_V6_vsb_128B  Vu %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
  (define Vdd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new0.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %iterator1.new0.new.mul (*  %iterator1.new0.new  %arg6))
                              (define %12 (+  %arg5  %iterator1.new0.new.mul))
                              (define %lastidx3 (-  %elemsize1  1))
                              (define %13 (+  %12  %lastidx3))
                              (define %14 (extract  %13 %12 Vu))
                              (define %19.ab0 (bvsizeext  %14 %arg2 %arg4))
                              %19.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %iterator0.new0.new.mul (*  %iterator0.new0.new  %factor1))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %3 (+  %iterator0.new0.new.mul  %lastidx1))
                              (define %4 (extract  %3 %iterator0.new0.new.mul Vu))
                              (define %9.ab0 (bvsizeext  %4 %arg0 %arg1))
                              %9.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  Vdd %arg7)
  )

(define (hexagon_V6_vmpyowh_rnd_128B  %arg5 %arg3 %arg2 Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg4 %arg6 %arg7 %arg8 %arg9 %arg10 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  i.new0.new.mul  %lastidx0))
                            (define %2 (extract  %1 i.new0.new.mul Vu))
                            (define %5 (+  %arg9  i.new0.new.mul))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %6 (+  %5  %lastidx1))
                            (define %7 (extract  %6 %5 Vv))
                            (define %9.ab0 (bvsizeext  %2 %arg7 %arg8))
                            (define %10.ab0 (bvsizeext  %7 %arg7 %arg6))
                            (define %11 (bvmul  %9.ab0  %10.ab0))
                            (define %12 (bvlshr  %11  %arg5))
                            (define %13.ab0 (bvaddnw %12 %arg3 %arg7 %arg4 ))
                            (define %14 (bvlshr  %13.ab0  %arg2))
                            (define %15.ab0 (bvsaturate  %14 64 %arg0 %arg1))
                            %15.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg10)
  )

(define (hexagon_V6_vasrhubsat_128B  %arg7 VuV VvV RtV %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %alpha.arg0 %arg5 %arg6 %arg8 )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg4  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %0 (bvand  RtV  %arg7))
                            (define %lastidx1 (-  %arg4  1))
                            (define %2 (+  i.new0.new.mul  %lastidx1))
                            (define %3 (extract  %2 i.new0.new.mul VvV))
                            (define %4.ab0 (bvsizeext  %3 %arg3 %arg6))
                            (define %5 (bvashr  %4.ab0  %0))
                            (define %6.ab0 (bvsaturate  %5 %arg3 %elemsize0 %arg5))
                            (define %13 (extract  %2 i.new0.new.mul VuV))
                            (define %14.ab0 (bvsizeext  %13 %arg3 %arg2))
                            (define %15 (bvashr  %14.ab0  %0))
                            (define %16.ab0 (bvsaturate  %15 %arg3 %elemsize0 %arg1))
                            (concat %16.ab0 %6.ab0)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  VdV %arg8)
  )

(define (hexagon_V6_vabsdiffuh_128B  Vu.norm Vv.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg0.norm %arg1.norm %arg2.norm %arg3.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.new0.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %1.norm (+  i.new0.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm i.new0.norm Vu.norm))
                            (define %5.norm (extract  %1.norm i.new0.norm Vv.norm))
                            (define %6.ab0.norm (bvgt %2.norm %5.norm %arg2.norm ))
                            (define %13.ab0.norm (bvsubnw %2.norm %5.norm %elemsize0.norm %arg1.norm ))
                            (define %20.ab0.norm (bvsubnw %5.norm %2.norm %elemsize0.norm %arg0.norm ))
                            (define %21.norm (if (equal? %6.ab0.norm #t) %13.ab0.norm %20.ab0.norm))
                            %21.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd.norm %arg3.norm)
  )

(define (hexagon_V6_vroundwuh_128B  %arg8 %arg7 %arg3 %arg2 Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg4 %arg5 %alpha.arg0 %arg6 %arg9 %arg10 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg5  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %lastidx1 (-  %arg5  1))
                            (define %1 (+  i.new0.new.mul  %lastidx1))
                            (define %2 (extract  %1 i.new0.new.mul Vv))
                            (define %3.ab0 (bvaddnw %2 %arg8 %arg5 %arg9 ))
                            (define %4 (bvlshr  %3.ab0  %arg7))
                            (define %5.ab0 (bvsaturate  %4 32 %elemsize0 %arg6))
                            (define %12 (extract  %1 i.new0.new.mul Vu))
                            (define %13.ab0 (bvaddnw %12 %arg3 %arg5 %arg4 ))
                            (define %14 (bvlshr  %13.ab0  %arg2))
                            (define %15.ab0 (bvsaturate  %14 32 %elemsize0 %arg1))
                            (concat %15.ab0 %5.ab0)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg10)
  )

(define (hexagon_V6_veqb_or_128B  %arg0.norm Vv.norm Vu.norm %arg1.norm QxV.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %alpha.arg0.norm %arg3.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx2.norm (-  %elemsize0.norm  1))
                            (define %highidx1.norm (+  i.norm  %lastidx2.norm))
                            (define %6.norm (extract  %highidx1.norm i.norm QxV.norm))
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                            (define %8.new0.norm (*  i.norm  %factor1.norm))
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
  (bvpadhighbits  %dst0.norm %arg3.norm)
  )

(define (hexagon_V6_vaslw_acc_128B  %arg1 Vx Vu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg2 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 Vx))
                            (define %5 (extract  %1 i.new0 Vu))
                            (define %6 (bvand  Rt  %arg1))
                            (define %7 (bvshl  %5  %6))
                            (define %8.ab0 (bvaddnw %2 %7 %elemsize0 %arg0 ))
                            %8.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0 %arg2)
  )

(define (hexagon_V6_vdealb_128B  Vu %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %alpha.arg0 %arg0 %arg1 %arg2 %arg3 %arg4 )
  (define Vdd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %11.new0 (*  %iterator1.new  %arg2))
                              (define %12 (+  %arg1  %11.new0))
                              (define %lastidx3 (-  %elemsize1  1))
                              (define %13 (+  %12  %lastidx3))
                              (define %14 (extract  %13 %12 Vu))
                              %14
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %elemsize0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %1.new0 (*  %iterator0.new  %factor1))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %3 (+  %1.new0  %lastidx1))
                              (define %4 (extract  %3 %1.new0 Vu))
                              %4
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  Vdd %arg4)
  )

(define (hexagon_V6_vgtuw_128B  %arg1.norm %arg0.norm Vu.norm Vv.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg3.norm %alpha.arg0.norm %arg4.norm )
  (define QdV.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %factor0.norm (/  %arg3.norm  %elemsize0.norm))
                            (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                            (define %3.new0.norm (*  i.norm  %factor1.norm))
                            (define %lastidx1.norm (-  %arg3.norm  1))
                            (define %4.norm (+  %3.new0.norm  %lastidx1.norm))
                            (define %5.norm (extract  %4.norm %3.new0.norm Vu.norm))
                            (define %9.norm (extract  %4.norm %3.new0.norm Vv.norm))
                            (define %10.ab0.norm (bvgt %5.norm %9.norm %arg2.norm ))
                            (define %11.norm (if (equal? %10.ab0.norm #t) %arg0.norm %arg1.norm))
                            %11.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  QdV.norm %arg4.norm)
  )

(define (hexagon_V6_vandvqv_128B  %arg0.norm %arg1.norm QvV.norm Vu.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg3.norm %arg4.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define i.new.div.norm (/  i.new.norm  %arg3.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %highidx0.norm (+  i.new.div.norm  %lastidx1.norm))
                            (define %0.norm (extract  %highidx0.norm i.new.div.norm QvV.norm))
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %2.norm (+  i.new.norm  %lastidx0.norm))
                            (define %3.norm (extract  %2.norm i.new.norm Vu.norm))
                            (define %cond0.norm (bveq  %0.norm  %arg1.norm))
                            (define %4.norm (if (equal? %cond0.norm #t) %3.norm %arg0.norm))
                            %4.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd.norm %arg4.norm)
  )

(define (hexagon_V6_vshufoh_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %alpha.arg0 %arg0 %arg1 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %elemsize0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %2 (+  %arg0  i.new0.new.mul))
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
  (bvpadhighbits  Vd %arg1)
  )

(define (hexagon_V6_vmpyuhe_acc_128B  Vx Vu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  i.new0.new.mul  %lastidx0))
                            (define %2 (extract  %1 i.new0.new.mul Vx))
                            (define %lastidx2 (-  %elemsize0  1))
                            (define %6 (+  i.new0.new.mul  %lastidx2))
                            (define %7 (extract  %6 i.new0.new.mul Vu))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %highidx0 (+  %lastidx1  %arg4))
                            (define %10 (extract  %highidx0 %arg4 Rt))
                            (define %11.ab0 (bvsizeext  %7 %arg0 %arg3))
                            (define %12.ab0 (bvsizeext  %10 %arg0 %arg2))
                            (define %13 (bvmul  %11.ab0  %12.ab0))
                            (define %14.ab0 (bvaddnw %2 %13 %arg0 %arg1 ))
                            %14.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0 %arg5)
  )

(define (hexagon_V6_vmpyiwb_acc_128B  Vx Vu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define i.new.div (/  i.new  %arg8))
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define %0.new0 (*  i.new  %factor1))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  %0.new0  %lastidx0))
                            (define %2 (extract  %1 %0.new0 Vx))
                            (define %5 (extract  %1 %0.new0 Vu))
                            (define %6 (modulo  i.new.div  %arg7))
                            (define %7 (*  %elemsize0  %6))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %8 (+  %7  %lastidx1))
                            (define %9 (extract  %8 %7 Rt))
                            (define %11.ab0 (bvsizeext  %5 %arg5 %arg6))
                            (define %12.ab0 (bvsizeext  %9 %arg5 %arg4))
                            (define %13 (bvmul  %11.ab0  %12.ab0))
                            (define %14.ab0 (bvsizeext  %2 %arg3 %arg2))
                            (define %15.ab0 (bvaddnw %14.ab0 %13 %arg3 %arg1 ))
                            (define %18.high.idx (- %arg0 1))
                            (define %18.low.idx 0)
                            (define %18 (extract  %18.high.idx %18.low.idx %15.ab0))
                            %18
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0 %arg9)
  )

(define (hexagon_V6_hi_128B  Vxx %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %3 (+  i.new0  %lastidx0))
                            (define %4 (extract  %3 i.new0 Vxx))
                            %4
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg0)
  )

(define (hexagon_V6_vasrhubrndsat_128B  %arg13 %arg11 %arg10 Vu Vv Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %alpha.arg0 %arg6 %arg7 %arg8 %arg9 %arg12 %arg14 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg5  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %0 (bvand  Rt  %arg13))
                            (define %lastidx1 (-  %arg5  1))
                            (define %2 (+  i.new0.new.mul  %lastidx1))
                            (define %3 (extract  %2 i.new0.new.mul Vv))
                            (define %4.ab0 (bvsubnw %0 %arg11 32 %arg12 ))
                            (define %5 (bvshl  %arg10  %4.ab0))
                            (define %6.ab0 (bvsizeext  %3 %arg9 %arg8))
                            (define %7.ab0 (bvaddnw %6.ab0 %5 %arg9 %arg7 ))
                            (define %8 (bvashr  %7.ab0  %0))
                            (define %9.ab0 (bvsaturate  %8 32 %elemsize0 %arg6))
                            (define %16 (extract  %2 i.new0.new.mul Vu))
                            (define %19.ab0 (bvsizeext  %16 %arg4 %arg3))
                            (define %20.ab0 (bvaddnw %19.ab0 %5 %arg4 %arg2 ))
                            (define %21 (bvashr  %20.ab0  %0))
                            (define %22.ab0 (bvsaturate  %21 32 %elemsize0 %arg1))
                            (concat %22.ab0 %9.ab0)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg14)
  )

(define (hexagon_V6_lo_128B  Vxx %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %2 (+  i.new0  %arg0))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %3 (+  %2  %lastidx1))
                            (define %4 (extract  %3 %2 Vxx))
                            %4
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg1)
  )

(define (hexagon_V6_veqh_and_128B  Vu.norm %arg0.norm %arg1.norm Vv.norm QxV.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %alpha.arg0.norm %arg3.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %5.new0.norm (+  i.norm  %lastidx0.norm))
                            (define %6.norm (extract  %5.new0.norm i.norm QxV.norm))
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                            (define %8.new0.norm (*  i.norm  %factor1.norm))
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
  (bvpadhighbits  %dst0.norm %arg3.norm)
  )

(define (hexagon_V6_vlsrwv_128B  VvV.norm %arg0.norm VuV.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm )
  (define VdV.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.new0.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %1.norm (+  i.new0.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm i.new0.norm VvV.norm))
                            (define %3.ab0.norm (bvgt %2.norm %arg0.norm %arg1.norm ))
                            (define %6.norm (extract  %1.norm i.new0.norm VuV.norm))
                            (define %10.norm (bvlshr  %6.norm  %2.norm))
                            (define %17.norm (bvshl  %6.norm  %2.norm))
                            (define %18.norm (if (equal? %3.ab0.norm #t) %10.norm %17.norm))
                            %18.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  VdV.norm %arg2.norm)
  )

(define (hexagon_V6_vmpyh_acc_128B  Vxx Vu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 %arg10 %arg11 %arg12 %arg13 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new0.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %iterator1.new0.new.mul (*  %iterator1.new0.new  %arg12))
                              (define %23 (+  %iterator1.new0.new.mul  %arg11))
                              (define %lastidx3 (-  %arg5  1))
                              (define %24 (+  %23  %lastidx3))
                              (define %25 (extract  %24 %23 Vxx))
                              (define %28 (+  %arg10  %iterator1.new0.new.mul))
                              (define %lastidx5 (-  %elemsize1  1))
                              (define %29 (+  %28  %lastidx5))
                              (define %30 (extract  %29 %28 Vu))
                              (define %lastidx4 (-  %elemsize1  1))
                              (define %highidx1 (+  %lastidx4  %arg9))
                              (define %33 (extract  %highidx1 %arg9 Rt))
                              (define %34.ab0 (bvsizeext  %30 %arg5 %arg8))
                              (define %35.ab0 (bvsizeext  %33 %arg5 %arg7))
                              (define %36 (bvmul  %34.ab0  %35.ab0))
                              (define %37.ab0 (bvaddnw %25 %36 %arg5 %arg6 ))
                              %37.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %iterator0.new0.new.mul (*  %iterator0.new0.new  %factor1))
                              (define %lastidx0 (-  %arg0  1))
                              (define %3 (+  %iterator0.new0.new.mul  %lastidx0))
                              (define %4 (extract  %3 %iterator0.new0.new.mul Vxx))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %8 (+  %iterator0.new0.new.mul  %lastidx2))
                              (define %9 (extract  %8 %iterator0.new0.new.mul Vu))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %highidx0 (+  %lastidx1  %arg4))
                              (define %12 (extract  %highidx0 %arg4 Rt))
                              (define %13.ab0 (bvsizeext  %9 %arg0 %arg3))
                              (define %14.ab0 (bvsizeext  %12 %arg0 %arg2))
                              (define %15 (bvmul  %13.ab0  %14.ab0))
                              (define %16.ab0 (bvaddnw %4 %15 %arg0 %arg1 ))
                              %16.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0 %arg13)
  )

(define (hexagon_V6_vaddubh_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 )
  (define Vdd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new0.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %iterator1.new0.new.mul (*  %iterator1.new0.new  %arg8))
                              (define %18 (+  %arg7  %iterator1.new0.new.mul))
                              (define %lastidx3 (-  %elemsize1  1))
                              (define %19 (+  %18  %lastidx3))
                              (define %20 (extract  %19 %18 Vu))
                              (define %25 (extract  %19 %18 Vv))
                              (define %26.ab0 (bvaddnw %20 %25 %elemsize1 %arg6 ))
                              (define %31.ab0 (bvsizeext  %26.ab0 %arg3 %arg5))
                              %31.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %iterator0.new0.new.mul (*  %iterator0.new0.new  %factor1))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %3 (+  %iterator0.new0.new.mul  %lastidx1))
                              (define %4 (extract  %3 %iterator0.new0.new.mul Vu))
                              (define %9 (extract  %3 %iterator0.new0.new.mul Vv))
                              (define %10.ab0 (bvaddnw %4 %9 %elemsize0 %arg2 ))
                              (define %15.ab0 (bvsizeext  %10.ab0 %arg0 %arg1))
                              %15.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  Vdd %arg9)
  )

(define (hexagon_V6_vmpyiewuh_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  i.new0.new.mul  %lastidx0))
                            (define %2 (extract  %1 i.new0.new.mul Vu))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %6 (+  i.new0.new.mul  %lastidx1))
                            (define %7 (extract  %6 i.new0.new.mul Vv))
                            (define %9.ab0 (bvsizeext  %2 %arg2 %arg3))
                            (define %10.ab0 (bvsizeext  %7 %arg2 %arg1))
                            (define %11 (bvmul  %9.ab0  %10.ab0))
                            (define %14.high.idx (- %arg0 1))
                            (define %14.low.idx 0)
                            (define %14 (extract  %14.high.idx %14.low.idx %11))
                            %14
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg4)
  )

(define (hexagon_V6_vaddwsat_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 Vu))
                            (define %5 (extract  %1 i.new0 Vv))
                            (define %6.ab0 (bvaddnw %2 %5 %elemsize0 %arg0 ))
                            %6.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg1)
  )

(define (hexagon_V6_vmpyih_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 Vu))
                            (define %5 (extract  %1 i.new0 Vv))
                            (define %6.ab0 (bvsizeext  %2 %arg1 %arg2))
                            (define %7.ab0 (bvsizeext  %5 %arg1 %arg0))
                            (define %8 (bvmul  %6.ab0  %7.ab0))
                            (define %11.high.idx (- %elemsize0 1))
                            (define %11.low.idx 0)
                            (define %11 (extract  %11.high.idx %11.low.idx %8))
                            %11
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg3)
  )

(define (hexagon_V6_vnavgw_128B  %arg0 Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg2 %arg3 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 Vu))
                            (define %5 (extract  %1 i.new0 Vv))
                            (define %6.ab0 (bvsubnw %2 %5 %elemsize0 %arg2 ))
                            (define %7.ab0 (bvdiv %6.ab0 %arg0 %arg1 ))
                            %7.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg3)
  )

(define (hexagon_V6_vasrwhrndsat_128B  %arg9 %arg7 %arg6 Vu Vv Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %alpha.arg0 %arg4 %arg5 %arg8 %arg10 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg3  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %0 (bvand  Rt  %arg9))
                            (define %lastidx1 (-  %arg3  1))
                            (define %2 (+  i.new0.new.mul  %lastidx1))
                            (define %3 (extract  %2 i.new0.new.mul Vv))
                            (define %4.ab0 (bvsubnw %0 %arg7 32 %arg8 ))
                            (define %5 (bvshl  %arg6  %4.ab0))
                            (define %6.ab0 (bvaddnw %3 %5 %arg3 %arg5 ))
                            (define %7 (bvashr  %6.ab0  %0))
                            (define %8.ab0 (bvsaturate  %7 32 %elemsize0 %arg4))
                            (define %15 (extract  %2 i.new0.new.mul Vu))
                            (define %18.ab0 (bvaddnw %15 %5 %arg3 %arg2 ))
                            (define %19 (bvashr  %18.ab0  %0))
                            (define %20.ab0 (bvsaturate  %19 32 %elemsize0 %arg1))
                            (concat %20.ab0 %8.ab0)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg10)
  )

(define (hexagon_V6_vgtuw_and_128B  %arg1.norm %arg0.norm QxV.norm Vu.norm Vv.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg3.norm %alpha.arg0.norm %arg4.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %5.new0.norm (+  i.norm  %lastidx0.norm))
                            (define %6.norm (extract  %5.new0.norm i.norm QxV.norm))
                            (define %factor0.norm (/  %arg3.norm  %elemsize0.norm))
                            (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                            (define %8.new0.norm (*  i.norm  %factor1.norm))
                            (define %lastidx1.norm (-  %arg3.norm  1))
                            (define %9.norm (+  %8.new0.norm  %lastidx1.norm))
                            (define %10.norm (extract  %9.norm %8.new0.norm Vu.norm))
                            (define %14.norm (extract  %9.norm %8.new0.norm Vv.norm))
                            (define %15.ab0.norm (bvgt %10.norm %14.norm %arg2.norm ))
                            (define %16.norm (if (equal? %15.ab0.norm #t) %arg0.norm %arg1.norm))
                            (define %17.norm (bvand  %6.norm  %16.norm))
                            %17.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0.norm %arg4.norm)
  )

(define (hexagon_V6_vandnqrt_128B  %arg1.norm Rt.norm QuV.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg0.norm %alpha.arg0.norm %arg2.norm %arg3.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx2.norm (-  %elemsize0.norm  1))
                            (define %highidx0.norm (+  i.norm  %lastidx2.norm))
                            (define %0.norm (extract  %highidx0.norm i.norm QuV.norm))
                            (define %1.norm (bvnot  %0.norm))
                            (define %2.norm (modulo  i.norm  %arg2.norm))
                            (define %3.norm (*  %arg0.norm  %2.norm))
                            (define %lastidx1.norm (-  %arg0.norm  1))
                            (define %4.norm (+  %3.norm  %lastidx1.norm))
                            (define %5.norm (extract  %4.norm %3.norm Rt.norm))
                            (define %6.norm (if (equal? %1.norm (bv #b1 1))
                                              %5.norm %arg1.norm))
                            %6.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd.norm %arg3.norm)
  )

(define (hexagon_V6_vlsrw_128B  %arg0 VuV RtV %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 VuV))
                            (define %3 (bvand  RtV  %arg0))
                            (define %4 (bvlshr  %2  %3))
                            %4
                            )
                  )
                )
      )
    )
  (bvpadhighbits  VdV %arg1)
  )

(define (hexagon_V6_vasrwuhsat_128B  %arg4 VuV VvV RtV %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %alpha.arg0 %arg3 %arg5 )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg2  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %0 (bvand  RtV  %arg4))
                            (define %lastidx1 (-  %arg2  1))
                            (define %2 (+  i.new0.new.mul  %lastidx1))
                            (define %3 (extract  %2 i.new0.new.mul VvV))
                            (define %4 (bvashr  %3  %0))
                            (define %5.ab0 (bvsaturate  %4 %arg2 %elemsize0 %arg3))
                            (define %12 (extract  %2 i.new0.new.mul VuV))
                            (define %13 (bvashr  %12  %0))
                            (define %14.ab0 (bvsaturate  %13 %arg2 %elemsize0 %arg1))
                            (concat %14.ab0 %5.ab0)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  VdV %arg5)
  )

(define (hexagon_V6_vmpyiewuh_acc_128B  Vx Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  i.new0.new.mul  %lastidx0))
                            (define %2 (extract  %1 i.new0.new.mul Vx))
                            (define %5 (extract  %1 i.new0.new.mul Vu))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %9 (+  i.new0.new.mul  %lastidx1))
                            (define %10 (extract  %9 i.new0.new.mul Vv))
                            (define %12.ab0 (bvsizeext  %5 %arg5 %arg6))
                            (define %13.ab0 (bvsizeext  %10 %arg5 %arg4))
                            (define %14 (bvmul  %12.ab0  %13.ab0))
                            (define %15.ab0 (bvsizeext  %2 %arg3 %arg2))
                            (define %16.ab0 (bvaddnw %15.ab0 %14 %arg3 %arg1 ))
                            (define %19.high.idx (- %arg0 1))
                            (define %19.low.idx 0)
                            (define %19 (extract  %19.high.idx %19.low.idx %16.ab0))
                            %19
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0 %arg7)
  )

(define (hexagon_V6_vaddcarrysat_128B  Vu Vv QsV %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define %0 (*  %factor1  i))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  %0  %lastidx0))
                            (define %2 (extract  %1 %0 Vu))
                            (define %5 (extract  %1 %0 Vv))
                            (define %6.ab0 (bvaddnw %2 %5 %arg0 %arg4 ))
                            (define %7 (*  i  %arg3))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %highidx0 (+  %7  %lastidx1))
                            (define %8 (extract  %highidx0 %7 QsV))
                            (define %9.ab0 (bvsizeext  %8 %arg0 %arg2))
                            (define %10.ab0 (bvaddnw %6.ab0 %9.ab0 %arg0 %arg1 ))
                            %10.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg5)
  )

(define (hexagon_V6_vmaxh_128B  Vu.norm Vv.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg0.norm %arg1.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.new0.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %1.norm (+  i.new0.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm i.new0.norm Vu.norm))
                            (define %5.norm (extract  %1.norm i.new0.norm Vv.norm))
                            (define %6.ab0.norm (bvgt %2.norm %5.norm %arg0.norm ))
                            (define %13.norm (if (equal? %6.ab0.norm #t) %2.norm %5.norm))
                            %13.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd.norm %arg1.norm)
  )

(define (hexagon_V6_vmpyewuh_128B  %arg1 Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg2 %arg3 %arg4 %arg5 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  i.new0.new.mul  %lastidx0))
                            (define %2 (extract  %1 i.new0.new.mul Vu))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %6 (+  i.new0.new.mul  %lastidx1))
                            (define %7 (extract  %6 i.new0.new.mul Vv))
                            (define %9.ab0 (bvsizeext  %2 %arg3 %arg4))
                            (define %10.ab0 (bvsizeext  %7 %arg3 %arg2))
                            (define %11 (bvmul  %9.ab0  %10.ab0))
                            (define %12 (bvlshr  %11  %arg1))
                            (define %15.high.idx (- %arg0 1))
                            (define %15.low.idx 0)
                            (define %15 (extract  %15.high.idx %15.low.idx %12))
                            %15
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg5)
  )

(define (hexagon_V6_vmpyhv_acc_128B  Vxx Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 %arg10 %arg11 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new0.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %iterator1.new0.new.mul (*  %iterator1.new0.new  %arg10))
                              (define %25 (+  %iterator1.new0.new.mul  %arg9))
                              (define %lastidx2 (-  %arg4  1))
                              (define %26 (+  %25  %lastidx2))
                              (define %27 (extract  %26 %25 Vxx))
                              (define %30 (+  %arg8  %iterator1.new0.new.mul))
                              (define %lastidx3 (-  %elemsize1  1))
                              (define %31 (+  %30  %lastidx3))
                              (define %32 (extract  %31 %30 Vu))
                              (define %37 (extract  %31 %30 Vv))
                              (define %38.ab0 (bvsizeext  %32 %arg4 %arg7))
                              (define %39.ab0 (bvsizeext  %37 %arg4 %arg6))
                              (define %40 (bvmul  %38.ab0  %39.ab0))
                              (define %41.ab0 (bvaddnw %27 %40 %arg4 %arg5 ))
                              %41.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %iterator0.new0.new.mul (*  %iterator0.new0.new  %factor1))
                              (define %lastidx0 (-  %arg0  1))
                              (define %3 (+  %iterator0.new0.new.mul  %lastidx0))
                              (define %4 (extract  %3 %iterator0.new0.new.mul Vxx))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %8 (+  %iterator0.new0.new.mul  %lastidx1))
                              (define %9 (extract  %8 %iterator0.new0.new.mul Vu))
                              (define %14 (extract  %8 %iterator0.new0.new.mul Vv))
                              (define %15.ab0 (bvsizeext  %9 %arg0 %arg3))
                              (define %16.ab0 (bvsizeext  %14 %arg0 %arg2))
                              (define %17 (bvmul  %15.ab0  %16.ab0))
                              (define %18.ab0 (bvaddnw %4 %17 %arg0 %arg1 ))
                              %18.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0 %arg11)
  )

(define (hexagon_V6_vxor_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 Vu))
                            (define %5 (extract  %1 i.new0 Vv))
                            (define %6 (bvxor  %2  %5))
                            %6
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg0)
  )

(define (hexagon_V6_vsatuwuh_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %alpha.arg0 %arg3 %arg4 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg2  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %lastidx1 (-  %arg2  1))
                            (define %1 (+  i.new0.new.mul  %lastidx1))
                            (define %2 (extract  %1 i.new0.new.mul Vv))
                            (define %3.ab0 (bvsaturate  %2 %arg2 %elemsize0 %arg3))
                            (define %10 (extract  %1 i.new0.new.mul Vu))
                            (define %11.ab0 (bvsaturate  %10 %arg2 %elemsize0 %arg1))
                            (concat %11.ab0 %3.ab0)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg4)
  )

(define (hexagon_V6_vor_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 Vu))
                            (define %5 (extract  %1 i.new0 Vv))
                            (define %6 (bvor  %2  %5))
                            %6
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg0)
  )

(define (hexagon_V6_vmpyieoh_128B  %arg1 Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg2 %arg3 %arg4 %arg5 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %lastidx2 (-  %elemsize0  1))
                            (define %3 (+  i.new0.new.mul  %lastidx2))
                            (define %4 (extract  %3 i.new0.new.mul Vu))
                            (define %7 (+  %arg4  i.new0.new.mul))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %8 (+  %7  %lastidx1))
                            (define %9 (extract  %8 %7 Vv))
                            (define %10.ab0 (bvsizeext  %4 %arg0 %arg3))
                            (define %11.ab0 (bvsizeext  %9 %arg0 %arg2))
                            (define %12 (bvmul  %10.ab0  %11.ab0))
                            (define %13 (bvshl  %12  %arg1))
                            %13
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg5)
  )

(define (hexagon_V6_vpackob_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %8.new0 (*  %iterator1.new  %arg4))
                              (define %9 (+  %arg3  %8.new0))
                              (define %lastidx3 (-  %elemsize1  1))
                              (define %10 (+  %9  %lastidx3))
                              (define %11 (extract  %10 %9 Vu))
                              %11
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %1.new0 (*  %iterator0.new  %arg1))
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
  (bvpadhighbits  Vd %arg6)
  )

(define (hexagon_V6_vmpabuuv_128B  Vuu Vvv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 %arg10 %arg11 %arg12 %arg13 %arg14 %arg15 %arg16 %arg17 )
  (define Vdd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new0.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %iterator1.new0.new.mul (*  %iterator1.new0.new  %arg16))
                              (define %42 (+  %arg15  %iterator1.new0.new.mul))
                              (define %lastidx5 (-  %elemsize1  1))
                              (define %44 (+  %42  %lastidx5))
                              (define %45 (extract  %44 %42 Vuu))
                              (define %52 (extract  %44 %42 Vvv))
                              (define %53.ab0 (bvsizeext  %45 %arg7 %arg14))
                              (define %54.ab0 (bvsizeext  %52 %arg7 %arg13))
                              (define %55 (bvmul  %53.ab0  %54.ab0))
                              (define %60 (+  %iterator1.new0.new.mul  %arg12))
                              (define %lastidx4 (-  %elemsize1  1))
                              (define %61 (+  %60  %lastidx4))
                              (define %62 (extract  %61 %60 Vuu))
                              (define %69 (extract  %61 %60 Vvv))
                              (define %70.ab0 (bvsizeext  %62 %arg7 %arg11))
                              (define %71.ab0 (bvsizeext  %69 %arg7 %arg10))
                              (define %72 (bvmul  %70.ab0  %71.ab0))
                              (define %73.ab0 (bvaddnw %55 %72 %arg7 %arg9 ))
                              %73.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %iterator0.new0.new.mul (*  %iterator0.new0.new  %factor1))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %5 (+  %iterator0.new0.new.mul  %lastidx2))
                              (define %6 (extract  %5 %iterator0.new0.new.mul Vuu))
                              (define %13 (extract  %5 %iterator0.new0.new.mul Vvv))
                              (define %14.ab0 (bvsizeext  %6 %arg0 %arg6))
                              (define %15.ab0 (bvsizeext  %13 %arg0 %arg5))
                              (define %16 (bvmul  %14.ab0  %15.ab0))
                              (define %21 (+  %iterator0.new0.new.mul  %arg4))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %22 (+  %21  %lastidx1))
                              (define %23 (extract  %22 %21 Vuu))
                              (define %30 (extract  %22 %21 Vvv))
                              (define %31.ab0 (bvsizeext  %23 %arg0 %arg3))
                              (define %32.ab0 (bvsizeext  %30 %arg0 %arg2))
                              (define %33 (bvmul  %31.ab0  %32.ab0))
                              (define %34.ab0 (bvaddnw %16 %33 %arg0 %arg1 ))
                              %34.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  Vdd %arg17)
  )

(define (hexagon_V6_vrmpyubv_acc_128B  Vx Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
  (define %dst0
    (apply
      concat
      (for/list ([i.new (reverse (range 0 %vectsize0 %outerlanesize0))])
                (define %lastidx0 (-  %outerlanesize0  1))
                (define %1.clone.0 (+  i.new  %lastidx0))
                (define %2.clone.0 (extract  %1.clone.0 i.new Vx))
                (define %dst0 %2.clone.0)
                (define %16.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new0.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %6 (+  iterator.0.new0.new0  %lastidx2))
                              (define %7 (extract  %6 iterator.0.new0.new0 Vu))
                              (define %12 (extract  %6 iterator.0.new0.new0 Vv))
                              (define %13.ab0 (bvsizeext  %7 %arg3 %arg4))
                              (define %14.ab0 (bvsizeext  %12 %arg3 %arg2))
                              (define %15 (bvmul  %13.ab0  %14.ab0))
                              (define %16.ab0 (bvsizeext  %15 %outerlanesize0 %arg1))
                              %16.ab0
                              )
                    ))
                (define %lastidx1 (-  %outerlanesize0  1))
                (define %79.clone.4 (+  i.new  %lastidx1))
                (define %16.acc0.ab0 (bvaddnw %16.ext0.red %dst0 %outerlanesize0 %arg0))
                %16.acc0.ab0
                )
      )
    )
  (bvpadhighbits  %dst0 %arg5)
  )

(define (hexagon_V6_vminub_128B  Vv.norm Vu.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg0.norm %arg1.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.new0.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %1.norm (+  i.new0.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm i.new0.norm Vu.norm))
                            (define %5.norm (extract  %1.norm i.new0.norm Vv.norm))
                            (define %6.ab0.norm (bvlt %2.norm %5.norm %arg0.norm ))
                            (define %13.norm (if (equal? %6.ab0.norm #t) %2.norm %5.norm))
                            %13.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd.norm %arg1.norm)
  )

(define (hexagon_V6_vaddhw_acc_128B  Vxx Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 %arg10 %arg11 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new0.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %iterator1.new0.new.mul (*  %iterator1.new0.new  %arg10))
                              (define %24 (+  %iterator1.new0.new.mul  %arg9))
                              (define %lastidx2 (-  %arg4  1))
                              (define %25 (+  %24  %lastidx2))
                              (define %26 (extract  %25 %24 Vxx))
                              (define %29 (+  %arg8  %iterator1.new0.new.mul))
                              (define %lastidx3 (-  %elemsize1  1))
                              (define %30 (+  %29  %lastidx3))
                              (define %31 (extract  %30 %29 Vu))
                              (define %36 (extract  %30 %29 Vv))
                              (define %37.ab0 (bvaddnw %31 %36 %elemsize1 %arg7 ))
                              (define %38.ab0 (bvsizeext  %37.ab0 %arg4 %arg6))
                              (define %39.ab0 (bvaddnw %26 %38.ab0 %arg4 %arg5 ))
                              %39.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %iterator0.new0.new.mul (*  %iterator0.new0.new  %factor1))
                              (define %lastidx0 (-  %arg0  1))
                              (define %3 (+  %iterator0.new0.new.mul  %lastidx0))
                              (define %4 (extract  %3 %iterator0.new0.new.mul Vxx))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %8 (+  %iterator0.new0.new.mul  %lastidx1))
                              (define %9 (extract  %8 %iterator0.new0.new.mul Vu))
                              (define %14 (extract  %8 %iterator0.new0.new.mul Vv))
                              (define %15.ab0 (bvaddnw %9 %14 %elemsize0 %arg3 ))
                              (define %16.ab0 (bvsizeext  %15.ab0 %arg0 %arg2))
                              (define %17.ab0 (bvaddnw %4 %16.ab0 %arg0 %arg1 ))
                              %17.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0 %arg11)
  )

(define (hexagon_V6_vdmpyhb_acc_128B  Vx Vu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 )
  (define %dst0
    (apply
      concat
      (for/list ([i.new (reverse (range 0 %vectsize0 %outerlanesize0))])
                (define %lastidx0 (-  %outerlanesize0  1))
                (define %1.clone.0 (+  i.new  %lastidx0))
                (define %2.clone.0 (extract  %1.clone.0 i.new Vx))
                (define %dst0 %2.clone.0)
                (define %17.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define iterator.0.new.div (/  iterator.0.new  %arg7))
                              (define %3.new0 (*  iterator.0.new  %arg6))
                              (define %5 (+  %3.new0  i.new))
                              (define %lastidx3 (-  %arg5  1))
                              (define %6 (+  %5  %lastidx3))
                              (define %7 (extract  %6 %5 Vu))
                              (define %8.new0 (/  i.new  %arg4))
                              (define %9 (+  %8.new0  iterator.0.new.div))
                              (define %10 (modulo  %9  %arg3))
                              (define %11 (*  %elemsize0  %10))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %12 (+  %11  %lastidx2))
                              (define %13 (extract  %12 %11 Rt))
                              (define %15.ab0 (bvsizeext  %7 %outerlanesize0 %arg2))
                              (define %16.ab0 (bvsizeext  %13 %outerlanesize0 %arg1))
                              (define %17 (bvmul  %15.ab0  %16.ab0))
                              %17
                              )
                    ))
                (define %lastidx1 (-  %outerlanesize0  1))
                (define %41.clone.2 (+  i.new  %lastidx1))
                (define %17.acc0.ab0 (bvaddnw %17.ext0.red %dst0 %outerlanesize0 %arg0))
                %17.acc0.ab0
                )
      )
    )
  (bvpadhighbits  %dst0 %arg8)
  )

(define (hexagon_V6_veqw_xor_128B  Vu.norm %arg0.norm %arg1.norm Vv.norm QxV.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %alpha.arg0.norm %arg3.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %5.new0.norm (+  i.norm  %lastidx0.norm))
                            (define %6.norm (extract  %5.new0.norm i.norm QxV.norm))
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                            (define %8.new0.norm (*  i.norm  %factor1.norm))
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
  (bvpadhighbits  %dst0.norm %arg3.norm)
  )

(define (hexagon_V6_pred_or_n_128B  QsV QtV %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
  (define QdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx2 (-  %elemsize0  1))
                            (define %highidx2 (+  i  %lastidx2))
                            (define %0 (extract  %highidx2 i QsV))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %highidx1 (+  i  %lastidx1))
                            (define %1 (extract  %highidx1 i QtV))
                            (define %2 (bvnot  %1))
                            (define %3 (bvor  %0  %2))
                            %3
                            )
                  )
                )
      )
    )
  (bvpadhighbits  QdV %arg0)
  )

(define (hexagon_V6_vgth_or_128B  %arg1.norm %arg0.norm QxV.norm Vu.norm Vv.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg3.norm %alpha.arg0.norm %arg4.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %5.new0.norm (+  i.norm  %lastidx0.norm))
                            (define %6.norm (extract  %5.new0.norm i.norm QxV.norm))
                            (define %factor0.norm (/  %arg3.norm  %elemsize0.norm))
                            (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                            (define %8.new0.norm (*  i.norm  %factor1.norm))
                            (define %lastidx1.norm (-  %arg3.norm  1))
                            (define %9.norm (+  %8.new0.norm  %lastidx1.norm))
                            (define %10.norm (extract  %9.norm %8.new0.norm Vu.norm))
                            (define %14.norm (extract  %9.norm %8.new0.norm Vv.norm))
                            (define %15.ab0.norm (bvgt %10.norm %14.norm %arg2.norm ))
                            (define %16.norm (if (equal? %15.ab0.norm #t) %arg0.norm %arg1.norm))
                            (define %17.norm (bvor  %6.norm  %16.norm))
                            %17.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0.norm %arg4.norm)
  )

(define (hexagon_V6_pred_not_128B  QsV %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
  (define QdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %highidx1 (+  i  %lastidx1))
                            (define %0 (extract  %highidx1 i QsV))
                            (define %1 (bvnot  %0))
                            %1
                            )
                  )
                )
      )
    )
  (bvpadhighbits  QdV %arg0)
  )

(define (hexagon_V6_vsubbnq_128B  %arg0.norm Vu.norm QvV.norm Vx.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define i.new.div.norm (/  i.new.norm  %arg3.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %highidx0.norm (+  i.new.div.norm  %lastidx1.norm))
                            (define %0.norm (extract  %highidx0.norm i.new.div.norm QvV.norm))
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %2.norm (+  i.new.norm  %lastidx0.norm))
                            (define %3.norm (extract  %2.norm i.new.norm Vx.norm))
                            (define %9.norm (extract  %2.norm i.new.norm Vu.norm))
                            (define %10.ab0.norm (bvsubnw %3.norm %9.norm %elemsize0.norm %arg1.norm ))
                            (define %cond0.norm (bveq  %0.norm  %arg0.norm))
                            (define %11.norm (if (equal? %cond0.norm #t) %3.norm %10.ab0.norm))
                            %11.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0.norm %arg4.norm)
  )

(define (hexagon_V6_pred_and_n_128B  QsV QtV %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
  (define QdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx2 (-  %elemsize0  1))
                            (define %highidx2 (+  i  %lastidx2))
                            (define %0 (extract  %highidx2 i QsV))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %highidx1 (+  i  %lastidx1))
                            (define %1 (extract  %highidx1 i QtV))
                            (define %2 (bvnot  %1))
                            (define %3 (bvand  %0  %2))
                            %3
                            )
                  )
                )
      )
    )
  (bvpadhighbits  QdV %arg0)
  )

(define (hexagon_V6_lvsplatw_128B  Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            Rt
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg0)
  )

(define (hexagon_V6_vabsw_sat_128B  Vu %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 Vu))
                            (define %3 (integer->bitvector (abs (bitvector->integer %2)) (bitvector %elemsize0)))
                            (define %4.ab0 (bvsaturate  %3 %elemsize0 %elemsize0 %arg0))
                            %4.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg1)
  )

(define (hexagon_V6_vasrh_acc_128B  %arg5 Vx Vu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg6 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 Vx))
                            (define %5 (extract  %1 i.new0 Vu))
                            (define %6 (bvand  Rt  %arg5))
                            (define %7.ab0 (bvsizeext  %5 %arg4 %arg3))
                            (define %8 (bvashr  %7.ab0  %6))
                            (define %9.ab0 (bvsizeext  %2 %arg2 %arg1))
                            (define %10.ab0 (bvaddnw %9.ab0 %8 %arg2 %arg0 ))
                            (define %13.high.idx (- %elemsize0 1))
                            (define %13.low.idx 0)
                            (define %13 (extract  %13.high.idx %13.low.idx %10.ab0))
                            %13
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0 %arg6)
  )

(define (hexagon_V6_vpackeh_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %alpha.arg0 %arg0 %alpha.arg1 %arg1 %arg2 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %factor2 (/  %elemsize1  %elemsize1))
                              (define %factor3 (*  %alpha.arg1  %factor2))
                              (define %11.new0 (*  %iterator1.new  %factor3))
                              (define %lastidx3 (-  %elemsize1  1))
                              (define %13 (+  %11.new0  %lastidx3))
                              (define %14 (extract  %13 %11.new0 Vu))
                              %14
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %elemsize0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
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
  (bvpadhighbits  Vd %arg2)
  )

(define (hexagon_V6_vaslh_acc_128B  %arg5 Vx Vu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg6 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 Vx))
                            (define %5 (extract  %1 i.new0 Vu))
                            (define %6 (bvand  Rt  %arg5))
                            (define %7.ab0 (bvsizeext  %5 %arg4 %arg3))
                            (define %8 (bvshl  %7.ab0  %6))
                            (define %9.ab0 (bvsizeext  %2 %arg2 %arg1))
                            (define %10.ab0 (bvaddnw %9.ab0 %8 %arg2 %arg0 ))
                            (define %13.high.idx (- %elemsize0 1))
                            (define %13.low.idx 0)
                            (define %13 (extract  %13.high.idx %13.low.idx %10.ab0))
                            %13
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0 %arg6)
  )

(define (hexagon_V6_vaslh_128B  %arg2 VuV RtV %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg3 )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 VuV))
                            (define %3 (bvand  RtV  %arg2))
                            (define %4.ab0 (bvsizeext  %2 %arg1 %arg0))
                            (define %5 (bvshl  %4.ab0  %3))
                            (define %8.high.idx (- %elemsize0 1))
                            (define %8.low.idx 0)
                            (define %8 (extract  %8.high.idx %8.low.idx %5))
                            %8
                            )
                  )
                )
      )
    )
  (bvpadhighbits  VdV %arg3)
  )

(define (hexagon_V6_vdmpybus_acc_128B  Vx Vu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
  (define %dst0
    (apply
      concat
      (for/list ([i.new (reverse (range 0 %vectsize0 %outerlanesize0))])
                (define %lastidx0 (-  %outerlanesize0  1))
                (define %1.clone.0 (+  i.new  %lastidx0))
                (define %2.clone.0 (extract  %1.clone.0 i.new Vx))
                (define %dst0 %2.clone.0)
                (define %15.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define iterator.0.new.div (/  iterator.0.new  %arg5))
                              (define %5 (+  iterator.0.new  i.new))
                              (define %lastidx3 (-  %elemsize0  1))
                              (define %6 (+  %5  %lastidx3))
                              (define %7 (extract  %6 %5 Vu))
                              (define %8.new1 (/  i.new  %arg4))
                              (define %8.new0 (+  %8.new1  iterator.0.new.div))
                              (define %9 (modulo  %8.new0  %arg3))
                              (define %10 (*  %elemsize0  %9))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %11 (+  %10  %lastidx2))
                              (define %12 (extract  %11 %10 Rt))
                              (define %13.ab0 (bvsizeext  %7 %outerlanesize0 %arg2))
                              (define %14.ab0 (bvsizeext  %12 %outerlanesize0 %arg1))
                              (define %15 (bvmul  %13.ab0  %14.ab0))
                              %15
                              )
                    ))
                (define %lastidx1 (-  %outerlanesize0  1))
                (define %38.clone.2 (+  i.new  %lastidx1))
                (define %15.acc0.ab0 (bvaddnw %15.ext0.red %dst0 %outerlanesize0 %arg0))
                %15.acc0.ab0
                )
      )
    )
  (bvpadhighbits  %dst0 %arg6)
  )

(define (hexagon_V6_vdmpyhvsat_128B  %arg0 Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg2 %arg3 %arg4 )
  (define Vd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 %vectsize0 %outerlanesize0))])
                (define %lastidx0 (-  %outerlanesize0  1))
                (define %29.0 (+  i.new  %lastidx0))
                (define %30 (extract  %29.0 i.new %arg0))
                (define Vd %30)
                (define %12.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new0.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %3 (+  iterator.0.new0.new0  %lastidx2))
                              (define %4 (extract  %3 iterator.0.new0.new0 Vu))
                              (define %9 (extract  %3 iterator.0.new0.new0 Vv))
                              (define %10.ab0 (bvsizeext  %4 %outerlanesize0 %arg3))
                              (define %11.ab0 (bvsizeext  %9 %outerlanesize0 %arg2))
                              (define %12 (bvmul  %10.ab0  %11.ab0))
                              %12
                              )
                    ))
                (define %lastidx1 (-  %outerlanesize0  1))
                (define %29.clone.0 (+  i.new  %lastidx1))
                (define %12.acc0.ab0 (bvaddnw %12.ext0.red Vd %outerlanesize0 %arg1))
                %12.acc0.ab0
                )
      )
    )
  (bvpadhighbits  Vd %arg4)
  )

(define (hexagon_V6_vavgb_128B  %arg0 Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg2 %arg3 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 Vu))
                            (define %5 (extract  %1 i.new0 Vv))
                            (define %6.ab0 (bvaddnw %2 %5 %elemsize0 %arg2 ))
                            (define %7.ab0 (bvdiv %6.ab0 %arg0 %arg1 ))
                            %7.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg3)
  )

(define (hexagon_V6_vandvnqv_128B  Vu.norm %arg1.norm QvV.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg0.norm %alpha.arg0.norm %arg2.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx1.norm (-  %elemsize0.norm  1))
                            (define %highidx0.norm (+  i.norm  %lastidx1.norm))
                            (define %0.norm (extract  %highidx0.norm i.norm QvV.norm))
                            (define %1.norm (bvnot  %0.norm))
                            (define %factor0.norm (/  %arg0.norm  %elemsize0.norm))
                            (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                            (define %2.norm (*  %factor1.norm  i.norm))
                            (define %lastidx0.norm (-  %arg0.norm  1))
                            (define %3.norm (+  %2.norm  %lastidx0.norm))
                            (define %4.norm (extract  %3.norm %2.norm Vu.norm))
                            (define %5.norm (if (equal? %1.norm (bv #b1 1))
                                              %4.norm %arg1.norm))
                            %5.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd.norm %arg2.norm)
  )

(define (hexagon_V6_vmpyub_128B  Vu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 %arg10 %arg11 %arg12 %arg13 %arg14 )
  (define Vdd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %19.new0 (*  %iterator1.new  %arg13))
                              (define %20 (+  %arg12  %19.new0))
                              (define %lastidx5 (-  %elemsize1  1))
                              (define %21 (+  %20  %lastidx5))
                              (define %22 (extract  %21 %20 Vu))
                              (define %23.new0 (/  %iterator1.new  %arg11))
                              (define %24 (+  %23.new0  %arg10))
                              (define %25 (modulo  %24  %arg9))
                              (define %26 (*  %elemsize1  %25))
                              (define %lastidx4 (-  %elemsize1  1))
                              (define %27 (+  %26  %lastidx4))
                              (define %28 (extract  %27 %26 Rt))
                              (define %29.ab0 (bvsizeext  %22 %arg5 %arg8))
                              (define %30.ab0 (bvsizeext  %28 %arg5 %arg7))
                              (define %31 (bvmul  %29.ab0  %30.ab0))
                              %31
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %1.new0 (*  %iterator0.new  %factor1))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %3 (+  %1.new0  %lastidx2))
                              (define %4 (extract  %3 %1.new0 Vu))
                              (define %5.new0 (/  %iterator0.new  %arg4))
                              (define %7 (modulo  %5.new0  %arg3))
                              (define %8 (*  %elemsize0  %7))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %9 (+  %8  %lastidx1))
                              (define %10 (extract  %9 %8 Rt))
                              (define %11.ab0 (bvsizeext  %4 %arg0 %arg2))
                              (define %12.ab0 (bvsizeext  %10 %arg0 %arg1))
                              (define %13 (bvmul  %11.ab0  %12.ab0))
                              %13
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  Vdd %arg14)
  )

(define (hexagon_V6_vunpackh_128B  Vu %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg2 )
  (define Vxx
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
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
  (bvpadhighbits  Vxx %arg2)
  )

(define (hexagon_V6_vmpyuhe_128B  Vu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %lastidx2 (-  %elemsize0  1))
                            (define %3 (+  i.new0.new.mul  %lastidx2))
                            (define %4 (extract  %3 i.new0.new.mul Vu))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %highidx0 (+  %lastidx1  %arg3))
                            (define %7 (extract  %highidx0 %arg3 Rt))
                            (define %8.ab0 (bvsizeext  %4 %arg0 %arg2))
                            (define %9.ab0 (bvsizeext  %7 %arg0 %arg1))
                            (define %10 (bvmul  %8.ab0  %9.ab0))
                            %10
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg4)
  )

(define (hexagon_V6_vmpyewuh_64_128B  %arg7 %arg1 Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg2 %arg3 %arg4 %arg5 %arg6 %arg8 %arg9 %arg10 %alpha.arg1 %arg11 %arg12 )
  (define Vdd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new0.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %factor2 (/  %elemsize1  %elemsize1))
                              (define %factor3 (*  %alpha.arg1  %factor2))
                              (define %iterator1.new0.new.mul (*  %iterator1.new0.new  %factor3))
                              (define %lastidx4 (-  %arg11  1))
                              (define %19 (+  %iterator1.new0.new.mul  %lastidx4))
                              (define %20 (extract  %19 %iterator1.new0.new.mul Vu))
                              (define %lastidx3 (-  %elemsize1  1))
                              (define %24 (+  %iterator1.new0.new.mul  %lastidx3))
                              (define %25 (extract  %24 %iterator1.new0.new.mul Vv))
                              (define %27.ab0 (bvsizeext  %20 %arg9 %arg10))
                              (define %28.ab0 (bvsizeext  %25 %arg9 %arg8))
                              (define %29 (bvmul  %27.ab0  %28.ab0))
                              (define %30 (bvlshr  %29  %arg7))
                              (define %35.high.idx (- %arg5 1))
                              (define %35.low.idx 0)
                              (define %35 (extract  %35.high.idx %35.low.idx %30))
                              %35
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %iterator0.new0.new.mul (*  %iterator0.new0.new  %factor1))
                              (define %lastidx0 (-  %arg0  1))
                              (define %1 (+  %iterator0.new0.new.mul  %lastidx0))
                              (define %2 (extract  %1 %iterator0.new0.new.mul Vu))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %6 (+  %iterator0.new0.new.mul  %lastidx1))
                              (define %7 (extract  %6 %iterator0.new0.new.mul Vv))
                              (define %9.ab0 (bvsizeext  %2 %arg3 %arg4))
                              (define %10.ab0 (bvsizeext  %7 %arg3 %arg2))
                              (define %11 (bvmul  %9.ab0  %10.ab0))
                              (define %12 (bvshl  %11  %arg1))
                              (define %17.high.idx (- %arg0 1))
                              (define %17.low.idx 0)
                              (define %17 (extract  %17.high.idx %17.low.idx %12))
                              %17
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  Vdd %arg12)
  )

(define (hexagon_V6_vsubbsat_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 Vu))
                            (define %5 (extract  %1 i.new0 Vv))
                            (define %6.ab0 (bvsubnw %2 %5 %elemsize0 %arg0 ))
                            %6.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg1)
  )

(define (hexagon_V6_vmpabuu_128B  Vuu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 %arg10 %arg11 %arg12 %arg13 %arg14 %arg15 %arg16 %arg17 %arg18 %arg19 %arg20 %arg21 )
  (define Vdd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new0.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %iterator1.new0.new.mul (*  %iterator1.new0.new  %arg20))
                              (define %34 (+  %arg19  %iterator1.new0.new.mul))
                              (define %lastidx9 (-  %elemsize1  1))
                              (define %36 (+  %34  %lastidx9))
                              (define %37 (extract  %36 %34 Vuu))
                              (define %lastidx8 (-  %elemsize1  1))
                              (define %highidx3 (+  %lastidx8  %arg18))
                              (define %40 (extract  %highidx3 %arg18 Rt))
                              (define %41.ab0 (bvsizeext  %37 %arg9 %arg17))
                              (define %42.ab0 (bvsizeext  %40 %arg9 %arg16))
                              (define %43 (bvmul  %41.ab0  %42.ab0))
                              (define %48 (+  %iterator1.new0.new.mul  %arg15))
                              (define %lastidx7 (-  %elemsize1  1))
                              (define %49 (+  %48  %lastidx7))
                              (define %50 (extract  %49 %48 Vuu))
                              (define %lastidx6 (-  %elemsize1  1))
                              (define %highidx2 (+  %lastidx6  %arg14))
                              (define %53 (extract  %highidx2 %arg14 Rt))
                              (define %54.ab0 (bvsizeext  %50 %arg9 %arg13))
                              (define %55.ab0 (bvsizeext  %53 %arg9 %arg12))
                              (define %56 (bvmul  %54.ab0  %55.ab0))
                              (define %57.ab0 (bvaddnw %43 %56 %arg9 %arg11 ))
                              %57.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %iterator0.new0.new.mul (*  %iterator0.new0.new  %factor1))
                              (define %lastidx4 (-  %elemsize0  1))
                              (define %5 (+  %iterator0.new0.new.mul  %lastidx4))
                              (define %6 (extract  %5 %iterator0.new0.new.mul Vuu))
                              (define %lastidx3 (-  %elemsize0  1))
                              (define %highidx1 (+  %lastidx3  %arg8))
                              (define %9 (extract  %highidx1 %arg8 Rt))
                              (define %10.ab0 (bvsizeext  %6 %arg0 %arg7))
                              (define %11.ab0 (bvsizeext  %9 %arg0 %arg6))
                              (define %12 (bvmul  %10.ab0  %11.ab0))
                              (define %17 (+  %iterator0.new0.new.mul  %arg5))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %18 (+  %17  %lastidx2))
                              (define %19 (extract  %18 %17 Vuu))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %highidx0 (+  %lastidx1  %arg4))
                              (define %22 (extract  %highidx0 %arg4 Rt))
                              (define %23.ab0 (bvsizeext  %19 %arg0 %arg3))
                              (define %24.ab0 (bvsizeext  %22 %arg0 %arg2))
                              (define %25 (bvmul  %23.ab0  %24.ab0))
                              (define %26.ab0 (bvaddnw %12 %25 %arg0 %arg1 ))
                              %26.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  Vdd %arg21)
  )

(define (hexagon_V6_vinsertwr_128B  Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 )
  (define Vx
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([%inner.it (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            Rt
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vx %arg1)
  )

(define (hexagon_V6_vmux_128B  QtV.norm %arg0.norm Vv.norm Vu.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define i.new.div.norm (/  i.new.norm  %arg2.norm))
                            (define %lastidx1.norm (-  %arg1.norm  1))
                            (define %highidx0.norm (+  i.new.div.norm  %lastidx1.norm))
                            (define %0.norm (extract  %highidx0.norm i.new.div.norm QtV.norm))
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %2.norm (+  i.new.norm  %lastidx0.norm))
                            (define %3.norm (extract  %2.norm i.new.norm Vu.norm))
                            (define %6.norm (extract  %2.norm i.new.norm Vv.norm))
                            (define %cond0.norm (bveq  %0.norm  %arg0.norm))
                            (define %7.norm (if (equal? %cond0.norm #t) %3.norm %6.norm))
                            %7.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd.norm %arg3.norm)
  )

(define (hexagon_V6_vdmpyhsusat_acc_128B  Vx Vu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 )
  (define %dst0
    (apply
      concat
      (for/list ([i.new (reverse (range 0 %vectsize0 %outerlanesize0))])
                (define %lastidx0 (-  %outerlanesize0  1))
                (define %1.clone.0 (+  i.new  %lastidx0))
                (define %2.clone.0 (extract  %1.clone.0 i.new Vx))
                (define %dst0 %2.clone.0)
                (define %13.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %5 (+  iterator.0.new0  i.new))
                              (define %lastidx3 (-  %elemsize0  1))
                              (define %6 (+  %5  %lastidx3))
                              (define %7 (extract  %6 %5 Vu))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %9 (+  iterator.0.new0  %lastidx2))
                              (define %10 (extract  %9 iterator.0.new0 Rt))
                              (define %11.ab0 (bvsizeext  %7 %outerlanesize0 %arg2))
                              (define %12.ab0 (bvsizeext  %10 %outerlanesize0 %arg1))
                              (define %13 (bvmul  %11.ab0  %12.ab0))
                              %13
                              )
                    ))
                (define %lastidx1 (-  %outerlanesize0  1))
                (define %29.clone.2 (+  i.new  %lastidx1))
                (define %13.acc0.ab0 (bvaddnw %13.ext0.red %dst0 %outerlanesize0 %arg0))
                %13.acc0.ab0
                )
      )
    )
  (bvpadhighbits  %dst0 %arg3)
  )

(define (hexagon_V6_vunpackob_128B  %arg2 Vxx Vu %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg3 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define %0.new0 (*  i.new  %factor1))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  %0.new0  %lastidx0))
                            (define %2 (extract  %1 %0.new0 Vxx))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %4 (+  i.new  %lastidx1))
                            (define %5 (extract  %4 i.new Vu))
                            (define %6 (bvshl  %5  %arg2))
                            (define %7.ab0 (bvsizeext  %6 %arg0 %arg1))
                            (define %8 (bvor  %2  %7.ab0))
                            %8
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0 %arg3)
  )

(define (hexagon_V6_vlsrh_128B  %arg2 VuV RtV %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg3 )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 VuV))
                            (define %3 (bvand  RtV  %arg2))
                            (define %4.ab0 (bvsizeext  %2 %arg1 %arg0))
                            (define %5 (bvlshr  %4.ab0  %3))
                            (define %8.high.idx (- %elemsize0 1))
                            (define %8.low.idx 0)
                            (define %8 (extract  %8.high.idx %8.low.idx %5))
                            %8
                            )
                  )
                )
      )
    )
  (bvpadhighbits  VdV %arg3)
  )

(define (hexagon_V6_vmpauhb_acc_128B  Vxx Vuu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 %arg10 %arg11 %arg12 %arg13 %arg14 %arg15 %arg16 %arg17 %arg18 %arg19 %arg20 %arg21 %arg22 %arg23 %arg24 %arg25 %arg26 %arg27 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new0.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %iterator1.new0.new.mul (*  %iterator1.new0.new  %arg26))
                              (define %41 (+  %iterator1.new0.new.mul  %arg25))
                              (define %lastidx5 (-  %arg12  1))
                              (define %42 (+  %41  %lastidx5))
                              (define %43 (extract  %42 %41 Vxx))
                              (define %47 (+  %arg24  %iterator1.new0.new.mul))
                              (define %lastidx9 (-  %arg23  1))
                              (define %49 (+  %47  %lastidx9))
                              (define %50 (extract  %49 %47 Vuu))
                              (define %lastidx8 (-  %elemsize1  1))
                              (define %highidx3 (+  %lastidx8  %arg22))
                              (define %53 (extract  %highidx3 %arg22 Rt))
                              (define %55.ab0 (bvsizeext  %50 %arg12 %arg21))
                              (define %56.ab0 (bvsizeext  %53 %arg12 %arg20))
                              (define %57 (bvmul  %55.ab0  %56.ab0))
                              (define %62 (+  %iterator1.new0.new.mul  %arg19))
                              (define %lastidx7 (-  %arg18  1))
                              (define %63 (+  %62  %lastidx7))
                              (define %64 (extract  %63 %62 Vuu))
                              (define %lastidx6 (-  %elemsize1  1))
                              (define %highidx2 (+  %lastidx6  %arg17))
                              (define %67 (extract  %highidx2 %arg17 Rt))
                              (define %69.ab0 (bvsizeext  %64 %arg12 %arg16))
                              (define %70.ab0 (bvsizeext  %67 %arg12 %arg15))
                              (define %71 (bvmul  %69.ab0  %70.ab0))
                              (define %72.ab0 (bvaddnw %57 %71 %arg12 %arg14 ))
                              (define %73.ab0 (bvaddnw %43 %72.ab0 %arg12 %arg13 ))
                              %73.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %iterator0.new0.new.mul (*  %iterator0.new0.new  %factor1))
                              (define %lastidx0 (-  %arg0  1))
                              (define %3 (+  %iterator0.new0.new.mul  %lastidx0))
                              (define %4 (extract  %3 %iterator0.new0.new.mul Vxx))
                              (define %lastidx4 (-  %arg11  1))
                              (define %10 (+  %iterator0.new0.new.mul  %lastidx4))
                              (define %11 (extract  %10 %iterator0.new0.new.mul Vuu))
                              (define %lastidx3 (-  %elemsize0  1))
                              (define %highidx1 (+  %lastidx3  %arg10))
                              (define %14 (extract  %highidx1 %arg10 Rt))
                              (define %16.ab0 (bvsizeext  %11 %arg0 %arg9))
                              (define %17.ab0 (bvsizeext  %14 %arg0 %arg8))
                              (define %18 (bvmul  %16.ab0  %17.ab0))
                              (define %23 (+  %iterator0.new0.new.mul  %arg7))
                              (define %lastidx2 (-  %arg6  1))
                              (define %24 (+  %23  %lastidx2))
                              (define %25 (extract  %24 %23 Vuu))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %highidx0 (+  %lastidx1  %arg5))
                              (define %28 (extract  %highidx0 %arg5 Rt))
                              (define %30.ab0 (bvsizeext  %25 %arg0 %arg4))
                              (define %31.ab0 (bvsizeext  %28 %arg0 %arg3))
                              (define %32 (bvmul  %30.ab0  %31.ab0))
                              (define %33.ab0 (bvaddnw %18 %32 %arg0 %arg2 ))
                              (define %34.ab0 (bvaddnw %4 %33.ab0 %arg0 %arg1 ))
                              %34.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0 %arg27)
  )

(define (hexagon_V6_veqw_128B  %arg0.norm Vv.norm Vu.norm %arg1.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %alpha.arg0.norm %arg3.norm )
  (define QdV.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %factor0.norm (/  %arg2.norm  %elemsize0.norm))
                            (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                            (define %3.new0.norm (*  i.norm  %factor1.norm))
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
  (bvpadhighbits  QdV.norm %arg3.norm)
  )

(define (hexagon_V6_vandqrt_128B  Rt.norm QuV.norm %arg0.norm %arg1.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg3.norm %arg4.norm %arg5.norm )
  (define Vd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define i.new.div.norm (/  i.new.norm  %arg4.norm))
                            (define %lastidx2.norm (-  %arg3.norm  1))
                            (define %highidx0.norm (+  i.new.div.norm  %lastidx2.norm))
                            (define %0.norm (extract  %highidx0.norm i.new.div.norm QuV.norm))
                            (define %1.norm (modulo  i.new.div.norm  %arg2.norm))
                            (define %2.norm (*  %elemsize0.norm  %1.norm))
                            (define %lastidx1.norm (-  %elemsize0.norm  1))
                            (define %3.norm (+  %2.norm  %lastidx1.norm))
                            (define %4.norm (extract  %3.norm %2.norm Rt.norm))
                            (define %cond0.norm (bveq  %0.norm  %arg1.norm))
                            (define %5.norm (if (equal? %cond0.norm #t) %4.norm %arg0.norm))
                            %5.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd.norm %arg5.norm)
  )

(define (hexagon_V6_vandvrt_acc_128B  %arg1.norm %arg2.norm %arg0.norm Rt.norm QxV.norm Vu.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg3.norm %arg4.norm %alpha.arg0.norm %arg5.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx3.norm (-  %elemsize0.norm  1))
                            (define %highidx1.norm (+  i.norm  %lastidx3.norm))
                            (define %0.norm (extract  %highidx1.norm i.norm QxV.norm))
                            (define %factor0.norm (/  %arg3.norm  %elemsize0.norm))
                            (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                            (define %1.norm (*  %factor1.norm  i.norm))
                            (define %lastidx2.norm (-  %arg3.norm  1))
                            (define %2.norm (+  %1.norm  %lastidx2.norm))
                            (define %3.norm (extract  %2.norm %1.norm Vu.norm))
                            (define %4.norm (modulo  i.norm  %arg4.norm))
                            (define %5.norm (*  %arg3.norm  %4.norm))
                            (define %lastidx1.norm (-  %arg3.norm  1))
                            (define %6.norm (+  %5.norm  %lastidx1.norm))
                            (define %7.norm (extract  %6.norm %5.norm Rt.norm))
                            (define %8.norm (bvand  %3.norm  %7.norm))
                            (define %9.norm (not (bveq  %8.norm  %arg2.norm )))
                            (define %10.norm (if (equal? %9.norm #t) %arg0.norm %arg1.norm))
                            (define %11.norm (bvor  %0.norm  %10.norm))
                            %11.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0.norm %arg5.norm)
  )

(define (hexagon_V6_vavguhrnd_128B  %arg2 %arg0 Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg3 %arg4 %arg5 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 Vu))
                            (define %5 (extract  %1 i.new0 Vv))
                            (define %6.ab0 (bvaddnw %2 %5 %elemsize0 %arg4 ))
                            (define %7.ab0 (bvaddnw %6.ab0 %arg2 %elemsize0 %arg3 ))
                            (define %8.ab0 (bvdiv %7.ab0 %arg0 %arg1 ))
                            %8.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg5)
  )

(define (hexagon_V6_vmpauhb_128B  Vuu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 %arg10 %arg11 %arg12 %arg13 %arg14 %arg15 %arg16 %arg17 %arg18 %arg19 %arg20 %arg21 %arg22 %arg23 %arg24 %arg25 )
  (define Vdd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new0.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %iterator1.new0.new.mul (*  %iterator1.new0.new  %arg24))
                              (define %36 (+  %arg23  %iterator1.new0.new.mul))
                              (define %lastidx9 (-  %arg22  1))
                              (define %38 (+  %36  %lastidx9))
                              (define %39 (extract  %38 %36 Vuu))
                              (define %lastidx8 (-  %elemsize1  1))
                              (define %highidx3 (+  %lastidx8  %arg21))
                              (define %42 (extract  %highidx3 %arg21 Rt))
                              (define %44.ab0 (bvsizeext  %39 %arg11 %arg20))
                              (define %45.ab0 (bvsizeext  %42 %arg11 %arg19))
                              (define %46 (bvmul  %44.ab0  %45.ab0))
                              (define %51 (+  %iterator1.new0.new.mul  %arg18))
                              (define %lastidx7 (-  %arg17  1))
                              (define %52 (+  %51  %lastidx7))
                              (define %53 (extract  %52 %51 Vuu))
                              (define %lastidx6 (-  %elemsize1  1))
                              (define %highidx2 (+  %lastidx6  %arg16))
                              (define %56 (extract  %highidx2 %arg16 Rt))
                              (define %58.ab0 (bvsizeext  %53 %arg11 %arg15))
                              (define %59.ab0 (bvsizeext  %56 %arg11 %arg14))
                              (define %60 (bvmul  %58.ab0  %59.ab0))
                              (define %61.ab0 (bvaddnw %46 %60 %arg11 %arg13 ))
                              %61.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %iterator0.new0.new.mul (*  %iterator0.new0.new  %factor1))
                              (define %lastidx4 (-  %arg10  1))
                              (define %5 (+  %iterator0.new0.new.mul  %lastidx4))
                              (define %6 (extract  %5 %iterator0.new0.new.mul Vuu))
                              (define %lastidx3 (-  %elemsize0  1))
                              (define %highidx1 (+  %lastidx3  %arg9))
                              (define %9 (extract  %highidx1 %arg9 Rt))
                              (define %11.ab0 (bvsizeext  %6 %arg0 %arg8))
                              (define %12.ab0 (bvsizeext  %9 %arg0 %arg7))
                              (define %13 (bvmul  %11.ab0  %12.ab0))
                              (define %18 (+  %iterator0.new0.new.mul  %arg6))
                              (define %lastidx2 (-  %arg5  1))
                              (define %19 (+  %18  %lastidx2))
                              (define %20 (extract  %19 %18 Vuu))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %highidx0 (+  %lastidx1  %arg4))
                              (define %23 (extract  %highidx0 %arg4 Rt))
                              (define %25.ab0 (bvsizeext  %20 %arg0 %arg3))
                              (define %26.ab0 (bvsizeext  %23 %arg0 %arg2))
                              (define %27 (bvmul  %25.ab0  %26.ab0))
                              (define %28.ab0 (bvaddnw %13 %27 %arg0 %arg1 ))
                              %28.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  Vdd %arg25)
  )

(define (hexagon_V6_vrmpybus_128B  %arg0 Vu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
  (define Vd
    (apply
      concat
      (for/list ([i.new (reverse (range 0 %vectsize0 %outerlanesize0))])
                (define %lastidx0 (-  %outerlanesize0  1))
                (define %67.0 (+  i.new  %lastidx0))
                (define %68 (extract  %67.0 i.new %arg0))
                (define Vd %68)
                (define %13.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %2 (+  iterator.0.new0  i.new))
                              (define %lastidx3 (-  %elemsize0  1))
                              (define %3 (+  %2  %lastidx3))
                              (define %4 (extract  %3 %2 Vu))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %6 (+  iterator.0.new0  %lastidx2))
                              (define %7 (extract  %6 iterator.0.new0 Rt))
                              (define %8.ab0 (bvsizeext  %4 %arg4 %arg5))
                              (define %9.ab0 (bvsizeext  %7 %arg4 %arg3))
                              (define %10 (bvmul  %8.ab0  %9.ab0))
                              (define %13.ab0 (bvsizeext  %10 %outerlanesize0 %arg2))
                              %13.ab0
                              )
                    ))
                (define %lastidx1 (-  %outerlanesize0  1))
                (define %67.clone.2 (+  i.new  %lastidx1))
                (define %13.acc0.ab0 (bvaddnw %13.ext0.red Vd %outerlanesize0 %arg1))
                %13.acc0.ab0
                )
      )
    )
  (bvpadhighbits  Vd %arg6)
  )

(define (hexagon_V6_vswap_128B  Vv.norm Vu.norm QtV.norm %arg0.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm %alpha.arg0.norm %arg5.norm )
  (define Vdd.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.norm (reverse (range %innerlaneoffset1.norm %innerlanesize1.norm %elemsize1.norm))])
                              (define %lastidx4.norm (-  %elemsize1.norm  1))
                              (define %highidx1.norm (+  %iterator1.norm  %lastidx4.norm))
                              (define %0.copy0.copy.0.norm (extract  %highidx1.norm %iterator1.norm QtV.norm))
                              (define %13.norm (bvnot  %0.copy0.copy.0.norm))
                              (define %factor0.norm (/  %arg3.norm  %elemsize1.norm))
                              (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                              (define %14.norm (*  %factor1.norm  %iterator1.norm))
                              (define %lastidx3.norm (-  %arg3.norm  1))
                              (define %15.norm (+  %14.norm  %lastidx3.norm))
                              (define %16.norm (extract  %15.norm %14.norm Vu.norm))
                              (define %19.norm (extract  %15.norm %14.norm Vv.norm))
                              (define %20.norm (if (equal? %13.norm (bv #b1 1))
                                                 %16.norm %19.norm))
                              %20.norm
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                              (define %iterator0.new.div.norm (/  %iterator0.new.norm  %arg2.norm))
                              (define %lastidx1.norm (-  %arg1.norm  1))
                              (define %highidx0.norm (+  %iterator0.new.div.norm  %lastidx1.norm))
                              (define %0.norm (extract  %highidx0.norm %iterator0.new.div.norm QtV.norm))
                              (define %lastidx0.norm (-  %elemsize0.norm  1))
                              (define %2.norm (+  %iterator0.new.norm  %lastidx0.norm))
                              (define %3.norm (extract  %2.norm %iterator0.new.norm Vu.norm))
                              (define %6.norm (extract  %2.norm %iterator0.new.norm Vv.norm))
                              (define %cond0.norm (bveq  %0.norm  %arg0.norm))
                              (define %7.norm (if (equal? %cond0.norm #t) %3.norm %6.norm))
                              %7.norm
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  Vdd.norm %arg5.norm)
  )

(define (hexagon_V6_vmpyiwh_128B  Vu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define i.new.div (/  i.new  %arg5))
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define %0.new0 (*  i.new  %factor1))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  %0.new0  %lastidx0))
                            (define %2 (extract  %1 %0.new0 Vu))
                            (define %3 (modulo  i.new.div  %arg4))
                            (define %4 (*  %elemsize0  %3))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %5 (+  %4  %lastidx1))
                            (define %6 (extract  %5 %4 Rt))
                            (define %8.ab0 (bvsizeext  %2 %arg2 %arg3))
                            (define %9.ab0 (bvsizeext  %6 %arg2 %arg1))
                            (define %10 (bvmul  %8.ab0  %9.ab0))
                            (define %13.high.idx (- %arg0 1))
                            (define %13.low.idx 0)
                            (define %13 (extract  %13.high.idx %13.low.idx %10))
                            %13
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg6)
  )

(define (hexagon_V6_vmpybus_acc_128B  Vxx Vu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 %arg10 %arg11 %arg12 %arg13 %arg14 %arg15 %arg16 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %24.new0 (*  %iterator1.new  %arg15))
                              (define %26 (+  %24.new0  %arg14))
                              (define %lastidx3 (-  %arg6  1))
                              (define %27 (+  %26  %lastidx3))
                              (define %28 (extract  %27 %26 Vxx))
                              (define %31 (+  %arg13  %24.new0))
                              (define %lastidx5 (-  %elemsize1  1))
                              (define %32 (+  %31  %lastidx5))
                              (define %33 (extract  %32 %31 Vu))
                              (define %34.new0 (/  %iterator1.new  %arg12))
                              (define %35 (+  %34.new0  %arg11))
                              (define %36 (modulo  %35  %arg10))
                              (define %37 (*  %elemsize1  %36))
                              (define %lastidx4 (-  %elemsize1  1))
                              (define %38 (+  %37  %lastidx4))
                              (define %39 (extract  %38 %37 Rt))
                              (define %40.ab0 (bvsizeext  %33 %arg6 %arg9))
                              (define %41.ab0 (bvsizeext  %39 %arg6 %arg8))
                              (define %42 (bvmul  %40.ab0  %41.ab0))
                              (define %43.ab0 (bvaddnw %28 %42 %arg6 %arg7 ))
                              %43.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %0.new0 (*  %iterator0.new  %factor1))
                              (define %lastidx0 (-  %arg0  1))
                              (define %3 (+  %0.new0  %lastidx0))
                              (define %4 (extract  %3 %0.new0 Vxx))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %8 (+  %0.new0  %lastidx2))
                              (define %9 (extract  %8 %0.new0 Vu))
                              (define %10.new0 (/  %iterator0.new  %arg5))
                              (define %12 (modulo  %10.new0  %arg4))
                              (define %13 (*  %elemsize0  %12))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %14 (+  %13  %lastidx1))
                              (define %15 (extract  %14 %13 Rt))
                              (define %16.ab0 (bvsizeext  %9 %arg0 %arg3))
                              (define %17.ab0 (bvsizeext  %15 %arg0 %arg2))
                              (define %18 (bvmul  %16.ab0  %17.ab0))
                              (define %19.ab0 (bvaddnw %4 %18 %arg0 %arg1 ))
                              %19.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0 %arg16)
  )

(define (hexagon_V6_vasrwh_128B  %arg2 VuV VvV RtV %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %alpha.arg0 %arg3 )
  (define VdV
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg1  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %0 (bvand  RtV  %arg2))
                            (define %lastidx1 (-  %arg1  1))
                            (define %2 (+  i.new0.new.mul  %lastidx1))
                            (define %3 (extract  %2 i.new0.new.mul VvV))
                            (define %4 (bvashr  %3  %0))
                            (define %9.high.idx (- %elemsize0 1))
                            (define %9.low.idx 0)
                            (define %9 (extract  %9.high.idx %9.low.idx %4))
                            (define %12 (extract  %2 i.new0.new.mul VuV))
                            (define %13 (bvashr  %12  %0))
                            (define %18.high.idx (- %elemsize0 1))
                            (define %18.low.idx 0)
                            (define %18 (extract  %18.high.idx %18.low.idx %13))
                            (concat %18 %9)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  VdV %arg3)
  )

(define (hexagon_V6_vdmpyhsuisat_acc_128B  Vx Vuu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 )
  (define %dst0
    (apply
      concat
      (for/list ([i.new (reverse (range 0 %vectsize0 %outerlanesize0))])
                (define %lastidx0 (-  %outerlanesize0  1))
                (define %1.clone.0 (+  i.new  %lastidx0))
                (define %2.clone.0 (extract  %1.clone.0 i.new Vx))
                (define %dst0 %2.clone.0)
                (define %15.ext0.red
                  (apply
                    bvadd
                    (for/list ([iterator.0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define iterator.0.new.div (/  iterator.0.new  %arg6))
                              (define %35.new0 (-  %arg5  iterator.0.new.div))
                              (define %3 (*  %arg4  %35.new0))
                              (define %5.new0 (*  iterator.0.new  %arg3))
                              (define %6 (+  %3  i.new))
                              (define %7 (+  %6  %5.new0))
                              (define %lastidx3 (-  %elemsize0  1))
                              (define %8 (+  %7  %lastidx3))
                              (define %9 (extract  %8 %7 Vuu))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %11 (+  iterator.0.new  %lastidx2))
                              (define %12 (extract  %11 iterator.0.new Rt))
                              (define %13.ab0 (bvsizeext  %9 %outerlanesize0 %arg2))
                              (define %14.ab0 (bvsizeext  %12 %outerlanesize0 %arg1))
                              (define %15 (bvmul  %13.ab0  %14.ab0))
                              %15
                              )
                    ))
                (define %lastidx1 (-  %outerlanesize0  1))
                (define %33.clone.2 (+  i.new  %lastidx1))
                (define %15.acc0.ab0 (bvaddnw %15.ext0.red %dst0 %outerlanesize0 %arg0))
                %15.acc0.ab0
                )
      )
    )
  (bvpadhighbits  %dst0 %arg7)
  )

(define (hexagon_V6_vshufoeh_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
  (define Vdd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new0.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %iterator1.new0.new.mul (*  %iterator1.new0.new  %arg4))
                              (define %24 (+  %arg3  %iterator1.new0.new.mul))
                              (define %lastidx3 (-  %elemsize1  1))
                              (define %25 (+  %24  %lastidx3))
                              (define %26 (extract  %25 %24 Vv))
                              (define %37 (extract  %25 %24 Vu))
                              (concat %37 %26)
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %elemsize0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %iterator0.new0.new.mul (*  %iterator0.new0.new  %factor1))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %3 (+  %iterator0.new0.new.mul  %lastidx1))
                              (define %4 (extract  %3 %iterator0.new0.new.mul Vv))
                              (define %15 (extract  %3 %iterator0.new0.new.mul Vu))
                              (concat %15 %4)
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  Vdd %arg5)
  )

(define (hexagon_V6_vmpyiowh_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  i.new0.new.mul  %lastidx0))
                            (define %2 (extract  %1 i.new0.new.mul Vu))
                            (define %5 (+  %arg4  i.new0.new.mul))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %6 (+  %5  %lastidx1))
                            (define %7 (extract  %6 %5 Vv))
                            (define %9.ab0 (bvsizeext  %2 %arg2 %arg3))
                            (define %10.ab0 (bvsizeext  %7 %arg2 %arg1))
                            (define %11 (bvmul  %9.ab0  %10.ab0))
                            (define %14.high.idx (- %arg0 1))
                            (define %14.low.idx 0)
                            (define %14 (extract  %14.high.idx %14.low.idx %11))
                            %14
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg5)
  )

(define (hexagon_V6_vandnqrt_acc_128B  Rt.norm %arg1.norm Vx.norm QuV.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg0.norm %alpha.arg0.norm %arg2.norm %arg3.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %factor0.norm (/  %arg0.norm  %elemsize0.norm))
                            (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                            (define %0.norm (*  %factor1.norm  i.norm))
                            (define %lastidx0.norm (-  %arg0.norm  1))
                            (define %1.norm (+  %0.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm %0.norm Vx.norm))
                            (define %lastidx2.norm (-  %elemsize0.norm  1))
                            (define %highidx0.norm (+  i.norm  %lastidx2.norm))
                            (define %3.norm (extract  %highidx0.norm i.norm QuV.norm))
                            (define %4.norm (bvnot  %3.norm))
                            (define %5.norm (modulo  i.norm  %arg2.norm))
                            (define %6.norm (*  %arg0.norm  %5.norm))
                            (define %lastidx1.norm (-  %arg0.norm  1))
                            (define %7.norm (+  %6.norm  %lastidx1.norm))
                            (define %8.norm (extract  %7.norm %6.norm Rt.norm))
                            (define %9.norm (if (equal? %4.norm (bv #b1 1))
                                              %8.norm %arg1.norm))
                            (define %10.norm (bvor  %2.norm  %9.norm))
                            %10.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0.norm %arg3.norm)
  )

(define (hexagon_V6_vgtuw_xor_128B  %arg0.norm %arg1.norm QxV.norm Vu.norm Vv.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg3.norm %alpha.arg0.norm %arg4.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %5.new0.norm (+  i.norm  %lastidx0.norm))
                            (define %6.norm (extract  %5.new0.norm i.norm QxV.norm))
                            (define %factor0.norm (/  %arg3.norm  %elemsize0.norm))
                            (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                            (define %8.new0.norm (*  i.norm  %factor1.norm))
                            (define %lastidx1.norm (-  %arg3.norm  1))
                            (define %9.norm (+  %8.new0.norm  %lastidx1.norm))
                            (define %10.norm (extract  %9.norm %8.new0.norm Vu.norm))
                            (define %14.norm (extract  %9.norm %8.new0.norm Vv.norm))
                            (define %15.ab0.norm (bvgt %10.norm %14.norm %arg2.norm ))
                            (define %16.norm (if (equal? %15.ab0.norm #t) %arg0.norm %arg1.norm))
                            (define %17.norm (bvxor  %6.norm  %16.norm))
                            %17.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0.norm %arg4.norm)
  )

(define (hexagon_V6_vmpyowh_rnd_sacc_128B  %arg5 %arg3 %arg2 Vx Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 %arg4 %arg6 %arg7 %arg8 %arg9 %arg10 %arg11 %arg12 %arg13 )
  (define %dst0
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %arg0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %lastidx0 (-  %arg0  1))
                            (define %1 (+  i.new0.new.mul  %lastidx0))
                            (define %2 (extract  %1 i.new0.new.mul Vx))
                            (define %5 (extract  %1 i.new0.new.mul Vu))
                            (define %8 (+  %arg12  i.new0.new.mul))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %9 (+  %8  %lastidx1))
                            (define %10 (extract  %9 %8 Vv))
                            (define %12.ab0 (bvsizeext  %5 %arg10 %arg11))
                            (define %13.ab0 (bvsizeext  %10 %arg10 %arg9))
                            (define %14 (bvmul  %12.ab0  %13.ab0))
                            (define %15.ab0 (bvsizeext  %2 %arg8 %arg7))
                            (define %16.ab0 (bvaddnw %15.ab0 %14 %arg8 %arg6 ))
                            (define %17 (bvlshr  %16.ab0  %arg5))
                            (define %18.ab0 (bvaddnw %17 %arg3 64 %arg4 ))
                            (define %19 (bvlshr  %18.ab0  %arg2))
                            (define %20.ab0 (bvsaturate  %19 64 %arg0 %arg1))
                            %20.ab0
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0 %arg13)
  )

(define (hexagon_V6_vabsh_128B  Vu %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 Vu))
                            (define %3 (integer->bitvector (abs (bitvector->integer %2)) (bitvector %elemsize0)))
                            %3
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg0)
  )

(define (hexagon_V6_vmpyh_128B  Vu Rt %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %alpha.arg0 %arg1 %arg2 %arg3 %arg4 %arg5 %arg6 %arg7 %arg8 %arg9 %arg10 %arg11 )
  (define Vdd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new0.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %iterator1.new0.new.mul (*  %iterator1.new0.new  %arg10))
                              (define %17 (+  %arg9  %iterator1.new0.new.mul))
                              (define %lastidx5 (-  %elemsize1  1))
                              (define %18 (+  %17  %lastidx5))
                              (define %19 (extract  %18 %17 Vu))
                              (define %lastidx4 (-  %elemsize1  1))
                              (define %highidx1 (+  %lastidx4  %arg8))
                              (define %22 (extract  %highidx1 %arg8 Rt))
                              (define %23.ab0 (bvsizeext  %19 %arg4 %arg7))
                              (define %24.ab0 (bvsizeext  %22 %arg4 %arg6))
                              (define %25 (bvmul  %23.ab0  %24.ab0))
                              %25
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg0  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %iterator0.new0.new.mul (*  %iterator0.new0.new  %factor1))
                              (define %lastidx2 (-  %elemsize0  1))
                              (define %3 (+  %iterator0.new0.new.mul  %lastidx2))
                              (define %4 (extract  %3 %iterator0.new0.new.mul Vu))
                              (define %lastidx1 (-  %elemsize0  1))
                              (define %highidx0 (+  %lastidx1  %arg3))
                              (define %7 (extract  %highidx0 %arg3 Rt))
                              (define %8.ab0 (bvsizeext  %4 %arg0 %arg2))
                              (define %9.ab0 (bvsizeext  %7 %arg0 %arg1))
                              (define %10 (bvmul  %8.ab0  %9.ab0))
                              %10
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  Vdd %arg11)
  )

(define (hexagon_V6_vaddwq_128B  QvV.norm %arg0.norm Vx.norm Vu.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm %arg3.norm %arg4.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define i.new.div.norm (/  i.new.norm  %arg3.norm))
                            (define %lastidx1.norm (-  %arg2.norm  1))
                            (define %highidx0.norm (+  i.new.div.norm  %lastidx1.norm))
                            (define %0.norm (extract  %highidx0.norm i.new.div.norm QvV.norm))
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %2.norm (+  i.new.norm  %lastidx0.norm))
                            (define %3.norm (extract  %2.norm i.new.norm Vx.norm))
                            (define %9.norm (extract  %2.norm i.new.norm Vu.norm))
                            (define %10.ab0.norm (bvaddnw %3.norm %9.norm %elemsize0.norm %arg1.norm ))
                            (define %cond0.norm (bveq  %0.norm  %arg0.norm))
                            (define %11.norm (if (equal? %cond0.norm #t) %3.norm %10.ab0.norm))
                            %11.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0.norm %arg4.norm)
  )

(define (hexagon_V6_vaslwv_128B  VvV.norm %arg0.norm VuV.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm )
  (define VdV.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.new0.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %1.norm (+  i.new0.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm i.new0.norm VvV.norm))
                            (define %3.ab0.norm (bvgt %2.norm %arg0.norm %arg1.norm ))
                            (define %6.norm (extract  %1.norm i.new0.norm VuV.norm))
                            (define %10.norm (bvshl  %6.norm  %2.norm))
                            (define %17.norm (bvashr  %6.norm  %2.norm))
                            (define %18.norm (if (equal? %3.ab0.norm #t) %10.norm %17.norm))
                            %18.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  VdV.norm %arg2.norm)
  )

(define (hexagon_V6_vasrhv_128B  VvV.norm %arg0.norm VuV.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg1.norm %arg2.norm )
  (define VdV.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.new0.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %1.norm (+  i.new0.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm i.new0.norm VvV.norm))
                            (define %3.ab0.norm (bvgt %2.norm %arg0.norm %arg1.norm ))
                            (define %6.norm (extract  %1.norm i.new0.norm VuV.norm))
                            (define %10.norm (bvashr  %6.norm  %2.norm))
                            (define %17.norm (bvshl  %6.norm  %2.norm))
                            (define %18.norm (if (equal? %3.ab0.norm #t) %10.norm %17.norm))
                            %18.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  VdV.norm %arg2.norm)
  )

(define (hexagon_V6_vshufeh_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 %alpha.arg0 %arg1 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %factor0 (/  %elemsize0  %elemsize0))
                            (define %factor1 (*  %alpha.arg0  %factor0))
                            (define i.new0.new.mul (*  i.new0.new  %factor1))
                            (define %lastidx1 (-  %elemsize0  1))
                            (define %3 (+  i.new0.new.mul  %lastidx1))
                            (define %4 (extract  %3 i.new0.new.mul Vv))
                            (define %13 (extract  %3 i.new0.new.mul Vu))
                            (concat %13 %4)
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg1)
  )

(define (hexagon_V6_vandqrt_acc_128B  %arg1.norm %arg0.norm QuV.norm Rt.norm Vx.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg2.norm %arg3.norm %arg4.norm %arg5.norm )
  (define %dst0.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.new.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define i.new.div.norm (/  i.new.norm  %arg4.norm))
                            (define %lastidx0.norm (-  %elemsize0.norm  1))
                            (define %1.norm (+  i.new.norm  %lastidx0.norm))
                            (define %2.norm (extract  %1.norm i.new.norm Vx.norm))
                            (define %lastidx2.norm (-  %arg3.norm  1))
                            (define %highidx0.norm (+  i.new.div.norm  %lastidx2.norm))
                            (define %3.norm (extract  %highidx0.norm i.new.div.norm QuV.norm))
                            (define %4.norm (modulo  i.new.div.norm  %arg2.norm))
                            (define %5.norm (*  %elemsize0.norm  %4.norm))
                            (define %lastidx1.norm (-  %elemsize0.norm  1))
                            (define %6.norm (+  %5.norm  %lastidx1.norm))
                            (define %7.norm (extract  %6.norm %5.norm Rt.norm))
                            (define %cond0.norm (bveq  %3.norm  %arg1.norm))
                            (define %8.norm (if (equal? %cond0.norm #t) %7.norm %arg0.norm))
                            (define %9.norm (bvor  %2.norm  %8.norm))
                            %9.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  %dst0.norm %arg5.norm)
  )

(define (hexagon_V6_vandvrt_128B  %arg2.norm %arg1.norm %arg0.norm Rt.norm Vu.norm %vectsize0.norm %outerlanesize0.norm %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm %arg3.norm %arg4.norm %alpha.arg0.norm %arg5.norm )
  (define QdV.norm
    (apply
      concat
      (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
                (apply
                  concat
                  (for/list ([i.norm (reverse (range %innerlaneoffset0.norm %innerlanesize0.norm %elemsize0.norm))])
                            (define %factor0.norm (/  %arg3.norm  %elemsize0.norm))
                            (define %factor1.norm (*  %alpha.arg0.norm  %factor0.norm))
                            (define %0.norm (*  %factor1.norm  i.norm))
                            (define %lastidx2.norm (-  %arg3.norm  1))
                            (define %1.norm (+  %0.norm  %lastidx2.norm))
                            (define %2.norm (extract  %1.norm %0.norm Vu.norm))
                            (define %3.norm (modulo  i.norm  %arg4.norm))
                            (define %4.norm (*  %arg3.norm  %3.norm))
                            (define %lastidx1.norm (-  %arg3.norm  1))
                            (define %5.norm (+  %4.norm  %lastidx1.norm))
                            (define %6.norm (extract  %5.norm %4.norm Rt.norm))
                            (define %7.norm (bvand  %2.norm  %6.norm))
                            (define %8.norm (not (bveq  %7.norm  %arg2.norm )))
                            (define %9.norm (if (equal? %8.norm #t) %arg0.norm %arg1.norm))
                            %9.norm
                            )
                  )
                )
      )
    )
  (bvpadhighbits  QdV.norm %arg5.norm)
  )

(define (hexagon_V6_vpackhb_sat_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %innerlaneoffset1 %innerlanesize1 %elemsize1 %arg0 %arg1 %alpha.arg0 %arg2 %arg3 %arg4 %alpha.arg1 %arg5 %arg6 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (concat 
                  (apply
                    concat
                    (for/list ([%iterator1.new (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                              (define %factor2 (/  %arg4  %elemsize1))
                              (define %factor3 (*  %alpha.arg1  %factor2))
                              (define %9.new0 (*  %iterator1.new  %factor3))
                              (define %lastidx3 (-  %arg4  1))
                              (define %10 (+  %9.new0  %lastidx3))
                              (define %11 (extract  %10 %9.new0 Vu))
                              (define %12.ab0 (bvsaturate  %11 %arg4 %elemsize1 %arg3))
                              %12.ab0
                              )
                    )
                  (apply
                    concat
                    (for/list ([%iterator0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                              (define %factor0 (/  %arg1  %elemsize0))
                              (define %factor1 (*  %alpha.arg0  %factor0))
                              (define %0.new0 (*  %iterator0.new  %factor1))
                              (define %lastidx1 (-  %arg1  1))
                              (define %1 (+  %0.new0  %lastidx1))
                              (define %2 (extract  %1 %0.new0 Vv))
                              (define %3.ab0 (bvsaturate  %2 %arg1 %elemsize0 %arg0))
                              %3.ab0
                              )
                    )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg6)
  )

(define (hexagon_V6_vand_128B  Vu Vv %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0 )
  (define Vd
    (apply
      concat
      (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
                (apply
                  concat
                  (for/list ([i.new0 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                            (define %lastidx0 (-  %elemsize0  1))
                            (define %1 (+  i.new0  %lastidx0))
                            (define %2 (extract  %1 i.new0 Vu))
                            (define %5 (extract  %1 i.new0 Vv))
                            (define %6 (bvand  %2  %5))
                            %6
                            )
                  )
                )
      )
    )
  (bvpadhighbits  Vd %arg0)
  )
;; ================================================================================
