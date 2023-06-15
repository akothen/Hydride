(define (vqmovn_s32 a
                    %vectsize0
                    %outerlanesize0
                    %innerlaneoffset0
                    %innerlanesize0
                    %elemsize0
                    %arg0
                    %arg1
                    %arg2
                    %arg3)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %4.new0 (* e0.new %arg3))
                      (define %lastidx1 (- %arg2 1))
                      (define %9 (+ %4.new0 %lastidx1))
                      (define %11 (extract %9 %4.new0 a))
                      (define %16.ab0 (bvsizeext %11 192 %arg1))
                      (define %17.ab0 (bvsaturate %16.ab0 192 %elemsize0 %arg0))
                      %17.ab0)))))
  result)

(define (vqdmull_s32 %arg3
                     a
                     b
                     %vectsize0
                     %outerlanesize0
                     %innerlaneoffset0
                     %innerlanesize0
                     %elemsize0
                     %arg0
                     %arg1
                     %arg2
                     %arg4
                     %arg5)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx1 (- %elemsize0 1))
                      (define %6 (+ e0.new %lastidx1))
                      (define %7 (extract %6 e0.new a))
                      (define %8.ab0 (bvsizeext %7 192 %arg5))
                      (define %13 (extract %6 e0.new b))
                      (define %14.ab0 (bvsizeext %13 192 %arg4))
                      (define %15 (bvmul %arg3 %8.ab0))
                      (define %16 (bvmul %15 %14.ab0))
                      (define %18.ab0 (bvsaturate %16 192 %arg0 %arg2))
                      %18.ab0)))))
  result)

(define (vqdmlsls_s32 %arg8
                      a
                      b
                      c
                      %vectsize0
                      %outerlanesize0
                      %innerlaneoffset0
                      %innerlanesize0
                      %elemsize0
                      %arg0
                      %arg1
                      %arg2
                      %arg3
                      %arg4
                      %arg5
                      %arg6
                      %arg7
                      %arg9
                      %arg10)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx1 (- %elemsize0 1))
                      (define %7 (+ e0.new %lastidx1))
                      (define %8 (extract %7 e0.new b))
                      (define %9.ab0 (bvsizeext %8 192 %arg10))
                      (define %14 (extract %7 e0.new c))
                      (define %15.ab0 (bvsizeext %14 192 %arg9))
                      (define %16 (bvmul %arg8 %9.ab0))
                      (define %17 (bvmul %16 %15.ab0))
                      (define %19.ab0 (bvsaturate %17 192 %arg7 %arg6))
                      (define %21.new0 (* e0.new %arg5))
                      (define %lastidx0 (- %arg0 1))
                      (define %26 (+ %21.new0 %lastidx0))
                      (define %28 (extract %26 %21.new0 a))
                      (define %29.ab0 (bvsizeext %28 192 %arg4))
                      (define %30.ab0 (bvsizeext %19.ab0 192 %arg3))
                      (define %31.ab0 (bvsubnw %29.ab0 %30.ab0 192 %arg2))
                      (define %41.ab0 (bvsaturate %31.ab0 192 %arg0 %arg1))
                      %41.ab0)))))
  result)

(define (vcgtzq_s8 %arg1.norm
                   %arg0.norm
                   %arg2.norm
                   a.norm
                   %vectsize0.norm
                   %outerlanesize0.norm
                   %innerlaneoffset0.norm
                   %innerlanesize0.norm
                   %elemsize0.norm
                   %arg3.norm
                   %arg4.norm)
  (define result.norm
    (apply concat
           (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
             (apply concat
                    (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm
                                                            %innerlanesize0.norm
                                                            %elemsize0.norm))])
                      (define %lastidx0.norm (- %elemsize0.norm 1))
                      (define %4.norm (+ e0.new.norm %lastidx0.norm))
                      (define %5.norm (extract %4.norm e0.new.norm a.norm))
                      (define %6.ab0.norm (bvsizeext %5.norm 192 %arg4.norm))
                      (define %7.ab0.norm (bvgt %6.ab0.norm %arg2.norm %arg3.norm))
                      (define %14.norm (if (equal? %7.ab0.norm #t) %arg0.norm %arg1.norm))
                      %14.norm)))))
  result.norm)

(define (vmlsl_u32 a
                   b
                   c
                   %vectsize0
                   %outerlanesize0
                   %innerlaneoffset0
                   %innerlanesize0
                   %elemsize0
                   %arg0
                   %arg1
                   %arg2
                   %arg3
                   %arg4
                   %arg5)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx2 (- %elemsize0 1))
                      (define %8 (+ e0.new %lastidx2))
                      (define %9 (extract %8 e0.new b))
                      (define %10.ab0 (bvsizeext %9 192 %arg5))
                      (define %15 (extract %8 e0.new c))
                      (define %16.ab0 (bvsizeext %15 192 %arg4))
                      (define %19 (bvmul %10.ab0 %16.ab0))
                      (define %lastidx1 (- %arg0 1))
                      (define %highidx0 (+ %lastidx1 %arg3))
                      (define %20 (extract %highidx0 %arg3 %19))
                      (define %22.new0 (* e0.new %arg2))
                      (define %lastidx0 (- %arg0 1))
                      (define %27 (+ %22.new0 %lastidx0))
                      (define %29 (extract %27 %22.new0 a))
                      (define %30.ab0 (bvsubnw %29 %20 %arg0 %arg1))
                      %30.ab0)))))
  result)

(define (vtrn1_u16 a
                   b
                   %vectsize0
                   %outerlanesize0
                   %innerlaneoffset0
                   %innerlanesize0
                   %elemsize0
                   %innerlaneoffset1
                   %innerlanesize1
                   %elemsize1
                   %arg0
                   %arg1
                   %arg2
                   %arg3
                   %arg4)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (concat
              (apply concat
                     (for/list ([%iterator1.new
                                 (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                       (define %28.new0 (* %iterator1.new %arg1))
                       (define %lastidx2 (- %elemsize1 1))
                       (define %33 (+ %28.new0 %lastidx2))
                       (define %34 (extract %33 %28.new0 b))
                       %34))
              (apply concat
                     (for/list ([%iterator0.new
                                 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                       (define %3.new0 (* %iterator0.new %arg0))
                       (define %lastidx0 (- %elemsize0 1))
                       (define %8 (+ %3.new0 %lastidx0))
                       (define %17 (extract %8 %3.new0 a))
                       %17))))))
  result)

(define (vneg_s32 a
                  %vectsize0
                  %outerlanesize0
                  %innerlaneoffset0
                  %innerlanesize0
                  %elemsize0
                  %arg0
                  %arg1)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %4 (+ e0.new %lastidx0))
                      (define %5 (extract %4 e0.new a))
                      (define %6.ab0 (bvsizeext %5 192 %arg1))
                      (define %7 (bvneg %6.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %13 (extract %highidx0 %arg0 %7))
                      %13)))))
  result)

(define (vuqadd_s64 a
                    b
                    %vectsize0
                    %outerlanesize0
                    %innerlaneoffset0
                    %innerlanesize0
                    %elemsize0
                    %arg0
                    %arg1
                    %arg2
                    %arg3)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %4 (+ e0.new %lastidx0))
                      (define %5 (extract %4 e0.new b))
                      (define %7.ab0 (bvsizeext %5 192 %arg3))
                      (define %12 (extract %4 e0.new a))
                      (define %13.ab0 (bvsizeext %12 192 %arg2))
                      (define %18.ab0 (bvaddnw %7.ab0 %13.ab0 192 %arg1))
                      (define %19.ab0 (bvsaturate %18.ab0 192 %elemsize0 %arg0))
                      %19.ab0)))))
  result)

(define (vmlsl_n_s16 a
                     b
                     c
                     %vectsize0
                     %outerlanesize0
                     %innerlaneoffset0
                     %innerlanesize0
                     %elemsize0
                     %arg0
                     %arg1
                     %arg2
                     %arg3
                     %arg4
                     %arg5)
  (define %7 (extract 15 0 c))
  (define %8.ab0 (bvsizeext %7 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx2 (- %elemsize0 1))
                      (define %13 (+ e0.new %lastidx2))
                      (define %14 (extract %13 e0.new b))
                      (define %15.ab0 (bvsizeext %14 192 %arg5))
                      (define %18 (bvmul %15.ab0 %8.ab0))
                      (define %lastidx1 (- %arg1 1))
                      (define %highidx0 (+ %lastidx1 %arg4))
                      (define %19 (extract %highidx0 %arg4 %18))
                      (define %21.new0 (* e0.new %arg3))
                      (define %lastidx0 (- %arg1 1))
                      (define %26 (+ %21.new0 %lastidx0))
                      (define %36 (extract %26 %21.new0 a))
                      (define %37.ab0 (bvsubnw %36 %19 %arg1 %arg2))
                      %37.ab0)))))
  result)

(define (vorrq_u16 a b)
  (define %0 (bvor a b))
  %0)

(define (vaddl_u8 a
                  b
                  %vectsize0
                  %outerlanesize0
                  %innerlaneoffset0
                  %innerlanesize0
                  %elemsize0
                  %arg0
                  %arg1
                  %arg2
                  %arg3
                  %arg4
                  %arg5)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx2 (- %elemsize0 1))
                      (define %5 (+ e0.new %lastidx2))
                      (define %6 (extract %5 e0.new a))
                      (define %7.ab0 (bvsizeext %6 192 %arg5))
                      (define %12 (extract %5 e0.new b))
                      (define %13.ab0 (bvsizeext %12 192 %arg4))
                      (define %14.ab0 (bvaddnw %7.ab0 %13.ab0 192 %arg3))
                      (define %lastidx1 (- %arg0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %25 (extract %highidx0 %arg1 %14.ab0))
                      %25)))))
  result)

(define (vmull_high_n_u16 a
                          b
                          %vectsize0
                          %outerlanesize0
                          %innerlaneoffset0
                          %innerlanesize0
                          %elemsize0
                          %arg0
                          %arg1
                          %arg2
                          %arg3
                          %arg4)
  (define %2 (extract 127 64 a))
  (define %9 (extract 15 0 b))
  (define %10.ab0 (bvsizeext %9 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %12.new0 (/ e0.new %arg4))
                      (define %lastidx2 (- %arg3 1))
                      (define %15 (+ %12.new0 %lastidx2))
                      (define %16 (extract %15 %12.new0 %2))
                      (define %17.ab0 (bvsizeext %16 192 %arg2))
                      (define %20 (bvmul %17.ab0 %10.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %21 (extract %highidx0 %arg1 %20))
                      %21)))))
  result)

(define (vaddl_high_u16 a
                        b
                        %vectsize0
                        %outerlanesize0
                        %innerlaneoffset0
                        %innerlanesize0
                        %elemsize0
                        %arg0
                        %arg1
                        %arg2
                        %arg3
                        %arg4
                        %arg5)
  (define %2 (extract 127 64 a))
  (define %5 (extract 127 64 b))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %8.new0 (/ e0.new %arg5))
                      (define %lastidx2 (- %arg3 1))
                      (define %11 (+ %8.new0 %lastidx2))
                      (define %12 (extract %11 %8.new0 %2))
                      (define %13.ab0 (bvsizeext %12 192 %arg4))
                      (define %18 (extract %11 %8.new0 %5))
                      (define %19.ab0 (bvsizeext %18 192 %arg2))
                      (define %20.ab0 (bvaddnw %13.ab0 %19.ab0 192 %arg1))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %31 (extract %highidx0 %arg0 %20.ab0))
                      %31)))))
  result)

(define (vmlsl_high_n_u16 a
                          b
                          c
                          %vectsize0
                          %outerlanesize0
                          %innerlaneoffset0
                          %innerlanesize0
                          %elemsize0
                          %arg0
                          %arg1
                          %arg2
                          %arg3
                          %arg4
                          %arg5)
  (define %2 (extract 127 64 b))
  (define %10 (extract 15 0 c))
  (define %11.ab0 (bvsizeext %10 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %13.new0 (/ e0.new %arg5))
                      (define %lastidx2 (- %arg4 1))
                      (define %16 (+ %13.new0 %lastidx2))
                      (define %17 (extract %16 %13.new0 %2))
                      (define %18.ab0 (bvsizeext %17 192 %arg3))
                      (define %21 (bvmul %18.ab0 %11.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg2))
                      (define %22 (extract %highidx0 %arg2 %21))
                      (define %lastidx0 (- %elemsize0 1))
                      (define %29 (+ e0.new %lastidx0))
                      (define %39 (extract %29 e0.new a))
                      (define %40.ab0 (bvsubnw %39 %22 %elemsize0 %arg1))
                      %40.ab0)))))
  result)

(define (vqrdmlah_s32 %arg6
                      %arg5
                      %arg2
                      %arg1
                      a
                      b
                      c
                      %vectsize0
                      %outerlanesize0
                      %innerlaneoffset0
                      %innerlanesize0
                      %elemsize0
                      %arg0
                      %arg3
                      %arg4
                      %arg7
                      %arg8
                      %arg9)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %6 (+ e0.new %lastidx0))
                      (define %7 (extract %6 e0.new b))
                      (define %8.ab0 (bvsizeext %7 192 %arg9))
                      (define %13 (extract %6 e0.new c))
                      (define %14.ab0 (bvsizeext %13 192 %arg8))
                      (define %19 (extract %6 e0.new a))
                      (define %20.ab0 (bvsizeext %19 192 %arg7))
                      (define %21 (armshl %20.ab0 %arg6))
                      (define %22 (bvmul %8.ab0 %14.ab0))
                      (define %23 (bvmul %arg5 %22))
                      (define %24.ab0 (bvaddnw %21 %23 192 %arg4))
                      (define %25.ab0 (bvaddnw %24.ab0 %arg2 192 %arg3))
                      (define %30 (bvashr %25.ab0 %arg1))
                      (define %31.ab0 (bvsaturate %30 192 %elemsize0 %arg0))
                      %31.ab0)))))
  result)

(define (vqdmlal_n_s16 %arg9
                       a
                       b
                       c
                       %vectsize0
                       %outerlanesize0
                       %innerlaneoffset0
                       %innerlanesize0
                       %elemsize0
                       %arg0
                       %arg1
                       %arg2
                       %arg3
                       %arg4
                       %arg5
                       %arg6
                       %arg7
                       %arg8
                       %arg10)
  (define %7 (extract 15 0 c))
  (define %8.ab0 (bvsizeext %7 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx1 (- %elemsize0 1))
                      (define %13 (+ e0.new %lastidx1))
                      (define %14 (extract %13 e0.new b))
                      (define %15.ab0 (bvsizeext %14 192 %arg10))
                      (define %16 (bvmul %arg9 %15.ab0))
                      (define %17 (bvmul %16 %8.ab0))
                      (define %19.ab0 (bvsaturate %17 192 %arg8 %arg7))
                      (define %21.new0 (* e0.new %arg6))
                      (define %lastidx0 (- %arg1 1))
                      (define %26 (+ %21.new0 %lastidx0))
                      (define %28 (extract %26 %21.new0 a))
                      (define %29.ab0 (bvsizeext %28 192 %arg5))
                      (define %30.ab0 (bvsizeext %19.ab0 192 %arg4))
                      (define %31.ab0 (bvaddnw %29.ab0 %30.ab0 192 %arg3))
                      (define %41.ab0 (bvsaturate %31.ab0 192 %arg1 %arg2))
                      %41.ab0)))))
  result)

(define (vmovn_high_u32 r
                        a
                        %vectsize0
                        %outerlanesize0
                        %innerlaneoffset0
                        %innerlanesize0
                        %elemsize0
                        %arg0
                        %arg1)
  (define result0
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %4.new0 (* e0.new %arg1))
                      (define %lastidx1 (- %arg0 1))
                      (define %17.new.high.idx0 (+ %4.new0 %lastidx1))
                      (define %110.new (extract %17.new.high.idx0 %4.new0 a))
                      %110.new)))))
  (define %18 (concat result0 r))
  %18)

(define (vaddw_s32 a
                   b
                   %vectsize0
                   %outerlanesize0
                   %innerlaneoffset0
                   %innerlanesize0
                   %elemsize0
                   %arg0
                   %arg1
                   %arg2
                   %arg3
                   %arg4
                   %arg5)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %4.new0 (* e0.new %arg5))
                      (define %lastidx0 (- %arg0 1))
                      (define %9 (+ %4.new0 %lastidx0))
                      (define %11 (extract %9 %4.new0 a))
                      (define %12.ab0 (bvsizeext %11 192 %arg4))
                      (define %lastidx2 (- %elemsize0 1))
                      (define %16 (+ e0.new %lastidx2))
                      (define %17 (extract %16 e0.new b))
                      (define %18.ab0 (bvsizeext %17 192 %arg3))
                      (define %19.ab0 (bvaddnw %12.ab0 %18.ab0 192 %arg2))
                      (define %lastidx1 (- %arg0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %30 (extract %highidx0 %arg1 %19.ab0))
                      %30)))))
  result)

(define (vqdmlal_high_s16 %arg6
                          a
                          b
                          c
                          %vectsize0
                          %outerlanesize0
                          %innerlaneoffset0
                          %innerlanesize0
                          %elemsize0
                          %arg0
                          %arg1
                          %arg2
                          %arg3
                          %arg4
                          %arg5
                          %arg7
                          %arg8
                          %arg9
                          %arg10)
  (define %2 (extract 127 64 b))
  (define %5 (extract 127 64 c))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %10.new0 (/ e0.new %arg10))
                      (define %lastidx1 (- %arg8 1))
                      (define %13 (+ %10.new0 %lastidx1))
                      (define %14 (extract %13 %10.new0 %2))
                      (define %15.ab0 (bvsizeext %14 192 %arg9))
                      (define %20 (extract %13 %10.new0 %5))
                      (define %21.ab0 (bvsizeext %20 192 %arg7))
                      (define %22 (bvmul %arg6 %15.ab0))
                      (define %23 (bvmul %22 %21.ab0))
                      (define %25.ab0 (bvsaturate %23 192 %arg5 %arg4))
                      (define %lastidx0 (- %elemsize0 1))
                      (define %32 (+ e0.new %lastidx0))
                      (define %34 (extract %32 e0.new a))
                      (define %35.ab0 (bvsizeext %34 192 %arg3))
                      (define %36.ab0 (bvsizeext %25.ab0 192 %arg2))
                      (define %37.ab0 (bvaddnw %35.ab0 %36.ab0 192 %arg1))
                      (define %47.ab0 (bvsaturate %37.ab0 192 %elemsize0 %arg0))
                      %47.ab0)))))
  result)

(define (vshl_u32 %arg2
                  a
                  b
                  %vectsize0
                  %outerlanesize0
                  %innerlaneoffset0
                  %innerlanesize0
                  %elemsize0
                  %arg0
                  %arg1
                  %arg3
                  %arg4
                  %arg5
                  %arg6)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %2.new0 (* e0.new %arg6))
                      (define %lastidx0 (- %arg0 1))
                      (define %5 (+ %2.new0 %lastidx0))
                      (define %lastidx2 (- %elemsize0 1))
                      (define %7.new.high.idx0 (+ %2.new0 %lastidx2))
                      (define %60.new (extract %7.new.high.idx0 %2.new0 b))
                      (define %8.ab0 (bvsizeext %60.new 192 %arg5))
                      (define %13 (extract %5 %2.new0 a))
                      (define %14.ab0 (bvsizeext %13 192 %arg4))
                      (define %15.ab0 (bvaddnw %14.ab0 %arg2 192 %arg3))
                      (define %16 (armshl %15.ab0 %8.ab0))
                      (define %lastidx1 (- %arg0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %22 (extract %highidx0 %arg1 %16))
                      %22)))))
  result)

(define (vmlal_n_u32 a
                     b
                     c
                     %vectsize0
                     %outerlanesize0
                     %innerlaneoffset0
                     %innerlanesize0
                     %elemsize0
                     %arg0
                     %arg1
                     %arg2
                     %arg3
                     %arg4
                     %arg5)
  (define %7 (extract 31 0 c))
  (define %8.ab0 (bvsizeext %7 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx2 (- %elemsize0 1))
                      (define %13 (+ e0.new %lastidx2))
                      (define %14 (extract %13 e0.new b))
                      (define %15.ab0 (bvsizeext %14 192 %arg5))
                      (define %18 (bvmul %15.ab0 %8.ab0))
                      (define %lastidx1 (- %arg1 1))
                      (define %highidx0 (+ %lastidx1 %arg4))
                      (define %19 (extract %highidx0 %arg4 %18))
                      (define %21.new0 (* e0.new %arg3))
                      (define %lastidx0 (- %arg1 1))
                      (define %26 (+ %21.new0 %lastidx0))
                      (define %36 (extract %26 %21.new0 a))
                      (define %37.ab0 (bvaddnw %36 %19 %arg1 %arg2))
                      %37.ab0)))))
  result)

(define (vbicq_s32 a b)
  (define %0 (bvnot b))
  (define %1 (bvand a %0))
  %1)

(define (vceq_s16 %arg0.norm
                  b.norm
                  %arg1.norm
                  a.norm
                  %vectsize0.norm
                  %outerlanesize0.norm
                  %innerlaneoffset0.norm
                  %innerlanesize0.norm
                  %elemsize0.norm)
  (define result.norm
    (apply concat
           (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
             (apply concat
                    (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm
                                                            %innerlanesize0.norm
                                                            %elemsize0.norm))])
                      (define %lastidx0.norm (- %elemsize0.norm 1))
                      (define %4.norm (+ e0.new.norm %lastidx0.norm))
                      (define %5.norm (extract %4.norm e0.new.norm a.norm))
                      (define %10.norm (extract %4.norm e0.new.norm b.norm))
                      (define %11.norm (bveq %5.norm %10.norm))
                      (define %18.norm (if (equal? %11.norm #t) %arg0.norm %arg1.norm))
                      %18.norm)))))
  result.norm)

(define (vsubw_s8 a
                  b
                  %vectsize0
                  %outerlanesize0
                  %innerlaneoffset0
                  %innerlanesize0
                  %elemsize0
                  %arg0
                  %arg1
                  %arg2
                  %arg3
                  %arg4
                  %arg5)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %4.new0 (* e0.new %arg5))
                      (define %lastidx0 (- %arg0 1))
                      (define %9 (+ %4.new0 %lastidx0))
                      (define %11 (extract %9 %4.new0 a))
                      (define %12.ab0 (bvsizeext %11 192 %arg4))
                      (define %lastidx2 (- %elemsize0 1))
                      (define %16 (+ e0.new %lastidx2))
                      (define %17 (extract %16 e0.new b))
                      (define %18.ab0 (bvsizeext %17 192 %arg3))
                      (define %19.ab0 (bvsubnw %12.ab0 %18.ab0 192 %arg2))
                      (define %lastidx1 (- %arg0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %30 (extract %highidx0 %arg1 %19.ab0))
                      %30)))))
  result)

(define (vsubw_high_s32 a
                        b
                        %vectsize0
                        %outerlanesize0
                        %innerlaneoffset0
                        %innerlanesize0
                        %elemsize0
                        %arg0
                        %arg1
                        %arg2
                        %arg3
                        %arg4
                        %arg5)
  (define %3 (extract 127 64 b))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %12 (+ e0.new %lastidx0))
                      (define %14 (extract %12 e0.new a))
                      (define %15.ab0 (bvsizeext %14 192 %arg5))
                      (define %16.new0 (/ e0.new %arg4))
                      (define %lastidx2 (- %arg3 1))
                      (define %19 (+ %16.new0 %lastidx2))
                      (define %20 (extract %19 %16.new0 %3))
                      (define %21.ab0 (bvsizeext %20 192 %arg2))
                      (define %22.ab0 (bvsubnw %15.ab0 %21.ab0 192 %arg1))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %33 (extract %highidx0 %arg0 %22.ab0))
                      %33)))))
  result)

(define (vqrshl_s16 %arg5
                    %arg4
                    a
                    b
                    %vectsize0
                    %outerlanesize0
                    %innerlaneoffset0
                    %innerlanesize0
                    %elemsize0
                    %arg0
                    %arg1
                    %arg2
                    %arg3
                    %arg6
                    %arg7
                    %arg8)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %2.new0 (* e0.new %arg8))
                      (define %lastidx0 (- %arg0 1))
                      (define %5 (+ %2.new0 %lastidx0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %7.new.high.idx0 (+ %2.new0 %lastidx1))
                      (define %60.new (extract %7.new.high.idx0 %2.new0 b))
                      (define %8.ab0 (bvsizeext %60.new 192 %arg7))
                      (define %9 (bvneg %8.ab0))
                      (define %10.ab0 (bvsubnw %9 %arg5 192 %arg6))
                      (define %11 (armshl %arg4 %10.ab0))
                      (define %16 (extract %5 %2.new0 a))
                      (define %17.ab0 (bvsizeext %16 192 %arg3))
                      (define %18.ab0 (bvaddnw %17.ab0 %11 192 %arg2))
                      (define %19 (armshl %18.ab0 %8.ab0))
                      (define %24.ab0 (bvsaturate %19 192 %arg0 %arg1))
                      %24.ab0)))))
  result)

(define (vtrn2q_s8 a
                   b
                   %vectsize0
                   %outerlanesize0
                   %innerlaneoffset0
                   %innerlanesize0
                   %elemsize0
                   %innerlaneoffset1
                   %innerlanesize1
                   %elemsize1
                   %arg0
                   %arg1
                   %arg2
                   %arg3
                   %arg4
                   %arg5
                   %arg6)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (concat
              (apply concat
                     (for/list ([%iterator1.new
                                 (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                       (define %18.new0 (/ %iterator1.new %arg6))
                       (define %19 (+ %18.new0 %arg5))
                       (define %20 (* %19 %arg4))
                       (define %lastidx2 (- %elemsize1 1))
                       (define %25 (+ %20 %lastidx2))
                       (define %34 (extract %25 %20 b))
                       %34))
              (apply concat
                     (for/list ([%iterator0.new
                                 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                       (define %9.new0 (/ %iterator0.new %arg2))
                       (define %10 (+ %9.new0 %arg1))
                       (define %11 (* %10 %arg0))
                       (define %lastidx1 (- %elemsize0 1))
                       (define %16 (+ %11 %lastidx1))
                       (define %17 (extract %16 %11 a))
                       %17))))))
  result)

(define (vmulq_s8 a
                  b
                  %vectsize0
                  %outerlanesize0
                  %innerlaneoffset0
                  %innerlanesize0
                  %elemsize0
                  %arg0
                  %arg1
                  %arg2)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %4 (+ e0.new %lastidx0))
                      (define %5 (extract %4 e0.new a))
                      (define %10 (extract %4 e0.new b))
                      (define %12.ab0 (bvsizeext %5 192 %arg2))
                      (define %13.ab0 (bvsizeext %10 192 %arg1))
                      (define %14 (bvmul %12.ab0 %13.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %15 (extract %highidx0 %arg0 %14))
                      %15)))))
  result)

(define (vmulq_n_s32 a
                     b
                     %vectsize0
                     %outerlanesize0
                     %innerlaneoffset0
                     %innerlanesize0
                     %elemsize0
                     %arg0
                     %arg1
                     %arg2)
  (define %4 (extract 31 0 b))
  (define %5.ab0 (bvsizeext %4 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %10 (+ e0.new %lastidx0))
                      (define %11 (extract %10 e0.new a))
                      (define %12.ab0 (bvsizeext %11 192 %arg2))
                      (define %14 (bvmul %12.ab0 %5.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %15 (extract %highidx0 %arg1 %14))
                      %15)))))
  result)

(define (vmax_u16 a
                  b
                  %vectsize0
                  %outerlanesize0
                  %innerlaneoffset0
                  %innerlanesize0
                  %elemsize0
                  %arg0
                  %arg1
                  %arg2
                  %arg3)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %4 (+ e0.new %lastidx0))
                      (define %5 (extract %4 e0.new a))
                      (define %6.ab0 (bvsizeext %5 192 %arg3))
                      (define %11 (extract %4 e0.new b))
                      (define %12.ab0 (bvsizeext %11 192 %arg2))
                      (define %14.ab0 (bvmax %6.ab0 %12.ab0 %arg1))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %20 (extract %highidx0 %arg0 %14.ab0))
                      %20)))))
  result)

(define (vclt_s16 %arg0.norm
                  %arg1.norm
                  a.norm
                  b.norm
                  %vectsize0.norm
                  %outerlanesize0.norm
                  %innerlaneoffset0.norm
                  %innerlanesize0.norm
                  %elemsize0.norm
                  %arg2.norm
                  %arg3.norm
                  %arg4.norm)
  (define result.norm
    (apply concat
           (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
             (apply concat
                    (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm
                                                            %innerlanesize0.norm
                                                            %elemsize0.norm))])
                      (define %lastidx0.norm (- %elemsize0.norm 1))
                      (define %4.norm (+ e0.new.norm %lastidx0.norm))
                      (define %5.norm (extract %4.norm e0.new.norm b.norm))
                      (define %6.ab0.norm (bvsizeext %5.norm 192 %arg4.norm))
                      (define %11.norm (extract %4.norm e0.new.norm a.norm))
                      (define %12.ab0.norm (bvsizeext %11.norm 192 %arg3.norm))
                      (define %14.ab0.norm (bvgt %6.ab0.norm %12.ab0.norm %arg2.norm))
                      (define %21.norm (if (equal? %14.ab0.norm #t) %arg0.norm %arg1.norm))
                      %21.norm)))))
  result.norm)

(define (vmull_n_u32 a
                     b
                     %vectsize0
                     %outerlanesize0
                     %innerlaneoffset0
                     %innerlanesize0
                     %elemsize0
                     %arg0
                     %arg1
                     %arg2
                     %arg3
                     %arg4)
  (define %6 (extract 31 0 b))
  (define %7.ab0 (bvsizeext %6 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx2 (- %elemsize0 1))
                      (define %12 (+ e0.new %lastidx2))
                      (define %13 (extract %12 e0.new a))
                      (define %14.ab0 (bvsizeext %13 192 %arg4))
                      (define %17 (bvmul %14.ab0 %7.ab0))
                      (define %lastidx1 (- %arg1 1))
                      (define %highidx0 (+ %lastidx1 %arg3))
                      (define %18 (extract %highidx0 %arg3 %17))
                      %18)))))
  result)

(define (vqdmull_n_s16 %arg4
                       a
                       b
                       %vectsize0
                       %outerlanesize0
                       %innerlaneoffset0
                       %innerlanesize0
                       %elemsize0
                       %arg0
                       %arg1
                       %arg2
                       %arg3
                       %arg5)
  (define %6 (extract 15 0 b))
  (define %7.ab0 (bvsizeext %6 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx1 (- %elemsize0 1))
                      (define %12 (+ e0.new %lastidx1))
                      (define %13 (extract %12 e0.new a))
                      (define %14.ab0 (bvsizeext %13 192 %arg5))
                      (define %15 (bvmul %arg4 %14.ab0))
                      (define %16 (bvmul %15 %7.ab0))
                      (define %18.ab0 (bvsaturate %16 192 %arg1 %arg3))
                      %18.ab0)))))
  result)

(define (vqdmlal_high_n_s16 %arg7
                            a
                            b
                            c
                            %vectsize0
                            %outerlanesize0
                            %innerlaneoffset0
                            %innerlanesize0
                            %elemsize0
                            %arg0
                            %arg1
                            %arg2
                            %arg3
                            %arg4
                            %arg5
                            %arg6
                            %arg8
                            %arg9
                            %arg10)
  (define %2 (extract 127 64 b))
  (define %10 (extract 15 0 c))
  (define %11.ab0 (bvsizeext %10 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %13.new0 (/ e0.new %arg10))
                      (define %lastidx1 (- %arg9 1))
                      (define %16 (+ %13.new0 %lastidx1))
                      (define %17 (extract %16 %13.new0 %2))
                      (define %18.ab0 (bvsizeext %17 192 %arg8))
                      (define %19 (bvmul %arg7 %18.ab0))
                      (define %20 (bvmul %19 %11.ab0))
                      (define %22.ab0 (bvsaturate %20 192 %arg6 %arg5))
                      (define %lastidx0 (- %elemsize0 1))
                      (define %29 (+ e0.new %lastidx0))
                      (define %31 (extract %29 e0.new a))
                      (define %32.ab0 (bvsizeext %31 192 %arg4))
                      (define %33.ab0 (bvsizeext %22.ab0 192 %arg3))
                      (define %34.ab0 (bvaddnw %32.ab0 %33.ab0 192 %arg2))
                      (define %44.ab0 (bvsaturate %34.ab0 192 %elemsize0 %arg1))
                      %44.ab0)))))
  result)

(define (vmlal_high_n_u32 a
                          b
                          c
                          %vectsize0
                          %outerlanesize0
                          %innerlaneoffset0
                          %innerlanesize0
                          %elemsize0
                          %arg0
                          %arg1
                          %arg2
                          %arg3
                          %arg4
                          %arg5)
  (define %2 (extract 127 64 b))
  (define %10 (extract 31 0 c))
  (define %11.ab0 (bvsizeext %10 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %13.new0 (/ e0.new %arg5))
                      (define %lastidx2 (- %arg4 1))
                      (define %16 (+ %13.new0 %lastidx2))
                      (define %17 (extract %16 %13.new0 %2))
                      (define %18.ab0 (bvsizeext %17 192 %arg3))
                      (define %21 (bvmul %18.ab0 %11.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg2))
                      (define %22 (extract %highidx0 %arg2 %21))
                      (define %lastidx0 (- %elemsize0 1))
                      (define %29 (+ e0.new %lastidx0))
                      (define %39 (extract %29 e0.new a))
                      (define %40.ab0 (bvaddnw %39 %22 %elemsize0 %arg1))
                      %40.ab0)))))
  result)

(define (vbcaxq_u8 a b c)
  (define %0 (bvnot c))
  (define %1 (bvand b %0))
  (define %2 (bvxor a %1))
  %2)

(define (vrax1q_u64 %arg1 %arg0 a b)
  (define %0 (extract 127 64 b))
  (define %1 (bvrol %0 %arg1))
  (define %2 (extract 63 0 b))
  (define %3 (bvrol %2 %arg0))
  (define %4 (concat %1 %3))
  (define %5 (bvxor a %4))
  %5)

(define (vmlsq_n_u32 a
                     b
                     c
                     %vectsize0
                     %outerlanesize0
                     %innerlaneoffset0
                     %innerlanesize0
                     %elemsize0
                     %arg0
                     %arg1
                     %arg2
                     %arg3)
  (define %4 (extract 31 0 c))
  (define %5.ab0 (bvsizeext %4 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %10 (+ e0.new %lastidx0))
                      (define %11 (extract %10 e0.new b))
                      (define %12.ab0 (bvsizeext %11 192 %arg3))
                      (define %14 (bvmul %12.ab0 %5.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg2))
                      (define %15 (extract %highidx0 %arg2 %14))
                      (define %24 (extract %10 e0.new a))
                      (define %25.ab0 (bvsubnw %24 %15 %elemsize0 %arg1))
                      %25.ab0)))))
  result)

(define (vmlal_u16 a
                   b
                   c
                   %vectsize0
                   %outerlanesize0
                   %innerlaneoffset0
                   %innerlanesize0
                   %elemsize0
                   %arg0
                   %arg1
                   %arg2
                   %arg3
                   %arg4
                   %arg5)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx2 (- %elemsize0 1))
                      (define %8 (+ e0.new %lastidx2))
                      (define %9 (extract %8 e0.new b))
                      (define %10.ab0 (bvsizeext %9 192 %arg5))
                      (define %15 (extract %8 e0.new c))
                      (define %16.ab0 (bvsizeext %15 192 %arg4))
                      (define %19 (bvmul %10.ab0 %16.ab0))
                      (define %lastidx1 (- %arg0 1))
                      (define %highidx0 (+ %lastidx1 %arg3))
                      (define %20 (extract %highidx0 %arg3 %19))
                      (define %22.new0 (* e0.new %arg2))
                      (define %lastidx0 (- %arg0 1))
                      (define %27 (+ %22.new0 %lastidx0))
                      (define %29 (extract %27 %22.new0 a))
                      (define %30.ab0 (bvaddnw %29 %20 %arg0 %arg1))
                      %30.ab0)))))
  result)

(define (vhaddq_u16 a
                    b
                    %vectsize0
                    %outerlanesize0
                    %innerlaneoffset0
                    %innerlanesize0
                    %elemsize0
                    %arg0
                    %arg1
                    %arg2
                    %arg3)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %4 (+ e0.new %lastidx0))
                      (define %5 (extract %4 e0.new a))
                      (define %6.ab0 (bvsizeext %5 192 %arg3))
                      (define %11 (extract %4 e0.new b))
                      (define %12.ab0 (bvsizeext %11 192 %arg2))
                      (define %13.ab0 (bvaddnw %6.ab0 %12.ab0 192 %arg1))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %18 (extract %highidx0 %arg0 %13.ab0))
                      %18)))))
  result)

(define (vceqz_s8 %arg1.norm
                  a.norm
                  %arg0.norm
                  %arg2.norm
                  %vectsize0.norm
                  %outerlanesize0.norm
                  %innerlaneoffset0.norm
                  %innerlanesize0.norm
                  %elemsize0.norm
                  %arg3.norm)
  (define result.norm
    (apply concat
           (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
             (apply concat
                    (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm
                                                            %innerlanesize0.norm
                                                            %elemsize0.norm))])
                      (define %lastidx0.norm (- %elemsize0.norm 1))
                      (define %4.norm (+ e0.new.norm %lastidx0.norm))
                      (define %5.norm (extract %4.norm e0.new.norm a.norm))
                      (define %6.ab0.norm (bvsizeext %5.norm 192 %arg3.norm))
                      (define %7.norm (bveq %6.ab0.norm %arg2.norm))
                      (define %14.norm (if (equal? %7.norm #t) %arg0.norm %arg1.norm))
                      %14.norm)))))
  result.norm)

(define (vqsubq_u16 a
                    b
                    %vectsize0
                    %outerlanesize0
                    %innerlaneoffset0
                    %innerlanesize0
                    %elemsize0
                    %arg0
                    %arg1
                    %arg2
                    %arg3)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %4 (+ e0.new %lastidx0))
                      (define %5 (extract %4 e0.new a))
                      (define %6.ab0 (bvsizeext %5 192 %arg3))
                      (define %11 (extract %4 e0.new b))
                      (define %12.ab0 (bvsizeext %11 192 %arg2))
                      (define %13.ab0 (bvsubnw %6.ab0 %12.ab0 192 %arg1))
                      (define %18.ab0 (bvsaturate %13.ab0 192 %elemsize0 %arg0))
                      %18.ab0)))))
  result)

(define (vqshlq_u8 %arg1
                   a
                   b
                   %vectsize0
                   %outerlanesize0
                   %innerlaneoffset0
                   %innerlanesize0
                   %elemsize0
                   %arg0
                   %arg2
                   %arg3
                   %arg4)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %5 (+ e0.new %lastidx0))
                      (define %60.new (extract %5 e0.new b))
                      (define %8.ab0 (bvsizeext %60.new 192 %arg4))
                      (define %13 (extract %5 e0.new a))
                      (define %14.ab0 (bvsizeext %13 192 %arg3))
                      (define %15.ab0 (bvaddnw %14.ab0 %arg1 192 %arg2))
                      (define %16 (armshl %15.ab0 %8.ab0))
                      (define %21.ab0 (bvsaturate %16 192 %elemsize0 %arg0))
                      %21.ab0)))))
  result)

(define (vmovl_high_u8 %arg1
                       a
                       %vectsize0
                       %outerlanesize0
                       %innerlaneoffset0
                       %innerlanesize0
                       %elemsize0
                       %arg0
                       %arg2
                       %arg3
                       %arg4)
  (define %2 (extract 127 64 a))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %5.new0 (/ e0.new %arg4))
                      (define %lastidx2 (- %arg3 1))
                      (define %8 (+ %5.new0 %lastidx2))
                      (define %9 (extract %8 %5.new0 %2))
                      (define %10.ab0 (bvsizeext %9 192 %arg2))
                      (define %11 (armshl %10.ab0 %arg1))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %22 (extract %highidx0 %arg0 %11))
                      %22)))))
  result)

(define (vmlsl_high_s16 a
                        b
                        c
                        %vectsize0
                        %outerlanesize0
                        %innerlaneoffset0
                        %innerlanesize0
                        %elemsize0
                        %arg0
                        %arg1
                        %arg2
                        %arg3
                        %arg4
                        %arg5)
  (define %2 (extract 127 64 b))
  (define %5 (extract 127 64 c))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %11.new0 (/ e0.new %arg5))
                      (define %lastidx2 (- %arg3 1))
                      (define %14 (+ %11.new0 %lastidx2))
                      (define %15 (extract %14 %11.new0 %2))
                      (define %16.ab0 (bvsizeext %15 192 %arg4))
                      (define %21 (extract %14 %11.new0 %5))
                      (define %22.ab0 (bvsizeext %21 192 %arg2))
                      (define %25 (bvmul %16.ab0 %22.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %26 (extract %highidx0 %arg1 %25))
                      (define %lastidx0 (- %elemsize0 1))
                      (define %33 (+ e0.new %lastidx0))
                      (define %35 (extract %33 e0.new a))
                      (define %36.ab0 (bvsubnw %35 %26 %elemsize0 %arg0))
                      %36.ab0)))))
  result)

(define (vcle_u16 %arg1.norm
                  %arg0.norm
                  a.norm
                  b.norm
                  %vectsize0.norm
                  %outerlanesize0.norm
                  %innerlaneoffset0.norm
                  %innerlanesize0.norm
                  %elemsize0.norm
                  %arg2.norm
                  %arg3.norm
                  %arg4.norm)
  (define result.norm
    (apply concat
           (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
             (apply concat
                    (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm
                                                            %innerlanesize0.norm
                                                            %elemsize0.norm))])
                      (define %lastidx0.norm (- %elemsize0.norm 1))
                      (define %4.norm (+ e0.new.norm %lastidx0.norm))
                      (define %5.norm (extract %4.norm e0.new.norm b.norm))
                      (define %6.ab0.norm (bvsizeext %5.norm 192 %arg4.norm))
                      (define %11.norm (extract %4.norm e0.new.norm a.norm))
                      (define %12.ab0.norm (bvsizeext %11.norm 192 %arg3.norm))
                      (define %13.ab0.norm (bvge %6.ab0.norm %12.ab0.norm %arg2.norm))
                      (define %21.norm (if (equal? %13.ab0.norm #t) %arg0.norm %arg1.norm))
                      %21.norm)))))
  result.norm)

(define (vrshlq_s8 %arg4
                   %arg3
                   a
                   b
                   %vectsize0
                   %outerlanesize0
                   %innerlaneoffset0
                   %innerlanesize0
                   %elemsize0
                   %arg0
                   %arg1
                   %arg2
                   %arg5
                   %arg6)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %5 (+ e0.new %lastidx0))
                      (define %60.new (extract %5 e0.new b))
                      (define %8.ab0 (bvsizeext %60.new 192 %arg6))
                      (define %9 (bvneg %8.ab0))
                      (define %10.ab0 (bvsubnw %9 %arg4 192 %arg5))
                      (define %11 (armshl %arg3 %10.ab0))
                      (define %16 (extract %5 e0.new a))
                      (define %17.ab0 (bvsizeext %16 192 %arg2))
                      (define %18.ab0 (bvaddnw %17.ab0 %11 192 %arg1))
                      (define %19 (armshl %18.ab0 %8.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %25 (extract %highidx0 %arg0 %19))
                      %25)))))
  result)

(define (vandq_u16 a b)
  (define %0 (bvand a b))
  %0)

(define (vmull_high_u16 a
                        b
                        %vectsize0
                        %outerlanesize0
                        %innerlaneoffset0
                        %innerlanesize0
                        %elemsize0
                        %arg0
                        %arg1
                        %arg2
                        %arg3
                        %arg4)
  (define %2 (extract 127 64 a))
  (define %5 (extract 127 64 b))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %8.new0 (/ e0.new %arg4))
                      (define %lastidx2 (- %arg2 1))
                      (define %11 (+ %8.new0 %lastidx2))
                      (define %12 (extract %11 %8.new0 %2))
                      (define %13.ab0 (bvsizeext %12 192 %arg3))
                      (define %18 (extract %11 %8.new0 %5))
                      (define %19.ab0 (bvsizeext %18 192 %arg1))
                      (define %30 (bvmul %13.ab0 %19.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %31 (extract %highidx0 %arg0 %30))
                      %31)))))
  result)

(define (vqrdmlahs_s32 %arg6
                       %arg5
                       %arg2
                       %arg1
                       a
                       b
                       c
                       %vectsize0
                       %outerlanesize0
                       %innerlaneoffset0
                       %innerlanesize0
                       %elemsize0
                       %arg0
                       %arg3
                       %arg4
                       %arg7
                       %arg8
                       %arg9)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %6 (+ e0.new %lastidx0))
                      (define %7 (extract %6 e0.new b))
                      (define %8.ab0 (bvsizeext %7 192 %arg9))
                      (define %13 (extract %6 e0.new c))
                      (define %14.ab0 (bvsizeext %13 192 %arg8))
                      (define %19 (extract %6 e0.new a))
                      (define %20.ab0 (bvsizeext %19 192 %arg7))
                      (define %21 (armshl %20.ab0 %arg6))
                      (define %22 (bvmul %8.ab0 %14.ab0))
                      (define %23 (bvmul %arg5 %22))
                      (define %24.ab0 (bvsubnw %21 %23 192 %arg4))
                      (define %25.ab0 (bvaddnw %24.ab0 %arg2 192 %arg3))
                      (define %30 (bvashr %25.ab0 %arg1))
                      (define %31.ab0 (bvsaturate %30 192 %elemsize0 %arg0))
                      %31.ab0)))))
  result)

(define (vsubl_s8 a
                  b
                  %vectsize0
                  %outerlanesize0
                  %innerlaneoffset0
                  %innerlanesize0
                  %elemsize0
                  %arg0
                  %arg1
                  %arg2
                  %arg3
                  %arg4
                  %arg5)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx2 (- %elemsize0 1))
                      (define %5 (+ e0.new %lastidx2))
                      (define %6 (extract %5 e0.new a))
                      (define %7.ab0 (bvsizeext %6 192 %arg5))
                      (define %12 (extract %5 e0.new b))
                      (define %13.ab0 (bvsizeext %12 192 %arg4))
                      (define %14.ab0 (bvsubnw %7.ab0 %13.ab0 192 %arg3))
                      (define %lastidx1 (- %arg0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %25 (extract %highidx0 %arg1 %14.ab0))
                      %25)))))
  result)

(define (vmlal_high_s8 a
                       b
                       c
                       %vectsize0
                       %outerlanesize0
                       %innerlaneoffset0
                       %innerlanesize0
                       %elemsize0
                       %arg0
                       %arg1
                       %arg2
                       %arg3
                       %arg4
                       %arg5)
  (define %2 (extract 127 64 b))
  (define %5 (extract 127 64 c))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %11.new0 (/ e0.new %arg5))
                      (define %lastidx2 (- %arg3 1))
                      (define %14 (+ %11.new0 %lastidx2))
                      (define %15 (extract %14 %11.new0 %2))
                      (define %16.ab0 (bvsizeext %15 192 %arg4))
                      (define %21 (extract %14 %11.new0 %5))
                      (define %22.ab0 (bvsizeext %21 192 %arg2))
                      (define %25 (bvmul %16.ab0 %22.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %26 (extract %highidx0 %arg1 %25))
                      (define %lastidx0 (- %elemsize0 1))
                      (define %33 (+ e0.new %lastidx0))
                      (define %35 (extract %33 e0.new a))
                      (define %36.ab0 (bvaddnw %35 %26 %elemsize0 %arg0))
                      %36.ab0)))))
  result)

(define (vmls_n_u16 a
                    b
                    c
                    %vectsize0
                    %outerlanesize0
                    %innerlaneoffset0
                    %innerlanesize0
                    %elemsize0
                    %arg0
                    %arg1
                    %arg2
                    %arg3)
  (define %4 (extract 15 0 c))
  (define %5.ab0 (bvsizeext %4 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %10 (+ e0.new %lastidx0))
                      (define %11 (extract %10 e0.new b))
                      (define %12.ab0 (bvsizeext %11 192 %arg3))
                      (define %14 (bvmul %12.ab0 %5.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg2))
                      (define %15 (extract %highidx0 %arg2 %14))
                      (define %24 (extract %10 e0.new a))
                      (define %25.ab0 (bvsubnw %24 %15 %elemsize0 %arg1))
                      %25.ab0)))))
  result)

(define (vqdmlsl_high_n_s32 %arg7
                            a
                            b
                            c
                            %vectsize0
                            %outerlanesize0
                            %innerlaneoffset0
                            %innerlanesize0
                            %elemsize0
                            %arg0
                            %arg1
                            %arg2
                            %arg3
                            %arg4
                            %arg5
                            %arg6
                            %arg8
                            %arg9
                            %arg10)
  (define %2 (extract 127 64 b))
  (define %10 (extract 31 0 c))
  (define %11.ab0 (bvsizeext %10 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %13.new0 (/ e0.new %arg10))
                      (define %lastidx1 (- %arg9 1))
                      (define %16 (+ %13.new0 %lastidx1))
                      (define %17 (extract %16 %13.new0 %2))
                      (define %18.ab0 (bvsizeext %17 192 %arg8))
                      (define %19 (bvmul %arg7 %18.ab0))
                      (define %20 (bvmul %19 %11.ab0))
                      (define %22.ab0 (bvsaturate %20 192 %arg6 %arg5))
                      (define %lastidx0 (- %elemsize0 1))
                      (define %29 (+ e0.new %lastidx0))
                      (define %31 (extract %29 e0.new a))
                      (define %32.ab0 (bvsizeext %31 192 %arg4))
                      (define %33.ab0 (bvsizeext %22.ab0 192 %arg3))
                      (define %34.ab0 (bvsubnw %32.ab0 %33.ab0 192 %arg2))
                      (define %44.ab0 (bvsaturate %34.ab0 192 %elemsize0 %arg1))
                      %44.ab0)))))
  result)

(define (vzip1_u16 a
                   b
                   %vectsize0
                   %outerlanesize0
                   %innerlaneoffset0
                   %innerlanesize0
                   %elemsize0
                   %innerlaneoffset1
                   %innerlanesize1
                   %elemsize1
                   %arg0
                   %arg1
                   %arg2
                   %arg3)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (concat
              (apply concat
                     (for/list ([%iterator1.new
                                 (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                       (define %lastidx3 (- %elemsize1 1))
                       (define %30 (+ %iterator1.new %lastidx3))
                       (define %31 (extract %30 %iterator1.new b))
                       %31))
              (apply concat
                     (for/list ([%iterator0.new
                                 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                       (define %lastidx1 (- %elemsize0 1))
                       (define %15 (+ %iterator0.new %lastidx1))
                       (define %16 (extract %15 %iterator0.new a))
                       %16))))))
  result)

(define (vmlsl_high_n_s32 a
                          b
                          c
                          %vectsize0
                          %outerlanesize0
                          %innerlaneoffset0
                          %innerlanesize0
                          %elemsize0
                          %arg0
                          %arg1
                          %arg2
                          %arg3
                          %arg4
                          %arg5)
  (define %2 (extract 127 64 b))
  (define %10 (extract 31 0 c))
  (define %11.ab0 (bvsizeext %10 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %13.new0 (/ e0.new %arg5))
                      (define %lastidx2 (- %arg4 1))
                      (define %16 (+ %13.new0 %lastidx2))
                      (define %17 (extract %16 %13.new0 %2))
                      (define %18.ab0 (bvsizeext %17 192 %arg3))
                      (define %21 (bvmul %18.ab0 %11.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg2))
                      (define %22 (extract %highidx0 %arg2 %21))
                      (define %lastidx0 (- %elemsize0 1))
                      (define %29 (+ e0.new %lastidx0))
                      (define %39 (extract %29 e0.new a))
                      (define %40.ab0 (bvsubnw %39 %22 %elemsize0 %arg1))
                      %40.ab0)))))
  result)

(define (vorn_s8 a b)
  (define %0 (bvnot b))
  (define %1 (bvor a %0))
  %1)

(define (veorq_s16 %arg0 a b)
  (define %3 (bvand a %arg0))
  (define %4 (bvxor b %3))
  %4)

(define (vmla_n_s16 a
                    b
                    c
                    %vectsize0
                    %outerlanesize0
                    %innerlaneoffset0
                    %innerlanesize0
                    %elemsize0
                    %arg0
                    %arg1
                    %arg2
                    %arg3)
  (define %4 (extract 15 0 c))
  (define %5.ab0 (bvsizeext %4 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %10 (+ e0.new %lastidx0))
                      (define %11 (extract %10 e0.new b))
                      (define %12.ab0 (bvsizeext %11 192 %arg3))
                      (define %14 (bvmul %12.ab0 %5.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg2))
                      (define %15 (extract %highidx0 %arg2 %14))
                      (define %24 (extract %10 e0.new a))
                      (define %25.ab0 (bvaddnw %24 %15 %elemsize0 %arg1))
                      %25.ab0)))))
  result)

(define (vaddq_s16 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %4 (+ e0.new %lastidx0))
                      (define %5 (extract %4 e0.new a))
                      (define %10 (extract %4 e0.new b))
                      (define %15.ab0 (bvaddnw %5 %10 %elemsize0 %arg0))
                      %15.ab0)))))
  result)

(define (vmull_u32 a
                   b
                   %vectsize0
                   %outerlanesize0
                   %innerlaneoffset0
                   %innerlanesize0
                   %elemsize0
                   %arg0
                   %arg1
                   %arg2
                   %arg3
                   %arg4)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx2 (- %elemsize0 1))
                      (define %5 (+ e0.new %lastidx2))
                      (define %6 (extract %5 e0.new a))
                      (define %7.ab0 (bvsizeext %6 192 %arg4))
                      (define %12 (extract %5 e0.new b))
                      (define %13.ab0 (bvsizeext %12 192 %arg3))
                      (define %24 (bvmul %7.ab0 %13.ab0))
                      (define %lastidx1 (- %arg0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %25 (extract %highidx0 %arg1 %24))
                      %25)))))
  result)

(define (vmovq_n_s16 value %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      value)))))
  result)

(define (vqmovn_high_u64 r
                         a
                         %vectsize0
                         %outerlanesize0
                         %innerlaneoffset0
                         %innerlanesize0
                         %elemsize0
                         %arg0
                         %arg1
                         %arg2
                         %arg3)
  (define result0
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx1 (- %elemsize0 1))
                      (define %9 (+ e0.new %lastidx1))
                      (define %11 (extract %9 e0.new a))
                      (define %16.ab0 (bvsizeext %11 192 %arg2))
                      (define %17.ab0 (bvsaturate %16.ab0 192 %arg0 %arg1))
                      %17.ab0)))))
  (define %18 (concat result0 r))
  %18)

(define (vpmin_s8 a
                  b
                  %vectsize0
                  %outerlanesize0
                  %innerlaneoffset0
                  %innerlanesize0
                  %elemsize0
                  %arg0
                  %arg1
                  %arg2
                  %arg3
                  %arg4
                  %arg5
                  %arg6
                  %arg7
                  %arg8
                  %arg9)
  (define %1 (concat b a))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %4.new0 (* e0.new %arg9))
                      (define %lastidx3 (- %arg8 1))
                      (define %8 (+ %4.new0 %lastidx3))
                      (define %9 (extract %8 %4.new0 %1))
                      (define %10.ab0 (bvsizeext %9 192 %arg7))
                      (define %11.new0 (/ e0.new %arg6))
                      (define %12 (+ %11.new0 %arg5))
                      (define %13 (* %12 %arg4))
                      (define %lastidx2 (- %arg3 1))
                      (define %18 (+ %13 %lastidx2))
                      (define %19 (extract %18 %13 %1))
                      (define %20.ab0 (bvsizeext %19 192 %arg2))
                      (define %21.ab0 (bvmin %10.ab0 %20.ab0 %arg1))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %28 (extract %highidx0 %arg0 %21.ab0))
                      %28)))))
  result)

(define (vmla_n_u32 a
                    b
                    c
                    %vectsize0
                    %outerlanesize0
                    %innerlaneoffset0
                    %innerlanesize0
                    %elemsize0
                    %arg0
                    %arg1
                    %arg2
                    %arg3)
  (define %4 (extract 31 0 c))
  (define %5.ab0 (bvsizeext %4 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %10 (+ e0.new %lastidx0))
                      (define %11 (extract %10 e0.new b))
                      (define %12.ab0 (bvsizeext %11 192 %arg3))
                      (define %14 (bvmul %12.ab0 %5.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg2))
                      (define %15 (extract %highidx0 %arg2 %14))
                      (define %24 (extract %10 e0.new a))
                      (define %25.ab0 (bvaddnw %24 %15 %elemsize0 %arg1))
                      %25.ab0)))))
  result)

(define (vqdmull_high_n_s16 %arg2
                            a
                            b
                            %vectsize0
                            %outerlanesize0
                            %innerlaneoffset0
                            %innerlanesize0
                            %elemsize0
                            %arg0
                            %arg1
                            %arg3
                            %arg4
                            %arg5)
  (define %2 (extract 127 64 a))
  (define %9 (extract 15 0 b))
  (define %10.ab0 (bvsizeext %9 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %12.new0 (/ e0.new %arg5))
                      (define %lastidx1 (- %arg4 1))
                      (define %15 (+ %12.new0 %lastidx1))
                      (define %16 (extract %15 %12.new0 %2))
                      (define %17.ab0 (bvsizeext %16 192 %arg3))
                      (define %18 (bvmul %arg2 %17.ab0))
                      (define %19 (bvmul %18 %10.ab0))
                      (define %21.ab0 (bvsaturate %19 192 %elemsize0 %arg1))
                      %21.ab0)))))
  result)

(define (vmin_s32 a
                  b
                  %vectsize0
                  %outerlanesize0
                  %innerlaneoffset0
                  %innerlanesize0
                  %elemsize0
                  %arg0
                  %arg1
                  %arg2
                  %arg3)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %4 (+ e0.new %lastidx0))
                      (define %5 (extract %4 e0.new a))
                      (define %6.ab0 (bvsizeext %5 192 %arg3))
                      (define %11 (extract %4 e0.new b))
                      (define %12.ab0 (bvsizeext %11 192 %arg2))
                      (define %13.ab0 (bvmin %6.ab0 %12.ab0 %arg1))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %20 (extract %highidx0 %arg0 %13.ab0))
                      %20)))))
  result)

(define (vpaddq_s8 %arg0
                   a
                   b
                   %vectsize0
                   %outerlanesize0
                   %innerlaneoffset0
                   %innerlanesize0
                   %elemsize0
                   %arg1
                   %arg2
                   %arg3
                   %arg4)
  (define %1 (concat b a))
  (define result
    (apply concat
           (for/list ([e0.new (reverse (range 0 %vectsize0 %outerlanesize0))])
             (define %lastidx0 (- %outerlanesize0 1))
             (define %22.0 (+ e0.new %lastidx0))
             (define %24 (extract %22.0 e0.new %arg0))
             (define result %24)
             (define %9.ext0.red
               (apply bvadd
                      (for/list ([iterator.0.new
                                  (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                        (define iterator.0.new.div (/ iterator.0.new %arg4))
                        (define %3.new1 (/ e0.new %arg3))
                        (define %3.new0 (+ %3.new1 iterator.0.new.div))
                        (define %4 (* %3.new0 %arg2))
                        (define %lastidx2 (- %outerlanesize0 1))
                        (define %8.new0 (+ %4 %lastidx2))
                        (define %9 (extract %8.new0 %4 %1))
                        %9)))
             (define %lastidx1 (- %outerlanesize0 1))
             (define %22.clone.0.new1 (+ e0.new %lastidx1))
             (define %9.acc0.ab0 (bvaddnw %9.ext0.red result %outerlanesize0 %arg1))
             %9.acc0.ab0)))
  result)

(define (vmull_high_n_u32 a
                          b
                          %vectsize0
                          %outerlanesize0
                          %innerlaneoffset0
                          %innerlanesize0
                          %elemsize0
                          %arg0
                          %arg1
                          %arg2
                          %arg3
                          %arg4)
  (define %2 (extract 127 64 a))
  (define %9 (extract 31 0 b))
  (define %10.ab0 (bvsizeext %9 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %12.new0 (/ e0.new %arg4))
                      (define %lastidx2 (- %arg3 1))
                      (define %15 (+ %12.new0 %lastidx2))
                      (define %16 (extract %15 %12.new0 %2))
                      (define %17.ab0 (bvsizeext %16 192 %arg2))
                      (define %20 (bvmul %17.ab0 %10.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %21 (extract %highidx0 %arg1 %20))
                      %21)))))
  result)

(define (vcltz_s32 %arg1.norm
                   %arg0.norm
                   %arg2.norm
                   a.norm
                   %vectsize0.norm
                   %outerlanesize0.norm
                   %innerlaneoffset0.norm
                   %innerlanesize0.norm
                   %elemsize0.norm
                   %arg3.norm
                   %arg4.norm)
  (define result.norm
    (apply concat
           (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
             (apply concat
                    (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm
                                                            %innerlanesize0.norm
                                                            %elemsize0.norm))])
                      (define %lastidx0.norm (- %elemsize0.norm 1))
                      (define %4.norm (+ e0.new.norm %lastidx0.norm))
                      (define %5.norm (extract %4.norm e0.new.norm a.norm))
                      (define %6.ab0.norm (bvsizeext %5.norm 192 %arg4.norm))
                      (define %7.ab0.norm (bvlt %6.ab0.norm %arg2.norm %arg3.norm))
                      (define %14.norm (if (equal? %7.ab0.norm #t) %arg0.norm %arg1.norm))
                      %14.norm)))))
  result.norm)

(define (vaddhn_high_u64 %arg3
                         r
                         a
                         b
                         %vectsize0
                         %outerlanesize0
                         %innerlaneoffset0
                         %innerlanesize0
                         %elemsize0
                         %arg0
                         %arg1
                         %arg2
                         %arg4
                         %arg5)
  (define result0
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx2 (- %elemsize0 1))
                      (define %14 (+ e0.new %lastidx2))
                      (define %16 (extract %14 e0.new a))
                      (define %25 (extract %14 e0.new b))
                      (define %26.ab0 (bvaddnw %16 %25 %elemsize0 %arg5))
                      (define %27.ab0 (bvaddnw %26.ab0 %arg3 64 %arg4))
                      (define %lastidx1 (- %arg0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %34 (extract %highidx0 %arg1 %27.ab0))
                      %34)))))
  (define %35 (concat result0 r))
  %35)

(define (vqrdmulhs_s32 %arg4
                       %arg2
                       %arg1
                       a
                       b
                       %vectsize0
                       %outerlanesize0
                       %innerlaneoffset0
                       %innerlanesize0
                       %elemsize0
                       %arg0
                       %arg3
                       %arg5
                       %arg6)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %6 (+ e0.new %lastidx0))
                      (define %7 (extract %6 e0.new a))
                      (define %8.ab0 (bvsizeext %7 192 %arg6))
                      (define %13 (extract %6 e0.new b))
                      (define %14.ab0 (bvsizeext %13 192 %arg5))
                      (define %15 (bvmul %arg4 %8.ab0))
                      (define %16 (bvmul %15 %14.ab0))
                      (define %17.ab0 (bvaddnw %16 %arg2 192 %arg3))
                      (define %22 (bvashr %17.ab0 %arg1))
                      (define %23.ab0 (bvsaturate %22 192 %elemsize0 %arg0))
                      %23.ab0)))))
  result)

(define (vzip2q_u64 a
                    b
                    %vectsize0
                    %outerlanesize0
                    %innerlaneoffset0
                    %innerlanesize0
                    %elemsize0
                    %innerlaneoffset1
                    %innerlanesize1
                    %elemsize1
                    %arg0
                    %arg1
                    %arg2
                    %arg3
                    %arg4
                    %arg5
                    %arg6
                    %arg7
                    %arg8
                    %arg9)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (concat
              (apply concat
                     (for/list ([%iterator1.new
                                 (reverse (range %innerlaneoffset1 %innerlanesize1 %elemsize1))])
                       (define %iterator1.new.div (/ %iterator1.new %arg9))
                       (define %25 (+ %arg5 %iterator1.new.div))
                       (define %26 (* %25 %arg4))
                       (define %lastidx3 (- %elemsize1 1))
                       (define %30 (+ %26 %lastidx3))
                       (define %31 (extract %30 %26 b))
                       %31))
              (apply concat
                     (for/list ([%iterator0.new
                                 (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                       (define %iterator0.new.div (/ %iterator0.new %arg3))
                       (define %10 (+ %arg1 %iterator0.new.div))
                       (define %11 (* %10 %arg0))
                       (define %lastidx1 (- %elemsize0 1))
                       (define %15 (+ %11 %lastidx1))
                       (define %16 (extract %15 %11 a))
                       %16))))))
  result)

(define (vrhaddq_s16 %arg1
                     a
                     b
                     %vectsize0
                     %outerlanesize0
                     %innerlaneoffset0
                     %innerlanesize0
                     %elemsize0
                     %arg0
                     %arg2
                     %arg3
                     %arg4
                     %arg5)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %4 (+ e0.new %lastidx0))
                      (define %5 (extract %4 e0.new a))
                      (define %6.ab0 (bvsizeext %5 192 %arg5))
                      (define %11 (extract %4 e0.new b))
                      (define %12.ab0 (bvsizeext %11 192 %arg4))
                      (define %17.ab0 (bvaddnw %6.ab0 %12.ab0 192 %arg3))
                      (define %18.ab0 (bvaddnw %17.ab0 %arg1 192 %arg2))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %19 (extract %highidx0 %arg0 %18.ab0))
                      %19)))))
  result)

(define (vmul_n_u16 a
                    b
                    %vectsize0
                    %outerlanesize0
                    %innerlaneoffset0
                    %innerlanesize0
                    %elemsize0
                    %arg0
                    %arg1
                    %arg2)
  (define %4 (extract 15 0 b))
  (define %5.ab0 (bvsizeext %4 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %10 (+ e0.new %lastidx0))
                      (define %11 (extract %10 e0.new a))
                      (define %12.ab0 (bvsizeext %11 192 %arg2))
                      (define %14 (bvmul %12.ab0 %5.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %15 (extract %highidx0 %arg1 %14))
                      %15)))))
  result)

(define (vqdmulhq_n_s32 %arg5
                        %arg3
                        %arg2
                        a
                        b
                        %vectsize0
                        %outerlanesize0
                        %innerlaneoffset0
                        %innerlanesize0
                        %elemsize0
                        %arg0
                        %arg1
                        %arg4
                        %arg6)
  (define %6 (extract 31 0 b))
  (define %7.ab0 (bvsizeext %6 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %12 (+ e0.new %lastidx0))
                      (define %13 (extract %12 e0.new a))
                      (define %14.ab0 (bvsizeext %13 192 %arg6))
                      (define %15 (bvmul %arg5 %14.ab0))
                      (define %16 (bvmul %15 %7.ab0))
                      (define %17.ab0 (bvaddnw %16 %arg3 192 %arg4))
                      (define %22 (bvashr %17.ab0 %arg2))
                      (define %23.ab0 (bvsaturate %22 192 %elemsize0 %arg1))
                      %23.ab0)))))
  result)

(define (vmlsl_n_s32 a
                     b
                     c
                     %vectsize0
                     %outerlanesize0
                     %innerlaneoffset0
                     %innerlanesize0
                     %elemsize0
                     %arg0
                     %arg1
                     %arg2
                     %arg3
                     %arg4
                     %arg5)
  (define %7 (extract 31 0 c))
  (define %8.ab0 (bvsizeext %7 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx2 (- %elemsize0 1))
                      (define %13 (+ e0.new %lastidx2))
                      (define %14 (extract %13 e0.new b))
                      (define %15.ab0 (bvsizeext %14 192 %arg5))
                      (define %18 (bvmul %15.ab0 %8.ab0))
                      (define %lastidx1 (- %arg1 1))
                      (define %highidx0 (+ %lastidx1 %arg4))
                      (define %19 (extract %highidx0 %arg4 %18))
                      (define %21.new0 (* e0.new %arg3))
                      (define %lastidx0 (- %arg1 1))
                      (define %26 (+ %21.new0 %lastidx0))
                      (define %36 (extract %26 %21.new0 a))
                      (define %37.ab0 (bvsubnw %36 %19 %arg1 %arg2))
                      %37.ab0)))))
  result)

(define (vshl_s8 %arg1
                 a
                 b
                 %vectsize0
                 %outerlanesize0
                 %innerlaneoffset0
                 %innerlanesize0
                 %elemsize0
                 %arg0
                 %arg2
                 %arg3
                 %arg4)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %5 (+ e0.new %lastidx0))
                      (define %60.new (extract %5 e0.new b))
                      (define %8.ab0 (bvsizeext %60.new 192 %arg4))
                      (define %13 (extract %5 e0.new a))
                      (define %14.ab0 (bvsizeext %13 192 %arg3))
                      (define %15.ab0 (bvaddnw %14.ab0 %arg1 192 %arg2))
                      (define %16 (armshl %15.ab0 %8.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %22 (extract %highidx0 %arg0 %16))
                      %22)))))
  result)

(define (vqneg_s64 a
                   %vectsize0
                   %outerlanesize0
                   %innerlaneoffset0
                   %innerlanesize0
                   %elemsize0
                   %arg0
                   %arg1)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %4 (+ e0.new %lastidx0))
                      (define %5 (extract %4 e0.new a))
                      (define %6.ab0 (bvsizeext %5 192 %arg1))
                      (define %7 (bvneg %6.ab0))
                      (define %12.ab0 (bvsaturate %7 192 %elemsize0 %arg0))
                      %12.ab0)))))
  result)

(define (vqshl_s64 %arg2
                   a
                   b
                   %vectsize0
                   %outerlanesize0
                   %innerlaneoffset0
                   %innerlanesize0
                   %elemsize0
                   %arg0
                   %arg1
                   %arg3
                   %arg4
                   %arg5
                   %arg6)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %2.new0 (* e0.new %arg6))
                      (define %lastidx0 (- %arg0 1))
                      (define %5 (+ %2.new0 %lastidx0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %7.new.high.idx0 (+ %2.new0 %lastidx1))
                      (define %60.new (extract %7.new.high.idx0 %2.new0 b))
                      (define %8.ab0 (bvsizeext %60.new 192 %arg5))
                      (define %13 (extract %5 %2.new0 a))
                      (define %14.ab0 (bvsizeext %13 192 %arg4))
                      (define %15.ab0 (bvaddnw %14.ab0 %arg2 192 %arg3))
                      (define %16 (armshl %15.ab0 %8.ab0))
                      (define %21.ab0 (bvsaturate %16 192 %arg0 %arg1))
                      %21.ab0)))))
  result)

(define (vaddw_high_u8 a
                       b
                       %vectsize0
                       %outerlanesize0
                       %innerlaneoffset0
                       %innerlanesize0
                       %elemsize0
                       %arg0
                       %arg1
                       %arg2
                       %arg3
                       %arg4
                       %arg5)
  (define %3 (extract 127 64 b))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %12 (+ e0.new %lastidx0))
                      (define %14 (extract %12 e0.new a))
                      (define %15.ab0 (bvsizeext %14 192 %arg5))
                      (define %16.new0 (/ e0.new %arg4))
                      (define %lastidx2 (- %arg3 1))
                      (define %19 (+ %16.new0 %lastidx2))
                      (define %20 (extract %19 %16.new0 %3))
                      (define %21.ab0 (bvsizeext %20 192 %arg2))
                      (define %22.ab0 (bvaddnw %15.ab0 %21.ab0 192 %arg1))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %33 (extract %highidx0 %arg0 %22.ab0))
                      %33)))))
  result)

(define (vqdmlsl_high_n_s16 %arg7
                            a
                            b
                            c
                            %vectsize0
                            %outerlanesize0
                            %innerlaneoffset0
                            %innerlanesize0
                            %elemsize0
                            %arg0
                            %arg1
                            %arg2
                            %arg3
                            %arg4
                            %arg5
                            %arg6
                            %arg8
                            %arg9
                            %arg10)
  (define %2 (extract 127 64 b))
  (define %10 (extract 15 0 c))
  (define %11.ab0 (bvsizeext %10 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %13.new0 (/ e0.new %arg10))
                      (define %lastidx1 (- %arg9 1))
                      (define %16 (+ %13.new0 %lastidx1))
                      (define %17 (extract %16 %13.new0 %2))
                      (define %18.ab0 (bvsizeext %17 192 %arg8))
                      (define %19 (bvmul %arg7 %18.ab0))
                      (define %20 (bvmul %19 %11.ab0))
                      (define %22.ab0 (bvsaturate %20 192 %arg6 %arg5))
                      (define %lastidx0 (- %elemsize0 1))
                      (define %29 (+ e0.new %lastidx0))
                      (define %31 (extract %29 e0.new a))
                      (define %32.ab0 (bvsizeext %31 192 %arg4))
                      (define %33.ab0 (bvsizeext %22.ab0 192 %arg3))
                      (define %34.ab0 (bvsubnw %32.ab0 %33.ab0 192 %arg2))
                      (define %44.ab0 (bvsaturate %34.ab0 192 %elemsize0 %arg1))
                      %44.ab0)))))
  result)

(define (vqdmlsl_n_s16 %arg9
                       a
                       b
                       c
                       %vectsize0
                       %outerlanesize0
                       %innerlaneoffset0
                       %innerlanesize0
                       %elemsize0
                       %arg0
                       %arg1
                       %arg2
                       %arg3
                       %arg4
                       %arg5
                       %arg6
                       %arg7
                       %arg8
                       %arg10)
  (define %7 (extract 15 0 c))
  (define %8.ab0 (bvsizeext %7 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx1 (- %elemsize0 1))
                      (define %13 (+ e0.new %lastidx1))
                      (define %14 (extract %13 e0.new b))
                      (define %15.ab0 (bvsizeext %14 192 %arg10))
                      (define %16 (bvmul %arg9 %15.ab0))
                      (define %17 (bvmul %16 %8.ab0))
                      (define %19.ab0 (bvsaturate %17 192 %arg8 %arg7))
                      (define %21.new0 (* e0.new %arg6))
                      (define %lastidx0 (- %arg1 1))
                      (define %26 (+ %21.new0 %lastidx0))
                      (define %28 (extract %26 %21.new0 a))
                      (define %29.ab0 (bvsizeext %28 192 %arg5))
                      (define %30.ab0 (bvsizeext %19.ab0 192 %arg4))
                      (define %31.ab0 (bvsubnw %29.ab0 %30.ab0 192 %arg3))
                      (define %41.ab0 (bvsaturate %31.ab0 192 %arg1 %arg2))
                      %41.ab0)))))
  result)

(define (vqdmlal_n_s32 %arg9
                       a
                       b
                       c
                       %vectsize0
                       %outerlanesize0
                       %innerlaneoffset0
                       %innerlanesize0
                       %elemsize0
                       %arg0
                       %arg1
                       %arg2
                       %arg3
                       %arg4
                       %arg5
                       %arg6
                       %arg7
                       %arg8
                       %arg10)
  (define %7 (extract 31 0 c))
  (define %8.ab0 (bvsizeext %7 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx1 (- %elemsize0 1))
                      (define %13 (+ e0.new %lastidx1))
                      (define %14 (extract %13 e0.new b))
                      (define %15.ab0 (bvsizeext %14 192 %arg10))
                      (define %16 (bvmul %arg9 %15.ab0))
                      (define %17 (bvmul %16 %8.ab0))
                      (define %19.ab0 (bvsaturate %17 192 %arg8 %arg7))
                      (define %21.new0 (* e0.new %arg6))
                      (define %lastidx0 (- %arg1 1))
                      (define %26 (+ %21.new0 %lastidx0))
                      (define %28 (extract %26 %21.new0 a))
                      (define %29.ab0 (bvsizeext %28 192 %arg5))
                      (define %30.ab0 (bvsizeext %19.ab0 192 %arg4))
                      (define %31.ab0 (bvaddnw %29.ab0 %30.ab0 192 %arg3))
                      (define %41.ab0 (bvsaturate %31.ab0 192 %arg1 %arg2))
                      %41.ab0)))))
  result)

(define (vuzp2_s32 a
                   b
                   %vectsize0
                   %outerlanesize0
                   %innerlaneoffset0
                   %innerlanesize0
                   %elemsize0
                   %arg0
                   %arg1
                   %arg2)
  (define %1 (concat b a))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %7.new0 (/ e0.new %arg2))
                      (define %8 (+ %7.new0 %arg1))
                      (define %9 (* %8 %arg0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %14 (+ %9 %lastidx1))
                      (define %15 (extract %14 %9 %1))
                      %15)))))
  result)

(define (vraddhn_u64 %arg1
                     a
                     b
                     %vectsize0
                     %outerlanesize0
                     %innerlaneoffset0
                     %innerlanesize0
                     %elemsize0
                     %arg0
                     %arg2
                     %arg3
                     %arg4
                     %arg5)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %9.new0 (* e0.new %arg5))
                      (define %lastidx2 (- %arg4 1))
                      (define %14 (+ %9.new0 %lastidx2))
                      (define %16 (extract %14 %9.new0 a))
                      (define %25 (extract %14 %9.new0 b))
                      (define %26.ab0 (bvaddnw %16 %25 %arg4 %arg3))
                      (define %27.ab0 (bvaddnw %26.ab0 %arg1 64 %arg2))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %34 (extract %highidx0 %arg0 %27.ab0))
                      %34)))))
  result)

(define (vmlal_high_n_s16 a
                          b
                          c
                          %vectsize0
                          %outerlanesize0
                          %innerlaneoffset0
                          %innerlanesize0
                          %elemsize0
                          %arg0
                          %arg1
                          %arg2
                          %arg3
                          %arg4
                          %arg5)
  (define %2 (extract 127 64 b))
  (define %10 (extract 15 0 c))
  (define %11.ab0 (bvsizeext %10 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %13.new0 (/ e0.new %arg5))
                      (define %lastidx2 (- %arg4 1))
                      (define %16 (+ %13.new0 %lastidx2))
                      (define %17 (extract %16 %13.new0 %2))
                      (define %18.ab0 (bvsizeext %17 192 %arg3))
                      (define %21 (bvmul %18.ab0 %11.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg2))
                      (define %22 (extract %highidx0 %arg2 %21))
                      (define %lastidx0 (- %elemsize0 1))
                      (define %29 (+ e0.new %lastidx0))
                      (define %39 (extract %29 e0.new a))
                      (define %40.ab0 (bvaddnw %39 %22 %elemsize0 %arg1))
                      %40.ab0)))))
  result)

(define (vclezq_s64 %arg0.norm
                    %arg1.norm
                    %arg2.norm
                    a.norm
                    %vectsize0.norm
                    %outerlanesize0.norm
                    %innerlaneoffset0.norm
                    %innerlanesize0.norm
                    %elemsize0.norm
                    %arg3.norm
                    %arg4.norm)
  (define result.norm
    (apply concat
           (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
             (apply concat
                    (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm
                                                            %innerlanesize0.norm
                                                            %elemsize0.norm))])
                      (define %lastidx0.norm (- %elemsize0.norm 1))
                      (define %4.norm (+ e0.new.norm %lastidx0.norm))
                      (define %5.norm (extract %4.norm e0.new.norm a.norm))
                      (define %6.ab0.norm (bvsizeext %5.norm 192 %arg4.norm))
                      (define %7.ab0.norm (bvle %6.ab0.norm %arg2.norm %arg3.norm))
                      (define %14.norm (if (equal? %7.ab0.norm #t) %arg0.norm %arg1.norm))
                      %14.norm)))))
  result.norm)

(define (vqdmulh_n_s16 %arg5
                       %arg3
                       %arg2
                       a
                       b
                       %vectsize0
                       %outerlanesize0
                       %innerlaneoffset0
                       %innerlanesize0
                       %elemsize0
                       %arg0
                       %arg1
                       %arg4
                       %arg6)
  (define %6 (extract 15 0 b))
  (define %7.ab0 (bvsizeext %6 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %12 (+ e0.new %lastidx0))
                      (define %13 (extract %12 e0.new a))
                      (define %14.ab0 (bvsizeext %13 192 %arg6))
                      (define %15 (bvmul %arg5 %14.ab0))
                      (define %16 (bvmul %15 %7.ab0))
                      (define %17.ab0 (bvaddnw %16 %arg3 192 %arg4))
                      (define %22 (bvashr %17.ab0 %arg2))
                      (define %23.ab0 (bvsaturate %22 192 %elemsize0 %arg1))
                      %23.ab0)))))
  result)

(define (vqdmull_high_s32 %arg1
                          a
                          b
                          %vectsize0
                          %outerlanesize0
                          %innerlaneoffset0
                          %innerlanesize0
                          %elemsize0
                          %arg0
                          %arg2
                          %arg3
                          %arg4
                          %arg5)
  (define %2 (extract 127 64 a))
  (define %5 (extract 127 64 b))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %9.new0 (/ e0.new %arg5))
                      (define %lastidx1 (- %arg3 1))
                      (define %12 (+ %9.new0 %lastidx1))
                      (define %13 (extract %12 %9.new0 %2))
                      (define %14.ab0 (bvsizeext %13 192 %arg4))
                      (define %19 (extract %12 %9.new0 %5))
                      (define %20.ab0 (bvsizeext %19 192 %arg2))
                      (define %21 (bvmul %arg1 %14.ab0))
                      (define %22 (bvmul %21 %20.ab0))
                      (define %24.ab0 (bvsaturate %22 192 %elemsize0 %arg0))
                      %24.ab0)))))
  result)

(define (vmls_s16 a
                  b
                  c
                  %vectsize0
                  %outerlanesize0
                  %innerlaneoffset0
                  %innerlanesize0
                  %elemsize0
                  %arg0
                  %arg1
                  %arg2
                  %arg3)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %4 (+ e0.new %lastidx0))
                      (define %5 (extract %4 e0.new b))
                      (define %10 (extract %4 e0.new c))
                      (define %12.ab0 (bvsizeext %5 192 %arg3))
                      (define %13.ab0 (bvsizeext %10 192 %arg2))
                      (define %14 (bvmul %12.ab0 %13.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %15 (extract %highidx0 %arg1 %14))
                      (define %24 (extract %4 e0.new a))
                      (define %25.ab0 (bvsubnw %24 %15 %elemsize0 %arg0))
                      %25.ab0)))))
  result)

(define (vmla_u32 a
                  b
                  c
                  %vectsize0
                  %outerlanesize0
                  %innerlaneoffset0
                  %innerlanesize0
                  %elemsize0
                  %arg0
                  %arg1
                  %arg2
                  %arg3)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %4 (+ e0.new %lastidx0))
                      (define %5 (extract %4 e0.new b))
                      (define %10 (extract %4 e0.new c))
                      (define %12.ab0 (bvsizeext %5 192 %arg3))
                      (define %13.ab0 (bvsizeext %10 192 %arg2))
                      (define %14 (bvmul %12.ab0 %13.ab0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %15 (extract %highidx0 %arg1 %14))
                      (define %24 (extract %4 e0.new a))
                      (define %25.ab0 (bvaddnw %24 %15 %elemsize0 %arg0))
                      %25.ab0)))))
  result)

(define (vmovl_s32 %arg3
                   a
                   %vectsize0
                   %outerlanesize0
                   %innerlaneoffset0
                   %innerlanesize0
                   %elemsize0
                   %arg0
                   %arg1
                   %arg2
                   %arg4)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx2 (- %elemsize0 1))
                      (define %5 (+ e0.new %lastidx2))
                      (define %6 (extract %5 e0.new a))
                      (define %7.ab0 (bvsizeext %6 192 %arg4))
                      (define %8 (armshl %7.ab0 %arg3))
                      (define %lastidx1 (- %arg0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %19 (extract %highidx0 %arg1 %8))
                      %19)))))
  result)

(define (vqaddq_u16 a
                    b
                    %vectsize0
                    %outerlanesize0
                    %innerlaneoffset0
                    %innerlanesize0
                    %elemsize0
                    %arg0
                    %arg1
                    %arg2
                    %arg3)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %4 (+ e0.new %lastidx0))
                      (define %5 (extract %4 e0.new a))
                      (define %6.ab0 (bvsizeext %5 192 %arg3))
                      (define %11 (extract %4 e0.new b))
                      (define %12.ab0 (bvsizeext %11 192 %arg2))
                      (define %13.ab0 (bvaddnw %6.ab0 %12.ab0 192 %arg1))
                      (define %18.ab0 (bvsaturate %13.ab0 192 %elemsize0 %arg0))
                      %18.ab0)))))
  result)

(define (vpmax_s8 a
                  b
                  %vectsize0
                  %outerlanesize0
                  %innerlaneoffset0
                  %innerlanesize0
                  %elemsize0
                  %arg0
                  %arg1
                  %arg2
                  %arg3
                  %arg4
                  %arg5
                  %arg6
                  %arg7
                  %arg8
                  %arg9)
  (define %1 (concat b a))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %4.new0 (* e0.new %arg9))
                      (define %lastidx3 (- %arg8 1))
                      (define %8 (+ %4.new0 %lastidx3))
                      (define %9 (extract %8 %4.new0 %1))
                      (define %10.ab0 (bvsizeext %9 192 %arg7))
                      (define %11.new0 (/ e0.new %arg6))
                      (define %12 (+ %11.new0 %arg5))
                      (define %13 (* %12 %arg4))
                      (define %lastidx2 (- %arg3 1))
                      (define %18 (+ %13 %lastidx2))
                      (define %19 (extract %18 %13 %1))
                      (define %20.ab0 (bvsizeext %19 192 %arg2))
                      (define %22.ab0 (bvmax %10.ab0 %20.ab0 %arg1))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %28 (extract %highidx0 %arg0 %22.ab0))
                      %28)))))
  result)

(define (vqdmull_n_s32 %arg4
                       a
                       b
                       %vectsize0
                       %outerlanesize0
                       %innerlaneoffset0
                       %innerlanesize0
                       %elemsize0
                       %arg0
                       %arg1
                       %arg2
                       %arg3
                       %arg5)
  (define %6 (extract 31 0 b))
  (define %7.ab0 (bvsizeext %6 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx1 (- %elemsize0 1))
                      (define %12 (+ e0.new %lastidx1))
                      (define %13 (extract %12 e0.new a))
                      (define %14.ab0 (bvsizeext %13 192 %arg5))
                      (define %15 (bvmul %arg4 %14.ab0))
                      (define %16 (bvmul %15 %7.ab0))
                      (define %18.ab0 (bvsaturate %16 192 %arg1 %arg3))
                      %18.ab0)))))
  result)

(define (vhsub_s16 a
                   b
                   %vectsize0
                   %outerlanesize0
                   %innerlaneoffset0
                   %innerlanesize0
                   %elemsize0
                   %arg0
                   %arg1
                   %arg2
                   %arg3)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %4 (+ e0.new %lastidx0))
                      (define %5 (extract %4 e0.new a))
                      (define %6.ab0 (bvsizeext %5 192 %arg3))
                      (define %11 (extract %4 e0.new b))
                      (define %12.ab0 (bvsizeext %11 192 %arg2))
                      (define %13.ab0 (bvsubnw %6.ab0 %12.ab0 192 %arg1))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %18 (extract %highidx0 %arg0 %13.ab0))
                      %18)))))
  result)

(define (vmvn_s32 a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %4 (+ e0.new %lastidx0))
                      (define %5 (extract %4 e0.new a))
                      (define %10 (bvnot %5))
                      %10)))))
  result)

(define (vqabss_s32 a
                    %vectsize0
                    %outerlanesize0
                    %innerlaneoffset0
                    %innerlanesize0
                    %elemsize0
                    %arg0
                    %arg1)
  (define result
    (apply
     concat
     (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
       (apply concat
              (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                (define %lastidx0 (- %elemsize0 1))
                (define %4 (+ e0.new %lastidx0))
                (define %5 (extract %4 e0.new a))
                (define %6.ab0 (bvsizeext %5 192 %arg1))
                (define %7 (integer->bitvector (abs (bitvector->integer %6.ab0)) (bitvector 192)))
                (define %12.ab0 (bvsaturate %7 192 %elemsize0 %arg0))
                %12.ab0)))))
  result)

(define (vtstq_u16 %arg0.norm
                   %arg1.norm
                   a.norm
                   b.norm
                   %vectsize0.norm
                   %outerlanesize0.norm
                   %innerlaneoffset0.norm
                   %innerlanesize0.norm
                   %elemsize0.norm)
  (define result.norm
    (apply concat
           (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
             (apply concat
                    (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm
                                                            %innerlanesize0.norm
                                                            %elemsize0.norm))])
                      (define %lastidx0.norm (- %elemsize0.norm 1))
                      (define %4.norm (+ e0.new.norm %lastidx0.norm))
                      (define %5.norm (extract %4.norm e0.new.norm a.norm))
                      (define %10.norm (extract %4.norm e0.new.norm b.norm))
                      (define %11.norm (bvand %5.norm %10.norm))
                      (define %12.norm (bvzero %11.norm))
                      (define %13.norm (not %12.norm))
                      (define %20.norm (if (equal? %13.norm #t) %arg0.norm %arg1.norm))
                      %20.norm)))))
  result.norm)

(define (vmull_n_s16 a
                     b
                     %vectsize0
                     %outerlanesize0
                     %innerlaneoffset0
                     %innerlanesize0
                     %elemsize0
                     %arg0
                     %arg1
                     %arg2
                     %arg3
                     %arg4)
  (define %6 (extract 15 0 b))
  (define %7.ab0 (bvsizeext %6 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx2 (- %elemsize0 1))
                      (define %12 (+ e0.new %lastidx2))
                      (define %13 (extract %12 e0.new a))
                      (define %14.ab0 (bvsizeext %13 192 %arg4))
                      (define %17 (bvmul %14.ab0 %7.ab0))
                      (define %lastidx1 (- %arg1 1))
                      (define %highidx0 (+ %lastidx1 %arg3))
                      (define %18 (extract %highidx0 %arg3 %17))
                      %18)))))
  result)

(define (vsubl_high_u16 a
                        b
                        %vectsize0
                        %outerlanesize0
                        %innerlaneoffset0
                        %innerlanesize0
                        %elemsize0
                        %arg0
                        %arg1
                        %arg2
                        %arg3
                        %arg4
                        %arg5)
  (define %2 (extract 127 64 a))
  (define %5 (extract 127 64 b))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %8.new0 (/ e0.new %arg5))
                      (define %lastidx2 (- %arg3 1))
                      (define %11 (+ %8.new0 %lastidx2))
                      (define %12 (extract %11 %8.new0 %2))
                      (define %13.ab0 (bvsizeext %12 192 %arg4))
                      (define %18 (extract %11 %8.new0 %5))
                      (define %19.ab0 (bvsizeext %18 192 %arg2))
                      (define %20.ab0 (bvsubnw %13.ab0 %19.ab0 192 %arg1))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %31 (extract %highidx0 %arg0 %20.ab0))
                      %31)))))
  result)

(define (vcgezq_s32 %arg0.norm
                    %arg1.norm
                    %arg2.norm
                    a.norm
                    %vectsize0.norm
                    %outerlanesize0.norm
                    %innerlaneoffset0.norm
                    %innerlanesize0.norm
                    %elemsize0.norm
                    %arg3.norm
                    %arg4.norm)
  (define result.norm
    (apply concat
           (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
             (apply concat
                    (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm
                                                            %innerlanesize0.norm
                                                            %elemsize0.norm))])
                      (define %lastidx0.norm (- %elemsize0.norm 1))
                      (define %4.norm (+ e0.new.norm %lastidx0.norm))
                      (define %5.norm (extract %4.norm e0.new.norm a.norm))
                      (define %6.ab0.norm (bvsizeext %5.norm 192 %arg4.norm))
                      (define %7.ab0.norm (bvge %6.ab0.norm %arg2.norm %arg3.norm))
                      (define %14.norm (if (equal? %7.ab0.norm #t) %arg0.norm %arg1.norm))
                      %14.norm)))))
  result.norm)

(define (vsubq_s32 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %4 (+ e0.new %lastidx0))
                      (define %5 (extract %4 e0.new a))
                      (define %10 (extract %4 e0.new b))
                      (define %15.ab0 (bvsubnw %5 %10 %elemsize0 %arg0))
                      %15.ab0)))))
  result)

(define (vcge_s32 %arg0.norm
                  %arg1.norm
                  a.norm
                  b.norm
                  %vectsize0.norm
                  %outerlanesize0.norm
                  %innerlaneoffset0.norm
                  %innerlanesize0.norm
                  %elemsize0.norm
                  %arg2.norm
                  %arg3.norm
                  %arg4.norm)
  (define result.norm
    (apply concat
           (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
             (apply concat
                    (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm
                                                            %innerlanesize0.norm
                                                            %elemsize0.norm))])
                      (define %lastidx0.norm (- %elemsize0.norm 1))
                      (define %4.norm (+ e0.new.norm %lastidx0.norm))
                      (define %5.norm (extract %4.norm e0.new.norm a.norm))
                      (define %6.ab0.norm (bvsizeext %5.norm 192 %arg4.norm))
                      (define %11.norm (extract %4.norm e0.new.norm b.norm))
                      (define %12.ab0.norm (bvsizeext %11.norm 192 %arg3.norm))
                      (define %13.ab0.norm (bvge %6.ab0.norm %12.ab0.norm %arg2.norm))
                      (define %21.norm (if (equal? %13.ab0.norm #t) %arg0.norm %arg1.norm))
                      %21.norm)))))
  result.norm)

(define (vsubhn_s64 %arg1
                    a
                    b
                    %vectsize0
                    %outerlanesize0
                    %innerlaneoffset0
                    %innerlanesize0
                    %elemsize0
                    %arg0
                    %arg2
                    %arg3
                    %arg4
                    %arg5)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %9.new0 (* e0.new %arg5))
                      (define %lastidx2 (- %arg4 1))
                      (define %14 (+ %9.new0 %lastidx2))
                      (define %16 (extract %14 %9.new0 a))
                      (define %25 (extract %14 %9.new0 b))
                      (define %26.ab0 (bvsubnw %16 %25 %arg4 %arg3))
                      (define %27.ab0 (bvaddnw %26.ab0 %arg1 64 %arg2))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %highidx0 (+ %lastidx1 %arg0))
                      (define %34 (extract %highidx0 %arg0 %27.ab0))
                      %34)))))
  result)

(define (vabs_s64 a
                  %vectsize0
                  %outerlanesize0
                  %innerlaneoffset0
                  %innerlanesize0
                  %elemsize0
                  %arg0
                  %arg1)
  (define result
    (apply
     concat
     (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
       (apply concat
              (for/list ([e0.new (reverse (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                (define %lastidx0 (- %elemsize0 1))
                (define %4 (+ e0.new %lastidx0))
                (define %5 (extract %4 e0.new a))
                (define %6.ab0 (bvsizeext %5 192 %arg1))
                (define %7 (integer->bitvector (abs (bitvector->integer %6.ab0)) (bitvector 192)))
                (define %lastidx1 (- %elemsize0 1))
                (define %highidx0 (+ %lastidx1 %arg0))
                (define %13 (extract %highidx0 %arg0 %7))
                %13)))))
  result)

(define (vuzp1q_u8 a b %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0)
  (define %1 (concat b a))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %9.new0 (* e0.new %arg0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %14 (+ %9.new0 %lastidx1))
                      (define %15 (extract %14 %9.new0 %1))
                      %15)))))
  result)

(define (vqdmlsl_high_s32 %arg6
                          a
                          b
                          c
                          %vectsize0
                          %outerlanesize0
                          %innerlaneoffset0
                          %innerlanesize0
                          %elemsize0
                          %arg0
                          %arg1
                          %arg2
                          %arg3
                          %arg4
                          %arg5
                          %arg7
                          %arg8
                          %arg9
                          %arg10)
  (define %2 (extract 127 64 b))
  (define %5 (extract 127 64 c))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %10.new0 (/ e0.new %arg10))
                      (define %lastidx1 (- %arg8 1))
                      (define %13 (+ %10.new0 %lastidx1))
                      (define %14 (extract %13 %10.new0 %2))
                      (define %15.ab0 (bvsizeext %14 192 %arg9))
                      (define %20 (extract %13 %10.new0 %5))
                      (define %21.ab0 (bvsizeext %20 192 %arg7))
                      (define %22 (bvmul %arg6 %15.ab0))
                      (define %23 (bvmul %22 %21.ab0))
                      (define %25.ab0 (bvsaturate %23 192 %arg5 %arg4))
                      (define %lastidx0 (- %elemsize0 1))
                      (define %32 (+ e0.new %lastidx0))
                      (define %34 (extract %32 e0.new a))
                      (define %35.ab0 (bvsizeext %34 192 %arg3))
                      (define %36.ab0 (bvsizeext %25.ab0 192 %arg2))
                      (define %37.ab0 (bvsubnw %35.ab0 %36.ab0 192 %arg1))
                      (define %47.ab0 (bvsaturate %37.ab0 192 %elemsize0 %arg0))
                      %47.ab0)))))
  result)

(define (vbsl_s16 a b c)
  (define %0 (bvxor c b))
  (define %1 (bvand %0 a))
  (define %2 (bvxor c %1))
  %2)

(define (vmlal_n_u16 a
                     b
                     c
                     %vectsize0
                     %outerlanesize0
                     %innerlaneoffset0
                     %innerlanesize0
                     %elemsize0
                     %arg0
                     %arg1
                     %arg2
                     %arg3
                     %arg4
                     %arg5)
  (define %7 (extract 15 0 c))
  (define %8.ab0 (bvsizeext %7 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx2 (- %elemsize0 1))
                      (define %13 (+ e0.new %lastidx2))
                      (define %14 (extract %13 e0.new b))
                      (define %15.ab0 (bvsizeext %14 192 %arg5))
                      (define %18 (bvmul %15.ab0 %8.ab0))
                      (define %lastidx1 (- %arg1 1))
                      (define %highidx0 (+ %lastidx1 %arg4))
                      (define %19 (extract %highidx0 %arg4 %18))
                      (define %21.new0 (* e0.new %arg3))
                      (define %lastidx0 (- %arg1 1))
                      (define %26 (+ %21.new0 %lastidx0))
                      (define %36 (extract %26 %21.new0 a))
                      (define %37.ab0 (bvaddnw %36 %19 %arg1 %arg2))
                      %37.ab0)))))
  result)

(define (vrshlq_s64 %arg5
                    %arg4
                    a
                    b
                    %vectsize0
                    %outerlanesize0
                    %innerlaneoffset0
                    %innerlanesize0
                    %elemsize0
                    %arg0
                    %arg1
                    %arg2
                    %arg3
                    %arg6
                    %arg7
                    %arg8)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %2.new0 (* e0.new %arg8))
                      (define %lastidx0 (- %arg0 1))
                      (define %5 (+ %2.new0 %lastidx0))
                      (define %lastidx2 (- %elemsize0 1))
                      (define %7.new.high.idx0 (+ %2.new0 %lastidx2))
                      (define %60.new (extract %7.new.high.idx0 %2.new0 b))
                      (define %8.ab0 (bvsizeext %60.new 192 %arg7))
                      (define %9 (bvneg %8.ab0))
                      (define %10.ab0 (bvsubnw %9 %arg5 192 %arg6))
                      (define %11 (armshl %arg4 %10.ab0))
                      (define %16 (extract %5 %2.new0 a))
                      (define %17.ab0 (bvsizeext %16 192 %arg3))
                      (define %18.ab0 (bvaddnw %17.ab0 %11 192 %arg2))
                      (define %19 (armshl %18.ab0 %8.ab0))
                      (define %lastidx1 (- %arg0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %25 (extract %highidx0 %arg1 %19))
                      %25)))))
  result)

(define (vqdmlal_s16 %arg8
                     a
                     b
                     c
                     %vectsize0
                     %outerlanesize0
                     %innerlaneoffset0
                     %innerlanesize0
                     %elemsize0
                     %arg0
                     %arg1
                     %arg2
                     %arg3
                     %arg4
                     %arg5
                     %arg6
                     %arg7
                     %arg9
                     %arg10)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx1 (- %elemsize0 1))
                      (define %7 (+ e0.new %lastidx1))
                      (define %8 (extract %7 e0.new b))
                      (define %9.ab0 (bvsizeext %8 192 %arg10))
                      (define %14 (extract %7 e0.new c))
                      (define %15.ab0 (bvsizeext %14 192 %arg9))
                      (define %16 (bvmul %arg8 %9.ab0))
                      (define %17 (bvmul %16 %15.ab0))
                      (define %19.ab0 (bvsaturate %17 192 %arg7 %arg6))
                      (define %21.new0 (* e0.new %arg5))
                      (define %lastidx0 (- %arg0 1))
                      (define %26 (+ %21.new0 %lastidx0))
                      (define %28 (extract %26 %21.new0 a))
                      (define %29.ab0 (bvsizeext %28 192 %arg4))
                      (define %30.ab0 (bvsizeext %19.ab0 192 %arg3))
                      (define %31.ab0 (bvaddnw %29.ab0 %30.ab0 192 %arg2))
                      (define %41.ab0 (bvsaturate %31.ab0 192 %arg0 %arg1))
                      %41.ab0)))))
  result)

(define (vmovn_s16 a %vectsize0 %outerlanesize0 %innerlaneoffset0 %innerlanesize0 %elemsize0 %arg0)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %4.new0 (* e0.new %arg0))
                      (define %lastidx1 (- %elemsize0 1))
                      (define %17.new.high.idx0 (+ %4.new0 %lastidx1))
                      (define %110.new (extract %17.new.high.idx0 %4.new0 a))
                      %110.new)))))
  result)

(define (vcgtd_u64 %arg0.norm
                   %arg1.norm
                   a.norm
                   b.norm
                   %vectsize0.norm
                   %outerlanesize0.norm
                   %innerlaneoffset0.norm
                   %innerlanesize0.norm
                   %elemsize0.norm
                   %arg2.norm
                   %arg3.norm
                   %arg4.norm)
  (define result.norm
    (apply concat
           (for/list ([%outer.it.norm (reverse (range 0 %vectsize0.norm %outerlanesize0.norm))])
             (apply concat
                    (for/list ([e0.new.norm (reverse (range %innerlaneoffset0.norm
                                                            %innerlanesize0.norm
                                                            %elemsize0.norm))])
                      (define %lastidx0.norm (- %elemsize0.norm 1))
                      (define %4.norm (+ e0.new.norm %lastidx0.norm))
                      (define %5.norm (extract %4.norm e0.new.norm a.norm))
                      (define %6.ab0.norm (bvsizeext %5.norm 192 %arg4.norm))
                      (define %11.norm (extract %4.norm e0.new.norm b.norm))
                      (define %12.ab0.norm (bvsizeext %11.norm 192 %arg3.norm))
                      (define %14.ab0.norm (bvgt %6.ab0.norm %12.ab0.norm %arg2.norm))
                      (define %21.norm (if (equal? %14.ab0.norm #t) %arg0.norm %arg1.norm))
                      %21.norm)))))
  result.norm)

(define (vqrshl_u8 %arg4
                   %arg3
                   a
                   b
                   %vectsize0
                   %outerlanesize0
                   %innerlaneoffset0
                   %innerlanesize0
                   %elemsize0
                   %arg0
                   %arg1
                   %arg2
                   %arg5
                   %arg6)
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx0 (- %elemsize0 1))
                      (define %5 (+ e0.new %lastidx0))
                      (define %60.new (extract %5 e0.new b))
                      (define %8.ab0 (bvsizeext %60.new 192 %arg6))
                      (define %9 (bvneg %8.ab0))
                      (define %10.ab0 (bvsubnw %9 %arg4 192 %arg5))
                      (define %11 (armshl %arg3 %10.ab0))
                      (define %16 (extract %5 e0.new a))
                      (define %17.ab0 (bvsizeext %16 192 %arg2))
                      (define %18.ab0 (bvaddnw %17.ab0 %11 192 %arg1))
                      (define %19 (armshl %18.ab0 %8.ab0))
                      (define %24.ab0 (bvsaturate %19 192 %elemsize0 %arg0))
                      %24.ab0)))))
  result)

(define (vqdmlal_high_n_s32 %arg7
                            a
                            b
                            c
                            %vectsize0
                            %outerlanesize0
                            %innerlaneoffset0
                            %innerlanesize0
                            %elemsize0
                            %arg0
                            %arg1
                            %arg2
                            %arg3
                            %arg4
                            %arg5
                            %arg6
                            %arg8
                            %arg9
                            %arg10)
  (define %2 (extract 127 64 b))
  (define %10 (extract 31 0 c))
  (define %11.ab0 (bvsizeext %10 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %13.new0 (/ e0.new %arg10))
                      (define %lastidx1 (- %arg9 1))
                      (define %16 (+ %13.new0 %lastidx1))
                      (define %17 (extract %16 %13.new0 %2))
                      (define %18.ab0 (bvsizeext %17 192 %arg8))
                      (define %19 (bvmul %arg7 %18.ab0))
                      (define %20 (bvmul %19 %11.ab0))
                      (define %22.ab0 (bvsaturate %20 192 %arg6 %arg5))
                      (define %lastidx0 (- %elemsize0 1))
                      (define %29 (+ e0.new %lastidx0))
                      (define %31 (extract %29 e0.new a))
                      (define %32.ab0 (bvsizeext %31 192 %arg4))
                      (define %33.ab0 (bvsizeext %22.ab0 192 %arg3))
                      (define %34.ab0 (bvaddnw %32.ab0 %33.ab0 192 %arg2))
                      (define %44.ab0 (bvsaturate %34.ab0 192 %elemsize0 %arg1))
                      %44.ab0)))))
  result)

(define (vqdmull_high_n_s32 %arg2
                            a
                            b
                            %vectsize0
                            %outerlanesize0
                            %innerlaneoffset0
                            %innerlanesize0
                            %elemsize0
                            %arg0
                            %arg1
                            %arg3
                            %arg4
                            %arg5)
  (define %2 (extract 127 64 a))
  (define %9 (extract 31 0 b))
  (define %10.ab0 (bvsizeext %9 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %12.new0 (/ e0.new %arg5))
                      (define %lastidx1 (- %arg4 1))
                      (define %15 (+ %12.new0 %lastidx1))
                      (define %16 (extract %15 %12.new0 %2))
                      (define %17.ab0 (bvsizeext %16 192 %arg3))
                      (define %18 (bvmul %arg2 %17.ab0))
                      (define %19 (bvmul %18 %10.ab0))
                      (define %21.ab0 (bvsaturate %19 192 %elemsize0 %arg1))
                      %21.ab0)))))
  result)

(define (veor3q_u16 a b c)
  (define %0 (bvxor a b))
  (define %1 (bvxor %0 c))
  %1)

(define (vqdmlsl_n_s32 %arg9
                       a
                       b
                       c
                       %vectsize0
                       %outerlanesize0
                       %innerlaneoffset0
                       %innerlanesize0
                       %elemsize0
                       %arg0
                       %arg1
                       %arg2
                       %arg3
                       %arg4
                       %arg5
                       %arg6
                       %arg7
                       %arg8
                       %arg10)
  (define %7 (extract 31 0 c))
  (define %8.ab0 (bvsizeext %7 192 %arg0))
  (define result
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx1 (- %elemsize0 1))
                      (define %13 (+ e0.new %lastidx1))
                      (define %14 (extract %13 e0.new b))
                      (define %15.ab0 (bvsizeext %14 192 %arg10))
                      (define %16 (bvmul %arg9 %15.ab0))
                      (define %17 (bvmul %16 %8.ab0))
                      (define %19.ab0 (bvsaturate %17 192 %arg8 %arg7))
                      (define %21.new0 (* e0.new %arg6))
                      (define %lastidx0 (- %arg1 1))
                      (define %26 (+ %21.new0 %lastidx0))
                      (define %28 (extract %26 %21.new0 a))
                      (define %29.ab0 (bvsizeext %28 192 %arg5))
                      (define %30.ab0 (bvsizeext %19.ab0 192 %arg4))
                      (define %31.ab0 (bvsubnw %29.ab0 %30.ab0 192 %arg3))
                      (define %41.ab0 (bvsaturate %31.ab0 192 %arg1 %arg2))
                      %41.ab0)))))
  result)

(define (vrsubhn_high_u32 %arg3
                          r
                          a
                          b
                          %vectsize0
                          %outerlanesize0
                          %innerlaneoffset0
                          %innerlanesize0
                          %elemsize0
                          %arg0
                          %arg1
                          %arg2
                          %arg4
                          %arg5)
  (define result0
    (apply concat
           (for/list ([%outer.it (reverse (range 0 %vectsize0 %outerlanesize0))])
             (apply concat
                    (for/list ([e0.new (reverse
                                        (range %innerlaneoffset0 %innerlanesize0 %elemsize0))])
                      (define %lastidx2 (- %elemsize0 1))
                      (define %14 (+ e0.new %lastidx2))
                      (define %16 (extract %14 e0.new a))
                      (define %25 (extract %14 e0.new b))
                      (define %26.ab0 (bvsubnw %16 %25 %elemsize0 %arg5))
                      (define %27.ab0 (bvaddnw %26.ab0 %arg3 32 %arg4))
                      (define %lastidx1 (- %arg0 1))
                      (define %highidx0 (+ %lastidx1 %arg1))
                      (define %34 (extract %highidx0 %arg1 %27.ab0))
                      %34)))))
  (define %35 (concat result0 r))
  %35)
